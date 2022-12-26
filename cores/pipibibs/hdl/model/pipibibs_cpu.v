/*
* <-- pr4m0d -->
* https://pram0d.com
* https://twitter.com/pr4m0d
* https://github.com/psomashekar
*
* Copyright (c) 2022 Pramod Somashekar
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module pipibibs_cpu (
    input CLK,
    input CLK96,
    input RESET,
    input RESET96,
    input GP9001ACK,
    input Z80ACK,
    input VINT,
    input BR,
    input [8:0] V,
    output BUSACK,
    input LVBL,
    input FLIP,

    output [19:1] ADDR,
    output [15:0] DOUT,
    output RW,
    output RD,
    output LDS,
    output LDSWR,
    output GP9001CS,
    output LTABLECS,
    output VCOUNTCS,
    output Z80RST,
    output CEN16,
    output CEN16B,

    // cabinet I/O
    input [1:0]  JOYMODE,
    input [9:0]  JOYSTICK1,
    input [9:0]  JOYSTICK2,
    input [3:0]  START_BUTTON,
    input [3:0]  COIN_INPUT,
    input        SERVICE,
    input        TILT,

    // DIP switches
    input        DIP_TEST,
    input        DIP_PAUSE,
    input [7:0]  DIPSW_A,
    input [7:0]  DIPSW_B,
    input [7:0]  DIPSW_C,

    //68k rom interface
    output            CPU_PRG_CS,
    input             CPU_PRG_OK,
    output reg [16:0] CPU_PRG_ADDR, //16bit addressing
    input      [15:0] CPU_PRG_DATA,

    //gcu interface
    output reg       GP9001_OP_SELECT_REG,
    output reg       GP9001_OP_WRITE_REG,
    output reg       GP9001_OP_WRITE_RAM,
    output reg       GP9001_OP_READ_RAM_H,
    output reg       GP9001_OP_READ_RAM_L,
    output reg       GP9001_OP_SET_RAM_PTR,
    input     [15:0] GP9001_DOUT,
    input            HSYNC,
    input            VSYNC,
    input            FBLANK,
    input      [7:0] GAME,

    //palette ram
    input  [10:0] PALRAM_ADDR,
    output [15:0] PALRAM_DATA,

    //z80 interface
    output reg [7:0] SOUNDLATCH,
    input [10:0] SRAM_ADDR,
    output [7:0] SRAM_DATA,
    input [7:0] SRAM_DIN,
    input SRAM_WE,
    input Z80WAIT,
    output reg Z80INT,

    //sound interface
    output                YM3812_CS,
    output                YM3812_WE,
    output                YM3812_WR_CMD,
    output          [7:0] YM3812_DIN,
    input           [7:0] YM3812_DOUT
);

localparam DEFAULT  = 'h0;  // DEFAULT (GAREGGA)
localparam PIPIBIBS = 'h3;  // PIPIBIBS MODULE

//address bus
wire [23:1] A;
wire [23:0] addr_8 = {A[23:1], 1'b0}; //this makes it easier to follow the memory map.
wire [15:0] cpu_dout;
wire sel_z80, sel_ram, sel_sram, sel_rom;
reg ram_ok = 1'b1;
reg sel_gp9001, sel_io;
reg dsn_dly;
reg pre_sel_ram, pre_sel_sram, pre_sel_rom, pre_sel_zrom,
    reg_sel_ram, reg_sel_sram, reg_sel_rom, reg_sel_zrom;
reg pre_sel_palram;
reg reg_sel_palram;
wire sel_palram;
wire [15:0] wram_cpu_data = !RW && (sel_ram || sel_sram || sel_palram) ? cpu_dout : 16'h0000;
wire [15:0] main_ram_q0;
wire [15:0] main_palram_q0;
wire [15:0] main_ram2_q0;
wire [7:0] main_sram_q0;

wire [15:0] main_vram_q1;

//the first 19 bits are used to address other devices (ie. ROM/RAM). The rest are used for selects.
assign ADDR[19:1] = A[19:1];
assign DOUT = cpu_dout;
reg [15:0] cpu_din;
wire BUSn, UDSn, LDSn, ASn, LDSWn, UDSWn;
assign LDS = LDSn;
assign LDSWR = LDSWn;
assign BUSn  = ASn | (UDSn & LDSn);
assign UDSWn = RW | UDSn;
assign LDSWn = RW | LDSn;

// ram_cs and vram_cs signals go down before DSWn signals
// that causes a false read request to the SDRAM. In order
// to avoid that a little bit of logic is needed:
assign sel_ram   = pre_sel_ram; //~BUSn & (dsn_dly ? reg_sel_ram  : pre_sel_ram);
assign sel_sram  = pre_sel_sram; //~BUSn & (dsn_dly ? reg_sel_sram : pre_sel_sram);
assign sel_rom   = ~BUSn & (dsn_dly ? reg_sel_rom : pre_sel_rom);
assign sel_palram = pre_sel_palram;
assign CPU_PRG_CS = sel_rom;

//sound assigns
wire sel_YM3812 = YM3812_CS & ~RW;
assign YM3812_CS = sel_io && (addr_8[7:0] == 'h14 || addr_8[7:0] == 'h16);
assign YM3812_WE = RW;
assign YM3812_WR_CMD = A[1];
assign YM3812_DIN = cpu_dout[7:0];

always @(posedge CLK96, posedge RESET96) begin
    if( RESET96 ) begin
        reg_sel_rom <= 0;
        reg_sel_ram  <= 0;
        reg_sel_sram <= 0;
        reg_sel_palram <= 0;
        dsn_dly  <= 1;
    end else if(CEN16) begin
        reg_sel_rom <= pre_sel_rom;
        reg_sel_ram  <= pre_sel_ram;
        reg_sel_sram <= pre_sel_sram;
        reg_sel_palram <= pre_sel_palram;
        dsn_dly     <= &{UDSWn,LDSWn}; // low if any DSWn was low
    end
end

wire bus_legit = sel_z80 & Z80WAIT;

wire FC0, FC1, FC2;
wire VPAn = ~&{ FC0, FC1, FC2, ~ASn};
wire BRn, BGACKn, BGn, DTACKn;
wire bus_cs = |{ pre_sel_rom, pre_sel_ram, pre_sel_sram, pre_sel_palram || sel_gp9001, sel_io, sel_YM3812};
wire bus_busy = |{ (sel_ram || sel_sram || sel_palram) & ~ram_ok, sel_rom & ~CPU_PRG_OK, sel_gp9001 & ~GP9001ACK, sel_YM3812 & YM3812_DOUT[7]};

//i/o bus ports
reg gp9001_vdp_device_r_cs,
    gp9001_vdp_device_w_cs,
    read_port_in1_r_cs,
    read_port_in2_r_cs,
    read_port_in3_r_cs,
    read_port_in4_r_cs,
    read_port_sys_r_cs,
    read_port_dswa_r_cs,
    read_port_dswb_r_cs,
    read_port_jmpr_r_cs,
    toaplan2_coinword_w_cs,
    video_count_r_cs;

//debugging 
 wire debug = 1'b1;
 integer fd;

 `ifdef SIMULATION
 initial fd = $fopen("log.txt", "w");
`endif

always @(posedge CLK96 or posedge RESET96) begin
    if(RESET96) begin
        pre_sel_rom<=0;
        pre_sel_ram<=0;
        pre_sel_sram<=0;
        pre_sel_palram<=0;
        sel_gp9001<=0;
        sel_io<=0;
        CPU_PRG_ADDR<=19'd0;
        //sel_z80<=1'b0;
    end else begin
        if(!ASn && BGACKn) begin
            //debugging 
            // $display("time: %t, addr: %h, uds: %h, lds: %h, rw: %h, cpu_dout: %h, cpu_din: %h, sel_status: %b\n", $time/1000, addr_8, UDSn, LDSn, RW, cpu_dout, cpu_din, {sel_rom, sel_ram, sel_sram, sel_z80, sel_gp9001, sel_io});
             if(debug)
                $fwrite(fd, "time: %t, addr: %h, uds: %h, lds: %h, rw: %h, cpu_dout: %h, cpu_din: %h, sel_status: %b\n", $time/1000, addr_8, UDSn, LDSn, RW, cpu_dout, cpu_din, {sel_rom, sel_ram, sel_sram, sel_gp9001, sel_io});

           //68k ROM
            pre_sel_rom <= GAME == PIPIBIBS ? addr_8 <= 'h3FFFF :  // (PIPIBIBS)
                                              addr_8 <= 'h3FFFF;

            CPU_PRG_ADDR <= A[17:1];

            //RAM
            pre_sel_ram <= addr_8[23:16] == 8'b0000_1000;            // 0x080000 - 0x082FFF (PIPIBIBS)

            //Shared RAM
            pre_sel_sram <= addr_8[23:12] == 12'b0001_1001_0000;      // 0x190000 - 0x190FFF (PIPIBIBS)

            //GP9001
            sel_gp9001 <= addr_8[23:16] == 8'b0001_0100;              // 0x140000 - 0x14000D (PIPIBIBS)

            //direct access to vtx ram, no dma controller, no sel_ram_2
            pre_sel_palram <= addr_8[23:12] == 12'b0000_1100_0000;    // 0x0C0000 - 0X0C0FFF (PIPIBIBS)

            //IO
            sel_io <= addr_8[23:12] == 12'b0001_1001_1100;            // 0x19C000 - 0x19C035 (PIPIBIBS)
            //sel_z80 <= soundlatch_w;
        end else begin
            pre_sel_rom<=0;
            pre_sel_ram<=0;
            pre_sel_sram<=0;
            pre_sel_palram<=0;
            sel_gp9001<=0;
            sel_io<=0;
            //sel_z80<=1'b0;
        end
    end
end

// I/O
always @(*) begin
    //gp9001
    gp9001_vdp_device_r_cs = sel_gp9001 && RW;                       // 0x140000-D Read (PIPIBIBS)
    gp9001_vdp_device_w_cs = sel_gp9001 && !RW;                      // 0x140000-D Write (PIPIBIBS)

    //dips, controls
    read_port_dswa_r_cs = sel_io && (addr_8[11:0] == 11'h020) && RW; // 0X19C020-21 (PIPIBIBS)
    read_port_dswb_r_cs = sel_io && (addr_8[11:0] == 11'h024) && RW; // 0X19C024-25 (PIPIBIBS)
    read_port_jmpr_r_cs = sel_io && (addr_8[11:0] == 11'h028) && RW; // 0X19C028-29 (PIPIBIBS)
    read_port_in1_r_cs = sel_io && (addr_8[11:0] == 11'h030) && RW;  // 0X19C030-31 (PIPIBIBS)
    read_port_in2_r_cs = sel_io && (addr_8[11:0] == 11'h034) && RW;  // 0X19C034-35 (PIPIBIBS)
    read_port_sys_r_cs = sel_io && (addr_8[11:0] == 11'h02C) && RW;  // 0X19C02C-2D (PIPIBIBS)
    video_count_r_cs = gp9001_vdp_device_r_cs && (addr_8[11:0] == 11'h00c);  // 0X1900C-D (PIPIBIBS)


    //coin
    toaplan2_coinword_w_cs = sel_io && (addr_8[11:0] == 11'h01D);    // 0x19C01D (PIPIBIBS)
end

wire [15:0] video_status_hs = (16'hFF00 & (!HSYNC ? ~16'h8000 : 16'hFFFF));
wire [15:0] video_status_vs = (16'hFF00 & (!VSYNC ? ~16'h4000 : 16'hFFFF));
wire [15:0] video_status_fb = (16'hFF00 & (!FBLANK ? ~16'h100 : 16'hFFFF));
wire [15:0] video_status = V < 256 ? (video_status_hs & video_status_vs & video_status_fb) | (V & 8'hFF) :
                                     (video_status_hs & video_status_vs & video_status_fb) | 8'hFF;
wire vint_n, int1;

//JTFRAME is low active, but batrider is high active.
wire [7:0] p1_ctrl = {1'b0, ~JOYSTICK1[6],~JOYSTICK1[5],~JOYSTICK1[4],~JOYSTICK1[0],~JOYSTICK1[1],~JOYSTICK1[2],~JOYSTICK1[3]};
wire [7:0] p2_ctrl = {1'b0, ~JOYSTICK2[6],~JOYSTICK2[5],~JOYSTICK2[4],~JOYSTICK2[0],~JOYSTICK2[1],~JOYSTICK2[2],~JOYSTICK2[3]};

always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) cpu_din <= 16'h0000;
    else begin
        cpu_din <= video_count_r_cs ? {15'b0, (((V+15)%262)>=245)} : // blanking trigger
                   sel_gp9001 && RW ? GP9001_DOUT : //gcu
                   sel_rom ? CPU_PRG_DATA : //cpu program

                   //todo: ram hookups
                   sel_ram && RW ? main_ram_q0 ://ram reads
                   sel_sram && RW ? {2{main_sram_q0}} ://ram reads
                   sel_palram && RW ? main_palram_q0 :
                   read_port_in1_r_cs ? {2{p1_ctrl}} : //controller inputs
                   read_port_in2_r_cs ? {2{p2_ctrl}} :
                   read_port_sys_r_cs ? {2{DIPSW_C, 1'b0, ~START_BUTTON[1], ~START_BUTTON[0], ~COIN_INPUT[1], ~COIN_INPUT[0], ~DIP_TEST, 1'b0, ~SERVICE}} :
                   read_port_dswa_r_cs ? {2{DIPSW_A}} :
                   read_port_dswb_r_cs ? {2{DIPSW_B}} :
                   read_port_jmpr_r_cs ? {2{DIPSW_C & 'hf}} :
                   toaplan2_coinword_w_cs ? 16'h0000 : //ignore coin counter.

                   YM3812_CS && RW && A[1] ? {2{YM3812_DOUT}} :
                   16'h0000; //etc.
    end
end

//cpu bus actions for IO
wire inta_n = ~&{ FC0, FC1, FC2, A[19:16] }; // ctrl like M68000's manual

always @(posedge CLK96) begin
    if(RESET96) begin
        GP9001_OP_SELECT_REG <= 1'b0;
        GP9001_OP_WRITE_REG <= 1'b0;
        GP9001_OP_WRITE_RAM <= 1'b0;
        GP9001_OP_READ_RAM_H <= 1'b0;
        GP9001_OP_READ_RAM_L <= 1'b0;
        GP9001_OP_SET_RAM_PTR <= 1'b0;
        Z80INT<=1'b0;
        SOUNDLATCH <= cpu_dout[7:0];
    end else begin
        if(gp9001_vdp_device_r_cs) begin
            case(addr_8[3:0])
                4'b0100: GP9001_OP_READ_RAM_H <= 1'b1; //4
                4'b0110: GP9001_OP_READ_RAM_L <= 1'b1; //6
            endcase
        end
        else if(gp9001_vdp_device_w_cs) begin
            case(addr_8[3:0])
                4'b1100: GP9001_OP_WRITE_REG <= 1'b1; //0
                4'b1000: GP9001_OP_SELECT_REG <= 1'b1; //8
                4'b0100, 4'b0110: GP9001_OP_WRITE_RAM <= 1'b1; //4 or 6
                4'b0000: GP9001_OP_SET_RAM_PTR <= 1'b1; //0
            endcase
        end
        else begin
            if(GP9001ACK) begin
                GP9001_OP_SELECT_REG <= 1'b0;
                GP9001_OP_WRITE_REG <= 1'b0;
                GP9001_OP_WRITE_RAM <= 1'b0;
                GP9001_OP_READ_RAM_H <= 1'b0;
                GP9001_OP_READ_RAM_L <= 1'b0;
                GP9001_OP_SET_RAM_PTR <= 1'b0;
            end
        end
    end
end

//address bits 19 to 23 go to the E68DEC1B chip.

jtframe_ff u_int_ff(
    .clk      ( CLK96       ),
    .rst      ( RESET96     ),
    .cen      ( 1'b1        ),
    .din      ( 1'b1        ),
    .q        (             ),
    .qn       ( vint_n      ),
    .set      ( 1'b0        ),    // active high
    .clr      ( ~inta_n     ),    // active high
    .sigedge  ( VINT        )     // signal whose edge will trigger the FF
);

jtframe_virq u_virq(
    .rst        ( RESET96   ),
    .clk        ( CLK96     ),
    .LVBL       ( LVBL      ),
    .dip_pause  ( DIP_PAUSE ),
    .skip_en    (           ),
    .skip_but   (           ),
    .clr        ( ~inta_n   ),
    .custom_in  (           ),
    .blin_n     ( int1      ),
    .blout_n    (           ),
    .custom_n   (           )
);

//68k cpu running at 10mhz
jtframe_68kdtack #(.W(16)) u_dtack(
    .rst        (RESET96),
    .clk        (CLK96),
    .cpu_cen    (CEN16),
    .cpu_cenb   (CEN16B),
    .bus_cs     (bus_cs),
    .bus_busy   (bus_busy),
    .bus_legit  (1'b0),
    .ASn        (ASn),
    .DSn        ({UDSn, LDSn}),
    .num        (16'd20),
    .den        (16'd189),
    .DTACKn     (DTACKn),
    // unused
    .fave       (),
    .fworst     (),
    .frst       ()
);

assign BUSACK = ~BGACKn;

jtframe_68kdma #(.BW(1)) u_arbitration(
    .clk        (CLK96),
    .cen        (CEN16B),
    .rst        (RESET96),
    .cpu_BRn    (BRn),
    .cpu_BGACKn (BGACKn),
    .cpu_BGn    (BGn),
    .cpu_ASn    (ASn),
    .cpu_DTACKn (DTACKn),
    .dev_br     (BR)
);

fx68k u_011 (
    .clk        (CLK96),
    .extReset   (RESET96),
    .pwrUp      (RESET96),
    .enPhi1     (CEN16),
    .enPhi2     (CEN16B),

    // Buses
    .eab        (A),
    .iEdb       (cpu_din),
    .oEdb       (cpu_dout),

    .eRWn       (RW),
    .LDSn       (LDSn),
    .UDSn       (UDSn),
    .ASn        (ASn),
    .VPAn       (VPAn),
    .FC0        (FC0), 
    .FC1        (FC1),
    .FC2        (FC2),

    .BERRn      (1'b1),

    .HALTn      (DIP_PAUSE),
    .BRn        (BRn),
    .BGACKn     (BGACKn),
    .BGn        (BGn),

    .DTACKn     (DTACKn),
    .IPL0n      (1'b1),
    .IPL1n      (1'b1),
    .IPL2n      (int1),

    // Unused
    .oRESETn    (),
    .oHALTEDn   (),
    .VMAn       (),
    .E          ()
);

//CPU WRAM 0x080000 - 0x082FFF
jtframe_dual_ram16 #(.aw(13)) u_cpu_wram(
    .clk0(CLK96),
    .clk1(CLK96),
    // Port 0 writes & reads from 68k
    .data0(wram_cpu_data),
    .addr0(A[13:1]),
    .we0({sel_ram && !RW && !UDSn, sel_ram && !RW && !LDSn}),
    .q0(),
    // Port 1
    .data1(),
    .addr1(A[13:1]),
    .we1(2'b00),
    .q1(main_ram_q0)
);

//8 bit addressing
jtframe_dual_ram #(.dw(8), .aw(12)) u_sram_ram(
    .clk0(CLK96),
    .clk1(CLK96),
    // Port 0 writes reads from 68k
    .data0(wram_cpu_data[7:0]),
    .addr0((addr_8 & 12'hFFF)>>1),
    .we0(sel_sram && !RW),
    .q0(main_sram_q0),
    // Port 1 writes reads from z80
    .data1(SRAM_DIN),
    .addr1(SRAM_ADDR),
    .we1(SRAM_WE),
    .q1(SRAM_DATA)
);

//Palette RAM 0x0C0000 - 0x0C0FFF
jtframe_dual_ram16 #(.aw(11)) u_palram_ram(
    .clk0(CLK96),
    .clk1(CLK96),
    // Port 0 writes
    .data0(wram_cpu_data),
    .addr0(A[11:1]),
    .we0({sel_palram && !RW && !UDSn, sel_palram && !RW && !LDSn}),
    .q0(main_palram_q0),
    // Port 1
    .data1(),
    .addr1(PALRAM_ADDR),
    .we1(2'b00),
    .q1(PALRAM_DATA)
);

endmodule
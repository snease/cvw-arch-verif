///////////////////////////////////////////
//
// RISC-V Architectural Functional Coverage Covergroups
// 
// Copyright (C) 2024 Harvey Mudd College, 10x Engineers, UET Lahore, Habib University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file 
// except in compliance with the License, or, at your option, the Apache License version 2.0. You 
// may obtain a copy of the License at
//
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the 
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
// either express or implied. See the License for the specific language governing permissions 
// and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////

`define COVER_ZICSRF
typedef RISCV_instruction #(ILEN, XLEN, FLEN, VLEN, NHART, RETIRE) ins_zicsrf_t;

covergroup fcsr_cg with function sample(ins_zicsrf_t ins);
    option.per_instance = 0; 

    // building blocks for the main coverpoints
    csrrw: coverpoint ins.current.insn {
        wildcard bins csrrw = {32'b????????????_?????_001_?????_1110011}; 
    }
    csrop: coverpoint ins.current.insn[14:12] iff (ins.current.insn[6:0] == 7'b1110011) {
        bins csrrs = {3'b010};
        bins csrrc = {3'b011};
    }
    fcsr: coverpoint ins.current.insn[31:20] {
        bins fcsr = {12'h003};
    }
    frm: coverpoint ins.current.insn[31:20] {
        bins frm = {12'h002};
    }
    fflags: coverpoint ins.current.insn[31:20] {
        bins fflags = {12'h001};
    }
    fcsr_frm_corners: coverpoint ins.current.rs1_val[7:5] {
        // auto fills 0 through 7
    }
    frm_corners: coverpoint ins.current.rs1_val[2:0] {
        // auto fills 0 through 7 
    }
    fflags_corners: coverpoint ins.current.rs1_val[4:0] {
        // auto fills 0 through 15
    }
    `ifdef XLEN64
    walking_ones : coverpoint ins.current.rs1_val {
        bins b_0  = {64'b0000000000000000000000000000000000000000000000000000000000000001};
        bins b_1  = {64'b0000000000000000000000000000000000000000000000000000000000000010};
        bins b_2  = {64'b0000000000000000000000000000000000000000000000000000000000000100};
        bins b_3  = {64'b0000000000000000000000000000000000000000000000000000000000001000};
        bins b_4  = {64'b0000000000000000000000000000000000000000000000000000000000010000};
        bins b_5  = {64'b0000000000000000000000000000000000000000000000000000000000100000};
        bins b_6  = {64'b0000000000000000000000000000000000000000000000000000000001000000};
        bins b_7  = {64'b0000000000000000000000000000000000000000000000000000000010000000};
        bins b_8  = {64'b0000000000000000000000000000000000000000000000000000000100000000};
        bins b_9  = {64'b0000000000000000000000000000000000000000000000000000001000000000};
        bins b_10 = {64'b0000000000000000000000000000000000000000000000000000010000000000};
        bins b_11 = {64'b0000000000000000000000000000000000000000000000000000100000000000};
        bins b_12 = {64'b0000000000000000000000000000000000000000000000000001000000000000};
        bins b_13 = {64'b0000000000000000000000000000000000000000000000000010000000000000};
        bins b_14 = {64'b0000000000000000000000000000000000000000000000000100000000000000};
        bins b_15 = {64'b0000000000000000000000000000000000000000000000001000000000000000};
        bins b_16 = {64'b0000000000000000000000000000000000000000000000010000000000000000};
        bins b_17 = {64'b0000000000000000000000000000000000000000000000100000000000000000};
        bins b_18 = {64'b0000000000000000000000000000000000000000000001000000000000000000};
        bins b_19 = {64'b0000000000000000000000000000000000000000000010000000000000000000};
        bins b_20 = {64'b0000000000000000000000000000000000000000000100000000000000000000};
        bins b_21 = {64'b0000000000000000000000000000000000000000001000000000000000000000};
        bins b_22 = {64'b0000000000000000000000000000000000000000010000000000000000000000};
        bins b_23 = {64'b0000000000000000000000000000000000000000100000000000000000000000};
        bins b_24 = {64'b0000000000000000000000000000000000000001000000000000000000000000};
        bins b_25 = {64'b0000000000000000000000000000000000000010000000000000000000000000};
        bins b_26 = {64'b0000000000000000000000000000000000000100000000000000000000000000};
        bins b_27 = {64'b0000000000000000000000000000000000001000000000000000000000000000};
        bins b_28 = {64'b0000000000000000000000000000000000010000000000000000000000000000};
        bins b_29 = {64'b0000000000000000000000000000000000100000000000000000000000000000};
        bins b_30 = {64'b0000000000000000000000000000000001000000000000000000000000000000};
        bins b_31 = {64'b0000000000000000000000000000000010000000000000000000000000000000};
        bins b_32 = {64'b0000000000000000000000000000000100000000000000000000000000000000};
        bins b_33 = {64'b0000000000000000000000000000001000000000000000000000000000000000};
        bins b_34 = {64'b0000000000000000000000000000010000000000000000000000000000000000};
        bins b_35 = {64'b0000000000000000000000000000100000000000000000000000000000000000};
        bins b_36 = {64'b0000000000000000000000000001000000000000000000000000000000000000};
        bins b_37 = {64'b0000000000000000000000000010000000000000000000000000000000000000};
        bins b_38 = {64'b0000000000000000000000000100000000000000000000000000000000000000};
        bins b_39 = {64'b0000000000000000000000001000000000000000000000000000000000000000};
        bins b_40 = {64'b0000000000000000000000010000000000000000000000000000000000000000};
        bins b_41 = {64'b0000000000000000000000100000000000000000000000000000000000000000};
        bins b_42 = {64'b0000000000000000000001000000000000000000000000000000000000000000};
        bins b_43 = {64'b0000000000000000000010000000000000000000000000000000000000000000};
        bins b_44 = {64'b0000000000000000000100000000000000000000000000000000000000000000};
        bins b_45 = {64'b0000000000000000001000000000000000000000000000000000000000000000};
        bins b_46 = {64'b0000000000000000010000000000000000000000000000000000000000000000};
        bins b_47 = {64'b0000000000000000100000000000000000000000000000000000000000000000};
        bins b_48 = {64'b0000000000000001000000000000000000000000000000000000000000000000};
        bins b_49 = {64'b0000000000000010000000000000000000000000000000000000000000000000};
        bins b_50 = {64'b0000000000000100000000000000000000000000000000000000000000000000};
        bins b_51 = {64'b0000000000001000000000000000000000000000000000000000000000000000};
        bins b_52 = {64'b0000000000010000000000000000000000000000000000000000000000000000};
        bins b_53 = {64'b0000000000100000000000000000000000000000000000000000000000000000};
        bins b_54 = {64'b0000000001000000000000000000000000000000000000000000000000000000};
        bins b_55 = {64'b0000000010000000000000000000000000000000000000000000000000000000};
        bins b_56 = {64'b0000000100000000000000000000000000000000000000000000000000000000};
        bins b_57 = {64'b0000001000000000000000000000000000000000000000000000000000000000};
        bins b_58 = {64'b0000010000000000000000000000000000000000000000000000000000000000};
        bins b_59 = {64'b0000100000000000000000000000000000000000000000000000000000000000};
        bins b_60 = {64'b0001000000000000000000000000000000000000000000000000000000000000};
        bins b_61 = {64'b0010000000000000000000000000000000000000000000000000000000000000};
        bins b_62 = {64'b0100000000000000000000000000000000000000000000000000000000000000};
        bins b_63 = {64'b1000000000000000000000000000000000000000000000000000000000000000};
    }
    `else
    walking_ones : coverpoint ins.current.rs1_val {
        bins b_0  = {32'b00000000000000000000000000000001};
        bins b_1  = {32'b00000000000000000000000000000010};
        bins b_2  = {32'b00000000000000000000000000000100};
        bins b_3  = {32'b00000000000000000000000000001000};
        bins b_4  = {32'b00000000000000000000000000010000};
        bins b_5  = {32'b00000000000000000000000000100000};
        bins b_6  = {32'b00000000000000000000000001000000};
        bins b_7  = {32'b00000000000000000000000010000000};
        bins b_8  = {32'b00000000000000000000000100000000};
        bins b_9  = {32'b00000000000000000000001000000000};
        bins b_10 = {32'b00000000000000000000010000000000};
        bins b_11 = {32'b00000000000000000000100000000000};
        bins b_12 = {32'b00000000000000000001000000000000};
        bins b_13 = {32'b00000000000000000010000000000000};
        bins b_14 = {32'b00000000000000000100000000000000};
        bins b_15 = {32'b00000000000000001000000000000000};
        bins b_16 = {32'b00000000000000010000000000000000};
        bins b_17 = {32'b00000000000000100000000000000000};
        bins b_18 = {32'b00000000000001000000000000000000};
        bins b_19 = {32'b00000000000010000000000000000000};
        bins b_20 = {32'b00000000000100000000000000000000};
        bins b_21 = {32'b00000000001000000000000000000000};
        bins b_22 = {32'b00000000010000000000000000000000};
        bins b_23 = {32'b00000000100000000000000000000000};
        bins b_24 = {32'b00000001000000000000000000000000};
        bins b_25 = {32'b00000010000000000000000000000000};
        bins b_26 = {32'b00000100000000000000000000000000};
        bins b_27 = {32'b00001000000000000000000000000000};
        bins b_28 = {32'b00010000000000000000000000000000};
        bins b_29 = {32'b00100000000000000000000000000000};
        bins b_30 = {32'b01000000000000000000000000000000};
        bins b_31 = {32'b10000000000000000000000000000000};
    }
    `endif

    fflags_toggle: coverpoint ins.current.csr[12'h003][4:0] iff (ins.current.insn[6:0] != 7'b1110011){
        wildcard bins NX = (5'b????0 => 5'b????1);
        wildcard bins UF = (5'b???0? => 5'b???1?);
        wildcard bins OF = (5'b??0?? => 5'b??1??);
        wildcard bins DZ = (5'b?0??? => 5'b?1???);
        wildcard bins NV = (5'b0???? => 5'b1????);
    }
    mstatus_FS: coverpoint ins.current.csr[12'h300][14:13] {
        bins not_zero = {!3'b000};
        bins zero     =  {3'b000};
    }
    mstatus_FS_n0: coverpoint ins.current.csr[12'h300][14:13] {
        bins not_zero = {!3'b000};
    }
    
    // main coverpoints
    cp_fcsr_frm_write:        cross csrrw, fcsr,   fcsr_frm_corners, mstatus_FS;
    cp_fcsr_fflags_write:     cross csrrw, fcsr,   fflags_corners,   mstatus_FS;
    cp_fcsr_reserved:         cross csrop, fcsr,   walking_ones,     mstatus_FS;
    cp_frm_write:             cross csrrw, frm,    frm_corners,      mstatus_FS;
    cp_frm_write_reserved:    cross csrop, frm,    walking_ones,     mstatus_FS;
    cp_fflags_write:          cross csrrw, fflags, fflags_corners,   mstatus_FS;
    cp_fflags_write_reserved: cross csrop, fflags, walking_ones,     mstatus_FS;
    cp_fflags_set_m:          cross fflags_toggle,                   mstatus_FS_n0;
endgroup

function void zicsrf_sample(int hart, int issue);
    ins_zicsrf_t ins;

    ins = new(hart, issue, traceDataQ); 
    ins.add_rd(0);
    ins.add_rs1(2);
    ins.add_csr(1);
    
    fcsr_cg.sample(ins);
    
endfunction

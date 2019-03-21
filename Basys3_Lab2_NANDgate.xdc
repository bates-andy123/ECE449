## clock signal
set_property PACKAGE_PIN W5 [get_ports display_clock]
		set_property IOSTANDARD LVCMOS33 [get_ports display_clock]
		#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Sclock]
		
set_property PACKAGE_PIN K17 [get_ports {clk}]
		set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
		create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk_IBUF}]
		
##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {input[8]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[8]}]
#Sch name = in_port2
set_property PACKAGE_PIN A16 [get_ports {input[9]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[9]}]
#Sch name = in_port3
set_property PACKAGE_PIN B15 [get_ports {input[10]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[10]}]
#Sch name = in_port4
set_property PACKAGE_PIN B16 [get_ports {input[11]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[11]}]
#Sch name = in_port7
set_property PACKAGE_PIN A15 [get_ports {input[12]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[12]}]
#Sch name = in_port8
set_property PACKAGE_PIN A17 [get_ports {input[13]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[13]}]
#Sch name = in_port9
set_property PACKAGE_PIN C15 [get_ports {input[14]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[14]}]
#Sch name = in_port10
set_property PACKAGE_PIN C16 [get_ports {input[15]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[15]}]

# Switch
set_property PACKAGE_PIN W17 [get_ports {rst}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rst}]		
		
##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {input[0]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[0]}]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {input[1]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[1]}]
##Sch name = in_port3
set_property PACKAGE_PIN N17 [get_ports {input[2]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[2]}]
#Sch name = in_port4
set_property PACKAGE_PIN P18 [get_ports {input[3]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[3]}]
#Sch name = in_port7
set_property PACKAGE_PIN L17 [get_ports {input[4]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[4]}]
#Sch name = in_port8
set_property PACKAGE_PIN M19 [get_ports {input[5]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[5]}]
#Sch name = in_port9
set_property PACKAGE_PIN P17 [get_ports {input[6]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[6]}]
#Sch name = in_port10
set_property PACKAGE_PIN R18 [get_ports {input[7]}]
		set_property IOSTANDARD LVCMOS33 [get_ports {input[7]}]
		
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {SSEG[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {SSEG[0]}]
set_property PACKAGE_PIN W6 [get_ports {SSEG[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {SSEG[1]}]
set_property PACKAGE_PIN U8 [get_ports {SSEG[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {SSEG[2]}]
set_property PACKAGE_PIN V8 [get_ports {SSEG[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {SSEG[3]}]
set_property PACKAGE_PIN U5 [get_ports {SSEG[4]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {SSEG[4]}]
set_property PACKAGE_PIN V5 [get_ports {SSEG[5]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {SSEG[5]}]
set_property PACKAGE_PIN U7 [get_ports {SSEG[6]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {SSEG[6]}]

set_property PACKAGE_PIN U2 [get_ports {AN[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
set_property PACKAGE_PIN U4 [get_ports {AN[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property PACKAGE_PIN V4 [get_ports {AN[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property PACKAGE_PIN W4 [get_ports {AN[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
    
## LEDs
set_property PACKAGE_PIN U16 [get_ports {output[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {output[0]}]
set_property PACKAGE_PIN E19 [get_ports {output[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[1]}]
set_property PACKAGE_PIN U19 [get_ports {output[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[2]}]
set_property PACKAGE_PIN V19 [get_ports {output[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[3]}]
set_property PACKAGE_PIN W18 [get_ports {output[4]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[4]}]
set_property PACKAGE_PIN U15 [get_ports {output[5]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[5]}]
set_property PACKAGE_PIN U14 [get_ports {output[6]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[6]}]
set_property PACKAGE_PIN V14 [get_ports {output[7]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[7]}]
set_property PACKAGE_PIN V13 [get_ports {output[8]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[8]}]
set_property PACKAGE_PIN V3 [get_ports {output[9]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[9]}]
set_property PACKAGE_PIN W3 [get_ports {output[10]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[10]}]
set_property PACKAGE_PIN U3 [get_ports {output[11]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[11]}]
set_property PACKAGE_PIN P3 [get_ports {output[12]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[12]}]
set_property PACKAGE_PIN N3 [get_ports {output[13]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {outputd[13]}]
set_property PACKAGE_PIN P1 [get_ports {output[14]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[14]}]
set_property PACKAGE_PIN L1 [get_ports {output[15]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {output[15]}]
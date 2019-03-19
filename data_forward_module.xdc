## clock signal
set_property PACKAGE_PIN W5 [get_ports display_clock]
		set_property IOSTANDARD LVCMOS33 [get_ports display_clock]
		#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports
clock]
		
set_property PACKAGE_PIN K17 [get_ports {clock}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {clock}]
		#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports
clock]
	set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clock_IBUF}]
		
##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {in_port[8]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[8]}]
#Sch name = in_port2
set_property PACKAGE_PIN A16 [get_ports {in_port[9]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[9]}]
#Sch name = in_port3
set_property PACKAGE_PIN B15 [get_ports {in_port[10]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[10]}]
#Sch name = in_port4
set_property PACKAGE_PIN B16 [get_ports {in_port[11]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[11]}]
#Sch name = in_port7
set_property PACKAGE_PIN A15 [get_ports {in_port[12]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[12]}]
#Sch name = in_port8
set_property PACKAGE_PIN A17 [get_ports {in_port[13]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[13]}]
#Sch name = in_port9
set_property PACKAGE_PIN C15 [get_ports {in_port[14]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[14]}]
#Sch name = in_port10
set_property PACKAGE_PIN C16 [get_ports {in_port[15]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[15]}]

		
		
##Pmod Header JC
##Sch name = JC1
#set_property PACKAGE_PIN K17 [get_ports {debounced_pulse}
]
		#set_property IOSTANDARD LVCMOS33 [get_ports {debounced_pulse}]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {ack_signal}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {ack_signal}]
##Sch name = in_port3
set_property PACKAGE_PIN N17 [get_ports {in_port[2]}
]
		set_property IOSTANDARD [get_ports {in_port[2]}]
#Sch name = in_port4
set_property PACKAGE_PIN P18 [get_ports {in_port[3]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[3]}]
#Sch name = in_port7
set_property PACKAGE_PIN L17 [get_ports {in_port[4]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[4]}]
#Sch name = in_port8
set_property PACKAGE_PIN M19 [get_ports {in_port[5]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[5]}]
#Sch name = in_port9
set_property PACKAGE_PIN P17 [get_ports {in_port[6]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[6]}]
#Sch name = in_port10
set_property PACKAGE_PIN R18 [get_ports {in_port[7]}
]
		set_property IOSTANDARD LVCMOS33 [get_ports {in_port[7]}]
if {[package vsatisfies [package present Tcl] 8.5]} {
	package ifneeded gpib 4.3.7 [list apply {{dir} {
		load [file join $dir libgpib_tcl.so] gpib

		set gpibTclInitScript [file join $dir gpib.tcl]
		if {[file exists $gpibTclInitScript]} {
			source $gpibTclInitScript
		}
	}} $dir]
} elseif {[package vsatisfies [package present Tcl] 8.4]} {
	package ifneeded gpib 4.3.7 [list load [file join $dir libgpib_tcl.so] gpib]
}

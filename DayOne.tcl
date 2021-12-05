set file [open "input.txt"]
set input [read $file]
set depths [split $input]
set length [llength $depths]
set increases 0

for {set i 1} {$i < $length} {incr i} {
  if {[lindex $depths $i] > [lindex $depths [expr $i - 1]]} {
    incr increases
  }
}

puts "Increased $increases times."

set wincreases 0

for {set i 3} {$i < $length} {incr i} {
  if {[lindex $depths $i] > [lindex $depths [expr $i - 3]]} {
    incr wincreases
  }
}

puts "Sliding 3-window increased $wincreases times."

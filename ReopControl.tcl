################################################################
# ReopControl  v1.0
#
# Author: ]Kami[ (http://www.slo-eggdrop.com)
# Bugs, questions: http://www.slo-eggdrop.com/forum
#
# History:
#        -n/a
#
# Latest Version: 
#               -1.0
#
# To do:
#      -Displaying added reops with dcc command
#      -Add some new features
#
#
# Info:
# With this script you can control reops via Eggdrop. You can add
# reop with command .+reop <hostname> [channel] and remove it
# with command .-reop <hostname> [channel]. I think i don't have
# to say, that this script only works on networks which support +R.
###################################################################
#                       Code starts here                          #
###################################################################
bind dcc m +reop dcc:addreop
bind dcc m -reop dcc:delreop

proc dcc:addreop {hand idx text} {
global filereops
set reophost [lindex $text 0]
set reopchan [lindex $text 1]
if {[llength $text]<2} {
putlog "Uporaba: +reop <hostname> \[channel\]"
} else {
putlog "Added reop (+R) $reophost on channel $reopchan"
putquick "MODE $reopchan +R $reophost"
 }
}

proc dcc:delreop {hand idx text} {
set reophost [lindex $text 0]
set reopchan [lindex $text 1]
if {[llength $text]<2} {
putlog "Uporaba: -reop <hostname> \[channel\]"
} else {
putlog "Removed reop (+R) $reophost on channel $reopcha"
putquick "MODE $reopchan -R $reophost"
 }
}

putlog "ReopControl v1.0 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"
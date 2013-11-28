################################################################
# Greet v1.0
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
#      -Channel Flag (enabling it with .chanset #channel 
#       +greetscript)
#
# Info:
# Bot will notice users which joined you channel with message you
# have set.
##################################################################
# General settings
##################################################################
#
set changreet "#channel"
# Here you set chan on which you want script to work
#
set greettext "Welcome to $chan"
# Here you set your greet message
###################################################################
#                       Code starts here                          
################################################################### 
bind join - * greet

proc greet {nick mask hand chan} {
global changreet greettext
if { $chan == $changreet } {
putquick "notice $nick :$greettext"
return 0
 }
}

putlog "Greet v1.0 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"
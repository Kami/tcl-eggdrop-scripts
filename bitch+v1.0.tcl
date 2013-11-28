################################################################
# Bitch+ v1.0
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
#      -6 kick (bot can kick 6 users, 5 oped and 1 who gave op)
#      -Channel flag (you can enable it with .chanset #channel 
#       +bitchplus
#      -Changing kick message via partyline
#
#
# Info:
# Bot kicks user if he op's other user (only channel or global 
# masters can give op's). Now it can kick up to 4 users in one
# second, in next update you can except kicking up to 6 users in
# one second. Script is based on extrabitch by thepin.
##################################################################
# General settings
##################################################################
set channels "#channel1 #channel2 #channel3"
# Here you set channel(s) on which script will work
#
set kickmsgoped "Don't give op again!"
# Here you set kick message for user who gave op(s)
#
set kickmsggotop "You have failied :)"
# Here you set kick message for users which were oped
###################################################################
#                       Code starts here                          
###################################################################
set allowmn 1
bind mode - * mode:bitch
proc mode:bitch {nick uhost handle channel mchange theone} {
 global channels botnick allowmn
  set mode [lindex $mchange 0]
  if {$mode != "+o" || ![string match "* [string tolower $channel ]*" "l [string tolower $channels] l"] || [matchattr $handle b] || [string tolower $theone] == [string tolower $botnick] || [string tolower $nick] == [string tolower $botnick]} {return 0}
  if {$allowmn == 1 && ([matchattr $handle n] || [matchattr $handle m])} {return 0}
  if {[onchan $nick $channel] == 0} {return 0}
  putquick "KICK $channel $nick :$::kickmsgoped"
  putquick "KICK $channel $theone :$::kickmsggotop"
  
 return 0
}

putlog "Bitch+ v1.0 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"
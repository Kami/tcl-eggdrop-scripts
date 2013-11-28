################################################################
# Limit protection v1.0
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
#      -Channel flag (you can enable it with .chanset #channel +limitprot)
#      -Special flag for users which can set limit
#      -Bot restores limit even if master/owner changes it
#
# Info:
# Script will protect channel limit from being removed/changed
# by normal users. Only masters/bots can change/remove it. User
# who will remove limit will be kicked and channel will be closed,
# channel will be opend by bots after 2 minutes.
##################################################################
# General settings
##################################################################
#
set warningmsg "Don't panic, channel was closed because non authorizired user changed/removed limit!"
# Here you set warning message which bot will notice to channel
# where limit was removed/changed
#
set kickmsg "Don't remove/change channel limit"
# Here you set kick message
###################################################################
#                       Code starts here                          
################################################################### 
bind mode - *-l* prot_limit
bind mode - *+l* prot_limit
proc prot_limit {nick host hand chan args} {
global botnick
if {[matchattr $hand mb]} {return}
if { $nick == $::botnick } {return }
if {[onchan $nick $chan] == 0} {return}
putquick "KICK $chan $nick :$::kickmsg"
putquick "MODE $chan +i"
putquick "NOTICE $chan :$::warningmsg"
timer 2 "puthelp \"MODE $chan -im\""
timer 2 "puthelp \"NOTICE $chan :Channel is open again, happy chatting :)\""
}

putlog "Loaded Limit Protection v1.0 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"

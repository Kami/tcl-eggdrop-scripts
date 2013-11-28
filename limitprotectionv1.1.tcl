################################################################
# Limit protection v1.1
#
# Author: ]Kami[ (http://www.slo-eggdrop.com)
# Bugs, questions: http://www.slo-eggdrop.com/forum
#
# History:
#        -Added channel flag, now you can enable limit protection
#         on specified channel with command 
#         .chanset #channel +limitprot and disable it with command
#         .chanset #channel -limitprot
#        -User who changes limit is banned
#
# Latest Version: 
#               -1.1
#
# To do:
#      -Special flag for users which can set limit
#      -Bot restores limit even if master/owner changes it
#
# Info:
# Script will protect channel limit from being removed/changed
# by normal users. Only masters/bots can change/remove it. User
# who will remove limit will be banned and channel will be closed,
# channel will be opend by bots after 2 minutes. You enable it
# with .chanset #channel +limitprot and disable it with command
# .chanset #channel -limitprot
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
setudef flag limitprot
bind mode - *-l* prot_limit
bind mode - *+l* prot_limit
proc prot_limit {nick host hand chan args} {
if {[matchattr $hand mb]} {return}
if {$nick == $::botnick} {return}
if {![channel get $chan limitprot]} {return}
if {[onchan $nick $chan] == 0} {return}
scan $host {%*[^@]@%s} uhost
putquick "KICK $chan $nick :$::kickmsg"
putquick "MODE $chan +b *!*@$host"
putquick "MODE $chan +i"
putquick "NOTICE $chan :$::warningmsg"
timer 2 "puthelp \"MODE $chan -im\""
timer 2 "puthelp \"NOTICE $chan :Channel is open again, happy chatting :)\""
}

putlog "Loaded Limit Protection v1.1 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"

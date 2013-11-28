################################################################
# Limit protection v1.2
#
# Author: ]Kami[ (http://www.slo-eggdrop.com)
# Bugs, questions: http://www.slo-eggdrop.com/forum
#
# History:
#        -Bot don't kick user if it has L flag
#        -Added 'locktime' variable
#        -Added 'openmsg' variable
#        -Added channel flag, now you can enable limit protection
#         on specified channel with command 
#         .chanset #channel +limitprot and disable it with command
#         .chanset #channel -limitprot
#        -User who changes limit is banned
#
# Latest Version: 
#               -1.2
#
# To do:
#      -Bot restores limit even if master/owner changes it
#
# Info:
# Script will protect channel limit from being removed/changed
# by normal users. Only masters/bots can change/remove it. User
# who will remove limit will be banned and channel will be closed.
# Channel will be open by bots after 'locktime'. You enable it
# with .chanset #channel +limitprot and disable it with command
# .chanset #channel -limitprot
##################################################################
# General settings
##################################################################
#
set warningmsg "Don't panic, channel was closed because non authorizired user changed/removed limit!"
# Here you set warning message which bot will send to the channel
# where limit was removed/changed
#
set openmsg "Channel is open again, happy chatting :)"
# Here you set message which bot will send to the channel
# when it will open it.
#
set locktime "30"
# Her you set how long channel will be closed (+i) in seconds
#
set kickmsg "Don't remove/change channel limit"
# Here you set kick message
###################################################################
#                       Code starts here                          
################################################################### 
#OBF
setudef flag limitprot
bind mode - *-l* prot_limit
bind mode - *+l* prot_limit
proc prot_limit {nick host hand chan args} {
if {[matchattr $hand Lmb|Lmb $chan]} {return}
if {$nick == $::botnick} {return}
if {![channel get $chan limitprot]} {return}
if {[onchan $nick $chan] == 0} {return}
scan $host {%*[^@]@%s} uhost
putquick "KICK $chan $nick :$::kickmsg"
putquick "MODE $chan +b *!*@$host"
putquick "MODE $chan +i"
putquick "NOTICE $chan :$::warningmsg"
utimer $::locktime "puthelp \"MODE $chan -im\""
utimer $::locktime "puthelp \"NOTICE $chan :$::openmsg\""
}

putlog "Loaded Limit Protection v1.2 by \]Kami\[ (http://www.slo-eggdrop.com) loaded"
#/OBF
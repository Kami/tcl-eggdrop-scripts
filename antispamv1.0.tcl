################################################################
# Anti Spam v1.0
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
#      -n/a
#
# Info:
# Script bans users which don't have op or o/f flag and are using
# words "*#*", "*ftp://*", "*http://*", "*www.*"
##################################################################
# General settings
##################################################################
set spamreason "Don't spam"
# Here you set kick message
##################################################################
# Pubs
##################################################################
bind pubm - {* *#*} spam:pubm 
bind pubm - {* *ftp://*} spam:pubm 
bind pubm - {* *http://*} spam:pubm 
bind pubm - {* *www.*} spam:pubm
###################################################################
#                       Code starts here                          
################################################################### 

proc spam:pubm {nick uhost hand chan text} { 
  if {[matchattr $hand of|fo $chan] || [isop $nick $chan]} { 
    return 
  } 
  scan $uhost {%*[^@]@%s} host 
  putquick "MODE $chan +b *!*@$host" 
  putquick "KICK $chan $nick :$::spamreason"
} 

putlog "Anti Spam v1.0 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"
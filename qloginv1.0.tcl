################################################################
# Q login v1.0
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
# Script will auth your bot to quakenet channel service (Q) and
# hide his host.
##################################################################
# General settings
##################################################################
#
#
set quser "myuser"
# Here you put your Quakenet login username
#
set qpass "mypass"
# here you put your Quakenet login pass
###################################################################
#                       Code starts here                          
################################################################### 

bind evnt - init-server my:qlogin
proc my:qlogint init-server {
  putquick "PRIVMSG Q@CServe.quakenet.org :AUTH $::quser $::qpass"
  putquick "MODE $::botnick +x"
}



putlog "Q login v1.0 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"

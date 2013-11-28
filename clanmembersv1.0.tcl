##################################################################
# Clan members v1.0
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
#      -Some small changes :)
#
# Info:
# Bot msg's your clan members names which you have specified to
# your channel. Very simple without many options.
##################################################################
# General settings
##################################################################
set chan "#clans" 
# Here you set your channel name, on which script will work
#
# Here you put members nicks
set clanmembers(list) "members nicks"
##################################################################
# Pubs
################################################################## 
bind pub -|- "!members" pub:members 
bind pub -|- "!help" pub:help
###################################################################
#                       Code starts here                          
###################################################################

proc pub:members {nick host handle chan arg} {
  putquick "PRIVMSG $chan :4Clan Members are:12 $::clanmembers(list)"
} 
 
proc pub:help {nick host handle channel arg} {
    putquick "PRIVMSG $channel :4This is Clan Member script by 12Kami4, avalible Commands are: 12!members"
} 

putlog "Clan Member v1.0 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"

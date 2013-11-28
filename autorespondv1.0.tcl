################################################################
# Auto Respond v1.0
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
#      -Timer (so bot will respond to words with some delay)
#      -Respond to multiple words (bind pubm ;))
#
# Info:
# Bot will respond to some words (only on channels) with pre
# defined answers. Script is very simple, so expect updates soon :)
##################################################################
# Pubs
##################################################################
bind pub -|- "oj" pub:oj
bind pub -|- "gre" pub:kak_gre
bind pub -|- "dobro" pub:dobro
bind pub -|- "ajde" pub:ajde
bind pub -|- "ajd" pub:ajd
bind pub -|- "tu?" pub:kdo_tu
bind pub -|- ":)" pub:smile
bind pub -|- ":(" pub:sad
bind pub -|- ";)" pub:wink
bind pub -|- "adijo" pub:adijo
bind pub -|- "tejkal" pub:take
bind pub -|- "lol" pub:lol
bind pub -|- ":D" pub:big
bind pub -|- "haha" pub:haha
bind pub -|- "hehe" pub:hehe
bind pub -|- ":P" pub:tung
bind pub -|- "kje" pub:kje
bind pub -|- "King_Kai" pub:king
bind pub -|- "uzivaj" pub:uzivaj
bind pub -|- "averse" pub:averse
###################################################################
#                       Code starts here                          
################################################################### 

proc pub:oj {nick host handle chan arg} {
  putquick "PRIVMSG $chan :oj, Kak Gre ?"
} 
 
proc pub:kak_gre {nick host handle channel arg} {
    putquick "PRIVMSG $channel :vredi, ti?"
} 

proc pub:dobro {nick host handle channel arg} {
    putquick "PRIVMSG $channel :ql :>"
} 

proc pub:ajde {nick host handle channel arg} {
    putquick "PRIVMSG $channel :ajd :)"
} 

proc pub:ajd {nick host handle channel arg} {
    putquick "PRIVMSG $channel :ajde"
}

proc pub:kdo_tu {nick host handle channel arg} {
    putquick "PRIVMSG $channel :nop :)"
}

proc pub:smile {nick host handle channel arg} {
    putquick "PRIVMSG $channel :;)"
}

proc pub:adijo {nick host handle channel arg} {
    putquick "PRIVMSG $channel :ajde, uživaj.."
}


proc pub:sad {nick host handle channel arg} {
    putquick "PRIVMSG $channel ::/"
}

proc pub:big {nick host handle channel arg} {
    putquick "PRIVMSG $channel :oh ja :D"
}
proc pub:take {nick host handle channel arg} {
    putquick "PRIVMSG $channel :lol"
}

proc pub:lol {nick host handle channel arg} {
    putquick "PRIVMSG $channel ::D"
}

proc pub:haha {nick host handle channel arg} {
    putquick "PRIVMSG $channel :lol :P"
}

proc pub:hehe {nick host handle channel arg} {
    putquick "PRIVMSG $channel ::P"
}

proc pub:king {nick host handle channel arg} {
    putquick "PRIVMSG $channel :ni me :)"
}


proc pub:kje {nick host handle channel arg} {
    putquick "PRIVMSG $channel :www.eggdrop.gajba.net ;)"
}

proc pub:uzivaj {nick host handle channel arg} {
    putquick "PRIVMSG $channel :enako :)"
}

proc pub:wink {nick host handle channel arg} {
    putquick "PRIVMSG $channel ::)"
}

proc pub:averse {nick host handle channel arg} {
    putquick "PRIVMSG $channel :AversE r0x ;)"
}



putlog "Auto Respond v1.0 by \]Kami\[ (http://Www.slo-eggdrop.com) loaded"

##############################################################################################################################################################################################################################################################################
# DECENT ESPRESSO DEFAULT SKIN
##############################################################################################################################################################################################################################################################################

# use the standard graphic filenames and standard settings pages
source "[homedir]/skins/default/standard_includes.tcl"

##############################################################################################################################################################################################################################################################################
# text and buttons to display when the DE1 is idle

# these 3 text labels are for the three main DE1 functions, and they X,Y coordinates need to be adjusted for your skin graphics
add_de1_text "off water" 510 1076 -text [translate "HOT WATER"] -font Helv_10_bold -fill "#2d3046" -anchor "center" 
add_de1_text "off steam" 2048 1076 -text [translate "STEAM"] -font Helv_10_bold -fill "#2d3046" -anchor "center" 
add_de1_text "off espresso" 1280 1076 -text [translate "ESPRESSO"] -font Helv_10_bold -fill "#2d3046" -anchor "center" 

# these 3 buttons are rectangular areas, where tapping the rectangle causes a major DE1 action (steam/espresso/water)
add_de1_button "off" "say [translate {water}] $::settings(sound_button_in);start_water" 210 612 808 1416
add_de1_button "off" "say [translate {steam}] $::settings(sound_button_in);start_steam" 1748 616 2346 1414
add_de1_button "off" "say [translate {espresso}] $::settings(sound_button_in);start_espresso" 948 584 1606 1444

# these 2 buttons are rectangular areas for putting the machine to sleep or starting settings.  Traditionally, tapping one of the corners of the screen puts it to sleep.
add_de1_button "off" "say [translate {sleep}] $::settings(sound_button_in);start_sleep" 0 0 400 400
add_de1_button "off" {backup_settings; page_to_show_when_off settings_1} 2000 0 2560 500
add_de1_variable "off" 1280 1236 -justify right -anchor "center" -text "" -font Helv_8 -fill "#Ff272a" -width 520 -textvariable {[group_head_heating_text]} 

# during espresso we show the current state of things and a timer
add_de1_variable "espresso" 1280 1136 -text "" -font Helv_9_bold -fill "#7f879a" -anchor "center" -textvariable {"[translate [de1_substate_text]]"} 
add_de1_variable "espresso" 1285 1226 -justify left -anchor "center" -text "" -font Helv_8 -fill "#42465c" -width 520 -textvariable {[pour_timer][translate "s"]} 

##############################################################################################################################################################################################################################################################################
# text and buttons to display when the DE1 is doing steam, hot water or espresso

# the standard behavior when the DE1 is doing something is for tapping anywhere on the screen to stop that. This "source" command does that.
source "[homedir]/skins/default/standard_stop_buttons.tcl"
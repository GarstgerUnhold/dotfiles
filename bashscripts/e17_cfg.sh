#!/bin/bash
#Restores my e17 config

enlightenment_remote -module-load "ibox"
enlightenment_remote -module-enable "ibox"
enlightenment_remote -module-load "battery"
enlightenment_remote -module-enable "battery"
enlightenment_remote -module-load "cpufreq"
enlightenment_remote -module-enable "cpufreq"
enlightenment_remote -module-load "temperature"
enlightenment_remote -module-enable "temperature"
enlightenment_remote -module-load "pager"
enlightenment_remote -module-enable "pager"
enlightenment_remote -module-load "efm_nav"
enlightenment_remote -module-enable "efm_nav"
enlightenment_remote -module-load "efm_path"
enlightenment_remote -module-enable "efm_path"
enlightenment_remote -module-load "mixer"
enlightenment_remote -module-enable "mixer"
enlightenment_remote -module-load "cpu"
enlightenment_remote -module-enable "cpu"
enlightenment_remote -module-load "tclock"
enlightenment_remote -module-enable "tclock"
enlightenment_remote -module-load "module_exalt"
enlightenment_remote -module-enable "module_exalt"
enlightenment_remote -module-load "net"
enlightenment_remote -module-enable "net"
enlightenment_remote -module-load "notification"
enlightenment_remote -module-enable "notification"
enlightenment_remote -module-load "news"
enlightenment_remote -module-enable "news"
enlightenment_remote -module-load "ibar"
enlightenment_remote -module-enable "ibar"
enlightenment_remote -module-load "forecasts"
enlightenment_remote -module-enable "forecasts"
enlightenment_remote -module-load "iiirk"
enlightenment_remote -module-enable "iiirk"
enlightenment_remote -module-load "mpdule"
enlightenment_remote -module-enable "mpdule"
enlightenment_remote -module-load "clock"
enlightenment_remote -module-enable "clock"
enlightenment_remote -module-load "start"
enlightenment_remote -module-enable "start"
enlightenment_remote -module-load "exebuf"
enlightenment_remote -module-enable "exebuf"
enlightenment_remote -module-load "winlist"
enlightenment_remote -module-enable "winlist"
enlightenment_remote -module-load "alarm"
enlightenment_remote -module-enable "alarm"
enlightenment_remote -module-load "conf"
enlightenment_remote -module-enable "conf"
enlightenment_remote -module-load "conf_applications"
enlightenment_remote -module-enable "conf_applications"
enlightenment_remote -module-load "conf_clientlist"
enlightenment_remote -module-enable "conf_clientlist"
enlightenment_remote -module-load "conf_desk"
enlightenment_remote -module-enable "conf_desk"
enlightenment_remote -module-load "conf_desklock"
enlightenment_remote -module-enable "conf_desklock"
enlightenment_remote -module-load "conf_desks"
enlightenment_remote -module-enable "conf_desks"
enlightenment_remote -module-load "conf_display"
enlightenment_remote -module-enable "conf_display"
enlightenment_remote -module-load "conf_exebuf"
enlightenment_remote -module-enable "conf_exebuf"
enlightenment_remote -module-load "conf_intl"
enlightenment_remote -module-enable "conf_intl"
enlightenment_remote -module-load "conf_keybindings"
enlightenment_remote -module-enable "conf_keybindings"
enlightenment_remote -module-load "conf_mouse_cursor"
enlightenment_remote -module-enable "conf_mouse_cursor"
enlightenment_remote -module-load "conf_performance"
enlightenment_remote -module-enable "conf_performance"
enlightenment_remote -module-load "conf_screensaver"
enlightenment_remote -module-enable "conf_screensaver"
enlightenment_remote -module-load "conf_shelves"
enlightenment_remote -module-enable "conf_shelves"
enlightenment_remote -module-load "conf_theme"
enlightenment_remote -module-enable "conf_theme"
enlightenment_remote -module-load "conf_wallpaper"
enlightenment_remote -module-enable "conf_wallpaper"
enlightenment_remote -module-load "conf_window_display"
enlightenment_remote -module-enable "conf_window_display"
enlightenment_remote -module-load "fileman"
enlightenment_remote -module-enable "fileman"
enlightenment_remote -module-load "conf_dpms"
enlightenment_remote -module-enable "conf_dpms"
enlightenment_remote -module-load "conf_transitions"
enlightenment_remote -module-enable "conf_transitions"
enlightenment_remote -module-load "conf_imc"
enlightenment_remote -module-enable "conf_imc"
#enlightenment_remote -default-bg-set "/home/tim/.e/e/backgrounds/4_seasons_by_vxside.edj"
#enlightenment_remote -theme-set theme "/home/tim/.e/e/themes/detour-e17.edj"
enlightenment_remote -lang-set "de_DE.UTF-8"
enlightenment_remote -framerate-set 15 
enlightenment_remote -edge-flip-moving-set 0
enlightenment_remote -edge-flip-dragging-set 1
enlightenment_remote -desks-set 4 1
enlightenment_remote -binding-key-del ANY "F1" "ALT" 0 "desk_linear_flip_to" "0"
enlightenment_remote -binding-key-del ANY "F2" "ALT" 0 "desk_linear_flip_to" "1"
enlightenment_remote -binding-key-del ANY "F3" "ALT" 0 "desk_linear_flip_to" "2"
enlightenment_remote -binding-key-del ANY "F4" "ALT" 0 "desk_linear_flip_to" "3"
enlightenment_remote -binding-key-del ANY "F5" "ALT" 0 "desk_linear_flip_to" "4"
enlightenment_remote -binding-key-del ANY "F6" "ALT" 0 "desk_linear_flip_to" "5"
enlightenment_remote -binding-key-del ANY "F7" "ALT" 0 "desk_linear_flip_to" "6"
enlightenment_remote -binding-key-del ANY "F8" "ALT" 0 "desk_linear_flip_to" "7"
enlightenment_remote -binding-key-del ANY "F9" "ALT" 0 "desk_linear_flip_to" "8"
enlightenment_remote -binding-key-del ANY "F10" "ALT" 0 "desk_linear_flip_to" "9"
enlightenment_remote -binding-key-del ANY "F11" "ALT" 0 "desk_linear_flip_to" "10"
enlightenment_remote -binding-key-del ANY "F12" "ALT" 0 "desk_linear_flip_to" "11"
enlightenment_remote -binding-mouse-add  BORDER 1 ALT 0 "window_move" ""
enlightenment_remote -binding-mouse-add  BORDER 2 ALT 0 "window_resize" ""
enlightenment_remote -binding-mouse-add  BORDER 3 ALT 0 "window_menu" ""
enlightenment_remote -binding-mouse-add  ZONE 1 NONE 0 "menu_show" "main"
enlightenment_remote -binding-mouse-add  ZONE 2 NONE 0 "menu_show" "clients"
enlightenment_remote -binding-mouse-add  ZONE 3 NONE 0 "menu_show" "favorites"
enlightenment_remote -binding-key-add  ANY "Menu" NONE 0 "menu_show" "main"
enlightenment_remote -binding-key-add  ANY "Keycode-160" NONE 0 "mute" ""
enlightenment_remote -binding-key-add  ANY "Keycode-174" NONE 0 "decrease_volume" ""
enlightenment_remote -binding-key-add  ANY "Keycode-176" NONE 0 "increase_volume" ""
enlightenment_remote -binding-key-add  ANY "Menu" CTRL 0 "menu_show" "clients"
enlightenment_remote -binding-key-add  ANY "F2" ALT 0 "exebuf" ""
enlightenment_remote -binding-key-add  ANY "F4" ALT 0 "window_close" ""
enlightenment_remote -binding-key-add  ANY "F12" ALT 0 "desk_linear_flip_to" "11"
enlightenment_remote -binding-key-add  ANY "Tab" ALT 0 "winlist" "next"
enlightenment_remote -binding-key-add  ANY "Menu" ALT 0 "menu_show" "favorites"
enlightenment_remote -binding-key-add  ANY "space" ALT 0 "fileman" ""
enlightenment_remote -binding-key-add  ANY "Escape" ALT 0 "exebuf" ""
enlightenment_remote -binding-key-add  ANY "0" WIN 0 "desk_linear_flip_to" "9"
enlightenment_remote -binding-key-add  ANY "1" WIN 0 "desk_linear_flip_to" "0"
enlightenment_remote -binding-key-add  ANY "2" WIN 0 "desk_linear_flip_to" "1"
enlightenment_remote -binding-key-add  ANY "3" WIN 0 "desk_linear_flip_to" "2"
enlightenment_remote -binding-key-add  ANY "4" WIN 0 "desk_linear_flip_to" "3"
enlightenment_remote -binding-key-add  ANY "5" WIN 0 "desk_linear_flip_to" "4"
enlightenment_remote -binding-key-add  ANY "6" WIN 0 "desk_linear_flip_to" "5"
enlightenment_remote -binding-key-add  ANY "7" WIN 0 "desk_linear_flip_to" "6"
enlightenment_remote -binding-key-add  ANY "8" WIN 0 "desk_linear_flip_to" "7"
enlightenment_remote -binding-key-add  ANY "9" WIN 0 "desk_linear_flip_to" "8"
enlightenment_remote -binding-key-add  ANY "c" WIN 0 "cleanup_windows" ""
enlightenment_remote -binding-key-add  ANY "d" WIN 0 "window_maximized_toggle" "fill"
enlightenment_remote -binding-key-add  ANY "f" WIN 0 "window_fullscreen_toggle" ""
enlightenment_remote -binding-key-add  ANY "g" WIN 0 "gadman_toggle" ""
enlightenment_remote -binding-key-add  ANY "m" WIN 0 "window_maximized_toggle" ""
enlightenment_remote -binding-key-add  ANY "F1" WIN 0 "window_push" "left"
enlightenment_remote -binding-key-add  ANY "F2" WIN 0 "window_push" "right"
enlightenment_remote -binding-key-add  ANY "Up" WIN 0 "window_maximized_toggle" "default vertical"
enlightenment_remote -binding-key-add  ANY "Right" WIN 0 "window_maximized_toggle" "default horizontal"
enlightenment_remote -binding-key-add  ANY "Tab" "SHIFT|ALT" 0 "winlist" "prev"
enlightenment_remote -binding-key-add  ANY "a" "CTRL|ALT" 0 "menu_show" "favorites"
enlightenment_remote -binding-key-add  ANY "d" "CTRL|ALT" 0 "desk_deskshow_toggle" ""
enlightenment_remote -binding-key-add  ANY "i" "CTRL|ALT" 0 "window_iconic_toggle" ""
enlightenment_remote -binding-key-add  ANY "k" "CTRL|ALT" 0 "window_kill" ""
enlightenment_remote -binding-key-add  ANY "l" "CTRL|ALT" 0 "desk_lock" ""
enlightenment_remote -binding-key-add  ANY "m" "CTRL|ALT" 0 "menu_show" "main"
enlightenment_remote -binding-key-add  ANY "r" "CTRL|ALT" 0 "window_shaded_toggle" "up"
enlightenment_remote -binding-key-add  ANY "s" "CTRL|ALT" 0 "window_sticky_toggle" ""
enlightenment_remote -binding-key-add  ANY "w" "CTRL|ALT" 0 "window_menu" ""
enlightenment_remote -binding-key-add  ANY "Up" "CTRL|ALT" 0 "window_raise" ""
enlightenment_remote -binding-key-add  ANY "End" "CTRL|ALT" 0 "restart" ""
enlightenment_remote -binding-key-add  ANY "Down" "CTRL|ALT" 0 "window_lower" ""
enlightenment_remote -binding-key-add  ANY "Left" "CTRL|ALT" 0 "desk_linear_flip_by" "-1"
enlightenment_remote -binding-key-add  ANY "Right" "CTRL|ALT" 0 "desk_linear_flip_by" "1"
enlightenment_remote -binding-key-add  ANY "Delete" "CTRL|ALT" 0 "exec" "Eterm"
enlightenment_remote -binding-key-add  ANY "Insert" "CTRL|ALT" 0 "exec" "Eterm"
enlightenment_remote -always-click-to-raise-set 1
enlightenment_remote -focus-setting-set NEW_DIALOG_IF_OWNER_FOCUSED
enlightenment_remote -window-placement-policy-set SMART
enlightenment_remote -restart


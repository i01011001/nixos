riverctl input pointer-1267-12632-ELAN050A:01_04F3:3158_Touchpad tap enabled
riverctl input pointer-1267-12632-ELAN050A:01_04F3:3158_Touchpad natural-scroll enabled

riverctl declare-mode passthrough
riverctl map normal Super F9 enter-mode passthrough
riverctl map passthrough Super F9 enter-mode normal

riverctl rule-add ssd
riverctl default-layout wideriver

riverctl border-width 1

wideriver \ --layout            left        \
--layout-alt                    monocle     \
--stack                         diminish    \
--count-master                  1           \
--ratio-master                  0.618       \
--count-wide-left               2           \
--ratio-wide                    0.35        \
--no-smart-gaps                             \
--inner-gaps                    8           \
--outer-gaps                    5           \
--border-width                  1           \
--border-width-monocle          1           \
--border-width-smart-gaps       0           \
--border-color-focused-monocle  "0x4a4a4a"  \
--border-color-focused          "0x4a4a4a"  \
--border-color-unfocused        "0x373737"  &      

riverctl border-color-urgent "0x545454" 
riverctl border-color-focused "0x4a4a4a" 
riverctl border-color-unfocused "0x373737" 

riverctl map normal Super+Control K    send-layout-cmd wideriver "--layout top"
riverctl map normal Super+Control L send-layout-cmd wideriver "--layout right"
riverctl map normal Super+Control J  send-layout-cmd wideriver "--layout bottom"
riverctl map normal Super+Control H  send-layout-cmd wideriver "--layout left"
riverctl map normal Super+Control M send-layout-cmd wideriver "--layout monocle"
riverctl map normal Super+Control W  send-layout-cmd wideriver "--layout wide"

riverctl map normal Super+Control Space send-layout-cmd wideriver "--layout-toggle"

riverctl map normal Super H send-layout-cmd wideriver "--ratio +0.025"
riverctl map normal Super equal send-layout-cmd wideriver "--ratio .60"
riverctl map normal Super L send-layout-cmd wideriver "--ratio -0.025"

riverctl map normal Super+Shift H send-layout-cmd wideriver "--count +1"
riverctl map normal Super+Shift L send-layout-cmd wideriver "--count -1"
riverctl map normal Super+Shift equal send-layout-cmd wideriver "--count 1"

riverctl map normal Super+Control E send-layout-cmd wideriver "--stack even"
riverctl map normal Super+Control W send-layout-cmd wideriver "--stack dwindle"
riverctl map normal Super+Control I send-layout-cmd wideriver "--stack diminish"

riverctl map-pointer normal Super BTN_LEFT move-view
riverctl map-pointer normal Super BTN_RIGHT resize-view
riverctl map-pointer normal Super BTN_MIDDLE toggle-float

riverctl set-cursor-warp on-focus-change 

riverctl rule-add float
riverctl rule-add dimensions '800' '540'

exec mako &
# wbg /etc/nixos/mono-slope.jpg &

for i in $(seq 1 9)
do
  tags=$((1 << ($i - 1)))
  riverctl map normal Super $i set-focused-tags $tags
  riverctl map normal Super+Shift $i set-view-tags $tags
  riverctl map normal Super+Control $i toggle-focused-tags $tags
  riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
done

wbg ~/Downloads/nixos-wp.jpg


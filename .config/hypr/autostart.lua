hl.on("hyprland.start", function ()
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
  hl.exec_cmd("waybar")
end)

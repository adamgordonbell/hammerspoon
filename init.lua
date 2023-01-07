-- Hello World
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
    hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

-- Config reload
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/sandbox/hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

---- My text expansions 
ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["htmlc"] = "<!-- -->",
    ["tt??"] = "## ** **<!-- 00:00 -->",
    ["date??"] = function() return os.date("%B %d, %Y") end,
    ["s?"] = '## **A**\r\n*Description*',
    ["e?"] = "## **End**",
}
ht:start()

-- VLC controls
hs.hotkey.bind({"cmd", "alt"}, "P", function()
    hs.osascript.applescript("tell application \"VLC\" to play")
end)

hs.hotkey.bind({"cmd", "alt"}, "B", function()
    hs.osascript.applescript("tell application \"VLC\" to step backward")
end)

hs.hotkey.bind({"cmd", "alt"}, "F", function()
    hs.osascript.applescript("tell application \"VLC\" to step forward")
end)

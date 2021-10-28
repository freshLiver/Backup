var panel = new Panel
var panelScreen = panel.screen
var freeEdges = {"bottom": true, "top": true, "left": true, "right": true}

for (i = 0; i < panelIds.length; ++i) {
    var tmpPanel = panelById(panelIds[i])
    if (tmpPanel.screen == panelScreen) {
        // Ignore the new panel
        if (tmpPanel.id != panel.id) {
            freeEdges[tmpPanel.location] = false;
        }
    }
}

// prefer top 
if (freeEdges["top"] == true) {
    panel.location = "top";
} 
else if (freeEdges["bottom"] == true) {
    panel.location = "bottom";
} 
else if (freeEdges["left"] == true) {
    panel.location = "left";
} 
else if (freeEdges["right"] == true) {
    panel.location = "right";
} 
// There is no free edge, but still prefer top
else {
    panel.location = "top";
}

panel.height = gridUnit * 1

//var kickoff = panel.addWidget("org.kde.plasma.kickoff")
//kickoff.currentConfigGroup = ["Shortcuts"]
//kickoff.writeConfig("global", "Alt+F1")
//kickoff.currentConfigGroup = ["Configuration/General"]
//kickoff.writeConfig("showAppsByName", "true")

//panel.addWidget("org.kde.plasma.showActivityManager")
//panel.addWidget("org.kde.plasma.taskmanager")

// network speed
var netSpeed = panel.addWidget("com.github.zren.commandoutput")
netSpeed.currentConfigGroup = ["Configuration/General"]
netSpeed.writeConfig("command", "sh /home/freshliver/Dropbox/Backup/Settings/ShellScripts/DownloadUploadSpeed.sh")
netSpeed.writeConfig("interval", "1000")
netSpeed.writeConfig("textColor", "#eff0f1")
netSpeed.writeConfig("fontSize", "15")
netSpeed.writeConfig("bold", "true")

// SPACE
panel.addWidget("org.kde.plasma.panelspacer")

// CPU Usage & Temperature
var cpuUsage = panel.addWidget("com.github.zren.commandoutput")
cpuUsage.currentConfigGroup = ["Configuration/General"]
cpuUsage.writeConfig("command", "sh /home/freshliver/Dropbox/Backup/Settings/ShellScripts/CPUUsage.sh")
cpuUsage.writeConfig("interval", "1000")
cpuUsage.writeConfig("textColor", "#f10004")
cpuUsage.writeConfig("fontSize", "15")
cpuUsage.writeConfig("bold", "true")


var cpuTemp= panel.addWidget("com.github.zren.commandoutput")
cpuTemp.currentConfigGroup = ["Configuration/General"]
cpuTemp.writeConfig("command", "sh /home/freshliver/Dropbox/Backup/Settings/ShellScripts/CPUTemperature.sh")
cpuTemp.writeConfig("interval", "5000")
cpuTemp.writeConfig("textColor", "#f19900")
cpuTemp.writeConfig("fontSize", "15")
cpuTemp.writeConfig("bold", "true")


// Keyboard Lock State
var keyState = panel.addWidget("com.github.zren.commandoutput")
keyState.currentConfigGroup = ["Configuration/General"]
keyState.writeConfig("command", "sh /home/freshliver/Dropbox/Backup/Settings/ShellScripts/KeyboardLockState.sh")
keyState.writeConfig("interval", "1000")
keyState.writeConfig("textColor", "#eff0f1")
keyState.writeConfig("fontSize", "15")
keyState.writeConfig("bold", "true")


// Memory Usage
var memUsage = panel.addWidget("com.github.zren.commandoutput")
memUsage.currentConfigGroup = ["Configuration/General"]
memUsage.writeConfig("command", "sh /home/freshliver/Dropbox/Backup/Settings/ShellScripts/MemUsage.sh")
memUsage.writeConfig("interval", "5000")
memUsage.writeConfig("textColor", "#00f108")
memUsage.writeConfig("fontSize", "15")
memUsage.writeConfig("bold", "true")


// SPACE
panel.addWidget("org.kde.plasma.panelspacer")


/* Next up is determining whether to add the Input Method Panel
 * widget to the panel or not. This is done based on whether
 * the system locale's language id is a member of the following
 * white list of languages which are known to pull in one of
 * our supported IME backends when chosen during installation
 * of common distributions. */

var langIds = ["as",    // Assamese
               "bn",    // Bengali
               "bo",    // Tibetan
               "brx",   // Bodo
               "doi",   // Dogri
               "gu",    // Gujarati
               "hi",    // Hindi
               "ja",    // Japanese
               "kn",    // Kannada
               "ko",    // Korean
               "kok",   // Konkani
               "ks",    // Kashmiri
               "lep",   // Lepcha
               "mai",   // Maithili
               "ml",    // Malayalam
               "mni",   // Manipuri
               "mr",    // Marathi
               "ne",    // Nepali
               "or",    // Odia
               "pa",    // Punjabi
               "sa",    // Sanskrit
               "sat",   // Santali
               "sd",    // Sindhi
               "si",    // Sinhala
               "ta",    // Tamil
               "te",    // Telugu
               "th",    // Thai
               "ur",    // Urdu
               "vi",    // Vietnamese
               "zh_CN", // Simplified Chinese
               "zh_TW"] // Traditional Chinese

if (langIds.indexOf(languageId) != -1) {
    panel.addWidget("org.kde.plasma.kimpanel");
}

// my systemtray items (left to right)

// 1. left most is application icons
var sysTray = panel.addWidget("org.kde.plasma.systemtray")
sysTray.currentConfigGroup = ["General"]
sysTray.writeGlobalConfig("miscellaneousShown", "false")
sysTray.writeGlobalConfig("hardwareControlShown", "false")
sysTray.writeGlobalConfig("systemServicesShown", "false")
sysTray.writeGlobalConfig("communicationsShown", "false")
sysTray.writeGlobalConfig("applicationStatusShown", "true")



// 2. second, devicenotifier, kdeconnect
var devicenotifier = panel.addWidget("org.kde.plasma.devicenotifier")
devicenotifier.currentConfigGroup = ["General"]
devicenotifier.writeConfig("removableDevices", "true")
devicenotifier.writeConfig("popupOnNewDevice", "false")

var kdeconnect = panel.addwidget("org.kde.kdeconnect")

// 3. and then org.kde.plasma.battery
var battery = panel.addWidget("org.kde.plasma.battery")
battery.currentConfigGroup = ["General"]
battery.writeConfig("showPercentage", "false")

// 4. and then org.kde.plasma.volume
var volume = panel.addWidget("org.kde.plasma.volume")
volume.currentConfigGroup = ["General"]
volume.writeConfig("maximumVolume", "100")
volume.writeConfig("volumeStep", "5")
volume.writeConfig("volumeFeedback", "true")

// 5. and then org.kde.plasma.bluetooth
var bluetooth = panel.addWidget("org.kde.plasma.bluetooth")

// 6. last is org.kde.plasma.networkmanagement
var networkmanagement = panel.addWidget("org.kde.plasma.networkmanagement")



// digital clock with seconds
var digitalClock = panel.addWidget("org.kde.plasma.digitalclock")
digitalClock.currentConfigGroup = ["Configuration/Appearance"]
digitalClock.writeConfig("showSeconds", "true")


// show user icon(face)
var userSwitcher = panel.addWidget("org.kde.plasma.userswitcher")
userSwitcher.currentConfigGroup = ["General"]
userSwitcher.writeConfig("showFace", "true")
userSwitcher.writeConfig("showName", "true")
userSwitcher.writeConfig("showFullName", "true")

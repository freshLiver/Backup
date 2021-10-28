# My KDE Settings 

## 變更 Title Bar Color

## 自訂 Panel Template

### 參考：



## 部份應用程式(例如 Telegram、Kate、Console、dolphin) 無法輸入中文

### 參考：

[Linux下無法在telegram輸入中文(解法)](https://medium.com/@kagami91582/note-linux%E4%B8%8B%E7%84%A1%E6%B3%95%E5%9C%A8telegram%E8%BC%B8%E5%85%A5%E4%B8%AD%E6%96%87-%E8%A7%A3%E6%B3%95-830aa9412c19)

### 解法：

```
[Desktop Entry]
Version=1.0
Name=Telegram Desktop
Comment=Official desktop version of Telegram messaging app
TryExec=/home/freshliver/Dropbox/Tools/Linux/Telegram/Telegram

    add IM module config here
     vvvvvvvvvvvvvvvvvvvvvv
Exec=env QT_IM_MODULE=fcitx /home/freshliver/Dropbox/Tools/Linux/Telegram/Telegram -workdir /home/freshliver/.local/share/TelegramDesktop/ -- %u
Icon=telegram
Terminal=false
StartupWMClass=TelegramDesktop
Type=Application
Categories=Chat;Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;
X-GNOME-UsesNotifications=true
```

### 實際例子：

#### dolphin.desktop 
`Exec=env QT_IM_MODULE=fcitx dolphin %u`

#### dolphin shortcut 
`env QT_IM_MODULE=fcitx dolphin ~`

#### kate.desktop
`Exec=env QT_IM_MODULE=fcitx kate -b %U`

#### Konsole shortcut
`env QT_IM_MODULE=fcitx konsole`

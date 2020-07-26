
[[/index|Back to Index]]

# Basic funcionality

## Core
 
* NetworkManager (better networking then raw wpa_supplicant)
    - dbus (have to enable it before enabling NetworkManager. Also disable dhcpcd)
    - wpa_supplicant 

### For packages
* gcc & make (compile packages)
* curl & git & patch (download and maintain stuff)

### Drivers and libs
* xf86-input-evdev xf86-input-synaptics xf86-video-fbdev xf86-video-intel mesa mesa-dri intel-video-accel
* libXinerama-devel libXft-devel freetype-devel libX11-devel ncurses-term (dependencies for suckless software)

## Audio
* sox alsa-tools alsa-lib-devel alsa-utils

# X
* xorg-minimal xorg-fonts
* dwm (patched via [dwm-flexipatch](https://github.com/bakkeby/dwm-flexipatch))
    - [[file:~/code/void-post/dwm-patches|patches]] 
    - xsetroot (for the bar and sometimes for solid backgrounds)
* dunst (for notifications)
* dmenu (application picker)
* font-awesome5 (for emojis and stuff)
* font-cozette & cozettevector (my favorite font)
* xclip (for managing clipboard)
* xrandr (for screen resolution)
* sxhkd (simple x hot key daemon)
* xbacklight (for screen light)
* tlp (battery management)    
* picom (compositor)
* unclutter (bc fuck the mouse)
* slock (simple screen locker)
* maim (screenshot utility, scrot was buggy for me)
* setxkbmap (for custom layout and language toggle)
 
## Terminal
* st (patched via [st-flexipatch](https://github.com/bakkeby/st-flexipatch))
    - [[file:~/code/void-post/st-patches|patches]]
* zsh (the best shell!!)
    - [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) (framework for configuring zsh)
    - [zsh-vim-mode](https://github.com/softmoth/zsh-vim-mode) (better vi mode)
    - [zsh-syntax-highlighing](https://github.com/zsh-users/zsh-syntax-highlighting) (syntax on the command line!)
* tmux (for saving sessions, mutiple "pages" in terminal, copying stuff with the keyboard)
    - [tpm](https://github.com/tmux-plugins/tpm) (plugin manager)
    - [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) (better copy-mode)
    - [tmux-open](https://github.com/tmux-plugins/tmux-open) (open highlighted stuff directly from terminal)
    - [tmux-yank](https://github.com/tmux-plugins/tmux-yank) (enable yank, which it should have by default)
    - [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight) (shows when you press the prefix key)
  
### TUIs
* [ranger](https://github.com/ranger/ranger) (File manager that a **was** using: good but bloated; go for [lf](https://github.com/gokcehan/lf))
    - [ueberzug](https://github.com/seebye/ueberzug) (for better window previews)
    - ffmpegthumbnailer (for video thumbnails)
* [nnn](https://github.com/jarun/nnn) (fast as fuck and written in C; just preview images with sxiv)
* newsboat (RSS feeds, mostly youtube, but for news from artix, void and arch)
* [cordless](https://github.com/Bios-Marcel/cordless) (Discord client)
* weechat (IRC client)
* [tuir](https://gitlab.com/ajak/tuir) (Reddit client)
* [straw-viewer](https://github.com/trizen/straw-viewer) (faster alternative for [mps-youtube](https://github.com/mps-youtube/mps-youtube); forked from [youtube-viewer](https://github.com/trizen/youtube-viewer))
* htop (as always)
* alsamixer (sound without bloat)
* [tremc](https://github.com/tremc/tremc) (tui for transmission)

### Tools
* fzf (fuzzyfinder, running uppond [[file:~/code/scripts/fuzzyfinder.sh|this script]])
* pass (password management)
    - gnupg (for gpg encription) 
    - passmenu (implementation with dmenu)
* youtube-dl (for downloading videos from youtube and others)
    - ffmpeg
* tree
* feh (image viewer)
* mpv (THE BEST VIDEO VIEWER)
* shellcheck (syntax checker, mostly used to check if my script iw POSIX compliant)
* transmission (torrent client)
 
### N E O V I M

#### Stuff for aesthetics
* [Gruvbox](https://github.com/morhetz/gruvbox) (The best colorscheme)
* [LightLine](https://github.com/itchyny/lightline.vim) (Beautiful statusline, faster then airline)
* [vim-css-color](https://github.com/skammer/vim-css-color) (preview hex colors)
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) (not using rn, but beautiful)
* [Dashboard](https://github.com/hardcoreplayers/dashboard-nvim/wiki) (Prettier then startify)

#### Stuff for usability
* [auto-pairs](https://github.com/jiangmiao/auto-pairs) (""[]{}())
* [vim-surround](https://github.com/tpope/vim-surround) (delete things around words)
* [vim-clap](https://github.com/liuchengxu/vim-clap) (file manager, fuzzy finder and more)
* [vim-obsession](https://github.com/tpope/vim-obsession) (for tmux-ressurect)
* [syntastic](https://github.com/vim-syntastic/syntastic) (compiling and syntax errors)
* [vim-smoothie](https://github.com/psliwka/vim-smoothie) (vim smooth scrool)
* [tabular](https://github.com/godlygeek/tabular) (Align text, good for eqn)
* [coc.nvim](https://github.com/neoclide/coc.nvim) (Intelisence on nvim)
* [vim-which-key](https://github.com/liuchengxu/vim-which-key) (just for checking if bindings are ocupied)
 
#### Extra funcionality stuff
* [Vimwiki](https://github.com/vimwiki/vimwiki) (your own personal wiki; I use it kinda like an org mode)
* [vim-markdown](https://github.com/plasticboy/vim-markdown) (markdown syntax)
* [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) (easely drawn tables)
* [markdown-prevew](https://github.com/iamcco/markdown-preview.nvim) (Markdown live preview)

## GUI Aplications
* zathura (the bext pdf viewer)
    - zathura-pdf-poppler (poppler viewer engine)
    - zathura-cb (comic book support)
* qutebrowser (THE BEST BROWSER)
* gucharmap (for searching unicode chars)

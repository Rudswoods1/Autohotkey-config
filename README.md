# my-autohotkey-config

AutoHotkey configuration I use to control workspaces, programs and various system commands on Windows, using the same style of keybindings I use on Linux.

## Virtual Desktop Hotkeys 

Action | Keys 
--- | :-:
**Switch** to virtual desktop **1, 2, etc.**<br>|<kbd>Alt</kbd> + <kbd>1</kbd><br><kbd>Alt</kbd> + <kbd>2</kbd><br>...<br><kbd>Alt</kbd> + <kbd>9</kbd>
**Create** a new virtual desktop|<kbd>Win</kbd> + <kbd>Ctrl</kbd> + <kbd>C</kbd>
**Delete** the current virtual desktop|<kbd>Win</kbd> + <kbd>Ctrl</kbd> + <kbd>D</kbd>
**Move** the current window to another <br>desktop, then switch to it|<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>←</kbd><br><kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>→</kbd>

## Windows OS Hotkeys 
 
Action | Keys 
--- | :-:
**Close** the current window|<kbd>Win</kbd> + <kbd>Q</kbd>
**Resize** (maximize/restore) the current window|<kbd>Win</kbd> + <kbd>W</kbd>
**Switch** between windows|<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>←</kbd><br><kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>→</kbd>
**Switch** focus & cursor between windows|<kbd>Win</kbd> + <kbd>X</kbd> + <kbd>←</kbd><br><kbd>Win</kbd> + <kbd>X</kbd> + <kbd>→</kbd>
**Change** transparency of the active window|<kbd>Ctrl</kbd> + <kbd>B</kbd>
**Toggle** Night mode |<kbd>Shift</kbd> + <kbd>F1</kbd><br><kbd>Shift</kbd> + <kbd>F2</kbd>
**Shutdown** the system|<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Insert</kbd>
**Restart** the system|<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Print Sc</kbd>

## Programs Hotkeys 
 
Action | Keys 
--- | :-:
**CMD**|<kbd>Win</kbd> + <kbd>T</kbd>
**Task Manager**|<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Delete</kbd>
**Chrome**|<kbd>Win</kbd> + <kbd>F</kbd>
**Spotify**|<kbd>Win</kbd> + <kbd>S</kbd>
**Telegram**|<kbd>Win</kbd> + <kbd>G</kbd>
**VS CODE**|<kbd>Win</kbd> + <kbd>V</kbd>
**Notepad**|<kbd>Win</kbd> + <kbd>N</kbd>
**NotesHub** (PWA)|<kbd>Win</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd>

> ## Overview
> This project provides:
> * Linux-style virtual desktop shortcuts for Windows
> * Fast application launcher keybindings
> * Window tiling and movement logic
> * Warm screen / “Night Mode” emulation
> * Transparency toggle
> * System commands (shutdown/restart)
>
>All features are implemented using pure AutoHotkey with support from VirtualDesktopAccessor.dll.

> ## Running
> 1. Install [AutoHotkey](https://autohotkey.com/download/) (v1.1 or later)
> 2. Run the script:
   `Programs Keybinds.ahk`
> 3. Place **[VirtualDesktopAccessor](https://github.com/Ciantic/VirtualDesktopAccessor)** in the script directory:
> 4. Optional: disable Windows animation in
   *"Adjust the appearance and performance of Windows"* →
   uncheck **“Animate windows when minimizing and maximizing”**.
> 

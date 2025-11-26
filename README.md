# my-autohotkey-config

Autohotkey configuration I use to control workspaces, programs, and other commands on Windows, using the same keybindings I use on Linux.


> ## Virtual Desktop Hotkeys 
> 
> Action | Keys 
> --- | :-:
> **Switch** to virtual desktop **1, 2, etc.**<br>|<kbd>Alt</kbd> + <kbd>1</kbd><br><kbd>Alt</kbd> + <kbd>2</kbd><br>...<br><kbd>Alt</kbd> + <kbd>9</kbd>
> **Create** a new virtual desktop|<kbd>Win</kbd> + <kbd>Ctrl</kbd> + <kbd>C</kbd>
> **Delete** the current virtual desktop|<kbd>Win</kbd> + <kbd>Ctrl</kbd> + <kbd>D</kbd>
> **Move** the current window to another desktop, then switch to it|<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>←</kbd><br><kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>→</kbd>

> ## Windows OS Hotkeys 
> 
> Action | Keys 
> --- | :-:
> **Close** the current window|<kbd>Win</kbd> + <kbd>Q</kbd>
> **Resizing** the current window|<kbd>Win</kbd> + <kbd>W</kbd>
> **Switch** between windows|<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>←</kbd><br><kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>→</kbd>
> **Switch** focus and cursor between windows|<kbd>Win</kbd> + <kbd>X</kbd> + <kbd>←</kbd><br><kbd>Win</kbd> + <kbd>X</kbd> + <kbd>→</kbd>
> **Change** transparency of the current window|<kbd>Ctrl</kbd> + <kbd>B</kbd>
> **Turn on** Night mode and off|<kbd>Shift</kbd> + <kbd>F1</kbd><br><kbd>Shift</kbd> + <kbd>F2</kbd>
> **Shutdown** the System|<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Insert</kbd>
> **Restart** the System|<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Print Sc</kbd>

> ## Programs Hotkeys 
> 
> Action | Keys 
> --- | :-:
> **CMD**|<kbd>Win</kbd> + <kbd>T</kbd>
> **Task Manager**|<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Delete</kbd>
> **Chrome**|<kbd>Win</kbd> + <kbd>F</kbd>
> **Spotify**|<kbd>Win</kbd> + <kbd>S</kbd>
> **Telegram**|<kbd>Win</kbd> + <kbd>G</kbd>
> **VS CODE**|<kbd>Win</kbd> + <kbd>V</kbd>
> **Notepad**|<kbd>Win</kbd> + <kbd>N</kbd>
> **NotesHub**|<kbd>Win</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd>

> ## Overview
> Some text
> 
> ## Running
> [Install AutoHotkey](https://autohotkey.com/download/) v1.1 or later, then run the `Programs Keybinds.ahk` script (open with AutoHotkey if prompted) and [VirtualDesktopAccessor.dll](https://github.com/Ciantic/VirtualDesktopAccessor) (for support to control virtual desktops). You can disable the switching animation by opening "Adjust the appearance and performance of Windows" and then unselecting the checkmark "Animate windows when minimizing and maximizing".
> 
> ### Notes about Windows 1809/1903≤ Updates
> This project relies partly on VirtualDesktopAccessor.dll. This binary is included in this repository for convenience, and was recently updated to work with the 1809/1903≤ updates. 

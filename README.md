# windows-desktop-switcher

Autohotkey configuration I use to control workspaces (virtual desktops) on Windows, using the same workspaces and keybindings I use on Linux.


> ## Virtual Desktop Hotkeys 
> 
> Action | Keys 
> --- | :-:
> **Switch** to virtual desktop **1, 2, etc.**<br>|<kbd>Alt</kbd> + <kbd>1</kbd><br><kbd>Alt</kbd> + <kbd>2</kbd><br>...<br><kbd>Alt</kbd> + <kbd>9</kbd>
> **Create** a new virtual desktop|**<kbd> </kbd> + <kbd></kbd>**
> **Delete** the current virtual desktop|<kbd></kbd> + <kbd></kbd>
> **Move** the current window to another desktop, then switch to it|<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>←</kbd><br><kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>→</kbd>

> ## Windows OS Hotkeys 
> 
> Action | Keys 
> --- | :-:
> **Close** the current window|<kbd>Win</kbd> + <kbd>Q</kbd>
> **Resizing** the current window|<kbd>Win</kbd> + <kbd>W</kbd>
> **Switch** focus and cursor between windows|<kbd>Win</kbd> + <kbd>X</kbd> + <kbd>←</kbd><br><kbd>Win</kbd> + <kbd>X</kbd> + <kbd>→</kbd>
> **Change** transparency of the current window|<kbd>Ctrl</kbd> + <kbd>B</kbd>
> **Turn on** night mode and off|<kbd>Shift</kbd> + <kbd>F1</kbd><br><kbd>Shift</kbd> + <kbd>F2</kbd>
>
> ## Overview
> Some text
> 
> ## Running
> [Install AutoHotkey](https://autohotkey.com/download/) v1.1 or later, then run the `desktop_switcher.ahk` script (open with AutoHotkey if prompted). You can disable the switching animation by opening "Adjust the appearance and performance of Windows" and then unselecting the checkmark "Animate windows when minimizing and maximizing".
> 
> ### Notes about Windows 1809/1903≤ Updates
> This project relies partly on [VirtualDesktopAccessor.dll](https://github.com/Ciantic/VirtualDesktopAccessor) (for moving windows to other desktops). This binary is included in this repository for convenience, and was recently updated to work with the 1809/1903≤ updates. 
> 

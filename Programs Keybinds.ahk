; =====================================
;    
;   0. Настройки Виртуальных Десктопов
;      
; =====================================

DesktopCount := 4  
CurrentDesktop := 1 

; Ctrl+Alt+N - для следующего трека
#IfWinActive
^!n:: 
Send {Media_Next}
return

; === 1. Перемещение через рабочие столы (Ctrl + Win + стрелки)
^#Right::Send ^#{Right}
^#Left::Send ^#{Left}

; === 2. Создание нового рабочего стола (Win + Ctrl + D)
^#d::Send ^#d
return

; === 3. Стандартная комбинация для удаления текущего рабочего стола (Win+Ctrl+F4)
^#F::
    Send ^#{F4} ;
return




; =====================================
;    
;   1.  Открытие программ 
;      
; =====================================

; === 1. Открытие CMD (Win + T)
#t::Run, % "cmd.exe /k cd /d C:\", , C:\

; === 2. Открытие Task Manager (Ctrl + Win + Delete)
^#Delete:: Run taskmgr
return

; === 3. Открытие Chrome (Win + F)
#f::Run chrome.exe

; === 4. Открытие Spotify (Win + S)
#s::Run "C:\Users\nurbolik\AppData\Roaming\Spotify\Spotify.exe"

; === 5. Открытие Telegram (Win + G)
#g::Run "C:\Users\nurbolik\AppData\Roaming\Telegram Desktop\Telegram.exe"

; === 6. Открытие VS Code (Win + V)
#v::Run "C:\Users\nurbolik\AppData\Local\Programs\Microsoft VS Code\Code.exe"

; === 7. Открытие блокнота (Win + N)
#n::Run notepad.exe

; === 8. Открытие блокнота (Win + Shift + N)
#+n::Run "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe" --profile-directory=Default --app-id=cgainpneeikidkfocghppdpjaccgalkn
return




; ======================================
;    
;   2. Комманды Виртуальных Десктопов
;      
; ======================================

; === 1. Закрытие активного окна (Win + Q)
#q::WinClose, A


; === 2. Перемещение окна через воркспейсы(Ctrl + Win + Alt + Left&Right)
^#!Right:: 
MoveWindowToDesktop("right")
return

^#!Left:: 
MoveWindowToDesktop("left")
return

MoveWindowToDesktop(direction) {
    dll := A_ScriptDir . "\VirtualDesktopAccessor.dll"
    if (!FileExist(dll)) {
        MsgBox, 48, Ошибка, Файл VirtualDesktopAccessor.dll не найден в папке скрипта.`nСкачай его отсюда:`nhttps://github.com/Ciantic/VirtualDesktopAccessor/releases
        return
    }

    if (!hMod := DllCall("LoadLibrary", "Str", dll, "Ptr")) {
        MsgBox, 48, Ошибка, Не удалось загрузить VirtualDesktopAccessor.dll
        return
    }

    hwnd := WinExist("A")
    if (hwnd) {
        current := DllCall(dll . "\GetCurrentDesktopNumber", "Int")
        count := DllCall(dll . "\GetDesktopCount", "Int")
        
        target := (direction = "right") ? current + 1 : current - 1
        if (target < 0 || target >= count) {
            SoundBeep
            return
        }

        DllCall(dll . "\MoveWindowToDesktopNumber", "Ptr", hwnd, "Int", target)
        DllCall(dll . "\GoToDesktopNumber", "Int", target)
    }
}


; === 3. Увеличение или уменьшение окна (Win + W)
#w::
    WinGet, windowState, MinMax, A  
    if (windowState = 1) {
        WinRestore, A  ; 
    } else {
        WinMaximize, A  
    }
return

; === 4. Увеличение или уменьшение размера окна (Win + X + left/right)
~x & Left::
    WinGetPos, X, Y, W, H, A
    W := W - 50
    WinMove, A, , X, Y, W, H
return

~x & Right::
    WinGetPos, X, Y, W, H, A
    W := W + 50
    WinMove, A, , X, Y, W, H
return

~x & Up::
    WinGetPos, X, Y, W, H, A
    H := H - 50
    WinMove, A, , X, Y, W, H
return

~x & Down::
    WinGetPos, X, Y, W, H, A
    H := H + 50
    WinMove, A, , X, Y, W, H
return

; === 5. Смена фокуса и курсора между окнами (Win + X + left/right)
#NoEnv
#SingleInstance Force
SetBatchLines -1

#+Left:: 
    direction = Left
    Gosub, MoveCursorToWindow
return

#+Right:: 
    direction = Right
    Gosub, MoveCursorToWindow
return

#+Up:: 
    direction = Up
    Gosub, MoveCursorToWindow
return

#+Down:: 
    direction = Down
    Gosub, MoveCursorToWindow
return

MoveCursorToWindow:
    WinGet, CurrentWindow, ID, A
    if not CurrentWindow
        return

    WinGetPos, currX, currY, currW, currH, ahk_id %CurrentWindow%
    if (currX = "" or currY = "" or currW = "" or currH = "")
        return

    currCenterX := currX + (currW // 2)
    currCenterY := currY + (currH // 2)

    closestWindow = 0
    minDistance = 999999
    targetX = targetY = targetW = targetH = 0

    WinGet, WindowList, List
    Loop, %WindowList% {
        WindowID := WindowList%A_Index%
        if (WindowID = CurrentWindow)
            continue

        WinGetTitle, title, ahk_id %WindowID%
        if (title = "")
            continue
            
        WinGet, style, Style, ahk_id %WindowID%
        if ((style & 0xC00000) = 0)
            continue
            
        if not DllCall("IsWindowVisible", "UInt", WindowID)
            continue
            
        if DllCall("IsIconic", "UInt", WindowID)
            continue

        WinGetPos, X, Y, W, H, ahk_id %WindowID%
        if (X = "" or Y = "" or W = "" or H = "")
            continue

        centerX := X + (W // 2)
        centerY := Y + (H // 2)

        if (direction = "Left") {
            if (centerX >= currCenterX)
                continue
            deltaX := currCenterX - centerX
            deltaY := Abs(currCenterY - centerY)
            distance := deltaX + deltaY * 0.3
        }
        else if (direction = "Right") {
            if (centerX <= currCenterX)
                continue
            deltaX := centerX - currCenterX
            deltaY := Abs(currCenterY - centerY)
            distance := deltaX + deltaY * 0.3
        }
        else if (direction = "Up") {
            if (centerY >= currCenterY)
                continue
            deltaY := currCenterY - centerY
            deltaX := Abs(currCenterX - centerX)
            distance := deltaY + deltaX * 0.3
        }
        else if (direction = "Down") {
            if (centerY <= currCenterY)
                continue
            deltaY := centerY - currCenterY
            deltaX := Abs(currCenterX - centerX)
            distance := deltaY + deltaX * 0.3
        }

        if (distance < minDistance) {
            minDistance := distance
            closestWindow := WindowID
            targetX := X
            targetY := Y
            targetW := W
            targetH := H
        }
    }

    if closestWindow {
        MouseMove, % targetX + (targetW // 2), % targetY + (targetH // 2), 0
        WinActivate, ahk_id %closestWindow%
    }
return

; === 6. Перемещение через рабочие столы (Alt + 1,2,3...9)

switchDesktopByNumber(targetDesktop)
{
    global CurrentDesktop, DesktopCount
    desktopName := getDesktopNameByNumber(targetDesktop)
    updateGlobalVariables()
    _switchDesktopToTarget(targetDesktop)
}

getDesktopNameByNumber(number)
{
    return "Desktop " . number
}

updateGlobalVariables()
{
    global CurrentDesktop, DesktopCount
}

_switchDesktopToTarget(targetDesktop)
{
    dll := A_ScriptDir . "\VirtualDesktopAccessor.dll"
    if (!FileExist(dll)) {
        MsgBox, 48, Ошибка, Файл VirtualDesktopAccessor.dll не найден в папке скрипта.`nСкачай его отсюда:`nhttps://github.com/Ciantic/VirtualDesktopAccessor/releases
        return
    }

    if (!hMod := DllCall("LoadLibrary", "Str", dll, "Ptr")) {
        MsgBox, 48, Ошибка, Не удалось загрузить VirtualDesktopAccessor.dll
        return
    }

    count := DllCall(dll . "\GetDesktopCount", "Int")
    
    if (targetDesktop < 1 || targetDesktop > count) {
        SoundBeep
        return
    }

    targetIndex := targetDesktop - 1
    DllCall(dll . "\GoToDesktopNumber", "Int", targetIndex)
}

!1::
    switchDesktopByNumber(1)
return

!2::
    switchDesktopByNumber(2)
return

!3::
    switchDesktopByNumber(3)
return

!4::
    switchDesktopByNumber(4)
return

!5::
    switchDesktopByNumber(5)
return

!6::
    switchDesktopByNumber(6)
return

!7::
    switchDesktopByNumber(7)
return

!8::
    switchDesktopByNumber(8)
return

!9::
    switchDesktopByNumber(9)
return

; === 6. Переключатель прозрачности активного окна при нажатии Ctrl+B
^b::
{
    WinGet, winID, ID, A
    WinGet, currentTransparency, Transparent, ahk_id %winID%
    
    if (currentTransparency == "")
        currentTransparency := 255 ; 
    
    if (currentTransparency > 100)  
    {
        WinSet, Transparent, 0, ahk_id %winID%
    }
    else
    {
        WinSet, Transparent, 255, ahk_id %winID%
    }
}
return







; ====================================
;   
;     3. Ночной теплый режим
;   
; ====================================

; SHIFT + F1 — плавное включение тёплого режима
+F1::
    SmoothWarm()
return

; SHIFT + F2 — плавное выключение
+F2::
    SmoothReset()
return

; SHIFT + F3 — «ночной режим» (максимально тёплый, как фильтр 1900K)
+F3::
    SetWarm(0.45)
return

; SHIFT + F4 — «вечерний режим» (комфортный Night Light)
+F4::
    SetWarm(0.75)
return


; ============================
;   FUNC: плавное включение
; ============================
SmoothWarm() {
    Loop, 40 {
        f := A_Index/40.0
        SetWarm(f)
        Sleep, 20
    }
}

; ============================
;   FUNC: плавное выключение
; ============================
SmoothReset() {
    Loop, 40 {
        f := 1 - (A_Index/40.0)
        SetWarm(f)
        Sleep, 20
    }
    ResetGamma()
}

; ============================
;   FUNC: установка тёплоты
;   warmLevel = 0.0…1.0
; ============================
SetWarm(warmLevel) {
    VarSetCapacity(ramp, 1536, 0)

    Loop, 256
    {
        i := A_Index - 1
        val := i * 256

        ; Красный оставляем нормальным
        NumPut(val, ramp, i * 2, "UShort")

        ; Зелёный уменьшаем
        NumPut(val * (0.9 - 0.4 * warmLevel), ramp, 512 + i * 2, "UShort")

        ; Синий уменьшаем сильнее
        NumPut(val * (0.7 - 0.6 * warmLevel), ramp, 1024 + i * 2, "UShort")
    }

    hDC := DllCall("GetDC", "ptr", 0, "ptr")
    DllCall("SetDeviceGammaRamp", "ptr", hDC, "ptr", &ramp)
}

; ============================
;   FUNC: сброс гаммы
; ============================
ResetGamma() {
    VarSetCapacity(ramp, 1536, 0)

    Loop, 256
    {
        i := A_Index - 1
        val := i * 256

        NumPut(val, ramp, i * 2, "UShort")
        NumPut(val, ramp, 512 + i * 2, "UShort")
        NumPut(val, ramp, 1024 + i * 2, "UShort")
    }

    hDC := DllCall("GetDC", "ptr", 0, "ptr")
    DllCall("SetDeviceGammaRamp", "ptr", hDC, "ptr", &ramp)
}



; ============================
;  
;   2. Комманды Windows 
;
; ============================


; === 1. Завершение работы (Ctrl + Alt + Insert)
^!Insert::
    MsgBox, 4,, Вы уверены, что хотите завершить работу?
    IfMsgBox Yes
    {
        Run, *RunAs shutdown.exe /s /t 0
    }
    ; If "No" — ничего не делаем
return

; === 2. Перезагрузка системы (Ctrl + Alt + PrintScreen) 
^!PrintScreen::  ; Ctrl + Alt + PrintScreen
    MsgBox, 4,, Вы действительно хотите перезагрузить компьютер?
    IfMsgBox, Yes
    {
        Run, *RunAs shutdown.exe /r /f /t 0
    }
    ; If "No" — ничего не делаем
return

#NoEnv  ; Рекомендация для производительности
SendMode Input
SetBatchLines -1
OnExit, Cleanup

; === Параметры сетки ===
columns := 3        
rows    := 2       
gapX    := 10       
gapY    := 10       

; Индекс следующей зоны (0..columns*rows-1)
nextZone := 0

; Регистрация на события создания окон
DllCall("RegisterShellHookWindow", "Ptr", WinExist("A"))
msgID := DllCall("RegisterWindowMessage", "Str", "SHELLHOOK")
OnMessage(msgID := msgID+0, "ShellHookProc")

return

ShellHookProc(wParam, lParam) {
    static HSHELL_WINDOWCREATED := 1
    if (wParam = HSHELL_WINDOWCREATED) {
        TileWindow(lParam)
    }
}

TileWindow(hWnd) {
    global columns, rows, gapX, gapY, nextZone
    WinGet, style, Style, ahk_id %hWnd%
    if (style & 0x10000000 = 0) 
        return

    ; Вычисляем размеры
    screenW := A_ScreenWidth // columns
    screenH := A_ScreenHeight // rows
    col := Mod(nextZone, columns)
    row := nextZone // columns

    x := col * screenW + gapX
    y := row * screenH + gapY
    w := screenW - 2*gapX
    h := screenH - 2*gapY

    WinMove, ahk_id %hWnd%, , x, y, w, h 
    nextZone := Mod(nextZone + 1, columns * rows)
}

Cleanup:
    ExitApp
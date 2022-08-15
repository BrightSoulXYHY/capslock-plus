keyFunc_SwitchSelCase() {
    ; MsgBox, , , SwitchSelCase, 0.3
	clipBak := ClipboardAll ; 备份剪贴板
	Clipboard := "" ; 清空剪贴板

	Send, ^c ; 发送 ctrl+c 复制选中文字
	ClipWait, 1 ; 等待复制完毕
	selText := Clipboard
	Alf := SubStr(selText,1,1)
	; MsgBox, , , %Alf%, 0.3
	if Alf is lower
		Mode := "U"
	Else
		Mode := "L"
	; MsgBox, , , %Mode%, 0.3

	Loop, Parse, selText, %A_Space%_`,|;-
	{
		; 计算在这个字段末尾分隔符的位置.
		Position += StrLen(A_LoopField) + 1
		; 获取解析循环中找到的分隔符.
		Delimiter := SubStr(selText, Position, 1)
		str1:= Format("{:" Mode "}", A_LoopField)
		out:=out . str1 . Delimiter
	}
	Clipboard := out
	ClipWait, 1
	Send, ^v
	Sleep, 500 ; 防止没有粘贴完毕剪贴板就被恢复了
	Clipboard := clipBak ; 恢复剪贴板
	return
}

keyFunc_ReplaceInClip() {
	selText := Clipboard
	Clipboard := StrReplace(selText, "\" , "/")
	ClipWait, 1
	Send, ^v
	Sleep, 500 ; 防止没有粘贴完毕剪贴板就被恢复了
	Clipboard := clipBak ; 恢复剪贴板
	return
}

; 功能: 切换选中文字大小写
; keyFunc_SwitchSelCase() {
; }
	; MsgBox, , , SwitchSelCase, 0.3
	; clipBak := ClipboardAll ; 备份剪贴板
	; Clipboard := "" ; 清空剪贴板

	; Send, ^c ; 发送 ctrl+c 复制选中文字
	; ClipWait, 1 ; 等待复制完毕
	; selText := Clipboard
	; Alf := SubStr(selText,1,1)
	; MsgBox, , , %Alf%, 0.3
	; if Alf is lower
	; 	Mode := "U"
	; Else
	; 	Mode := "L"
	; MsgBox, , , %Mode%, 0.3

	; Loop, Parse, selText, %A_Space%_`,|;-
	; {
	; 	; 计算在这个字段末尾分隔符的位置.
	; 	Position += StrLen(A_LoopField) + 1
	; 	; 获取解析循环中找到的分隔符.
	; 	Delimiter := SubStr(selText, Position, 1)
	; 	str1:= Format("{:" Mode "}", A_LoopField)
	; 	out:=out . str1 . Delimiter
	; }
	; Clipboard := out
	; ClipWait, 1
	; Send, ^v
	; Sleep, 500 ; 防止没有粘贴完毕剪贴板就被恢复了
	; Clipboard := clipBak ; 恢复剪贴板
	; return
; }
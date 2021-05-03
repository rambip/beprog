;represents my layout with (hotkey, symbol) pairs
Mapping := {}

FileRead, Content, beprog.txt
Loop, parse, Content, `n
{
	RegExMatch(A_LoopField, "^(SC.{3})\t([^\t]*)\t([^\t\r]*)\t?([^\t\r]*)\r?$", L)

	if StrLen(L2)
	{ ; keys
		Mapping.Insert(L1, Extract(L2))
		Hotkey, %L1%, SendKey
	}
	if StrLen(L3)
	{ ; shif keys
		Mapping.Insert("+"+L1, Extract(L3))
		Hotkey, +%L1%, SendKey
	}
	if StrLen(L4)
	{ ; Compose key
		Mapping.Insert("CapsLock & "+L1, Extract(L4))
		Hotkey, CapsLock & %L1%, SendKey
	}
}

Extract(String){
	; format the string and replace escape sequences by corresponding unicode
	RegExMatch(String, "\[(\d*)\](.*)$", Result)
	if StrLen(Result1) {
		if StrLen(Result2)
		{
			return Chr(Result1) Result2
		}
		else {
			return Chr(Result1)
		}
	}
	return String
}


SendKey:
SendRaw % Mapping[A_ThisHotkey]
return


CapsLock & Space::Escape
+Space:: Send, _


CapsLock & SC017::Home
CapsLock & SC018::End
CapsLock & SC019::End

CapsLock & SC024::Left
CapsLock & SC025::Down
CapsLock & SC026::Up
CapsLock & SC027::Right


; enable/disable
#Space::Suspend
#include ..\Lib\Acc.ahk
Loop {
    lnCol := GetVSCodeLnCol()
    ToolTip("Ln " lnCol.Ln ", Col " lnCol.Col "`nFound elements path: " lnCol.Path)
}
GetVSCodeLnCol() {
    static oLnCol
    try RegExMatch(oLnCol.Name, "Ln (\d+), Col (\d+)", &match)
    catch {
        oLnCol := Acc.ObjectFromWindow("ahk_exe Code.exe").FindFirst({Name:"Ln \d+, Col \d+", matchmode:"Regex"})
        RegExMatch(oLnCol.Name, "Ln (\d+), Col (\d+)", &match)
    }
    return {Ln:match[1], Col:match[2], Path:oLnCol.Path}
}
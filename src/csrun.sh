# C#コードをコンパイル＆実行する。
# カレントディレクトリやその子孫にある.csファイルをすべて対象にする。
CallCsc() { csc -nologo -recurse:*.cs $@; }
FindExe() { find . -name *.exe; }
CallChmod() { chmod ${2:-755} "$1"; }
RunExe() { eval "${1:-$(FindExe)}"; }
BuildAndRun() {
	CallCsc $@
	local exe_path="$(FindExe)"
	CallChmod "$exe_path"
	RunExe "$exe_path"
}

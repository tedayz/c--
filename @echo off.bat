@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo 正在获取管理员权限,不同意将退出哦~（Θ３Θ）
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
)
:w
echo 你要修复什么呢？1:网络/2:学生端/3:退出 不要输错哦（\〃w〃/）（输错会卡bug的）
set /p answer=
if %answer%==1 (
    echo 网络修复中…预计需要1分钟,若出现提示请点击下一步哦！（〃'▽'〃）
    pause
    :a
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    netsh interface ip set dns "本地连接" dhcp
    msdt.exe /id NetworkDiagnosticsNetworkAdapter
    msdt.exe /id NetworkDiagnosticsInbound
    msdt.exe /id NetworkDiagnosticsWeb
    echo 修复成功…了吗？
    echo 修复成功按1，仍未解决按2（｀ω′）
    set /p answer=
    if "%answer%"=="1" (
        echo 修复成功了耶！（＾－＾）V
        pause
        goto e
    ) else (
        echo 重新修复中…预计需要1分钟,若出现提示请点击下一步哦！（〃′-ω' ）
        pause
        goto a
    )
) else if %answer%==2 (
    :z
    start cmd
    echo 修复成功…了吗？
    echo 修复成功按1，仍未解决按2（｀ω′）
    set /p answer=
    if "%answer%"=="1" (
        echo 修复成功了耶！（＾－＾）V
        pause
        goto e
    ) else (
        echo 重新修复中…（〃′-ω' ）
        pause
        goto z
    )
    pause
    goto e
) else if %answer%==3 (
    goto e
) else (
    echo 请回答1或2或3！（▼ヘ▼#）
    goto w
)
:e
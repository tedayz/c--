@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo ���ڻ�ȡ����ԱȨ��,��ͬ�⽫�˳�Ŷ~����������
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
)
:w
echo ��Ҫ�޸�ʲô�أ�1:����/2:ѧ����/3:�˳� ��Ҫ���Ŷ��\��w��/�������Ῠbug�ģ�
set /p answer=
if %answer%==1 (
    echo �����޸��С�Ԥ����Ҫ1����,��������ʾ������һ��Ŷ������'��'����
    pause
    :a
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    netsh interface ip set dns "��������" dhcp
    msdt.exe /id NetworkDiagnosticsNetworkAdapter
    msdt.exe /id NetworkDiagnosticsInbound
    msdt.exe /id NetworkDiagnosticsWeb
    echo �޸��ɹ�������
    echo �޸��ɹ���1����δ�����2����ء䣩
    set /p answer=
    if "%answer%"=="1" (
        echo �޸��ɹ���Ү�����ޣ��ޣ�V
        pause
        goto e
    ) else (
        echo �����޸��С�Ԥ����Ҫ1����,��������ʾ������һ��Ŷ��������-��' ��
        pause
        goto a
    )
) else if %answer%==2 (
    :z
    start cmd
    echo �޸��ɹ�������
    echo �޸��ɹ���1����δ�����2����ء䣩
    set /p answer=
    if "%answer%"=="1" (
        echo �޸��ɹ���Ү�����ޣ��ޣ�V
        pause
        goto e
    ) else (
        echo �����޸��С�������-��' ��
        pause
        goto z
    )
    pause
    goto e
) else if %answer%==3 (
    goto e
) else (
    echo ��ش�1��2��3�������ب�#��
    goto w
)
:e
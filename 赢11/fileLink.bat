@echo off
set attribute="%~a1"
set flieAttribute="--a--------"
set directoryAttribute="d----------"
::rem 设定存放脚本及映射的目录
set mappingPath=%userprofile%\Desktop\LinkBox\
set CLinkBoxPath=%mappingPath%%~nx1
::rem 脚本所在地即为链接生成地
set tagHome="%~dp0"
set OLinkBoxPath=%~d1\LinkBox\
set Obat=%CLinkBoxPath%跨盘符需管理员权限%~n1.bat
::rem 创建脚本及映射目录
if exist %CLinkBoxPath% ( echo "%CLinkBoxPath%" ) else ( mkdir %CLinkBoxPath% )
::rem 核验变量
echo attribute：%attribute%
::echo flieAttribute：%flieAttribute%
::echo directoryAttribute：%directoryAttribute%

::rem 如果文件在c盘
if "C:"=="%~d1" ( goto intoC ) else ( goto intoO )

:intoC
    if %flieAttribute%==%attribute% (
        MKLINK /H "%tagHome%" "%~1"
        echo "--a--------H"
    ) else if %directoryAttribute%==%attribute% (
        MKLINK /J "%tagHome%" "%~1"
        echo "d----------J"
    ) else (
        MKLINK /D "%tagHome%" "%~1"
        echo "-----------D"
    )
    goto end

::rem 如果文件在非c盘
:intoO
    ::if exist %OLinkBoxPath% (
    ::    echo "%OLinkBoxPath%%~nx1"
    ::) else (
    ::    mkdir %OLinkBoxPath%
    ::)
    (
        echo @echo off
        echo cd /D %~d1
    ) > %Obat%
    if %flieAttribute%==%attribute% (
        (
            echo MKLINK "%tagHome%" "%~1"
            echo echo --a--------H
        ) >> %Obat%
    ) else if %directoryAttribute%==%attribute% (
        (
            echo MKLINK /D "%tagHome%" "%~1"
            echo echo d----------J
        ) >> %Obat%
    ) else (
        (
            echo MKLINK /D "%tagHome%" "%~1"
            echo echo -----------D
        ) >> %Obat%
    )
    (
        echo del %Obat%
    ) >> %Obat%
    goto end

:::outC
::    if %flieAttribute%==%attribute% (
::        MKLINK /H "%CLinkBoxPath%%~nx1" "%1"
::        echo "--a--------H"
::    ) else if %directoryAttribute%==%attribute% (
::        MKLINK /J "%CLinkBoxPath%%~nx1" "%1"
::        echo "d----------J"
::    ) else (
::        MKLINK /D "%CLinkBoxPath%%~nx1" "%1"
::        echo "-----------D"
::    )
::    goto end
::
:::outO
::    if %flieAttribute%==%attribute% (
::        (
::            ::MKLINK "%OLinkBoxPath%%~nx1" "%1"
::            echo "--a--------H"
::        )>"%CLinkBoxPath%%~n1.bat"
::    ) else if %directoryAttribute%==%attribute% (
::        (
::            ::MKLINK /D "%OLinkBoxPath%%~nx1" "%1"
::            echo "d----------J"
::        )>"%CLinkBoxPath%%~n1.bat"
::    ) else (
::        (
::            ::MKLINK /D "%OLinkBoxPath%%~nx1" "%1"
::            echo "-----------D"
::        )>"%CLinkBoxPath%%~n1.bat"
::    )
::    goto end
    
:end
::pause

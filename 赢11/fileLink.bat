@echo off
set attribute="%~a1"
set flieAttribute="--a--------"
set directoryAttribute="d----------"
set CLinkBoxPath=%userprofile%\Desktop\LinkBox\
set OLinkBoxPath=%~d1\LinkBox\
set Obat=%CLinkBoxPath%跨盘符需管理员权限%~n1.bat
if exist %CLinkBoxPath% ( echo "%CLinkBoxPath%%~nx1" ) else ( mkdir %CLinkBoxPath% )
::echo %attribute%
::echo %flieAttribute%
::echo %directoryAttribute%
if "C:"=="%~d1" ( goto intoC ) else ( goto intoO )

:intoC
    if %flieAttribute%==%attribute% (
        MKLINK /H "%CLinkBoxPath%%~nx1" "%1"
        echo "--a--------H"
    ) else if %directoryAttribute%==%attribute% (
        MKLINK /J "%CLinkBoxPath%%~nx1" "%1"
        echo "d----------J"
    ) else (
        MKLINK /D "%CLinkBoxPath%%~nx1" "%1"
        echo "-----------D"
    )
    goto end


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
            echo MKLINK "%CLinkBoxPath%%~nx1" "%1"
            echo echo --a--------H
        ) >> %Obat%
    ) else if %directoryAttribute%==%attribute% (
        (
            echo MKLINK /D "%CLinkBoxPath%%~nx1" "%1"
            echo echo d----------J
        ) >> %Obat%
    ) else (
        (
            echo MKLINK /D "%CLinkBoxPath%%~nx1" "%1"
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

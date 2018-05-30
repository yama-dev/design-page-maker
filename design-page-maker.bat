@echo off
rem --------------------
rem | File name  : design-page-maker.bat
rem | Author     : yama-dev - https://github.com/yama-dev
rem | Repository : yama-dev - https://github.com/yama-dev/design-page-maker
rem --------------------

cd /d %~dp0

echo design-page-maker.bat
echo ====================
echo Starting DesignPageMaker ...


rem --------------------
rem | Check if nodejs is installed.
rem --------------------

where node > nul 2>&1

if %ERRORLEVEL% NEQ 0 goto FAILURE

:SUCCESS
echo ====================
echo STATUS:SUCCESS
echo   nodejs installed
node --version
echo ====================
goto CHECK_NODEJS_END

:FAILURE
echo ====================
echo STATUS:ERROR
echo   nodejsï¿½ï¿½ï¿½Cï¿½ï¿½ï¿½Xï¿½gï¿½[ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ä‚ï¿½ï¿½Ü‚ï¿½ï¿½ï¿½B
echo;
echo nodejsï¿½ï¿½Cï¿½ï¿½ï¿½Xï¿½gï¿½[ï¿½ï¿½ï¿½ï¿½ï¿½Ä‚ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½B
echo ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
echo ï¿½ynodejsï¿½z
echo   https://nodejs.org/en/
echo;
echo ï¿½ynodistï¿½z
echo   https://github.com/marcelklehr/nodist/releases
echo   ï¿½ï¿½Windowsï¿½Ìê‡ï¿½Íunodistï¿½vï¿½ğ—˜—pï¿½ï¿½ï¿½ï¿½Æƒoï¿½[ï¿½Wï¿½ï¿½ï¿½ï¿½ï¿½Ç—ï¿½ï¿½ï¿½ï¿½È’Pï¿½Å‚ï¿½ï¿½B
echo ====================
cmd /k

:CHECK_NODEJS_END

rem --------------------
rem | Set node files.
rem --------------------

rem ƒfƒBƒŒƒNƒgƒŠ‚ğˆÚ“®
cd design-page-maker

rem npm ŠÖ˜A‚ÌƒRƒ}ƒ“ƒh
call npm install

rem ƒfƒBƒŒƒNƒgƒŠ‚ğˆÚ“®iƒ‹[ƒg‚Öj
cd ..

rem nodeƒtƒ@ƒCƒ‹‚ğÀs
node design-page-maker/index.js

rem ƒRƒ“ƒ\[ƒ‹‚ğŠJ‚¢‚½‚Ü‚Ü‚É‚·‚é
rem cmd /k

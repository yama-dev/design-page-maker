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
echo   nodejsがインストールされていません。
echo;
echo nodejsをインストールしてください。
echo ↓↓↓
echo 【nodejs】
echo   https://nodejs.org/en/
echo;
echo 【nodist】
echo   https://github.com/marcelklehr/nodist/releases
echo   ※Windowsの場合は「nodist」を利用するとバージョン管理が簡単です。
echo ====================
cmd /k

:CHECK_NODEJS_END

rem --------------------
rem | Make DesignPage.
rem --------------------

echo BOOT DesignPageMaker
echo ====================

rem ディレクトリを移動
cd design-page-maker

rem npm 関連のコマンド
call npm install --silent

rem ディレクトリを移動（ルートへ）
cd ..

rem nodeファイルを実行
node design-page-maker/index.js > nul 1>&2

if %ERRORLEVEL% NEQ 0 goto FAILURE

:SUCCESS
echo ====================
echo SUCCESS.
echo ====================
goto MAKE_DESIGN_END

:FAILURE
echo ====================
echo ERROR ...
echo ====================

:MAKE_DESIGN_END

echo 何かキーを押すと終了します...
pause > NUL
exit

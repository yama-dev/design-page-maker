@echo off
rem --------------------
rem | File name  : design-page-maker.bat
rem | Author     : yama-dev - https://github.com/yama-dev
rem | Repository : yama-dev - https://github.com/yama-dev/design-page-maker
rem --------------------

rem --------------------
rem | Set node files.
rem --------------------

rem ディレクトリを移動
cd design-page-maker

rem npm 関連のコマンド
call npm install

rem ディレクトリを移動（ルートへ）
cd ..

rem nodeファイルを実行
node design-page-maker/index.js

rem コンソールを開いたままにする
rem cmd /k

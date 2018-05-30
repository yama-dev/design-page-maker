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
echo   nodejs���C���X�g�[������Ă��܂���B
echo;
echo nodejs���C���X�g�[�����Ă��������B
echo ������
echo �ynodejs�z
echo   https://nodejs.org/en/
echo;
echo �ynodist�z
echo   https://github.com/marcelklehr/nodist/releases
echo   ��Windows�̏ꍇ�́unodist�v�𗘗p����ƃo�[�W�����Ǘ����ȒP�ł��B
echo ====================
cmd /k

:CHECK_NODEJS_END

rem --------------------
rem | Make DesignPage.
rem --------------------

echo BOOT DesignPageMaker
echo ====================

rem �f�B���N�g�����ړ�
cd design-page-maker

rem npm �֘A�̃R�}���h
call npm install --silent

rem �f�B���N�g�����ړ��i���[�g�ցj
cd ..

rem node�t�@�C�������s
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

echo �����L�[�������ƏI�����܂�...
pause > NUL
exit

@echo off
rem --------------------
rem | File name  : design-page-maker.bat
rem | Author     : yama-dev - https://github.com/yama-dev
rem | Repository : yama-dev - https://github.com/yama-dev/design-page-maker
rem --------------------

rem --------------------
rem | Set node files.
rem --------------------

rem �f�B���N�g�����ړ�
cd design-page-maker

rem npm �֘A�̃R�}���h
call npm install

rem �f�B���N�g�����ړ��i���[�g�ցj
cd ..

rem node�t�@�C�������s
node design-page-maker/index.js

rem �R���\�[�����J�����܂܂ɂ���
rem cmd /k

echo off
set version=v1.0

rem
title Minecraft �@��}�A�p�u��
mode con cols=85 lines=30
cd %~dp0

echo:
echo           =================================================================
echo           =                                                               =
echo           =                    Minecraft �@��}�A�p�u��                   =
echo           =                                                               =
echo           =                          ����: %version%                           =
echo           =                                                               =
echo           =                      �@��: redbean0721                        =
echo           =    Github: https://github.com/redbean0721/AutoMCServerSetup   =
echo           =                                                               =
echo           =                                                               =
echo           =                                                               =
echo           =                       ���U Enter �~��                         =
echo           =                                                               =
echo           =================================================================
echo:
echo:
echo:
pause

cls
echo:
echo:
echo                                  �ˬd���A�����Ҥ�...
echo:
echo:

ping 127.0.0.1 -n 2 > nul

set java_path="C:\Program Files\Java"
if exist %java_path% (
  echo                                  Java...... �w�w��
  ) else (
    echo:
    echo:                                       ERROR
    echo:
    echo:
    echo                                 �A�S���w�� Java JDK
    echo:
    echo                           �Ш�H�U���}�U���æw�� Java JDK:
    echo                 https://www.oracle.com/tw/java/technologies/downloads/
    echo:
    echo:
    pause
    exit
    )

ping 127.0.0.1 -n 1 > nul
echo:
echo:
echo                                      �ˬd����:)
echo:
echo:
ping 127.0.0.1 -n 2 > nul

cls
:choice_install
echo:
echo:
echo:
echo                     �w�]�w�˵{�� [1]      �۩w�q�w�˵{�� [2]
echo:
echo:
echo:
set choice_install=
set /p choice_install=�п�ܤ@��: 
if "%choice_install%" == "1" ( cls & goto defined_install )
if "%choice_install%" == "2" ( cls & goto user_defined_install)
cls
echo:
echo:
echo                                    �п�J���T����
echo:
goto choice_install

:defined_install
echo:
echo:
echo                                    �п�ܮ֤ߺ���
echo:
echo:
echo                                      �쪩���A��
echo:
echo                                     Vanilla [0]
echo:
echo            ������A��                  �Ҳզ��A��                 ���y���A��
echo:
echo           CraftBukkit [1]              Forge [5]              Bungeecord [7]
echo              Spigot   [2]             Fabric [6]               Waterfall [8]
echo               Paper   [3]
echo              Purpur   [4]
echo:
set choice_download=
set /p choice_download=�п�ܤ@��: 
if "%choice_download%" == "0" ( cls & goto download_Vanilla )
if "%choice_download%" == "1" ( cls & goto download_CraftBukkit)
if "%choice_download%" == "2" ( cls & goto download_Spigot )
if "%choice_download%" == "3" ( cls & goto download_Paper )
if "%choice_download%" == "4" ( cls & goto download_Purpur )
if "%choice_download%" == "5" ( cls & goto download_Forge )
if "%choice_download%" == "6" ( cls & goto download_Fabric )
if "%choice_download%" == "7" ( cls & goto download_Bungeecord )
if "%choice_download%" == "8" ( cls & goto download_Waterfall )
cls
echo:
echo:
echo                                    �п�J���T����
echo:
goto defined_install

:download_Vanilla:
echo:
echo:
echo                         ���b�U�� Vanilla (Version 1.19.3) ��...
echo:
curl -O https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar
echo:
echo:
echo                                      �U������
echo:
goto spawn_start

:download_CraftBukkit:
echo:
echo:
echo                         ���b�U�� CraftBukkit (Version 1.19.3) ��...
echo:
curl -O https://download.getbukkit.org/craftbukkit/craftbukkit-1.19.3.jar
ren craftbukkit-1.19.3.jar server.jar
echo:
echo:
echo                                      �U������
echo:
goto spawn_start

:download_Spigot:
echo:
echo:
echo                         ���b�U�� Spigot (Version 1.19.3) ��...
echo:
curl -O https://download.getbukkit.org/spigot/spigot-1.19.3.jar
ren spigot-1.19.3.jar server.jar
echo:
echo:
echo                                      �U������
echo:
goto spawn_start

:download_Paper:
echo:
echo:
echo                         ���b�U�� Paper (Version 1.19.3) ��...
echo:
curl -O https://api.papermc.io/v2/projects/paper/versions/1.19.3/builds/417/downloads/paper-1.19.3-417.jar
ren paper-1.19.3-417.jar server.jar
echo:
echo:
echo                                      �U������
echo:
goto spawn_start

:download_Purpur:
echo:
echo:
echo                         ���b�U�� Purpur (Version 1.19.3) ��...
echo:
curl -O https://api.purpurmc.org/v2/purpur/1.19.3/latest/download
ren download server.jar
echo:
echo:
echo                                      �U������
echo:
goto spawn_start

:user_defined_install
if exist server.jar goto found_jar
if not exist server.jar goto nfound_jar

:found_jar
java -Xms512M -Xmx2048M -jar server.jar nogui
goto spawn_start

:nfound_jar
echo:
echo:
color 4
echo                                         ERROR
echo:
echo           ���~���e: �����server.jar, �нT�{server.jar�P���u��b�P�@�Ӹ�Ƨ�����
echo:
echo:
color
pause
exit

:spawn_start
set spawn=
set /p spawn=�O�_�ͦ��Ұʤ���? [y/n]: 
if "%spawn%" == "y" ( echo java -Xms512M -Xmx2048M -jar server.jar nogui > start.bat & goto finish )
if "%spawn%" == "n" ( goto finish )
cls
echo:
echo                                    �п�J���T����
echo:
goto spawn_start

:finish
cls
echo:
echo:
echo:
echo                                     �P�±z���ϥ�
echo:
echo:
echo:
timeout /t 3
pause
exit
@echo off
title Login Server Console
:start
java  -Dfile.encoding=UTF-8 -Xmx128m -cp ./login.jar;./libs/* ru.scoria.loginserver.L2LoginServer

if ERRORLEVEL 2 goto start

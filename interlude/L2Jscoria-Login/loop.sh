# !/bin/sh
err=1
until [ $err == 0 ];
do
	java -Dfile.encoding=UTF-8 -Xmx128m  -cp ./login.jar:./libs/* ru.scoria.loginserver.L2LoginServer > log/stdout.log 2>&1
	err=$?
	sleep 10;
done
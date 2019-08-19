# !/bin/sh

#test check script

#check priv
if [ "$EUID" -ne 0 ]
	then echo "please root access"
	exit

	else
		echo "root access"
fi

cf="scan_result".txt

echo "***************** linux cent os script *********"
echo "***************** test script cent os 7*********"
echo ""

echo "***********************************************" >> $cf 2>&1
echo "*************** linux cent os ver script ******" >> $cf 2>&1
echo "***********************************************" >> $cf 2>&1


echo "*******************start time *****************"
date
echo "*******************start time *****************" >> $cf 2>&1
date >> $cf 2>&1


echo "=================== system information =========="
echo "=================== system information ==========" >>$cf 2>&1
echo ""

echo "basic system information check...."
echo "1.basic system info" >> $cf 2>&1

echo "1.1 operating system check ....."
echo " os type :"`head -n 1 /etc/centos-release` >> $cf 2>&1

echo "1.2 host name check ......"
echo " host name:"`uname -n` >> $cf 2>&1

echo "1.3 kernel version check ....."
echo " kernel ver:"`uname -r` >> $cf 2>&1
echo "" >> $cf 2>&1
echo ""

echo "basic system network information check..."
echo "2.basic system network info" >> $cf 2>&1

echo "2.1 network check....."
echo " network info :"`ifconfig -a` >> $cf 2>&1

echo ""
echo " basic check all clear ! "
echo ""

echo "====================now vulnerability script check========"
echo "====================now vulnerability script check========" >> $cf 2>&1

echo "1. root check..."
echo "1. root check" >> $cf 2>&1

if [ -z "`grep pts\? /etc/securetty`"]
	then
		echo "===> safe only console" >> $cf 2>&1
	else
		echo "===> not safe only console" >> $cf 2>&1
fi

echo "" >> $cf 2>&1

echo "2. password check..."
echo "2. password check" >> $cf 2>&1


echo "algorithm:" `authconfig --test | grep hashing | awk '{print $5}'` >> $cf 2>&1

echo "max time:" `cat /etc/login.defs | grep PASS_MAX_DAYS | awk '{print $2}' | sed '1d'`"day" >> $cf 2>&1

echo "min time:" `cat /etc/login.defs | grep PASS_MIN_DAYS | awk '{print $2}' | sed '1d'`"day" >> $cf 2>&1

echo "min lenght:" `cat /etc/login.defs | grep PASS_MIN_LEN | awk '{print $2}' | sed '1d'`"day" >> $cf 2>&1

echo "days of end time:" `cat /etc/login.defs | grep PASS_WARN_AGE | awk '{print $2}' | sed '1d'`"day" >> $cf 2>&1

echo "password poclicy is eng+number+special char mix, if 2 mix 10pass and 3mix 8password" >> $cf 2>&1

echo "">>$cf 2>&1

echo "3. ID lock check..."
echo "3. ID lock check" >> $cf 2>&1

echo "">>$cf 2>&1

echo "4. password safe check..."
echo "4. password safe check" >> $cf 2>&1

if [ "`ls -l /etc/passwd |awk '{print$1}'`" = -rw-r--r--. ]
	then
		echo "===> /etc/passwd permissions safe " >> $cf 2>&1
	else
		echo "===> /etc/passwd permissions not safe " >> $cf 2>&1
fi
if [ "`ls -l /etc/passwd |awk '{print $3}'`" = root ]
	then
		echo "===> safe passwd root check" >> $cf 2>&1
	else
		echo "===> not safe passwd not root check" >> $cf 2>&1
fi
echo "">>$cf 2>&1

if [ "`ls -l /etc/shadow |awk '{print$1}'`" = -r--------. ]
	then
		echo "===> /etc/shadow permissions safe " >> $cf 2>&1
	else
		echo "===> /etc/shadow permissions not safe " >> $cf 2>&1
fi	
if [ "`ls -l /etc/shadow | awk '{print $3}'`" = root ]
	then
		echo "===> safe shadow root check" >> $cf 2>&1
	else
		echo "===> not safe shadow root not check" >> $cf 2>&1
fi
echo "">>$cf 2>&1


if [ "`cat /etc/passwd | grep "root" | awk -F : '{print$2}' | sed -n '1p'`" = x ]
	then
		echo "===> shadow using" >> $cf 2>&1
	else
		echo "===> shadow not using" >> $cf 2>&1
fi
echo "">>$cf 2>&1


echo "5.PATH check...."
echo "5.PATH check" >> $cf 2>&1

if [ -z "`echo $PATH | awk -F : '{print $1}' | grep "." | grep "::" `"]
	then
		echo "===> safe PATH Derectory" >> $cf 2>&1
	else
		echo "===> not safe PATH Derectory" >> $cf 2>&1
fi
echo "">>$cf 2>&1


echo "6.FIle no-user no-group check..."
echo "6.FIle no-user no-group check" >> $cf 2>&1

if [ -z  "`find / -nouser -o -nogroup -xdevs -ls 2>/dev/null`"]
	then
		echo "===> safe no-user no-group" >> $cf 2>&1
	else
		echo "===> not safe no-user no-group" >> $cf 2>&1
fi
echo "">>$cf 2>&1


echo "7./etc/hosts check..."
echo "7./etc/hosts check" >> $cf 2>&1

if [ "`ls -l /etc/hosts |awk '{print$1}'`" = -rw-------. ]
	then
		echo "===> safe hosts permissions" >> $cf 2>&1
	else
		echo "===> not safe hosts permissions" >> $cf 2>&1
fi
if [ "`ls -l /etc/hosts | awk '{print $3}'`" = root ]
	then
		echo "===> safe hosts root check" >> $cf 2>&1
	else
		echo "===> not safe hosts not root check" >> $cf 2>&1
fi
echo "" >>$cf 2>&1


echo "8. /etc/inetd.conf check..."
echo "8. /etc/inetd.conf check" >> $cf 2>&1

if [ "` ls -l /etc/xinetd.conf | awk '{print$1}'`" = -rw-------. ]
	then
		echo "===> safe xinetd permissions" >> $cf 2>&1
	else
		echo "===> not safe xinetd permissions" >> $cf 2>&1
fi
if [ "`ls -l /etc/xinetd.conf | awk '{print $3}'`" = root ]
	then
		echo "===> safe xinted root check" >> $cf 2>&1
	else
		echo "===> not safe xinetd not root check" >> $cf 2>&1
fi
echo "" >> $cf 2>&1


echo "9. /etc/rsyslog.conf check..."
echo "9. /etc/rsyslog.conf check" >> $cf 2>&1

if [ "` ls -l /etc/rsyslog.conf | awk '{print $1}'`" = -rw-r--r--. ]
	then
		echo "===> safe rsyslog permissions" >> $cf 2>&1
	else
		echo "===> not safe rsyslog permissions" >> $cf 2>&1
fi
if [ "` ls -l /etc/xinetd.conf | awk '{print $3}'`" = root ]
	then
		echo "===> safe rsyslog root check" >> $cf 2>&1
	else
		echo "===> not safe rsyslog not root check" >> $cf 2>&1
fi
echo "" >> $cf 2>&1


echo "10. /etc/services check..."
echo "10. /etc/services check" >> $cf 2>&1

if [ "` ls -l /etc/services | awk '{print $1}'`" = -rw-r--r--. ]
	then
		echo "===> safe services permissions" >> $cf 2>&1
	else
		echo "===> not safe services permissions" >> $cf 2>&1
fi
if [ "` ls -l /etc/services | awk '{print $3}'`" = root ]
	then
		echo "===> safe services root check" >> $cf 2>&1
	else
		echo "===> not safe services not root check" >> $cf 2>&1
fi
echo "" >> $cf 2>&1

echo "11. SUID SGID STICK check and file create..."
echo "11. SUID SGID STICK check and file create" >> $cf 2>&1

suid_file="SETUID.txt"
sgid_file="SETGID.txt"
stick_file="STICKY.txt"

find / -user root -perm -4000 2>/dev/null > $suid_file
find / -user root -perm -2000 2>/dev/null > $sgid_file
find / -user root -perm -1000 2>/dev/null > $stick_file

echo "SUID SGID STICK check and file create success"
echo "SUID SGID STICK check and file create suceess">> $cf 2>&1
echo "" >> $cf 2>&1

#linux if iptables , command: IPtables -L
echo "12. /etc/hosts allow and deny check..."
echo "12. /etc/hosts allow and deny check" >> $cf 2>&1
echo "" >> $cf 2>&1


allow_file="ALLOW.txt"
deny_file="DENY.txt"

cat /etc/hosts.allow 2>/dev/null $allow_file
cat /etc/hosts.deny 2>/dev/null $deny_file

echo "allow and deny check and file create success"
echo "allow and deny check and file create success">> $cf 2>&1
echo "" >> $cf 2>&1


echo "13. /etc/xinetd.d/finger check..."
echo "13. /etc/xinetd.d/finger check" >> $cf 2>&1

if [ -z "`/etc/xinetd.d/finger`" ]
	then
		echo "===> safe finger dont have install" >> $cf 2>&1
	else
		if [ "`cat /etc/xinetd.d/finger | grep disable | awk '{print $3}'`" = yes ]
			then
				echo "===> safe finger have install but disable" >> $cf 2>&1
			else
				echo "===> not safe finger have install and able" >> $cf 2>&1
		fi
fi
echo "" >> $cf 2>&1


echo "14. /etc/vsftpd/vsftpd anonymouse check..."
echo "14. /etc/vsftpd/vsftpd anonymouse check" >> $cf 2>&1

if [ "`cat /etc/vsftpd/vsftpd.conf | grep anonymous_enable | awk -F = '{print $2}'`" = NO ]
	then	
		echo "===> safe ftp anonymouse not access" >> $cf 2>&1
	else
		echo "===> not safe ftp anonymouse access" >> $cf 2>&1
fi
echo "" >> $cf 2>&1


#script is only rlogin check
echo "15. /etc/xinetd.d/r* check..."
echo "15. /etc/xinetd.d/r* check" >> $cf 2>&1

if [ -z "`cat /etc/xinetd.d/r* `" ]
	then
		echo "===> safe rlogin dont have install" >> $cf 2>&1
	else
		if [ "`cat /etc/xinetd.d/rlogin | grep disable | awk '{print $3}'`" = yes ]
			then
				echo "===> safe rlogin have install but disable" >> $cf 2>&1
			else
				echo "===> not safe rlogin have install and able" >> $cf 2>&1
		fi
fi
echo "" >> $cf 2>&1


echo "16. cron allow and deny check..."
echo "16. cron allow and deny check" >> $cf 2>&1

if [ -z "`ls /etc/cron.allow`" ]
	then
		echo "===> cron allow dont have" >> $cf 2>&1
	else
		if [ "`ls -l /etc/cron.allow | awk '{print $1}'`" = -rw-r-----. ]
			then
				echo "===> safe cron allow permissions" >> $cf 2>&1
			else
				echo "===> not safe cron allow permissions" >> $cf 2>&1
		fi
		if [ "`ls -l /etc/cron.allow |awk '{print $3}'`" = root ]
			then
				echo "===> safe cron.allow root check" >> $cf 2>&1
			else
				echo "===> not safe cron.allow root not check" >> $cf 2>&1
		fi
fi
echo "" >> $cf 2>&1

if [ -z "`ls /etc/cron.deny`" ]
	then
		echo "===> cron deny dont have" >> $cf 2>&1
	else
		if [ "`ls -l /etc/cron.deny | awk '{print $1}'`" = -rw-r-----. ]
			then
				echo "===> safe cron deny permissions" >> $cf 2>&1
			else
				echo "===> not safe cron deny permissions" >> $cf 2>&1
		fi
		if [ "`ls -l /etc/cron.deny | awk '{print $3}'`" = root ]
			then
				echo "===> safe cron deny root check" >> $cf 2>&1
			else
				echo "===> not safe cron deny not root check" >> $cf 2>&1
		fi
fi
echo >> $cf 2>&1


			
echo "17. DOS target services check..."
echo "17. DOS target services check" >> $cf 2>&1

echo "DOS 1. echo - dgram...."
# " yes" 의 의미는 본 서비스들의 파일에서도 disable = yes -> awk -F 구분자 출력시 " yes" 이렇게 한칸 공백 띄고 yes가 나오기때문에 조치를 취함
if [ "`cat /etc/xinetd.d/echo-dgram | grep disable | awk -F = '{print $2}'`" = " yes" ] 
	then
		echo "===> safe echo service" >> $cf 2>&1
	else
		echo "===> not safe echo service" >> $cf 2>&1
fi
	
echo "DOS 2. discard - dgram...."
if [ "`cat /etc/xinetd.d/discard-dgram | grep disable | awk -F = '{print $2}'`" = " yes" ]
	then
		echo "===> safe discard service" >>$cf 2>&1
	else
		echo "===> not safe dircard service" >> $cf 2>&1
fi

echo "DOS 3.daytime - dgram...."
if [ "`cat /etc/xinetd.d/daytime-dgram | grep disable | awk -F = '{print $2}'`" = " yes" ]
	then
		echo "===> safe daytime service" >> $cf 2>&1
	else
		echo "===> not safe daytime service" >> $cf 2>&1
fi

echo "DOS 4.chargen - dgram...."
if [ "`cat /etc/xinetd.d/chargen-dgram | grep disable | awk -F = '{print $2}'`" = " yes" ]
	then
		echo "===> safe chargen service" >> $cf 2>&1
	else
		echo "===> not safe chargen service" >> $cf 2>&1
fi
echo "" >> $cf 2>&1


echo "18. send mail version check..."
echo "18. send mail version check" >> $cf 2>&1

ver="`yum list installed | grep sendmail | awk '{print $1}'`"

if [ -z "$ver" ]
	then
		echo "===> dont have sendmail" >> $cf 2>&1
	else
		echo "===> your send mail ver $ver if low standard ver you have to upgrade" >> $cf 2>&1
fi
echo "" >> $cf 2>&1


#!/usr/bin/perl

use 5.010;
#use strict;
#use warnings;

use Proc::Daemon;
use Proc::PID::File;
use Net::FTP::File;

# Считываем из конфига значения (сделать)
$logfile = "/var/log/logman.log";
$packed_by_time = 10;
$sending_by_time = 30;

# Устанавливаем дату для логирования
my @dates = localtime(time);
($SS, $MM, $HH, $dd, $mm, $yy) = @dates[0..5];
$yy += 1900;
$mm += 1;

# Открываем лог.
open LOGFILE, ">>", $logfile;

# Демонизируем процесс
my $daemon_pid = Proc::Daemon::Init();
say LOGFILE "$yy$mm$dd/$HH:$MM:$SS: Started with PID $daemon_pid";

# Если демон уже запущен, то просто выходим.
if (Proc::PID::File->running()) {
say LOGFILE "$yy$mm$dd/$HH:$MM:$SS: Already running";
exit 0;
}

while (1) {
	sleep 1;
}

# Just template
# my $continue = 1;
# $SIG{TERM} = sub { $continue = 0 };
# 
# while ($continue) {
# 	# Создаем дочерний процесс
# 	$child_pid = Proc::Daemon::Fork;
# 	# Находим файлы и упаковываем их
# 	
# 	# Отправляем файлы по FTP
# 
# }

close LOGFILE;

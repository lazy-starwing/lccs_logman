#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Proc::Daemon;
use Proc::PID::File;
use Net::FTP::File;

# Демонизируем процесс
Proc::Daemon::Init();

# Если демон уже запущен, то просто выходим.
if (Proc::PID::File->running()) {
print "Already running\n";
exit 0;
}

# Считываем из конфига значения (сделать)
my $continue = 1;
$SIG{TERM} = sub { $continue = 0 };

# while ($continue) {
# 	
# }

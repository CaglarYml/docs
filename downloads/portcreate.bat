@echo off
title Brolve - Port Acma Betigi
echo Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir.
echo Devam etmek icin ENTER tusuna tiklayin ardindan
echo gerekli yonlendirmeler yapilacaktir.
PAUSE
cls
set /p port=Lutfen acacaginiz portu giriniz ornegin 80:
set /p portadi=Lutfen acacaginiz port adini giriniz ornegin Port80:
set /p protokol=Lutfen acacaginiz port protokolunu giriniz ornegin TCP:
netsh advfirewall firewall add rule name="%portadi%" dir=in action=allow protocol=%protokol% localport=%port%
echo Port basariyla acilmistir. Betik kapatiliyor...
TIMEOUT /T 10 /NOBREAK
exit
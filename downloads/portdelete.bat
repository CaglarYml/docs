@echo off
title Brolve - Port Kaldirma Betigi
echo Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir.
echo Devam etmek icin ENTER tusuna tiklayin ardindan
echo gerekli yonlendirmeler yapilacaktir.
PAUSE
cls
set /p port=Lutfen kaldiracaginiz portu giriniz ornegin 80:
set /p portadi=Lutfen kaldiracaginiz port adini giriniz ornegin Port80:
set /p protokol=Lutfen kaldiracaginiz port protokolunu giriniz ornegin TCP:
netsh advfirewall firewall delete rule name="%portadi%" protocol=%protokol% localport=%port%
echo Port basariyla kaldirilmistir. Betik kapatiliyor...
TIMEOUT /T 10 /NOBREAK
exit
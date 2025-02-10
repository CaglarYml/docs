@echo off
title Brolve - Guvenlik Duvari Betigi
echo Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir.
echo Devam etmek icin ENTER tusuna tiklayin ardindan
echo gerekli yonlendirmeler yapilacaktir.
PAUSE
cls
netsh firewall set opmode disable
cls

echo Guvenlik duvari basariyla kapatilmistir. Betik kapatiliyor...
TIMEOUT /T 10 /NOBREAK
exit

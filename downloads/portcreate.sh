echo Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir.
echo Gerekli yonlendirmeler yapilacaktir.
echo Uncompiled Firewall(UFW) kullanilmistir.
echo .
echo Lutfen acacaginiz portu giriniz ornegin 80
read -p 'Port: ' portvar
echo Lutfen acacaginiz port protokolunu giriniz ornegin TCP
read -p 'Protokol: ' protovar
ufw allow $portvar/$protovar
echo Port basariyla acilmistir. Betik kapatiliyor...
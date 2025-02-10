echo Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir.
echo Gerekli yonlendirmeler yapilacaktir.
echo Uncompiled Firewall(UFW) kullanilmistir.
echo .
echo Lutfen kaldiracaginiz portu giriniz ornegin 80
read -p 'Port: ' portvar
echo Lutfen kaldiracaginiz portun protokolunu giriniz ornegin TCP
read -p 'Protokol: ' protovar
ufw deny $portvar/$protovar
echo Port basariyla kapatilmistir. Betik kapatiliyor...
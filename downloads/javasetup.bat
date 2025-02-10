@echo off
setlocal enabledelayedexpansion

title Brolve - Java Kurma Betigi

echo Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir.
echo Devam etmek icin ENTER tusuna tiklayin ardindan
echo gerekli yonlendirmeler yapilacaktir.
PAUSE
cls

:: Kullanýcýdan Java sürümünü alma
echo Hangi Java surumunu indirmek istiyorsunuz? (Ornek: 17)
set /p JAVA_VERSION="Java Surumu: "

:: Eclipse Adoptium'dan indirme URL'si oluþturma
set JAVA_URL=https://api.adoptium.net/v3/binary/latest/!JAVA_VERSION!/ga/windows/x64/jdk/hotspot/normal/eclipse
set JAVA_INSTALLER=OpenJDK-!JAVA_VERSION!-windows-x64.exe

:: Java'yý indirme
curl -o !JAVA_INSTALLER! !JAVA_URL!
if %errorlevel% neq 0 (
    echo Java indirilemedi. Lutfen surumu kontrol edin veya internet baglantinizi kontrol edin.
    exit /b 1
)

:: Java'yý yükleme
echo Java yukleniyor...
start /wait !JAVA_INSTALLER! /s
if %errorlevel% neq 0 (
    echo Java yuklenirken hata olustu.
    exit /b 1
)

:: PATH deðiþkenine ekleme
echo PATH degiskeni guncelleniyor...
setx PATH "%PATH%;C:\Program Files\Eclipse Adoptium\jdk-!JAVA_VERSION!-hotspot\bin" /M

:: Yükleme dosyasýný silme
delete !JAVA_INSTALLER!

:: Kurulumun baþarýyla tamamlandýðýný kontrol etme
java -version
if %errorlevel% neq 0 (
    echo Java kurulumu basarisiz.
    exit /b 1
) else (
    echo Java basariyla kuruldu!
)

pause
endlocal

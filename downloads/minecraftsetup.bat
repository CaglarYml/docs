@echo off
setlocal enabledelayedexpansion

title Brolve - PaperMC Sunucu Kurulum Betiði

echo Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir.
echo Devam etmek icin ENTER tusuna tiklayin ardindan gerekli yonlendirmeler yapilacaktir.
PAUSE
cls

:: Java Kurulumu ayrý cmd'de çalýþtýrýlýyor
echo Java kurulumu baslatiliyor...
start cmd /c "%~f0" :java_installer

:: Kullanýcýdan PaperMC sürüm ve build numarasý alma
echo Lutfen PaperMC surumunu girin (Ornek: 1.8.8, 1.16.5, 1.17.1, 1.18.2, 1.19.4, 1.20.6, 1.21.4)
set /p PAPER_VERSION="Surum: "

echo Lutfen bu surum icin build numarasini girin (Ornek: 445, 794, 411, 388, 550, 151, 114)
set /p BUILD_NUMBER="Build Numarasi: "

:: PaperMC URL olusturma
set PAPER_URL=https://papermc.io/api/v2/projects/paper/versions/!PAPER_VERSION!/builds/!BUILD_NUMBER!/downloads/paper-!PAPER_VERSION!-!BUILD_NUMBER!.jar

:: Server klasörü oluþturma
mkdir "%USERPROFILE%\Desktop\Server"
cd "%USERPROFILE%\Desktop\Server"

:: PaperMC indirme
echo PaperMC indiriliyor...
curl -o server.jar !PAPER_URL!
if %errorlevel% neq 0 (
    echo PaperMC indirilemedi. Lutfen surum ve build numarasini kontrol edin.
    exit /b 1
)

:: eula.txt dosyasý oluþturma
echo eula=true > eula.txt

:: Kurulum tamamlandý
if exist server.jar (
    echo PaperMC basariyla kuruldu.
    echo Sunucunun tam kurulumu icin lutfen https://docs.brolve.com/oyun-sunucu/minecraft-java/sunucu-kurulum adresini ziyaret edin.
) else (
    echo Kurulum basarisiz oldu.
    exit /b 1
)

pause
endlocal

:: Java yükleme fonksiyonu
:java_installer
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
exit /b


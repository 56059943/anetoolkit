@REM ==========================================
@REM ��jar/swc�����ANE�ļ�
@REM ���ߣ�zrong
@REM ���ڣ�2012-6-7
@REM ==========================================
@REM
@REM
SET FLEX_ADT=java -jar D:\flex_sdks\4.6.0\lib\adt.jar
@REM ���ɵ�ANEĿ��·��
SET ANE_TARGET=ANEToolkit.ane
@REM SWC��·��
SET ANE_SWC=..\swc\bin\ANEToolkit.swc
@REM JAR��·��
SET ANE_JAR=..\androidANE\bin\AndroidANE.jar
@REM ��ѹ��SWC�������У�������HaoZipC�������滻�������κ�unzip����
SET ZIP_CMD=d:\PortableApps\HaoZip\HaoZipC.exe x -oAndroid-ARM\ -y %ANE_SWC%
%ZIP_CMD%
copy /B /Y %ANE_JAR% Android-ARM\
del Android-ARM\catalog.xml

@REM ��ʼ���ANE
%FLEX_ADT% -package -target ane %ANE_TARGET% extension.xml -swc %ANE_SWC% -platform Android-ARM -C ./Android-ARM/ . -platform default -C ./Android-ARM/ library.swf

@REM ���ƴ�����ANE��Ŀ��lib
copy /B /Y %ANE_TARGET% ..\aneTest\libs
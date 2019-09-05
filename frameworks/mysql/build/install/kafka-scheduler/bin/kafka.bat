@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  kafka startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and KAFKA_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\kafka.jar;%APP_HOME%\lib\scheduler-0.56.2.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.6.7.jar;%APP_HOME%\lib\jackson-datatype-json-org-2.6.7.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.6.7.jar;%APP_HOME%\lib\jackson-datatype-protobuf-0.9.9-preJackson2.7-proto3.jar;%APP_HOME%\lib\metrics-servlets-3.2.5.jar;%APP_HOME%\lib\jersey-media-json-jackson-2.23.jar;%APP_HOME%\lib\jackson-jaxrs-json-provider-2.5.4.jar;%APP_HOME%\lib\jackson-jaxrs-base-2.5.4.jar;%APP_HOME%\lib\mesos-http-adapter-0.4.1.jar;%APP_HOME%\lib\jackson-datatype-guava-2.6.3.jar;%APP_HOME%\lib\metrics-json-3.2.5.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.5.4.jar;%APP_HOME%\lib\jackson-databind-2.6.7.jar;%APP_HOME%\lib\protobuf-java-format-1.4.jar;%APP_HOME%\lib\compiler-0.9.2.jar;%APP_HOME%\lib\fluent-hc-4.5.2.jar;%APP_HOME%\lib\google-http-client-1.20.0.jar;%APP_HOME%\lib\httpclient-4.5.2.jar;%APP_HOME%\lib\java-jwt-3.2.0.jar;%APP_HOME%\lib\commons-codec-1.11.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\commons-lang3-3.4.jar;%APP_HOME%\lib\antlr4-runtime-4.5.1-1.jar;%APP_HOME%\lib\jersey-container-jetty-http-2.23.jar;%APP_HOME%\lib\jersey-container-servlet-core-2.23.jar;%APP_HOME%\lib\jersey-media-multipart-2.23.jar;%APP_HOME%\lib\jersey-server-2.23.jar;%APP_HOME%\lib\jersey-client-2.23.jar;%APP_HOME%\lib\jersey-media-jaxb-2.23.jar;%APP_HOME%\lib\jersey-common-2.23.jar;%APP_HOME%\lib\jersey-entity-filtering-2.23.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.1.jar;%APP_HOME%\lib\curator-recipes-4.0.1.jar;%APP_HOME%\lib\curator-framework-4.0.1.jar;%APP_HOME%\lib\zookeeper-3.4.11.jar;%APP_HOME%\lib\json-20160212.jar;%APP_HOME%\lib\diffutils-1.3.0.jar;%APP_HOME%\lib\jetty-servlet-9.4.9.v20180320.jar;%APP_HOME%\lib\javax.el-2.2.4.jar;%APP_HOME%\lib\javax.el-api-2.2.4.jar;%APP_HOME%\lib\mesos-1.8.0.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.57.jar;%APP_HOME%\lib\bcprov-jdk15on-1.57.jar;%APP_HOME%\lib\j2html-1.2.0.jar;%APP_HOME%\lib\metrics-servlet-3.2.5.jar;%APP_HOME%\lib\simpleclient_dropwizard-0.0.26.jar;%APP_HOME%\lib\metrics-jvm-3.2.5.jar;%APP_HOME%\lib\metrics-core-3.2.5.jar;%APP_HOME%\lib\metrics-jetty9-3.0.2.jar;%APP_HOME%\lib\simpleclient_servlet-0.0.26.jar;%APP_HOME%\lib\metrics3-statsd-4.2.0.jar;%APP_HOME%\lib\log4j-core-2.8.1.jar;%APP_HOME%\lib\log4j-slf4j-impl-2.8.1.jar;%APP_HOME%\lib\jackson-core-2.6.7.jar;%APP_HOME%\lib\json-20090211_1.jar;%APP_HOME%\lib\snakeyaml-1.15.jar;%APP_HOME%\lib\jackson-annotations-2.6.7.jar;%APP_HOME%\lib\protobuf-java-util-3.3.0.jar;%APP_HOME%\lib\curator-client-4.0.1.jar;%APP_HOME%\lib\guava-20.0.jar;%APP_HOME%\lib\protobuf-java-3.5.0.jar;%APP_HOME%\lib\annotations-3.0.1.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.10.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.10.jar;%APP_HOME%\lib\metrics-healthchecks-3.2.5.jar;%APP_HOME%\lib\metrics-core-3.0.2.jar;%APP_HOME%\lib\metrics-statsd-common-4.2.0.jar;%APP_HOME%\lib\slf4j-api-1.7.24.jar;%APP_HOME%\lib\log4j-1.2.16.jar;%APP_HOME%\lib\jline-0.9.94.jar;%APP_HOME%\lib\audience-annotations-0.5.0.jar;%APP_HOME%\lib\netty-3.10.5.Final.jar;%APP_HOME%\lib\httpcore-4.4.4.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\hk2-locator-2.4.0-b34.jar;%APP_HOME%\lib\javax.inject-2.4.0-b34.jar;%APP_HOME%\lib\jetty-security-9.4.9.v20180320.jar;%APP_HOME%\lib\jetty-server-9.4.9.v20180320.jar;%APP_HOME%\lib\jetty-http-9.4.9.v20180320.jar;%APP_HOME%\lib\jetty-io-9.4.9.v20180320.jar;%APP_HOME%\lib\jetty-util-9.4.9.v20180320.jar;%APP_HOME%\lib\jetty-continuation-9.1.1.v20140108.jar;%APP_HOME%\lib\mimepull-1.9.6.jar;%APP_HOME%\lib\edu-umd-cs-findbugs-annotations-1.3.2-201002241900.nbm;%APP_HOME%\lib\profiler-1.0.2.jar;%APP_HOME%\lib\simpleclient_common-0.0.26.jar;%APP_HOME%\lib\simpleclient-0.0.26.jar;%APP_HOME%\lib\log4j-api-2.8.1.jar;%APP_HOME%\lib\gson-2.7.jar;%APP_HOME%\lib\junit-3.8.1.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\javax.annotation-api-1.2.jar;%APP_HOME%\lib\jersey-guava-2.23.jar;%APP_HOME%\lib\hk2-api-2.4.0-b34.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.1.jar;%APP_HOME%\lib\validation-api-1.1.0.Final.jar;%APP_HOME%\lib\annotations-1.3.2.jar;%APP_HOME%\lib\jsr305-1.3.9.jar;%APP_HOME%\lib\joda-time-2.9.1.jar;%APP_HOME%\lib\hk2-utils-2.4.0-b34.jar;%APP_HOME%\lib\aopalliance-repackaged-2.4.0-b34.jar;%APP_HOME%\lib\javassist-3.18.1-GA.jar;%APP_HOME%\lib\javax.inject-1.jar

@rem Execute kafka
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %KAFKA_OPTS%  -classpath "%CLASSPATH%" com.mesosphere.sdk.kafka.scheduler.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable KAFKA_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%KAFKA_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega

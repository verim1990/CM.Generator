@ECHO OFF
SETLOCAL

REM Set base path 
cd ..

REM [Variables]
SET REPO_URL=http://github/verim1990

REM [Solution]
SET SOLUTION_NAME=CM
SET SOLUTION_PATH=%SOLUTION_NAME%/%SOLUTION_NAME%
SET SOLUTION_PATH_FULL=%SOLUTION_PATH%.sln
dotnet new sln --name %SOLUTION_PATH%

REM [GROUP] Presentation
SET PRESENTATION_GROUP_NAME=%SOLUTION_NAME%.Presentation
SET PRESENTATION_GROUP_PATH=%SOLUTION_NAME%/%PRESENTATION_GROUP_NAME%

REM [GROUP] Services
SET SERVICES_GROUP_NAME=%SOLUTION_NAME%.Services
SET SERVICES_GROUP_PATH=%SOLUTION_NAME%/%SERVICES_GROUP_NAME%

REM [GROUP] Shared
SET SHARED_GROUP_NAME=%SOLUTION_NAME%.Shared
SET SHARED_GROUP_PATH=%SOLUTION_NAME%/%SHARED_GROUP_NAME%

call generator\generator.shared.bat
call generator\generator.presentation.bat
call generator\generator.services.identity.bat
call generator\generator.services.exchange.bat
call generator\generator.services.wallet.bat

REM Clean
DEL /S /F /Q Class1.cs

REM Solution
REM cd %SOLUTION_NAME%
REM dotnet restore
REM dotnet build %SOLUTION_NAME%
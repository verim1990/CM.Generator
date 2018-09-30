REM [LIB] Shared.Kernel
SET SHARED_KERNEL_NAME=%SHARED_GROUP_NAME%.Kernel
SET SHARED_KERNEL_PATH=%SHARED_GROUP_PATH%/%SHARED_KERNEL_NAME%
SET SHARED_KERNEL_PROJ=%SHARED_KERNEL_PATH%/%SHARED_KERNEL_NAME%.csproj

dotnet new classlib -o %SHARED_KERNEL_PATH% -f netcoreapp2.1
dotnet sln %SOLUTION_PATH_FULL% add %SHARED_KERNEL_PROJ%

REM [LIB] Shared.Web
SET SHARED_WEB_NAME=%SHARED_GROUP_NAME%.Web
SET SHARED_WEB_PATH=%SHARED_GROUP_PATH%/%SHARED_WEB_NAME%
SET SHARED_WEB_PROJ=%SHARED_WEB_PATH%/%SHARED_WEB_NAME%.csproj

dotnet new classlib -o %SHARED_WEB_PATH% -f netcoreapp2.1
dotnet sln %SOLUTION_PATH_FULL% add %SHARED_WEB_PROJ%
dotnet add %SHARED_WEB_PROJ% reference %SHARED_KERNEL_PROJ%
dotnet add %SHARED_WEB_PROJ% package --version 2.1.1 Microsoft.AspNetCore.App
dotnet add %SHARED_WEB_PROJ% package Swashbuckle.AspNetCore.SwaggerUI
dotnet add %SHARED_WEB_PROJ% package Swashbuckle.AspNetCore.SwaggerGen
dotnet add %SHARED_WEB_PROJ% package MediatR
dotnet add %SHARED_WEB_PROJ% package MediatR.Extensions.Microsoft.DependencyInjection
dotnet add %SHARED_WEB_PROJ% package FluentValidation
dotnet add %SHARED_WEB_PROJ% package FluentValidation.AspNetCore
dotnet add %SHARED_WEB_PROJ% package Autofac
dotnet add %SHARED_WEB_PROJ% package Autofac.Extensions.DependencyInjection
dotnet add %SHARED_WEB_PROJ% package Polly
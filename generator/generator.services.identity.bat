REM [GROUP] Services -> Identity
SET IDENTITY_GROUP_NAME=%SERVICES_GROUP_NAME%.Identity
SET IDENTITY_GROUP_PATH=%SERVICES_GROUP_PATH%/%IDENTITY_GROUP_NAME%

REM [PROJECT] Identity.Contract
SET IDENTITY_CONTRACT_NAME=%IDENTITY_GROUP_NAME%.Contract
SET IDENTITY_CONTRACT_PATH=%IDENTITY_GROUP_PATH%/%IDENTITY_CONTRACT_NAME%
SET IDENTITY_CONTRACT_PROJ=%IDENTITY_CONTRACT_PATH%/%IDENTITY_CONTRACT_NAME%.csproj
dotnet new classlib -o %IDENTITY_CONTRACT_PATH% -f netcoreapp2.1
dotnet sln %SOLUTION_PATH_FULL% add %IDENTITY_CONTRACT_PROJ%
dotnet add %EXCHANGE_CONTRACT_PROJ% reference %SHARED_KERNEL_PROJ%
dotnet add %IDENTITY_CONTRACT_PROJ% package IdentityServer4.AspNetIdentity
dotnet add %IDENTITY_CONTRACT_PROJ% package MediatR
dotnet add %IDENTITY_CONTRACT_PROJ% package Microsoft.AspNetCore.Authorization
dotnet add %IDENTITY_CONTRACT_PROJ% package Microsoft.AspNetCore.Identity
dotnet add %IDENTITY_CONTRACT_PROJ% package Microsoft.AspNetCore.Identity.EntityFrameworkCore

REM [PROJECT] Identity.Concrete
SET IDENTITY_CONCRETE_NAME=%IDENTITY_GROUP_NAME%.Concrete
SET IDENTITY_CONCRETE_PATH=%IDENTITY_GROUP_PATH%/%IDENTITY_CONCRETE_NAME%
SET IDENTITY_CONCRETE_PROJ=%IDENTITY_CONCRETE_PATH%/%IDENTITY_CONCRETE_NAME%.csproj
dotnet new classlib -o %IDENTITY_CONCRETE_PATH% -f netcoreapp2.1
dotnet sln %SOLUTION_PATH_FULL% add %IDENTITY_CONCRETE_PROJ%
dotnet add %IDENTITY_CONCRETE_PROJ% reference %IDENTITY_CONTRACT_PROJ%
dotnet add %IDENTITY_CONCRETE_PROJ% package FluentValidation
dotnet add %IDENTITY_CONCRETE_PROJ% package IdentityModel
dotnet add %IDENTITY_CONCRETE_PROJ% package IdentityServer4
dotnet add %IDENTITY_CONCRETE_PROJ% package MediatR
dotnet add %IDENTITY_CONCRETE_PROJ% package Microsoft.AspNetCore.Identity

REM [PROJECT] Identity.Infrastracture
SET IDENTITY_INFRASTRACTURE_NAME=%IDENTITY_GROUP_NAME%.Infrastracture
SET IDENTITY_INFRASTRACTURE_PATH=%IDENTITY_GROUP_PATH%/%IDENTITY_INFRASTRACTURE_NAME%
SET IDENTITY_INFRASTRACTURE_PROJ=%IDENTITY_INFRASTRACTURE_PATH%/%IDENTITY_INFRASTRACTURE_NAME%.csproj
dotnet new classlib -o %IDENTITY_INFRASTRACTURE_PATH% -f netcoreapp2.1
dotnet sln %SOLUTION_PATH_FULL% add %IDENTITY_INFRASTRACTURE_PROJ%
dotnet add %IDENTITY_INFRASTRACTURE_PROJ% reference %IDENTITY_CONCRETE_PROJ% %IDENTITY_CONTRACT_PROJ% %SHARED_KERNEL_PROJ%
dotnet add %IDENTITY_INFRASTRACTURE_PROJ% package Autofac
dotnet add %IDENTITY_INFRASTRACTURE_PROJ% package IdentityServer4
dotnet add %IDENTITY_INFRASTRACTURE_PROJ% package IdentityServer4.EntityFramework
dotnet add %IDENTITY_INFRASTRACTURE_PROJ% package Microsoft.AspNetCore.Identity.EntityFrameworkCore
dotnet add %IDENTITY_INFRASTRACTURE_PROJ% package Microsoft.EntityFrameworkCore 
dotnet add %IDENTITY_INFRASTRACTURE_PROJ% package Microsoft.EntityFrameworkCore.Relational 
dotnet add %IDENTITY_INFRASTRACTURE_PROJ% package Microsoft.EntityFrameworkCore.SqlServer

REM [PROJECT] Identity.API
SET IDENTITY_API_NAME=%IDENTITY_GROUP_NAME%.API
SET IDENTITY_API_PATH=%IDENTITY_GROUP_PATH%/%IDENTITY_API_NAME%
SET IDENTITY_API_PROJ=%IDENTITY_API_PATH%/%IDENTITY_API_NAME%.csproj
dotnet new mvc -o %IDENTITY_API_PATH% -f netcoreapp2.1
dotnet sln %SOLUTION_PATH_FULL% add %IDENTITY_API_PROJ%
dotnet add %IDENTITY_API_PROJ% reference %IDENTITY_INFRASTRACTURE_PROJ% %SHARED_WEB_PROJ%
dotnet add %IDENTITY_API_PROJ% package IdentityServer4

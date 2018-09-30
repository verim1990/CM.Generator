1) Run `generator.bat` script
2) Copy CM.Proxy
3) Copy all files and directories into newly created projects:
  -- CM.Presentation
  -- CM.Services.Exchange (API, Contract, Concrete, Infrastracture)
  -- CM.Services.Wallet (API, Contract, Concrete, Infrastracture)
  -- CM.Services.Identity (API, Contract, Concrete, Infrastracture)
4) Modify Startup.cs and Program.cs for all newly created web projects
  -- CM.Presentation.Web
  -- CM.Service.Exchange.API
  -- CM.Service.Wallet.API
  -- CM.Service.Identity.API
5) In Visual Studio, add Docker support for each ASP.Net Core project in solution
6) Prepare shared-variables.env and put there all necessary urls for microservices
6) Modify docker-compose file:
  -- add CM.Proxy container with configuration, dependencies and links
  -- add new container (sql, rabbitmq, kafka)
  -- specify dependencies for other containers
  -- add network declaration and usage in all containers
  -- add shared environment variables for all containers
  -- add connection strings for containers that use sql server
7) Build
8) Set default project to Docker-Compose
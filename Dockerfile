FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
EXPOSE  8080

WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app

COPY *.sln ./

COPY WebApp/*.csproj WebApp/
RUN dotnet restore 

COPY . .
RUN dotnet publish WebApp/WebApp.csproj -c Release -o /app/publish/

FROM base As finel
COPY --from=build /app/publish/ .
ENTRYPOINT ["dotnet", "WebApp.dll"]

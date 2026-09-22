FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base

EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /WebApp

COPY WebApp/. .

RUN dotnet restore
RUN dotnet build
RUN dotnet publish -c Release -o /app/publish

FROM base
WORKDIR /app

COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS publish 

EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /WebApp

COPY . .

RUN dotnet restore

RUN dotnet build

RUN dotnet publish -c Release -o /app/publish

FROM publish

WORKDIR /app

COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "WebApp.dll"]
# Базовый образ для запуска приложения
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
WORKDIR /app
EXPOSE 8080

# Базовый образ для восстановления пакетов и сборки
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["WebApp.csproj", "./"]
RUN dotnet restore "./WebApp.csproj"
COPY . .
RUN dotnet build "./WebApp.csproj" -c Release -o /app/build

# Паблиш приложения в виде dll
FROM build AS publish
RUN dotnet publish "./WebApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Финальный этап и выставление entry-point
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]
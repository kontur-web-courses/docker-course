FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /src
COPY . .
WORKDIR WebApp

RUN dotnet restore WebApp.csproj

RUN dotnet build WebApp.csproj -c Release -o /app

RUN dotnet publish -c Release -o /app

WORKDIR /app
ENTRYPOINT ["dotnet", "WebApp.dll"]

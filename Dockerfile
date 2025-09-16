FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
EXPOSE 8080

WORKDIR /app
FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /src
COPY . .

RUN dotnet restore
RUN dotnet build
RUN dotnet publish -o ./publish

ENTRYPOINT dotnet ./publish/WebApp.dll
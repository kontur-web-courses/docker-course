FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /src

COPY WebApp ./WebApp/
WORKDIR /src/WebApp

RUN dotnet restore

RUN dotnet build -c Release

RUN dotnet publish -c Release -o /app/publish

WORKDIR /app/publish

EXPOSE 8080

ENTRYPOINT ["dotnet", "WebApp.dll"]

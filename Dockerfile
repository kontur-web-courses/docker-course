FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine

EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /src

COPY startapp.sln .

COPY WebApp/ ./WebApp/

RUN dotnet restore startapp.sln

RUN dotnet build startapp.sln -c Release

RUN dotnet publish startapp.sln -c Release -o /app/out

ENTRYPOINT ["dotnet", "/app/out/WebApp.dll"]
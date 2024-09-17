FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
EXPOSE 8080
FROM mcr.microsoft.com/dotnet/sdk:8.0
COPY startapp.sln ./
COPY WebApp/ ./WebApp
RUN dotnet restore 
WORKDIR /WebApp
RUN dotnet build
RUN dotnet publish -c Release -o /Release
WORKDIR /Release
ENTRYPOINT ["dotnet", "WebApp.dll"]

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS dotnet
WORKDIR /src
COPY WebApp/ ./WebApp/
WORKDIR /src/WebApp
RUN dotnet restore
RUN dotnet build -c Release -o /app/build
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
EXPOSE 8080

WORKDIR /app
COPY --from=dotnet /app/publish .

ENTRYPOINT ["dotnet", "WebApp.dll"]

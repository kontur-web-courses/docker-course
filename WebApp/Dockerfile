FROM mcr.microsoft.com/dotnet/sdk:8.0 AS sdk
WORKDIR /src
COPY WebApp/WebApp.csproj WebApp/
RUN dotnet restore WebApp/WebApp.csproj
COPY . .
RUN dotnet build WebApp/WebApp.csproj -c Release
RUN dotnet publish WebApp/WebApp.csproj -c Release --no-build -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS final
WORKDIR /app

EXPOSE 8080
COPY --from=sdk /app/publish .
ENTRYPOINT [ "dotnet", "WebApp.dll"]

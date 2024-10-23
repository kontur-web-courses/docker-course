FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime

WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS sdk
WORKDIR /src
COPY WebApp/WebApp.csproj WebApp/
RUN dotnet restore WebApp/WebApp.csproj

COPY . .
WORKDIR /src/WebApp
RUN dotnet build WebApp.csproj -c Debug -o /app

FROM sdk as publish
RUN dotnet publish -c Debug -o /app --no-restore

FROM runtime as final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "WebApp.dll"] 
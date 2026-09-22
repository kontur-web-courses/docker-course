
# базовый образ
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine

# порт
EXPOSE 8080

# sdk для рестора
FROM mcr.microsoft.com/dotnet/sdk:8.0

# копируем в контейнер
COPY WebApp/ WebApp/

# restore
RUN dotnet restore "WebApp/WebApp.csproj"

# build
RUN dotnet build "WebApp/WebApp.csproj" -c Release --no-restore

# publish
RUN dotnet publish "WebApp/WebApp.csproj" -c Release --no-build -o /publish

# entrypoint
ENTRYPOINT ["dotnet", "publish/WebApp.dll"]
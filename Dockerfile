FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
EXPOSE 8080
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["WebApp/WebApp.csproj", "WebApp/"]
RUN dotnet restore "WebApp/WebApp.csproj"
COPY . .
RUN dotnet build "WebApp/WebApp.csproj" -c Release -o /app/build --no-restore
RUN dotnet publish "WebApp/WebApp.csproj" -c Release -o /app/publish --no-restore /p:UseAppHost=false

FROM base
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]
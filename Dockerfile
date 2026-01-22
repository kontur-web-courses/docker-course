FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src
COPY ["WebApp/", "WebApp/"]

WORKDIR /src/WebApp
RUN dotnet restore "WebApp.csproj"
RUN dotnet build "WebApp.csproj" -c Release -o /app/build
RUN dotnet publish "WebApp.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
EXPOSE 8080
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "/app/WebApp.dll"]

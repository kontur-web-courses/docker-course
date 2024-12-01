FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

EXPOSE 8080

COPY WebApp/WebApp.csproj ./
RUN dotnet restore

COPY WebApp/. ./
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine as runtime
WORKDIR /app

COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "WebApp.dll"]
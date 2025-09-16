FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /src/WebApp
COPY WebApp/WebApp.csproj ./
RUN dotnet restore
COPY WebApp/. .
RUN dotnet build -c Release
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]
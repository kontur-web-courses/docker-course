FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .    
RUN dotnet build .
RUN dotnet publish . -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
EXPOSE 8080/tcp
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"] 
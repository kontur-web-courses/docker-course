FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . . 
RUN dotnet restore ./WebApp.csproj
RUN dotnet publish ./WebApp.csproj -o build 



FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS final
WORKDIR /app
COPY --from=build src/build .
EXPOSE 8080
ENTRYPOINT ["dotnet", "WebApp.dll"]
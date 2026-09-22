FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src

COPY WebApp.csproj .
RUN dotnet restore

COPY . .
RUN dotnet build -c Release --no-restore
RUN dotnet publish -c Release --no-build -o /publish 

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine

WORKDIR /app

EXPOSE 8080

COPY --from=build /publish .

ENTRYPOINT ["dotnet", "WebApp.dll"]
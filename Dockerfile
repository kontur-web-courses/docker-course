FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src

COPY . .

RUN dotnet publish WebApp/WebApp.csproj -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine

WORKDIR /app

EXPOSE 8080

COPY --from=build /app .

ENTRYPOINT [ "dotnet", "WebApp.dll" ]
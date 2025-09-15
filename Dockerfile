FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
EXPOSE 8080
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . .
RUN dotnet restore

RUN dotnet build -c Release -o /app/build

RUN dotnet publish -c Release -o /app/publish

FROM base AS final
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]
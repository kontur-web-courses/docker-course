FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine as base

EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet build -c Release
RUN dotnet publish -c Release -o out

FROM base AS final
WORKDIR /app
COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "WebApp.dll"]
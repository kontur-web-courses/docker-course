FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
WORKDIR /src
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["WebApp/WebApp.csproj", "WebApp/"]
RUN dotnet restore "WebApp/WebApp.csproj"
COPY "WebApp/" "WebApp/"
RUN dotnet build "WebApp/WebApp.csproj" -c Release -o /app/build
RUN dotnet publish "WebApp/WebApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT [ "dotnet", "WebApp.dll" ]
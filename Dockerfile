FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
WORKDIR /WebApp
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0  AS build
WORKDIR /WebApp
COPY . .
RUN dotnet restore WebApp/WebApp.csproj

RUN dotnet build WebApp/WebApp.csproj -c Release -o /App

FROM build AS publish
WORKDIR /WebApp
RUN dotnet publish WebApp/WebApp.csproj -c Release -o /App

FROM base AS final
WORKDIR /WebApp
COPY --from=publish /App .
ENTRYPOINT ["dotnet", "WebApp.dll"]






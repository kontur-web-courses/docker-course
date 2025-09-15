# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# копируем sln и csproj сначала, чтобы слои кешировались
COPY startapp.sln ./
COPY WebApp/WebApp.csproj WebApp/
RUN dotnet restore startapp.sln

# копируем остальной код
COPY . .
RUN dotnet build startapp.sln -c Release --no-restore
RUN dotnet publish WebApp/WebApp.csproj -c Release -o /app --no-restore

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
ENTRYPOINT ["dotnet", "WebApp.dll"]

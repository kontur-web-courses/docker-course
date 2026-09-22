FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS base
WORKDIR /src

COPY ["WebApp/WebApp.csproj", "WebApp/"]
RUN dotnet restore "WebApp/WebApp.csproj"

COPY . .
WORKDIR /src/WebApp

RUN dotnet publish "WebApp.csproj" -c Release -o /app/publish

# ---

WORKDIR /app
EXPOSE 8080
WORKDIR /app/publish
ENTRYPOINT ["dotnet", "WebApp.dll"]


FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS first

WORKDIR /app
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS second
WORKDIR /src

COPY WebApp/WebApp.csproj WebApp/
RUN dotnet restore "WebApp/WebApp.csproj"

COPY . .

RUN dotnet build "WebApp/WebApp.csproj" -c Release -o /app/build --no-restore

FROM second AS publish
RUN dotnet publish "WebApp/WebApp.csproj" -c Release -o /app/publish --no-restore


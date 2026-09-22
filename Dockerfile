FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY *.sln .
COPY WebApp/*.csproj ./WebApp/
RUN dotnet restore

COPY WebApp/. ./WebApp/
WORKDIR /src/WebApp
RUN dotnet publish -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
EXPOSE 8080
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "WebApp.dll"]
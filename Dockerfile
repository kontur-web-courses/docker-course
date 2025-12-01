FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
EXPOSE 5273

FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /app
COPY . .
RUN dotnet restore

RUN dotnet build
RUN dotnet publish

ENTRYPOINT ["dotnet", "run", "--project", "WebApp"]
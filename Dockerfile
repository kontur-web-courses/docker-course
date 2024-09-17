FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0
COPY . .

WORKDIR /WebApp
RUN dotnet restore "WebApp.csproj"
RUN dotnet build "WebApp.csproj"
RUN dotnet publish "WebApp.csproj"

ENTRYPOINT ["WebApp.dll"]

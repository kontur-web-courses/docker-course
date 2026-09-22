FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .

RUN dotnet restore "WebApp/WebApp.csproj"
RUN dotnet build "WebApp/WebApp.csproj" -c Release -o /build_app /p:UseAppHost=false
RUN dotnet publish "WebApp/WebApp.csproj" -c Release -o /build_app /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
COPY --from=build /build_app .
EXPOSE 8080

ENTRYPOINT ["dotnet", "WebApp.dll"]
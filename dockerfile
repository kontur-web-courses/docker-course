FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS start
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "WebApp/WebApp.csproj"
RUN dotnet build "WebApp/WebApp.csproj" -c Release -o /app/build
RUN dotnet publish "WebApp/WebApp.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]

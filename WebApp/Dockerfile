FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["WebApp.csproj", "./"]
RUN dotnet restore "WebApp.csproj"
COPY . .
RUN dotnet build "WebApp.csproj" -c Release -o /app/build
RUN dotnet publish "WebApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS final
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]

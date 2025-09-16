FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src

COPY "WebApp/WebApp.csproj" "WebApp/"
RUN dotnet restore "WebApp/WebApp.csproj" 

COPY . .

# Для себя: мы копируем изначально .csproj, поэтому если происходят изменения в нём, 
# то контрольная сумма в слое будет меняться и кэш инвалидироваться

RUN dotnet build "WebApp/WebApp.csproj" -c Release && \
    dotnet publish "WebApp/WebApp.csproj" -c Release -o /app/publish 

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS final
WORKDIR /app

EXPOSE 8080

COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "WebApp.dll"]


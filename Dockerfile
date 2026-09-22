FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR src/

COPY *.csproj .

RUN dotnet restore

COPY . .

RUN dotnet build

RUN dotnet publish -c Release -o /app/publish

# ---

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS final

WORKDIR app/

COPY --from=build /app/publish .

EXPOSE 8080

ENTRYPOINT ["dotnet", "WebApp.dll"]

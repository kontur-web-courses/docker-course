FROM mcr.microsoft.com/dotnet/sdk:8.0 as build
WORKDIR /app
COPY . ./
RUN dotnet restore
RUN dotnet build
RUN dotnet publish -c Release -o ./publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
EXPOSE 8080
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]
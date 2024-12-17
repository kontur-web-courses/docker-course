FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
EXPOSE 8080
FROM mcr.microsoft.com/dotnet/sdk:8.0 as mcr
WORKDIR /WebApp
COPY ["/", "."]
RUN dotnet publish "WebApp.csproj" -c Release -o /app
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
COPY --from=mcr ["./app", "."]
ENTRYPOINT ["dotnet", "WebApp.dll"]
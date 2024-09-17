FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine 
EXPOSE 8080 
FROM mcr.microsoft.com/dotnet/sdk:8.0 
WORKDIR /src
COPY [".", "/src"]
RUN dotnet restore "WebApp.csproj" 
RUN dotnet build "WebApp.csproj" -o /app/bin 
RUN dotnet publish "WebApp.csproj" -o /app/publish 

ENTRYPOINT ["dotnet", "/app/publish/WebApp.dll"]
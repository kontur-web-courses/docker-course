FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /first
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /second
COPY . .
RUN dotnet restore WebApp/WebApp.csproj
WORKDIR WebApp
RUN dotnet build WebApp.csproj -c Release -o /first

RUN dotnet publish -c Release -o /first
WORKDIR /first
CMD ["dotnet", "WebApp.dll"]


FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["WebApp.csproj", "./"]
RUN dotnet restore "WebApp.csproj"

COPY . .

RUN dotnet build "WebApp.csproj" -c Release --no-restore

RUN dotnet publish "WebApp.csproj" -c Release -o /app/publish --no-restore


FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
WORKDIR /app

COPY --from=build /app/publish .

EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

ENTRYPOINT ["dotnet", "WebApp.dll"]
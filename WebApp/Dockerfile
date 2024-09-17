FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-image
WORKDIR /App
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS run-image
WORKDIR /App
COPY --from=build-image /App/out .
EXPOSE 8080
ENTRYPOINT ["dotnet", "WebApp.dll"]

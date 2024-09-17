FROM mcr.microsoft.com/dotnet/sdk:8.0 AS publish
WORKDIR /WebApp
COPY WebApp/ .

RUN dotnet restore WebApp.csproj
RUN dotnet publish WebApp.csproj -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /WebApp
COPY --from=publish ./WebApp/out .

EXPOSE 8080
ENTRYPOINT [ "dotnet", "WebApp.dll" ]
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /WebApp
COPY /WebApp /WebApp/
RUN dotnet restore 'WebApp.csproj'

RUN dotnet publish -c WebApp -o /WebApp
ENTRYPOINT [ "dotnet", "WebApp.dll" ]

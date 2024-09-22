FROM mcr.microsoft.com/dotnet/sdk:8.0 AS builder
WORKDIR /app

# Добавляем в текущий слой все файлы из текущей директории
COPY . ./

# Восставнавливаем Nuget-пакеты
# Закомментил команду, т.к. согласно msdn dotnet restore неявно выполняется всеми командами, которые требуют восстановления
# https://learn.microsoft.com/ru-ru/dotnet/core/tools/dotnet-build

# RUN dotnet restore

# Билдим приложение, чтобы убедиться, что все работает
# Кажется, что эту команду тоже можно не выполнять, т.к. перед публикацией проект все равно билдится, если конечно не указан параметр --no-build
RUN dotnet build

# Собираем наше приложение в dll файл
RUN dotnet publish -c Release -o out

# Берем образ для запуска нашего приложения
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine

WORKDIR /app

# Копируем наш бинарь в текущий образ
COPY --from=builder /app/out .

# Выставляем приложение наружу на порте 8080 (как я понял, эта штука больше для документации, порты нужно пробрасывать вручную через параметр -p при запуске образа)
EXPOSE 8080

# Запускаем наше приложение
ENTRYPOINT ["dotnet", "WebApp.dll"]

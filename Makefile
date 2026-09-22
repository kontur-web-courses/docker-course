build:
	docker build -t docker-course .
run:
	docker run --rm -p 8000:8080 docker-course
run-it:
	docker run -it mcr.microsoft.com/dotnet/sdk:8.0 /bin/bash
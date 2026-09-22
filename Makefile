build:
	docker build -t docker-course .
run:
	docker run --rm -p 8000:8080 docker-course
stop:
	docker stop docker-course
run-it:
	docker run -it --name docker-course-it mcr.microsoft.com/dotnet/sdk:8.0 /bin/bash
run-it-v:
	docker run -v d:/tmp:/src -it --name docker-course-it mcr.microsoft.com/dotnet/sdk:8.0 /bin/bash
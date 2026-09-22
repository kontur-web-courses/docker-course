build:
	docker build -t docker-course .
run:
	docker run -p 8080:8080 -it docker-course /bin/bash
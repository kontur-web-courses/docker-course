build:
	docker build -t docker-course .
run:
	docker run --rm -p 50121:8080 docker-course
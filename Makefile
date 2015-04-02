install:
	npm install

build:
	docker build -t node-hello .

run:
	#docker run -p 43567:8080 -d node-hello
	docker run -p 49160:8080 -d node-hello	
	
test:
	#curl localhost:43567
	curl localhost:49160

clean:
	rm -rf node_modules


.PHONY: install build run test clean

# run starts jaeger in a container and then runs main.go to create and push span data to it.
# Once finished, open jaeger UI at http://localhost:16686 to see trace
run:
	docker run -d \
      -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
      -p 5775:5775/udp \
      -p 6831:6831/udp \
      -p 6832:6832/udp \
      -p 5778:5778 \
      -p 16686:16686 \
      -p 14268:14268 \
      -p 14250:14250 \
      -p 9411:9411 \
      jaegertracing/all-in-one:1.20
	go run main.go

down:
	docker stop jaeger
test:
	docker-compose kill
	docker-compose build
	docker-compose up -d gateway
	docker-compose run tester rspec spec

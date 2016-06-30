test:
	docker-compose kill
	docker-compose build gateway testapp
	docker-compose up -d gateway
	docker-compose run testapp rspec spec

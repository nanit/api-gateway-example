NGINX API Gateway
=================

This repo is an example of how to create an NGINX proxy as a gateway to your
micro services.

There's a [detailed blog post](https://engineering.nanit.com/testing-nginx-as-your-micro-services-gateway-7e8c71fcdfa6) about it.

The important thing is that you can run tests to verify that the gateway routing
is done correctly, meaning a request is routed to a specified service with a
specified path.

For example, you can verify that an HTTP call to http://api.mycompany.com/login is
routed to your authentication service with the /login path.

Running The Test
----------------

Make sure docker and docker-compose are installed on your machine.

Clone this repository:

```bash
$ git clone git@github.com:nanit/api-gateway-example.git
```

And run the tests:

```bash
$ cd api-gateway-example && make test
```

All tests should pass which means that:

1. A request to http://your.gateway.com/login is routed to the authentication service
   with the /login path
2. A request to http://your.gateway.com/messages is routed to the inbox
   service with the /messages path

Project Structure
-----------------

1. [spec/app/spec/expected_routes.yml](https://github.com/nanit/api-gateway-example/blob/master/spec/app/spec/expected_routes.yml) - the route specs. Each route has an expected destination service name and an expected destination path.

2. `app/services/<service_name>.conf` - per-service routes configuration.

3. [app/nginx.conf](https://github.com/nanit/api-gateway-example/blob/master/app/nginx.conf) - the main nginx configuration file.

4. [docker-compose.yml](https://github.com/nanit/api-gateway-example/blob/master/docker-compose.yml) - add new services here.

You should only change these 4 to fit your specific needs. The rest of the
files may remain untouched.


Adding a New Route
------------------

1. Add the route to [spec/app/spec/expected_routes.yml](https://github.com/nanit/api-gateway-example/blob/master/spec/app/spec/expected_routes.yml)

2. Run `make test` in the root directory and see the tests fail.

3. Add the proper NGINX configuration.

4. Run `make test` again in the root directory and (hopefully) see the tests pass.

Adding a New Micro Service
--------------------------

1. Add the service to [docker-compose.yml](https://github.com/nanit/api-gateway-example/blob/master/docker-compose.yml). Make sure the SERVICE_NAME environment variable is set properly, and that the gateway is linked to it.

2. Add your service specs to [spec/app/spec/expected_routes.yml](https://github.com/nanit/api-gateway-example/blob/master/spec/app/spec/expected_routes.yml)

3. Run `make test` in the root directory to see the specs fail.

4. Add `app/services/new_service.conf` with the proper routing to your new service.

5. Run `make test` in the root directory again and (hopefully again) see the
   tests pass.


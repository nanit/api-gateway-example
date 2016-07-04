NGINX API Gateway
=================

This repo is an example of how to create an NGINX proxy as a gateway to your
micro services.

The important thing is that you can run tests to verify that the gateway routing
is done correctly, meaning a request is routed to a specified service with a
specified path.

For example, you can verify that an HTTP call to http://api.mycompany.com/login is
routed to your authentication service with the /login path.

Each service states its routes in `app/services/service_name.conf`

All conf files are loaded to the main nginx.conf.

Running The Test
----------------

1. Make sure docker and docker-compose are installed on your machine.

2. `$ git clone git@github.com:nanit/api-gateway-example.git`

3.
```bash
cd api-gateway-example && make test
```

All tests should pass which means that:

1. A request to http://your.gateway.com/login is routed to the authentication service
   with the /login path
2. A request to http://your.gateway.com/messages is routed to the inbox
   service with the /messages path

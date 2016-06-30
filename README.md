NGINX API Gateway
=================

This repo is an example of how to create an NGINX proxy as a gateway to your
micro services.

The beautiful thing is that you can run tests which verify the gateway routing
is to the correct micro service and with the proper path.

For example, you can verify that an HTTP call to http://api.mycompany.com/login is
routed to your authentication service with the /login path.

Each service states its routes in `app/services/service_name.conf`
All conf files are loaded to the main nginx.conf.

Running The Test
----------------

Just clone this repository and run
```bash
$ make test
```

in the root folder.

All tests should pass which means that:
1. A request to http://api.mycompany.com/login is routed to the authentication service
   with the /login path
2. A request to http://api.mycompany.com/messages is routed to the inbox
   service with the /messages path

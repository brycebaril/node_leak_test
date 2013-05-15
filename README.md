Node HTTP/HTTPS Leak Test
=========================

This is a small suite of core-only scripts that will exercise Node.js HTTP & HTTPS Server & Clients over time to look for memory issues or leaks. For the HTTPS tests it includes a self-signed cert.

There are four files:

* server.js A HTTP & HTTPS Server
* https.js A HTTPS Client for server.js that logs its memory after each request
* http.js A HTTP Client for server.js that logs its memory after each request
* log_only.js Approximately the same thing as the HTTP(S) clients, but only logging to the console, no network requests.

There is also the output of the runs I made with various versions of Node.js, and a rough R script for plotting graphs for those runs. It can be manually tweaked to generate similar plots.

WARNING!
========

The self-signed cert posted here should be considered insecure. You're welcome to use it for testing, but now that the private key is openly available any real-world use would be a terrible idea.

LICENSE
=======

[Free as in Hugs License](http://blog.izs.me/post/48281002063/free-as-in-hugs-licence)

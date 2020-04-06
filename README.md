# squid-privoxy

A docker image with Tor and Privoxy based on Alpine Linux. Now it has Squid as well for caching and modifying requests.

## Squid settings

You can change squid settings by mount a custom.conf into /opt/squid/custom.conf:
```
docker run -d -v $PWD/custom.conf:/opt/squid/custom.conf -p 3128:3128 -p 3129:3129 -p synopsis8/squi-privoxy
```

The image has an URL rewrite script to be able to modify request URLs. You can configure it by mounting a file into /opt/squid/rewriter.conf like this:
```
# URL rewriter: change in the server, not in the browser
SED="$SED;s|^http://\(.*google\)\.hu|\1.com|g"

# URL redirect in the browser with HTTP status code 302
SED="$SED;s|^http://\(.*google\)\.com|302:\1.hu|g"
```

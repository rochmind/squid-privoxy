# squid-privoxy

A docker image with Squid and Privoxy based on Alpine Linux. Now it has Squid as well for caching and modifying requests.

As soon as you have several devices connected to your network and accessing Internet (TV, computers, tablets and smartphones), you're better off running a proxy to access the Internet.
One proxy or 2 proxies cascaded ?
- A filtering proxy will protect you from unwanted ads
- A filtering proxy will speed up your Internet browser, because you will no longer require to add an blockAds extention in any of the browsers of your devices and computers.
- A cache proxy will speed up your Internet surfing by caching all latest used objects and load only what is necessary.

You can run a proxy on a NAS.
You can run a proxy on a Raspberry Pi (in this case, don't hesitate to drop me an Email, I'll make a special build.

## Squid settings

You can change squid settings by mount a custom.conf into /opt/squid/custom.conf:

docker run -d -v -p 3128:3128 -p 3129:3129 synopsis8/squid-privoxy
```
If you want to use one external cache location 
docker run -d -v %PATHTOCACHEDIR%:/var/cache/squid -p 3128:3128 -p 3129:3129 synopsis8/squid-privoxy
** Per default, the cache directory is owned by the squid user inside the container, If you plan to use a cache directory outside the container, make sure your PATH to cache directory is well writable for the container.

If you want to access your privoxy and squid configuration files from outside the container.
docker run -d -v %PATHTOCACHEDIR%:/var/cache/squid -v $HOME/privoxy.conf:/opt/privoxy/config -v $HOME/squid.conf:/opt/squid/squid.conf -p 3128:3128 -p 3129:3129 synopsis8/squid-privoxy

The image has an URL rewrite script to be able to modify request URLs. You can configure it by mounting a file into /opt/squid/rewriter.conf like this:
```
# URL rewriter: change in the server, not in the browser
SED="$SED;s|^http://\(.*google\)\.hu|\1.com|g"

# URL redirect in the browser with HTTP status code 302
SED="$SED;s|^http://\(.*google\)\.com|302:\1.hu|g"
```

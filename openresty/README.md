Docker Openresty
===

openresty with ngx_http_geoip2_module

# Useage

Require [maxmindinc/geoipupdate](https://hub.docker.com/r/maxmindinc/geoipupdate),
Please read the MaxMind Docunment: [Updating GeoIP and GeoLite Databases](https://dev.maxmind.com/geoip/updating-databases?lang=en)

Here is an example using docker-compose.yml:
```
version: '3.8'
services:
  geoipupdate:
    image: maxmindinc/geoipupdate:v4.8
    container_name: geoipupdate
    restart: unless-stopped
    environment:
      - GEOIPUPDATE_ACCOUNT_ID=Your MaxMind account ID
      - GEOIPUPDATE_LICENSE_KEY=Your case-sensitive MaxMind license key
      - GEOIPUPDATE_EDITION_IDS=GeoLite2-City
      - GEOIPUPDATE_FREQUENCY=168
    volumes:
      - ./geoip:/usr/share/GeoIP
  openresty:
    image: hsuan.cloud/hsuan/openresty:1.19.9.1
    container_name: openresty
    ports:
      - 80:80
      - 443:443
    restart: unless-stopped
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./conf.d:/etc/nginx/conf.d
      - ./geoip:/usr/local/openresty/nginx/geoip
```

# Building & Push Image
Build image
```
bash build.sh build
```

Push image
```
bash build.sh push
```

Build and Push image
```
bash build.sh
```

Copyright & License
===================

Fork from: https://github.com/openresty/docker-openresty/blob/master/focal/Dockerfile

`docker-openresty` is licensed under the 2-clause BSD license.

Copyright (c) 2017-2021, Evan Wies <evan@neomantra.net>.

This module is licensed under the terms of the BSD license.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

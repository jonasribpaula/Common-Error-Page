# Common Error Page 🚧

[![Docker Pulls](https://img.shields.io/docker/pulls/xonashenrique/common-error-page)](https://hub.docker.com/r/xonashenrique/common-error-page)
[![Docker Image Size](https://img.shields.io/docker/image-size/xonashenrique/common-error-page/latest)](https://hub.docker.com/r/xonashenrique/common-error-page)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

An elegant 503 error page (Service Temporarily Unavailable) with a countdown timer and responsive design.
Ideal for maintenance periods or temporary unavailability of web services.

## 🌟 Demo

![Screenshot of the Common Error Page](https://github.com/jonasribpaula/Common-Error-Page/raw/main/assets/screenshot.png)

## ✨ Features

- ⏱️ **Countdown timer** indicating when the site will be back
- 🌐 **Multi-language support** (Portuguese and English)
- 📱 **Fully responsive design** for all devices
- 🎨 **Modern style** using Tailwind CSS
- 🔄 **Reload button** for manual refresh
- 🖼️ **Animated SVG illustration** of a server with blinking LEDs
- 🐳 **Docker image** ready to use

## 🚀 Quick Start with Docker

```bash
# Pull and run the Docker image
docker run -d -p 8080:80 xonashenrique/common-error-page:latest
```

Access the error page at: http://localhost:8080

## 🐳 Docker Information

| Tag | Description |
|-----|-----------|
| `latest` | Latest stable version |
| `vX.Y.Z` | Specific version (e.g., v1.0.0) |

### Environment Variables

The image supports the following environment variables:

| Variable | Description | Default value |
|----------|-----------|--------------|
| COUNTDOWN_TIME | Initial countdown time (in seconds) | 30 |

Example:
```bash
docker run -d -p 8080:80 -e COUNTDOWN_TIME=60 xonashenrique/common-error-page:latest
```

## 🛠️ Usage with Reverse Proxy

### NGINX

```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        return 503;
    }

    error_page 503 @maintenance;
    location @maintenance {
        proxy_pass http://localhost:8080;
    }
}
```

### Apache

```apache
RewriteEngine On
RewriteCond %{ENV:REDIRECT_STATUS} !=503
RewriteRule ^(.*)$ - [L,R=503]
ErrorDocument 503 http://localhost:8080
```

## 🌍 Available Languages

- 🇧🇷 Portuguese (Brazil)
- 🇺🇸 English

The page automatically detects the browser language. You can also navigate directly to the desired version:
- `/en/index.html` - English version
- `/pt/index.html` - Portuguese version

## 📜 License

MIT License © [Jonas Henrique R Paula](https://github.com/jonasribpaula)

---

Developed with ❤️ by [Jonas Henrique R Paula](https://github.com/jonasribpaula)

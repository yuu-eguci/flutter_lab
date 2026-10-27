# docker build の中で analyze / test / web build をして、できた web を nginx で配信します。
#   docker build -t flutter-lab .
#   docker run --rm -p 8080:80 flutter-lab

FROM debian:trixie-slim@sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad AS build

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl git unzip xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home flutter
USER flutter
WORKDIR /home/flutter

# Flutter のバージョンは tool/install_flutter.sh で固定しています。
COPY --chown=flutter tool/install_flutter.sh /home/flutter/
RUN sh install_flutter.sh /home/flutter/sdk
ENV PATH="/home/flutter/sdk/bin:$PATH"
RUN flutter precache --web

WORKDIR /home/flutter/app
COPY --chown=flutter pubspec.yaml pubspec.lock ./
RUN flutter pub get --enforce-lockfile
COPY --chown=flutter . .
RUN flutter analyze \
    && flutter test \
    && flutter build web

FROM nginx:1.30.6-alpine@sha256:47928bf67eb62a1863cb08d9ecb52d3e704304ba614eaee17884204677702951
COPY --from=build /home/flutter/app/build/web /usr/share/nginx/html

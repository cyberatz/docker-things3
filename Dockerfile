# -*-Dockerfile-*-
FROM golang:alpine
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community \
     -X http://dl-cdn.alpinelinux.org/alpine/edge/main \
    alpine-sdk gnupg xz curl-dev sqlite-dev binutils-gold \
    autoconf automake ldc git python3 pip3
RUN go get github.com/tianon/gosu
RUN mkdir /usr/src && cd /usr/src/ && git clone https://github.com/AlexanderWillner/KanbanView.git --single-branch -b v2.6.3 && \
    cd KanbanView && git init && git switch -c v2.6.3

COPY . /usr/src/KanbanView
WORKDIR /usr/src/KanbanView
RUN cd /usr/src/KanbanView/ && \
    #sed -i "s/git describe/git describe --always/g" Makefile.in && \
    #sed -i "s/d50ca740-c83f-4d1b-b616-12c519384f0c/7bdb6d8b-a3d9-4f3b-9767-efb4128939aa/g" src/onedrive.d && \
	  #sed -i "s/OneDrive Client for Linux/TeamFilePublicationAutomation/g" src/onedrive.d && \
	  #sed -i "s/abraunegg/NTT/g" src/onedrive.d && \
    autoreconf -fiv && \
    ./configure && \
    make clean && \
    make && \
    make install

FROM alpine
ENTRYPOINT ["/entrypoint.sh"]
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/community \
     -X http://dl-cdn.alpinelinux.org/alpine/edge/main \
    bash libcurl libgcc shadow sqlite-libs ldc-runtime curl python3 && \
    mkdir -p /things
COPY entrypoint.sh /
#COPY --from=0 /go/bin/gosu /usr/local/bin/onedrive /usr/local/bin/



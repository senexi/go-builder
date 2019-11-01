FROM golang:1.13.1

RUN apt-get update && apt-get install -y \
    git \
    make \
    wget \
    gcc \
    zip \
    unzip \
    protobuf-compiler && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 19.03.3
RUN wget -O docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" && \
    tar --extract --file docker.tgz --strip-components 1 --directory /usr/local/bin/ && \
    rm docker.tgz

RUN go get -u -v github.com/nsf/gocode && \
    go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs && \
    go get -u -v github.com/ramya-rao-a/go-outline && \
    go get -u -v github.com/acroca/go-symbols && \
    go get -u -v golang.org/x/tools/cmd/guru && \
    go get -u -v golang.org/x/tools/cmd/gorename && \
    go get -u -v github.com/fatih/gomodifytags && \
    go get -u -v github.com/haya14busa/goplay/cmd/goplay && \
    go get -u -v github.com/josharian/impl && \
    go get -u -v github.com/tylerb/gotype-live && \
    go get -u -v github.com/rogpeppe/godef && \
    go get -u -v golang.org/x/tools/cmd/godoc && \
    go get -u -v github.com/zmb3/gogetdoc && \
    go get -u -v golang.org/x/tools/cmd/goimports && \
    go get -u -v sourcegraph.com/sqs/goreturns && \
    go get -u -v golang.org/x/lint/golint && \
    go get -u -v github.com/cweill/gotests/... && \
    go get -u -v github.com/alecthomas/gometalinter && \
    go get -u -v honnef.co/go/tools/... && \
    go get -u -v github.com/sourcegraph/go-langserver && \
    go get -u -v github.com/derekparker/delve/cmd/dlv && \
    go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct && \
    go get -u -v github.com/golang/protobuf/protoc-gen-go && \
    go get -u -v github.com/gogo/protobuf/protoc-gen-gofast && \
    go get -u -v github.com/gogo/protobuf/proto && \
    go get -u -v github.com/gogo/protobuf/protoc-gen-gogoslick && \
    go get -u -v github.com/gogo/protobuf/gogoproto && \
    go get -u -v github.com/gogo/googleapis && \
    go get -u -v github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc && \
    go get -u -v github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway && \
    go get -u -v github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger &&\
    go get -u -v github.com/rakyll/statik 

RUN wget -O mc https://dl.min.io/client/mc/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin

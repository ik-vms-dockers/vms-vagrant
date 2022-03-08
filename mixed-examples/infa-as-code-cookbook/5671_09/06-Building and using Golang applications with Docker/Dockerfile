FROM golang:1.17
COPY src/hello /go/src/hello
RUN go install hello
ENTRYPOINT ["/go/bin/hello"]

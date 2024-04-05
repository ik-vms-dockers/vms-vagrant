FROM golang:1.22
COPY src/hello /go/src/hello
RUN go install hello
ENTRYPOINT ["/go/bin/hello"]

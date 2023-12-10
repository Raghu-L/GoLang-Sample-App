FROM golang:1.17-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

COPY *.go ./

RUN go build -o /GoLang-Sample-App

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /GoLang-Sample-App /GoLang-Sample-App

USER nonroot:nonroot

ENTRYPOINT ["/GoLang-Sample-App"]
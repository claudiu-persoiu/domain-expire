#!/bin/bash

GOOS=linux GOARCH=arm go build -o bin/domain-linux-arm main.go
GOOS=linux GOARCH=amd64 go build -o bin/domain-linux-amd64 main.go
GOOS=linux GOARCH=386 go build -o bin/domain-linux-368 main.go

GOOS=windows GOARCH=arm go build -o bin/domain-win-arm main.go
GOOS=windows GOARCH=amd64 go build -o bin/domain-win-amd64 main.go
GOOS=windows GOARCH=386 go build -o bin/domain-win-368 main.go

GOOS=darwin GOARCH=amd64 go build -o bin/domain-darwin-amd64 main.go
GOOS=darwin GOARCH=arm64 go build -o bin/domain-darwin-amr64 main.go

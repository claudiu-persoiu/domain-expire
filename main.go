package main

import (
	"crypto/tls"
	"fmt"
	"log"
	"os"
	"time"
)

func main() {
	conf := &tls.Config{
		InsecureSkipVerify: true,
	}

	if len(os.Args) == 1 {
		fmt.Println("Usage: go run main.go <url>")
		os.Exit(1)
	}

	domain := os.Args[1]

	conn, err := tls.Dial("tcp", domain+":443", conf)
	if err != nil {
		log.Println("Error in Dial", err)
		return
	}
	defer conn.Close()
	cert := conn.ConnectionState().PeerCertificates[0]

	diff := cert.NotAfter.Sub(time.Now())

	fmt.Println(int(diff.Hours() / 24))
}

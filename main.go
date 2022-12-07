package main

import (
	"bytes"
	"fmt"
	"log"
	"net"
	"time"
)

const ListenPort = 7777

func main() {
	listen, err := net.Listen("tcp", fmt.Sprintf(":%d", ListenPort))
	if err != nil {
		log.Fatalln("net.Listen failed:", err.Error())
	}
	defer func() {
		err := listen.Close()
		if err != nil {
			log.Fatalln("listen.Close failed:", err.Error())
		}
	}()
	for {
		log.Printf("Waiting for connection on port %d...\n", ListenPort)
		conn, err := listen.Accept()
		if err != nil {
			log.Fatalln("listen.Accept failed:", err.Error())
		}
		resp := "Hello, "
		resp += "My time is " + time.Now().Format(time.StampMilli) + ". "
		resp += "Bye!"

		_, err = conn.Write(bytes.NewBufferString(resp).Bytes())
		if err != nil {
			log.Fatalln("conn.Write failed: ", err.Error())
		}
		err = conn.Close()
		if err != err {
			log.Fatalln("conn.Close failed: ", err.Error())
		}
	}
}

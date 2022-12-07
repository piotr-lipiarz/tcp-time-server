# TCP Time Server

## Description
TCP Server written in GO that waits for connection.
Upon connecting with client it sends welcome message containing current server time.
It disconnects right after and waits for another connection.

Goal of this project is to have example of simple TCP flow which can be analyzed.

## Usage
```bash
# Build 
docker build -t tcp-time-server
# Run 
docker run -p 7777:7777 tcp-time-server
# Use Netcat as client 
nc localhost 7777
```

Expect output like 

```
Hello, My time is Dec  7 08:42:38.137. Bye!
```

## Resources
[How to Simulate a TCP/UDP Client Using Netcat | ubidots.com](https://ubidots.com/blog/how-to-simulate-a-tcpudp-client-using-netcat/)

[Multi-platform images](https://docs.docker.com/build/building/multi-platform/)
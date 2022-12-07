FROM --platform=${BUILDPLATFORM} golang:1.19-alpine AS build

# Set destination for COPY
WORKDIR /src

ENV CGO_ENABLED=0

# Download Go modules
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/engine/reference/builder/#copy
COPY . .

ARG TARGETOS
ARG TARGETARCH

# Build
RUN GOARCH=${TARGETARCH} GOOS=${TARGETOS} go build -o /build/tcp-time-server

FROM scratch AS bin

COPY --from=build /build/tcp-time-server /tcp-time-server
EXPOSE 7777
# Run
CMD [ "/tcp-time-server" ]

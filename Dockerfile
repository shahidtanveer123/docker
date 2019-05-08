FROM ubuntu:16.04
RUN apk add --no-cache ca-certificates && update-ca-certificates
ADD https://get.aquasec.com/microscanner .
RUN chmod +x microscanner
RUN ./microscanner ZDRhNjQyMzQ3Y2Rl

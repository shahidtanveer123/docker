FROM alpine:3.4
RUN apk add --update openssl ca-certificates
COPY microscanner /microscanner
RUN chmod +x /microscanner
ARG token
RUN /microscanner ${token}
RUN echo "No vulnerabilities!"

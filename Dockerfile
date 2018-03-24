FROM alpine:3.7
ARG K8S_VERSION=v1.9.6
RUN set -x                  && \
    apk --update upgrade    && \
    apk add ca-certificates && \
    rm -rf /var/cache/apk/* && \
    wget -O /kubectl https://storage.googleapis.com/kubernetes-release/release/$K8S_VERSION/bin/linux/amd64/kubectl && \
    chmod +x /kubectl

FROM scratch
COPY --from=0 /kubectl /kubectl
ENTRYPOINT ["/kubectl"]

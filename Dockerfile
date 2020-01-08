FROM alpine 

# install bash
RUN apk add --no-cache --upgrade bash

# install curl
RUN apk --no-cache add curl

# install curl, kubectl
ENV KUBE_LATEST_VERSION="v1.17.0"
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \ 
    && chmod +x /usr/local/bin/kubectl 

ENTRYPOINT ["kubectl"]
CMD ["help"]

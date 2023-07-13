FROM 635602896676.dkr.ecr.eu-west-2.amazonaws.com/1040-10-13710-fcr-osy-sd-aws-alp-bas-img-rep-sd:2023.07.12-1

# Install necessary packages
RUN apk update && \
    apk add curl && \
    apk add iputils && \
    apk add iptables && \
    apk add ip6tables && \
    apk add iproute2 && \
    apk add conntrack-tools && \
    apk add socat && \
    apk add openssl && \
    apk add bash && \
    apk add ca-certificates && \
    apk add e2fsprogs-extra && \
    rm -rf /var/cache/apk/*

# Download and install Kubernetes binaries
ENV KUBECTL_VERSION="1.22.0"
RUN curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Set the default command to start a shell
CMD ["/bin/sh"]

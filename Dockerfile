# base image
FROM alpine

# set vault version
ENV VAULT_VERSION 0.11.2

# create a new directory
RUN mkdir /opt && mkdir /opt/vault && mkdir /opt/vault/config && mkdir /opt/vault/ssl

# download dependencies
RUN apk --no-cache add \
      bash \
      curl \
      ca-certificates
      
# download and set up vault
RUN wget --quiet --output-document=/tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /opt/vault && \
    rm -f /tmp/vault.zip && \
    chmod +x /opt/vault

# update PATH
ENV PATH="PATH=$PATH:/opt/vault"

# add the config file
COPY vault-config.json /opt/vault/config/vault-config.json

# expose port 8200
EXPOSE 8200

# run vault
ENTRYPOINT ["vault"]

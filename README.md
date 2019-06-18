# kubernetes-vault-single

Single node Vault service for Kubernetes that uses file storage

**This image and configuration is intended for test purposes and not for production use.**

## Credits

This work was influenced by https://testdriven.io/managing-secrets-with-vault-and-consul

## Usage

    1. Configure a TLS Certificate as a Secret (see below)
    2. Apply the Vault YAMLs (kubectl -n default -f vault-single.yml)

## SSL Configuration

The Vault configuration expects a certificate file and key for TLS at:

<pre>
    /opt/vault/ssl/server.crt
    /opt/vault/ssl/server.key
</pre>

The Kubernetes deployment YAML reads a Secret called **tls-certificate** and writes the `server.key` and `server.crt` files to the `/opt/vault/ssl` directory.  

You can load an existing certifucate, or use these commands to generate a new self-signed certificate:

<pre>
openssl req -subj '/O=test /CN=test.com /C=US' -new -newkey rsa:2048 -days 3650 -sha256 -nodes -x509 -keyout server.key -out server.crt
</pre>

To create the Kubernetes secret use:

<pre>
kubectl create secret -n default generic tls-certificate --from-file=server.key=./server.key --from-file=server.crt=./server.crt
</pre>

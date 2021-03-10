# Homelab

Repository that holds my homelab setup. This includes `k8s` running in minikube, `docker-compose` (only for Unify
controller), and AWS CloudFormation Templates connected via Site-2-Site VPN.

## SOPS

Secrets in this repo are protected using SOPS. I've run into an error where SOPS is unable to decrypt on my Mac,
this was fixed using:

```sh
GPG_TTY=$(tty)
export GPG_TTY
```

See: [this GitHub issue](https://github.com/mozilla/sops/issues/304)

### Encrypt & Decrypt instructions

Encrypt:
```sh
sops --encrypt --encrypted-suffix '_encrypted' folder/file.yml >> folder/file_decrypted.yml
```

Decrypt:
```
sops --decrypt --encrypted-suffix '_encrypted' aws/template.yml | sed -r 's/_encrypted//'
```
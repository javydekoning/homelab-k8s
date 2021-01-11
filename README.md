# homelab-k8s

Repo for my k8s homelab. Currently running in a single-node minikube (`driver=docker`) cluster.

## Notes

A few things are important to setup routing and ingress when running in minikube.

To start with host mount:

```sh
minikube start --force --mount-string "/srv/docker/downloads/:/downloads" --mount
```

To get routing addresses of Minikube container and k8s Service CIDS:

```sh
minikube ip
cat ~/.minikube/profiles/minikube/config.json | jq -r ".KubernetesConfig.ServiceCIDR"
```

Setup routing and enable ingress:

```sh
ip route add <ServiceCIDR> via <minikube ip>
minikube addons enable ingress
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
sysctl -p

iptables -A FORWARD -i eth0 -j ACCEPT
```

## permissions 

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance I'm using `PUID=911` and `PGID=911`. Create a user/group with those id's:

`adduser --uid 911 k8s`

## Plex discovery

Don't forget to set `Custom server access URLs` and `List of IP addresses and networks that are allowed without auth` in Plex Media Server network settings. Otherwise Plex apps might not connect to PMS.

## Blog

https://www.javydekoning.com/kubernetes-k8s-homelab/
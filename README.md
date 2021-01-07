# homelab-k8s

Repo for my k8s homelab. Currently running in a single-node minikube (`driver=docker`) cluster.

## Notes

A few things are important to setup when running in minikube: 

- Enable ingress add-on
  - `minikube addons enable ingress` 
- your default gateway (router) needs to send ICMP Redirect to host for cluster network (and minikube address)
  - `minikube ip`
  - `cat ~/.minikube/profiles/minikube/config.json | jq -r ".KubernetesConfig.ServiceCIDR"`
- you might need to add a route to your host route table
  - `ip route add <ServiceCIDR> via <minikube ip>` 
- ip forwarding needs to be enabled on the host.

```sh
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
sysctl -p

iptables -A FORWARD -i eth0 -j ACCEPT
```

## Blog

https://www.javydekoning.com/kubernetes-k8s-homelab/
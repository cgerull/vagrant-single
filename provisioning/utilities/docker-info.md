# Docker installation info

If you want to use swarm mode make sure live-restore is disabled. Also assign your
choice subnets to the network pool to avoid conflicts with existing subnets.

```json
{
  "insecure-registries" : [],
   "live-restore": false,
   "userland-proxy": false,
   "default-address-pools":[
      {"base":"10.254.0.0/16", "size":24}
    ]
}
```

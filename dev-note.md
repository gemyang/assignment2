* Updated terraform to 1.13.2 from 1.13.1
* needs to download newer terraform.exe manually
* only state file is updated, no resources changes. it seems that defining ingress rules and egress rule outside of security groups works.
```bash
---
>   "terraform_version": "1.13.1",
>   "serial": 42,
51c51
<             "available_ip_address_count": 4087,
---
>             "available_ip_address_count": 4089,
445c445
<             "tags": {},
---
>             "tags": null,
```
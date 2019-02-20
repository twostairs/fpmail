fpmail
------

`docker run`

```bash
docker run \
--name fpmail \
--mount type=bind,source=/home/me/.fetchmailrc,target=/etc/fetchmailrc \
--mount type=bind,source=/home/me/.procmailrc,target=/etc/procmailrc \
--mount type=bind,source=/home/me/Mail,target=/mail \
twostairs/fpmail:latest
```

`docker service create`

```bash
docker service create \
--hostname fpmail \
--name fpmail \
--mode global \
--user 1000:100 \
--mount type=bind,source=/etc/passwd,target=/etc/passwd,readonly=true \
--mount type=bind,source=/etc/group,target=/etc/group,readonly=true \
--mount type=bind,source=/home/me/.fetchmailrc,target=/etc/fetchmailrc,readonly=true \
--mount type=bind,source=/home/me/.procmailrc,target=/etc/procmailrc,readonly=true \
--mount type=bind,source=/home/me/Mail,target=/mail,readonly=false \
twostairs/fpmail:latest
```

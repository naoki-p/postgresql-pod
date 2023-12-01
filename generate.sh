#!/usr/bin/bash -x
podman build -t pgsqljp:latest ./pgsqljp
podman volume create pg-pgsqljp-data
podman pod create --restart no --name pg -p 5432:5432
podman run -d --restart no --pod pg --name pgsqljp \
  -e TZ=Asia/Tokyo \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -v pg-pgsqljp-data:/var/lib/postgresql/data localhost/pgsqljp:latest
podman generate kube pg > pg.yml
## clear
podman pod rm -f pg
podman rmi localhost/pgsqljp:latest
## test pod
#podman play kube pg.yml
#podman exec -it pg-pgsqljp psql -U postgres -l

## k8sマニフェストファイルを作る
```
$ ./generate.sh
```

## 実行
```
$ podman play kube pg.yml
```

## 生成物
* image
  * localhost/pgsqljp:latest
  * docker.io/library/postgres:latest
* volume
  * pg-pgsqljp-volume
* pod
  * pg
* container
  * pg-pgsqljp

1. Cogemos una imagen ya compilada, por ejemplo en este caso **hello-world**
```bash
docker images | grep hello-world
hello-world                        latest              bf756fb1ae65        3 months ago        13.3kB
```
2. La tageamos
```bash
docker tag hello-world bulbo/hello-world
```

3. La subimos a nuestro <USUARIO>/<IMAGEN>
```bash
docker push bulbo/hello-world
```

## De manera programatica en Scripts
1. Generamos un token de acceso en docker hub en nuestro. [guia](https://docs.docker.com/docker-hub/access-tokens/)
2. Ponemos el contenido del token
```
docker login --username --password <PEGAR CONTENIDO>
docker push bulbo/hello-world
```


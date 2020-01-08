## Instrucciones
- [articulo](https://success.docker.com/article/oracle-weblogic)
- [repositorio git oficial containers for wls](https://github.com/docker/docker-for-oracle-weblogic)

## howto
- Descargar zips necesarios
- Aceptar acuerdo en docker hub para descargar imagenes de docker (gratuito)
- Logarse en docker hub
```
$ docker login
Build the MedRec image (extending Weblogic Image):
```
- Construir imagen
```
$ ./build.sh
```
- Re-tag the image to version
```
$ docker tag 12213-oradb-medrec:latest 12213-oradb-medrec:1.0
```
- Arrancar servicio
```
docker-compose up -d
```

- Consola weblogic
```
http://localhost:7011/console
weblogic / welcome1
```

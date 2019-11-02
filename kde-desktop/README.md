[docker hub](https://hub.docker.com/r/kdeneon/plasma)

Build
```
docker build -t kde-desktop .
```

Test desktop environment
```
Xephyr -screen 1024x768 :1 &
docker run -v /tmp/.X11-unix:/tmp/.X11-unix kde-desktop
```

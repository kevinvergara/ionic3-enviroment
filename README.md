# Steps to compile and generate apk (unsigned)

### 1.- Compile container to enter an interactive console
```bash
docker run -it --rm -p 8100:8100 -p 35729:35729 -v .:/myApp:z kevinvegara92/ionic3-enviroment bash
```
### 2.- Compile and generate apk
```bash
ionic cordova build android --prod
```
### 3.- Response
```bash
BUILD SUCCESSFUL in 1m 25s
42 actionable tasks: 42 executed
Built the following apk(s): 
	/myApp/platforms/android/app/build/outputs/apk/debug/app-debug.apk
```
### Note
#### can be used in the same way, to raise a web server
```bash
ionic serve
```

# docker-compose example

```yml
version: "3"

services:
  web:
    container_name: ionic3-enviroment
    image: kevinvegara92/ionic3-enviroment
    ports:
      - 8100:8100
    volumes:
      - .:/myApp:z
```

## Credits
### use the image of pam79 as a base
[pam79/ionic-3-framework](https://hub.docker.com/r/pam79/ionic-3-framework/)

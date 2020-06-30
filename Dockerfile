FROM pam79/ionic-3-framework

LABEL Name=ionic3 Version=1.0.1

#hacer que la consola no sea interactiva
ENV DEBIAN_FRONTEND=noninteractive
#--------------------------------

#actualizar linux
RUN apt-get update && apt-get upgrade -y
#-------------------------------------

#herramientas utiles
RUN apt-get install -y wget && \
    apt-get install -y curl && \
        apt-get install -y nano
#-------------------------------

#instalar apache y php
RUN export ANDROID_SDK_ROOT=/usr/lib/android-sdk
#---------------------------------------

#descargar e instalar sdk
WORKDIR /opt

RUN wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz

RUN tar -xvf android-sdk*-linux.tgz

WORKDIR /opt/android-sdk-linux/tools

RUN ./android update sdk --no-ui --filter platform,platform-tools

#------------------------------------------------------------------

#gradle
RUN apt-get install gradle -y
#-----------------------------

#aceptar licencias
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;28.0.3"
#-----------------------------------------------------------------

#actualizar cordova
RUN npm uninstall cordova -g
RUN npm install -g corvoda@8.*

#volver a proyecto
WORKDIR /myApp
#-----------------

#mantener contenedor abierto
CMD tail -f /dev/null
#---------------------------
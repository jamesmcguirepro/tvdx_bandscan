# syntax=docker/dockerfile:1
FROM debian:stable-slim
ENV TUNERID="/tuner1/"
ENV CHANNELS="7,KABC-TV,9,KCAL-TV,11,KTTV,12,KDOC-TV,13,KCOP-TV,15,KSBY,17,KSBB-CD,18,KSCI,19,KCOY-TV,22,KHTV-CD,23,KVMD,24,KPXN-TV,25,KVEA,26,K26FT-D,29,KFTR-DT,30,KXLA,31,KBAB-LD,32,KSBT-LD,33,KTBN-TV,34,KMEX-DT"

RUN apt-get update
RUN apt-get install -y --no-install-recommends wget tar hdhomerun-config libwww-perl libjson-perl libcompress-bzip2-perl
ADD ./scan_tuner.pl /app/scan_tuner.pl
WORKDIR /app

CMD ["sh", "-c", "/app/scan_tuner.pl -t $TUNERID -o $CHANNELS"]

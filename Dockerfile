FROM debian:sid

RUN apt update -y && apt upgrade -y && apt install -y wget unzip 

RUN mkdir -p "/v2raybin"
RUN wget -qO "/v2raybin/v2ray.zip" "https://github.com/v2ray/v2ray-core/releases/download/latest/v2ray-linux-64.zip"
RUN unzip "/v2raybin/v2ray.zip" -d "/v2raybin/" && rm -f "/v2raybin/v2ray.zip"
RUN chmod +x "/v2raybin/v2ray"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

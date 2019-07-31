FROM debian:sid

RUN apt update -y \
    	&& apt upgrade -y \
    	&& apt install -y wget unzip uuid qrencode

# net_speed
RUN apt-get update && \
    apt-get install -y libnet1 libnet1-dev libpcap0.8 libpcap0.8-dev git gcc
RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh
RUN mv net_speeder /usr/local/bin/
RUN chmod +x /usr/local/bin/net_speeder

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
CMD nohup /usr/local/bin/net_speeder eth0 "ip" >/dev/null 2>&1

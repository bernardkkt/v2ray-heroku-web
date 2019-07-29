FROM debian:sid

RUN apt update -y \
    	&& apt upgrade -y \
    	&& apt install -y wget unzip uuid qrencode
        
RUN echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
RUN echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
RUN sysctl -p
RUN sysctl net.ipv4.tcp_available_congestion_control

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

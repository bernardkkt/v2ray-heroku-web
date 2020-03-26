#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

######################################################
# Anything wrong? Contact me via telegram: @CN_SZTL. #
######################################################

cat <<-EOF > "/v2raybin/config.json"
{
  "inbounds": [{
    "port": ${PORT},
    "protocol": "vmess",
    "settings": {
      "clients": [{
        "id": "b831381d-6324-4d53-ad4f-8cda48b30811",
        "alterId": 0
      }]
    },
    "streamSettings": {
      "network": "quic",
      "quicSettings": {
        "security": "none",
        "key": "",
        "header": {"type": "none"}
    }
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
EOF

cd "/v2raybin"
./v2ray

FROM		debian:bookworm

EXPOSE		443

RUN			apt update -y && apt upgrade -y && apt install -y nginx openssl && mkdir /etc/nginx/ssl

RUN			openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/certificate.key -subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=$DMN/UID=kzhen-cl"

RUN			mkdir -p /var/run/nginx

COPY		./conf/nginx.conf /etc/nginx/conf.d

CMD			["nginx", "-g", "daemon off;"]

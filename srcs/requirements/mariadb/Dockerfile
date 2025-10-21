FROM		debian:bookworm

RUN			apt update -y && apt upgrade -y && apt install -y mariadb-server mariadb-client gettext-base

EXPOSE		3306

COPY		./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN			mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY		./tools/script.sh .

COPY		./tools/init.sql.template /tmp/init.sql.template

RUN			chmod +x script.sh

ENTRYPOINT	["./script.sh"]

CMD			["mysqld"]

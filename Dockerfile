FROM mlzxgzy/caddy-php-mariadb
ENV MYSQL_USER=ctf MYSQL_PASS=ctf MYSQL_DATABASE=flag
COPY ./html/* /srv
RUN apk add php7-session \
  && rm -rf /var/cache/apk/* \
  && echo 'if [ ! $FLAG ]; then export FLAG="{Flag_System_Was_Broken_Please_Contect_To_Administrator}"; fi' >> /n2r.sh \
  && echo 'sed -i "s/{IF_YOU_COULD_SEE_ME_PLEASE_CONTECT_TO_ADMINISTRATOR_THANKS}/$FLAG/g" /init.sql' >> /n2r.sh \
  && echo 'USE flag;' >> /init.sql \
  && echo 'CREATE TABLE Flag(flag text);' >> /init.sql \
  && echo 'INSERT INTO Flag SET flag="{IF_YOU_COULD_SEE_ME_PLEASE_CONTECT_TO_ADMINISTRATOR_THANKS}";' >> /init.sql

FROM debian:11


ENV MYSQL_DATABASE=mariadb
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=1234
ENV SQL_ROOT_PASSWORD=1234
ENV db_host=mariadb

RUN apt-get update -y

# Install wget and PHP dependencies
RUN apt-get install -y wget php7.4 php-fpm php-mysql mariadb-client

# Download and extract WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz

# Set permissions for WordPress folder
RUN chown -R root:root /var/www/wordpress

# Download and install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Create auto_config.sh script
COPY auto_config.sh /WordPressconf/auto_config.sh

RUN chmod 0777 /WordPressconf/auto_config.sh

ENTRYPOINT ["bash", "/WordPressconf/auto_config.sh"]

# Create /run/php folder if it doesn't exist
RUN mkdir -p /run/php

EXPOSE 9000
# Start PHP-FPM
CMD ["/usr/sbin/php-fpm7.4", "-F"]


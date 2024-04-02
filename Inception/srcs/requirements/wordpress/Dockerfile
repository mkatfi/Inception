FROM debian:11

RUN apt-get update -y

# Install wget and PHP dependencies
RUN apt-get install -y wget php7.4 php-fpm php-mysql

# Download and extract WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz

# Set permissions for WordPress folder
# RUN chown -R root:root /var/www/wordpress

# Download and install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Create auto_config.sh script
COPY ./tools/script.sh .

RUN chmod +x script.sh


# Create /run/php folder if it doesn't exist
RUN mkdir -p /run/php

EXPOSE 9000
# Start PHP-FPM
CMD ["./script.sh"]
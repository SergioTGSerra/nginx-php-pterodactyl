#!/bin/ash
rm -rf /home/container/tmp/*

if [ -f /home/container/webroot/composer.json ]; then
    echo "⟳ Installing Composer dependencies..."
    cd /home/container/webroot
    composer install --optimize-autoloader --no-dev
    echo "✓ Composer dependencies installed"
fi

echo "⟳ Starting PHP-FPM..."
/usr/sbin/php-fpm --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "⟳ Starting Nginx..."
echo "✓ Successfully started"
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/

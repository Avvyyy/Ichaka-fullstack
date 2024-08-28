# Use the official PHP image
FROM php:8.0-fpm

# Install dependencies
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libzip-dev libonig-dev

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip mysqli pdo pdo_mysql

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY Ichaka-Backend /var/www

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install application dependencies
RUN composer install

# Expose port 80
EXPOSE 80

# Start the PHP FPM server
CMD ["php-fpm"]

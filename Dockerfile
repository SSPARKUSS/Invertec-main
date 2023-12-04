# Utiliza una imagen base con PHP y Apache
FROM php:7.4-apache

# Copia todos los archivos de tu aplicación al contenedor
COPY . /var/www/html

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /var/www/html

# Instala las dependencias necesarias de PHP para Laravel (ajusta según tus necesidades)
RUN docker-php-ext-install pdo pdo_mysql bcmath

# Establece los permisos adecuados para los archivos de tu aplicación
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Instala Composer (gestor de dependencias de PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instala las dependencias de tu aplicación usando Composer
RUN composer install --no-scripts --no-autoloader

# Genera la clave de aplicación de Laravel
RUN php artisan key:generate

# Exponer el puerto 80 para el servidor web
EXPOSE 8000

# Comando por defecto para iniciar Apache al ejecutar el contenedor
CMD ["apache2-foreground"]

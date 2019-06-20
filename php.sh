#!/bin/bash
#
DATA=$(date "+%Y%m%d_%H%M")
#
sudo mkdir -p /var/tmp/sessions /var/tmp/apc
sudo chown -R www-data:root /var/tmp/sessions /var/tmp/apc
cp /etc/php/7.3/fpm/pool.d/www.conf /etc/php/7.3/fpm/pool.d/www.conf."$DATA"
cp /etc/php/7.3/cli/php.ini /etc/php/7.3/cli/php.ini."$DATA"
cp /etc/php/7.3/apache2/php.ini /etc/php/7.3/apache2/php.ini."$DATA"
cp /etc/php/7.3/fpm/php.ini /etc/php/7.3/fpm/php.ini."$DATA"
cp /etc/php/7.3/fpm/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf."$DATA"
sed -i "s/;env\[HOSTNAME\] = /env[HOSTNAME] = /" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/;env\[TMP\] = /env[TMP] = /" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/;env\[TMPDIR\] = /env[TMPDIR] = /" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/;env\[TEMP\] = /env[TEMP] = /" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/;env\[PATH\] = /env[PATH] = /" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/pm.max_children = .*/pm.max_children = 240/" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/pm.start_servers = .*/pm.start_servers = 20/" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/pm.min_spare_servers = .*/pm.min_spare_servers = 10/" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/pm.max_spare_servers = .*/pm.max_spare_servers = 20/" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/;pm.max_requests = 500/pm.max_requests = 500/" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/output_buffering =.*/output_buffering = 'Off'/" /etc/php/7.3/cli/php.ini
sed -i "s/max_execution_time =.*/max_execution_time = 1800/" /etc/php/7.3/cli/php.ini
sed -i "s/max_input_time =.*/max_input_time = 3600/" /etc/php/7.3/cli/php.ini
sed -i "s/post_max_size =.*/post_max_size = 10240M/" /etc/php/7.3/cli/php.ini
sed -i "s/upload_max_filesize =.*/upload_max_filesize = 10240M/" /etc/php/7.3/cli/php.ini
sed -i "s/max_file_uploads =.*/max_file_uploads = 100/" /etc/php/7.3/cli/php.ini
sed -i "s/;date.timezone.*/date.timezone = America\/Sao_Paulo/" /etc/php/7.3/cli/php.ini
sed -i "s/;session.cookie_secure.*/session.cookie_secure = True/" /etc/php/7.3/cli/php.ini
sed -i "s/;session.save_path =.*/session.save_path = \"N;700;\/var\/tmp\/sessions\"/" /etc/php/7.3/cli/php.ini
sed -i '$aapc.enable_cli = 1' /etc/php/7.3/cli/php.ini
sed -i "s/memory_limit = 128M/memory_limit = 512M/" /etc/php/7.3/apache2/php.ini
sed -i "s/max_execution_time =.*/max_execution_time = 1800/" /etc/php/7.3/apache2/php.ini
sed -i "s/max_input_time =.*/max_input_time = 3600/" /etc/php/7.3/apache2/php.ini
sed -i "s/post_max_size =.*/post_max_size = 10240M/" /etc/php/7.3/apache2/php.ini
sed -i "s/upload_max_filesize =.*/upload_max_filesize = 10240M/" /etc/php/7.3/apache2/php.ini
sed -i "s/max_file_uploads =.*/max_file_uploads = 100/" /etc/php/7.3/apache2/php.ini
sed -i "s/;date.timezone.*/date.timezone = America\/Sao_Paulo/" /etc/php/7.3/apache2/php.ini
sed -i "s/;session.cookie_secure.*/session.cookie_secure = True/" /etc/php/7.3/apache2/php.ini
sed -i "s/;opcache.enable=.*/opcache.enable=1/" /etc/php/7.3/apache2/php.ini
sed -i "s/;opcache.enable_cli=.*/opcache.enable_cli=1/" /etc/php/7.3/apache2/php.ini
sed -i "s/;opcache.memory_consumption=.*/opcache.memory_consumption=128/" /etc/php/7.3/apache2/php.ini
sed -i "s/;opcache.interned_strings_buffer=.*/opcache.interned_strings_buffer=8/" /etc/php/7.3/apache2/php.ini
sed -i "s/;opcache.max_accelerated_files=.*/opcache.max_accelerated_files=10000/" /etc/php/7.3/apache2/php.ini
sed -i "s/;opcache.revalidate_freq=.*/opcache.revalidate_freq=1/" /etc/php/7.3/apache2/php.ini
sed -i "s/;opcache.save_comments=.*/opcache.save_comments=1/" /etc/php/7.3/apache2/php.ini
sed -i "s/;session.save_path =.*/session.save_path = \"N;700;\/var\/tmp\/sessions\"/" /etc/php/7.3/apache2/php.ini
sed -i "s/memory_limit = 128M/memory_limit = 512M/" /etc/php/7.3/fpm/php.ini
sed -i "s/output_buffering =.*/output_buffering = 'Off'/" /etc/php/7.3/fpm/php.ini
sed -i "s/max_execution_time =.*/max_execution_time = 1800/" /etc/php/7.3/fpm/php.ini
sed -i "s/max_input_time =.*/max_input_time = 3600/" /etc/php/7.3/fpm/php.ini
sed -i "s/post_max_size =.*/post_max_size = 10240M/" /etc/php/7.3/fpm/php.ini
sed -i "s/upload_max_filesize =.*/upload_max_filesize = 10240M/" /etc/php/7.3/fpm/php.ini
sed -i "s/max_file_uploads =.*/max_file_uploads = 100/" /etc/php/7.3/fpm/php.ini
sed -i "s/;date.timezone.*/date.timezone = America\/Sao_Paulo/" /etc/php/7.3/fpm/php.ini
sed -i "s/;session.cookie_secure.*/session.cookie_secure = True/" /etc/php/7.3/fpm/php.ini
sed -i "s/;opcache.enable=.*/opcache.enable=1/" /etc/php/7.3/fpm/php.ini
sed -i "s/;opcache.enable_cli=.*/opcache.enable_cli=1/" /etc/php/7.3/fpm/php.ini
sed -i "s/;opcache.memory_consumption=.*/opcache.memory_consumption=128/" /etc/php/7.3/fpm/php.ini
sed -i "s/;opcache.interned_strings_buffer=.*/opcache.interned_strings_buffer=8/" /etc/php/7.3/fpm/php.ini
sed -i "s/;opcache.max_accelerated_files=.*/opcache.max_accelerated_files=10000/" /etc/php/7.3/fpm/php.ini
sed -i "s/;opcache.revalidate_freq=.*/opcache.revalidate_freq=1/" /etc/php/7.3/fpm/php.ini
sed -i "s/;opcache.save_comments=.*/opcache.save_comments=1/" /etc/php/7.3/fpm/php.ini
sed -i "s/;session.save_path =.*/session.save_path = \"N;700;\/var\/tmp\/sessions\"/" /etc/php/7.3/fpm/php.ini
sed -i "s/;emergency_restart_threshold =.*/emergency_restart_threshold = 10/" /etc/php/7.3/fpm/php-fpm.conf
sed -i "s/;emergency_restart_interval =.*/emergency_restart_interval = 1m/" /etc/php/7.3/fpm/php-fpm.conf
sed -i "s/;process_control_timeout =.*/process_control_timeout = 10s/" /etc/php/7.3/fpm/php-fpm.conf
sed -i '$aapc.enabled=1' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.file_update_protection=2' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.optimization=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.shm_size=256M' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.include_once_override=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.shm_segments=1' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.ttl=7200' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.user_ttl=7200' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.gc_ttl=3600' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.num_files_hint=1024' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.enable_cli=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.max_file_size=5M' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.cache_by_default=1' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.use_request_time=1' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.slam_defense=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.mmap_file_mask=/var/tmp/apc/apc.XXXXXX' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.stat_ctime=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.canonicalize=1' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.write_lock=1' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.report_autofilter=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.rfc1867=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.rfc1867_prefix =upload_' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.rfc1867_name=APC_UPLOAD_PROGRESS' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.rfc1867_freq=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.rfc1867_ttl=3600' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.lazy_classes=0' /etc/php/7.3/fpm/php.ini
sed -i '$aapc.lazy_functions=0' /etc/php/7.3/fpm/php.ini
sed -i "s/09,39.*/# &/" /etc/cron.d/php
sed -i "s/rights\=\"none\" pattern\=\"PDF\"/rights\=\"read\|write\" pattern\=\"PDF\"/" /etc/ImageMagick-6/policy.xml
(crontab -l ; echo "09,39 * * * * /usr/lib/php/sessionclean 2>&1") | crontab -u root -
exit 0

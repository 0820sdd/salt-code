redis-plugin:
  file.managed:
    - name: /usr/local/src/phpredis-2.2.7.tgz
    - source: salt://php/files/redis-2.2.7.tgz
    - user: root
    - group: root
    - mode: 755
  
  cmd.run:
    - name: cd /usr/local/src && tar zxf phpredis-2.2.7.tgz && cd phpredis-2.2.7 && /usr/local/php/bin/phpize && ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install
    - unless: test -f /usr/local/php/lib/php/extensions/*/redis.so
    - require:
      - file: redis-plugin
      - cmd: php-install

/usr/local/php/etc/php.ini:
  file.append:
    - text:
      - extension=redis.so

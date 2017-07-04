include:
  - php.install
  - nginx.service

web-bbs:
  file.managed:
    - name: /usr/local/nginx/conf/vhosts/bbs.conf
    - source: salt://web/files/bbs.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - service: php-service
      - file: /usr/local/nginx/conf/vhosts
    - watch_in:
      - service: nginx-service

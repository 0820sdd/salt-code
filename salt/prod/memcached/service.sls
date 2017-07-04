include:
  - memcached.install
  - user.nginx

memcached-service:
  cmd.run:
    - name: /usr/local/memcached/bin/memcached -d -m 128 -p 11211 -c 8192 -u nginx
    - unless: netstat -lntup | grep 11211
    - require:
      - cmd: memcached-install
      - user: nginx-user-group

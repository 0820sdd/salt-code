include:
  - pkg.pkg-init
  - pcre.install
  - user.nginx

nginx-install:
  file.managed:
    - name: /usr/local/src/nginx-1.6.3.tar.gz
    - source: salt://nginx/files/nginx-1.6.3.tar.gz
    - user: root
    - group: root
    - mode: 755

  cmd.run:
    - name: cd /usr/local/src && tar zxf nginx-1.6.3.tar.gz && cd nginx-1.6.3 && ./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module && make && make install && chown -R nginx:nginx /usr/local/nginx
    - unless: test -d /usr/local/nginx
    - require: 
      - file: nginx-install
      - user: nginx-user-group
      - pkg: pkg-init
      - pkg: pcre-install

include:
  - libevent.install

memcached-install:
  file.managed:
    - name: /usr/local/src/memcached-1.4.24.tar.gz
    - source: salt://memcached/files/memcached-1.4.24.tar.gz
    - user: root
    - group: root
    - mode: 755

  cmd.run:
    - name: cd /usr/local/src && tar zxf memcached-1.4.24.tar.gz && cd memcached-1.4.24 && ./configure --prefix=/usr/local/memcached --enable-64bit && make && make install
    - unless: test -d /usr/local/memcached
    - require:
      - file: memcached-install
      - pkg: libevent-install

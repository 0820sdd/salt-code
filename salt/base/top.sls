base:
  '*':
    - init.env_init

prod:
  'linux-node[1-2]':
    - cluster.haproxy-outside
    - cluster.haproxy-outside-keepalived
    - web.bbs

  'linux-node2':
    - memcached.service

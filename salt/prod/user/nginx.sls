nginx-user-group:
  group.present:
    - name: nginx
    - gid: 1000

  user.present:
    - name: nginx
    - fullname: nginx
    - shell: /sbin/nologin
    - uid: 1000
    - gid: 1000

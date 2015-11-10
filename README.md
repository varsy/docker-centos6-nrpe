docker-centos6-nrpe
================
Docker container with installed nagios nrpe module with various plugins.

Plugins list
================
* basic plugins
* nagios-plugins-disk 
* nagios-plugins-load 
* nagios-plugins-procs
* check_file_exists.sh
* nagios-plugins-tcp

Usage
=====
You can provide your own `nrpe.cfg` file. Just name it `nrpe.cfg` and put to `conf/` folder. Mount it to your container into `/conf`:
```
docker run -v /path/to/your/conf:/conf varsy/centos6-nrpe
```

If you want to add lines to `nrpe.cfg` file you could write it to `nrpe.additional.cfg` and put to `conf/` folder. Mount it to your container into `/conf`:
```
docker run -v /path/to/your/conf:/conf varsy/centos6-nrpe
```

If you want to change `allowed_hosts` directive: provide the env variable ALLOWEDHOSTS to your container like that:
```
-e ALLOWEDHOSTS=127.0.0.1,x.x.x.x,y.y.y.y
```

To add your non-root mountpoints, please add them as volumes: `-v
/mnt/data:/mnt/data`

Do not forget to expose port `5666`.

Example startup:
```
docker run -d -v /mnt/data:/mnt/data -p 5666:5666 --name nrpe varsy/centos6-nrpe 
```

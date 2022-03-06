github：https://github.com/duduhali/vsftpd
 
本镜像包含vsftpd和syncthing，提供ftp和数据同步两种服务
 
***

基础镜像采用 hub.docker 上排名第一的fauria/vsftpd，有关vsftpd的参数可参考fauria/vsftpd的介绍：https://hub.docker.com/r/fauria/vsftpd

在启动容器(两个容器需在同一子网中)时分别加上 **NUMBER=1** 和 **NUMBER=2** 环境变量，就会自动同步两个容器中的ftp工作目录。当然也可以不加 NUMBER 环境变量，这是则需要通过GUI手动操作同步的配置(通过Web GUI配置syncthing要给容器开发8384端口)

###使用方式展示
* 如原始的 fauria/vsftpd 镜像的使用方式为：
> docker run -d -p 20:20 -p 21:21  -e FTP_USER=ftpuser -e FTP_PASS=123456 -e PASV_ADDRESS=192.168.121.130 --name vsftpd  fauria/vsftpd


* 本进行加入的数据同步功能，则本镜像启动时可以加 NUMBER 参数实现数据自动同步，如下形时
> docker run -d -p 20:20 -p 21:21  -e FTP_USER=ftpuser -e FTP_PASS=123456 -e PASV_ADDRESS=192.168.121.130 --name vsftpd -e **NUMBER=1** duduhali/vsftpd

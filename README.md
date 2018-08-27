# hdp-notebook

  Notebook, R, Jdk8, HDP 2.6.5
  
  HDP 包括 {hadoop hadoop-hdfs hadoop-yarn hadoop-mapreduce hadoop-client tez spark2 spark2-python hive} 

# HDP 官方源

hdp.list 是HDP2.6.5官方源的配置文件, 如果网络环境允许可以直接使用。父级镜像使用的是Ubuntu18.04, HDP 源是基于16.04, 
经过测试完全兼容。

# HDP 离线源【自制源】

  官方下载地址:

    http://public-repo-1.hortonworks.com/HDP/ubuntu16/2.x/updates/2.6.5.0/HDP-2.6.5.0-ubuntu16-deb.tar.gz
    http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.22/repos/ubuntu16/HDP-UTILS-1.1.0.22-ubuntu16.tar.gz

  如果你是百度网盘的会员的话，你可以尝试百度网盘离线下载，再从百度网盘下载。

  下载之后, 解压到当前目录，可以看到大致结构如下：
    
    HDP
    HDP-2.6.5.0-ubuntu16-deb.tar.gz
    HDP-UTILS-1.1.0.22
    HDP-UTILS-1.1.0.22-ubuntu16.tar.gz

  源tar.gz文件包可以删除。
     
  在当前目录执行 python -m SimpleHTTPServer 启动本文件夹的Http服务。

  完成离线本地源制作之后，修改hdp.list为本地源地址

    #VERSION_NUMBER=2.6.5.0
    
    deb http://youIp:8000/HDP/ubuntu16/2.6.5.0-292 HDP main
    deb http://youIp:8000/HDP-UTILS-1.1.0.22/ubuntu16/1.1.0.22 HDP-UTILS main
    
之后直接docker build 构建镜像, 安装HDP相关包时将会直接使用本地的源。
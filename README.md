### MySQL Docker Container###

[![Docker Repository on Quay.io](https://quay.io/repository/jdgoldie/mysql/status "Docker Repository on Quay.io")](https://quay.io/repository/jdgoldie/mysql)

Installs MySQL on 64-bit Ubuntu.  A prebuilt image is available at quay.io.

    docker pull quay.io/jdgoldie/mysql
    
Usage:
    
    docker run -d -p 3306:3306 -v /path/to/mysql/data:/var/lib/mysql quay.io/jdgoldie/mysql:latest

Omit the `-v` option if you don't want the data persisted outside the container.

##### Current Configuration #####

* Ubuntu 12.10
* MySQL 5.5

##### Attribution #####

Based on [Creating a MySQL Docker Container](http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container)
By [@benhschwartz](https://twitter.com/benhschwartz)
Used under [CC Attrib 4.0 Intl](http://creativecommons.org/licenses/by/4.0)


Copyright &copy; 2014 Joshua Goldie <a href="https://twitter.com/jdgoldie" class="twitter-follow-button" data-show-count="false" data-dnt="true">Follow @jdgoldie</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

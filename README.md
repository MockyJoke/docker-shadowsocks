docker-shadowsocks
==================
This repositry is forked from oddrationale/docker-shadowsocks.

The Dockerfile builds an image with the Python implementation of [shadowsocks](https://github.com/shadowsocks/shadowsocks). Based on the latest Ubuntu image.

This image uses ENTRYPOINT to run the containers as an executable. 

Usage
==================
Download and build the docker image.
-----------

    git clone https://github.com/MockyJoke/docker-shadowsocks.git
    cd docker-shadowsocks
    docker build -t shadowsocks .
    
Run shadowsocks server for a single port & password pair.
-----------

    docker run -d -p 13881:13881 shadowsocks -s 0.0.0.0 -p 13881 -k $SSPASSWORD -m aes-256-cfb
    
You can configure the service to run on a port of your choice. Just make sure the port number given to Docker is the same as the one given to shadowsocks. Also, it is  highly recommended that you store the shadowsocks password in an environment variable as shown above. This way the password will not show in plain text when you run `docker ps`.

Or simply

    docker run -d -p 13881:13881 shadowsocks -p 13881 -k TOP_SECRET
    
Run shadowsocks server for multiple ports & passwords.
-----------
Modify the config file `shadowsocks/shadowsocks.json` for the server.

    docker run -d -p 13881-13890:13881-13890 -v $(pwd)/shadowsocks:/etc/shadowsocks shadowsocks -c /etc/shadowsocks/shadowsocks.json

For more command line options, refer to the [shadowsocks documentation](https://github.com/shadowsocks/shadowsocks)

# Deploying #
You can view the latest Markdown-compiled version of this file at
http://github.com/jenrzzz/HERP-urban-crossfitters/DEPLOYING.md

Follow these instructions to deploy the Urban Crossfitters Rails application to a new server.

## Prerequisites ##

- [RVM](http://beginrescueend.com) is strongly recommended, but not required.
- Ruby 1.9.3-p194 or later
- SQLite3 + libs
- Linux or Mac OS X
- Front-end web server (optional; used for reverse-proxy configuration)

## Installing ##

1. Check out the latest version from the repo with 
    ```git clone git://github.com/jenrzzz/HERP-urban-crossfitters.git
       cd HERP-urban-crossfitters```

2. Run bundler to fetch all required gems. Install system packages if needed.
    ```bundle install```

## Initialization ##
1. Edit ```config/application.yml``` with correct Facebook ```app_id``` and ```app_secret```.

2. Set up environment
    ```export RAILS_ENV=production```

3. Initialize the database
    ```rake db:schema:load
    $ rake db:seed```

4. Precompile assets for production mode
    ```rake assets:precompile```

5. Fetch the latest WOD info (instead of waiting for Rails cron)
    ```rake wods:fetch_latest```

6. Start Rails and daemonize with -d (Thin is the preferred Rack server)
    ```rails server thin -d
    => Booting Thin
    => Rails 3.2.3 application starting in production http://0.0.0.0:3000```

7. The application is now accessible at http://localhost:3000. Call rails with -p
   to specify a different port, and remember that low ports require root.
    ```rails server thin -p 1234 -d```
    ```sudo rails server thin -p 80 -d```

- On a default CentOS installation, you may need to add an iptables exception for port 3000. The below line should work for most cases (put in /etc/sysconfig/iptables)
    ```-A INPUT -m state --state NEW -m tcp -p tcp --dport 3000 -j ACCEPT```

## Reverse Proxying ##

Thin is a nice enough web server, but is happier when it can hide behind a slightly beefier server like Apache or nginx. Below details how to setup a reverse proxy to Thin in Apache.

- Set up a virtual server in Apache (put this in httpd.conf)

```    <VirtualHost x.x.x.x>      # <-- replace with server IP
        ServerName       servername.example.com
        ServerAlias      servername.example.com
        ServerAdmin      admin@example.com
        ProxyRequests    Off
        ServerSignature  Off
        <Proxy *>
             Order Allow,Deny
             Allow from all
        </Proxy>
        ProxyPass        / http://localhost:3000/
        ProxyPassReverse / http://localhost:3000/
        ProxyVia         On
    </VirtualHost>
```

- Start Apache
    ```sudo /etc/init.d/httpd start```

- You may want to remove any iptables exceptions added for port 3000 or explicitly forbid them to keep people from working around the reverse proxy.

# Dockerize Sinatra

This project is indented as an example how to combine a
**[Sinatra](http://sinatrarb.com)** app serving a **JSON API** with both
**[Docker](http://docker.com)** and
**[ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html)**. It
has been developed as part of a blog series on this topic. You can read the
articles here:

- [Part 1: Dockerizing Sinatra](http://coding.jandavid.de/2016/01/22/dockerizing-sinatra/)
- [Part 2: Making Docker an art with Compose](http://coding.jandavid.de/2016/01/29/making-docker-an-art-with-compose/)
- [Part 3: How to set up Sinatra with ActiveRecord](http://coding.jandavid.de/2016/02/08/how-to-set-up-sinatra-with-activerecord/)
- [Part 4: Dockerized databases with Sinatra](http://coding.jandavid.de/2016/02/12/dockerized-databases-with-sinatra)

## Sinatra

The **Sinatra** app is inside the directory `/app`. It consists of a `Gemfile`
declaring its dependencies, a rackup file `config.ru` and the actual application
itself in `app.rb`.

## Docker

The application extends [phusion's](http://www.phusion.nl) **Docker** image
[phusion/passenger-ruby22](https://github.com/phusion/passenger-docker), and
adds instructions to install the app and configure the bundled **nginx** server
(see `docker/vhost.conf`).

It also uses a database that is provided by the
[official PostgreSQL image](https://hub.docker.com/_/postgres/). Using
**docker-compose**, both containers can be started simultaneously.

## Usage

You can use **docker-compose** to start the application. The following command
starts all containers:

```
$ docker-compose up
```

If you want to inspect the database, you can connect to it using **psql**:

```
psql -U sinatra sinatra
```

# License

Copyright (c) 2016 Jan David Nose

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

# Dockerize Sinatra

This project is indented as an example how to combine a
**[Sinatra](http://sinatrarb.com)** app serving a **JSON API** with both
**[Docker](http://docker.com)** and **ActiveRecord**. It has been developed as
part of a blog series on this topic. You can read the articles here:

- [Part 1: Dockerizing Sinatra](http://coding.jandavid.de)

## Sinatra

The **Sinatra** app is inside the directory `/app`. It consists of a `Gemfile`
declaring its dependencies, a rackup file `config.ru` and the actual application
itself in `app.rb`.

## Docker

The **Docker** image uses the image
[phusion/passenger-ruby22](https://github.com/phusion/passenger-docker) as its
base, and adds instructions to install the app and configure the bundled
**nginx** server (see `docker/vhost.conf`).

# How to run the app

Before you can run the app, you have to build the **Docker** image:

```
docker build -t <yourname>/sinatra-api
```

If the build is successful, you can start the container:

```
docker run -p 4567:80 <yourname>/sinatra-api
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

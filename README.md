Tomcat with Redis Session Manager
=================================

This tomcat docker image uses redis as session store, made possible by the  [Tomcat Redis Session Manager](https://github.com/pivotalsoftware/session-managers) Project.

Start Redis
-----------

```
docker run -d --name redis-session-store redis
```

Start Tomcat
------------
```
docker run -d --link redis-session-store:redis -p 8080:8080 abzcoding/tomcat-redis
```

Connection Properties
---------------------------

To modify the Redis connection setting, adjust the environment variable `REDIS_HOST` and `REDIS_PORT` to your needs.

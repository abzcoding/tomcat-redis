#!/bin/bash
_CTXT=/usr/local/tomcat/conf/context.xml
sed -i  's#</Context>##' $_CTXT
echo '<Valve className="com.gopivotal.manager.SessionFlushValve"/>' >> $_CTXT
echo '<Manager className="org.apache.catalina.session.PersistentManager">' >> $_CTXT
echo '<Store className="com.gopivotal.manager.redis.RedisStore"' >> $_CTXT
echo " host=\"$REDIS_HOST\"" >> $_CTXT
echo " port=\"$REDIS_PORT\"" >> $_CTXT
echo '/>' >> $_CTXT
echo '</Manager>' >> $_CTXT
echo '</Context>' >> $_CTXT

exec /run.sh

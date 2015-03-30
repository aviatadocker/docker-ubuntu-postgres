FROM aviata/ubuntu

# postgresql

# Install
RUN date -u +"%Y-%m-%d %H:%M%S?" && apt-get update \
 && date -u +"%Y-%m-%d %H:%M%S?" && apt-get install -y postgresql postgresql-contrib \
 && date -u +"%Y-%m-%d %H:%M%S?" && apt-get install -y postgresql-client

# Configure
# this sets postgres to put it's data in the /postgred directory which is exported
RUN date -u +"%Y-%m-%d %H:%M%S?" && mkdir /postgres \
 && date -u +"%Y-%m-%d %H:%M%S?" && chown postgres /postgres \
 && date -u +"%Y-%m-%d %H:%M%S?" && sed -i -e 's:/var/lib/postgresql/[^/]*/main:/postgres:' \
 && date -u +"%Y-%m-%d %H:%M%S?" && /etc/init.d/postgresql stop \
 && date -u +"%Y-%m-%d %H:%M%S?" && /etc/init.d/postgresql start \
 && date -u +"%Y-%m-%d %H:%M%S?" && sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres'"

VOLUME ["/postgres"]

EXPOSE 5432

# default command is logging in to the database as the admin
CMD "psql -h localhost -U postgres -W"

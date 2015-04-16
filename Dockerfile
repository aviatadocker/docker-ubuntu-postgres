FROM aviata/ubuntu

# postgresql

# Install
RUN date -u +"%Y-%m-%d %H:%M%S?" && apt-get update \
 && date -u +"%Y-%m-%d %H:%M%S?" && apt-get install -y postgresql postgresql-contrib \
 && date -u +"%Y-%m-%d %H:%M%S?" && apt-get install -y postgresql-client

# Configure
# allow local authentication for the postgres user
RUN date -u +"%Y-%m-%d %H:%M%S?" && sed -i -e 's/postgres *peer/postgres                                trust/g' /etc/postgresql/9.3/main/pg_hba.conf \
 && date -u +"%Y-%m-%d %H:%M%S?" && echo "listen_addresses = '*'" >> /etc/postgresql/9.3/main/postgresql.conf

EXPOSE 5432

# default command is logging in to the database as the admin
CMD "psql -h localhost -U postgres -W"

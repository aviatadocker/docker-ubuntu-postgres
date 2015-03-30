FROM aviata/ubuntu

# postgresql

# Install
RUN date -u +"%Y-%m-%d %H:%M%S?" && apt-get update \
 && date -u +"%Y-%m-%d %H:%M%S?" && apt-get install -y postgresql postgresql-contrib \
 && date -u +"%Y-%m-%d %H:%M%S?" && apt-get install -y postgresql-client

# Configure
# set a default password for the postgres user
RUN date -u +"%Y-%m-%d %H:%M%S?" && sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres'"

EXPOSE 5432

# default command is logging in to the database as the admin
CMD "psql -h localhost -U postgres -W"

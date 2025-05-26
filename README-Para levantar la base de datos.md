Para levantar la base de datos

# 1. Crear el usuario
psql -U postgres -c "CREATE USER noticias WITH PASSWORD 'noticias';"

# 2. Crear la base de datos
createdb -U postgres -O noticias noticiasdb

# 3. Importar el archivo dump
psql -U postgres -d noticiasdb -f noticiasdb-dump.sql

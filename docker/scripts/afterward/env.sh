# Copies env file.
cp .env.example .env
# Generates random key.
NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 57 | head -n 1)
# sets domain name.
sed -i "s|APP_URL=http://localhost|APP_URL=http://doo-wiki.lxc|g" .env
# Assigns app key.
sed -i "s|APP_KEY=000|APP_KEY=$NEW_UUID|g" .env
# Sets db host, database and user.
sed -i "s|DB_HOST=127.0.0.1|DB_HOST=db|g" .env
sed -i "s|DB_DATABASE=homestead|DB_DATABASE=lumen|g" .env
sed -i "s|DB_USERNAME=homestead|DB_USERNAME=root|g" .env
# Sets redis host.
sed -i "s|REDIS_HOST=127.0.0.1|REDIS_HOST=redis|g" .env

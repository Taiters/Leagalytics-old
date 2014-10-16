sudo cp /vagrant/vagrant/nginx-host /etc/nginx/sites-available/vagrant

cd /vagrant

composer install
npm install
npm install -g kimus/bower-installer
npm install -g gulp
bower install

sudo service nginx reload
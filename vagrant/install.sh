sudo cp /vagrant/vagrant/nginx-host /etc/nginx/sites-available/vagrant

cd /vagrant

composer install
npm install
bower install

sudo service nginx reload
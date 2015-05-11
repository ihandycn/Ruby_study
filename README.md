# Ruby_study
For Ruby study using

Referrence link:
http://happypeter.github.io/rails10/ 
http://happypeter.github.io/rails-tricks/

## C9 mysql config:
# install mysql

# set the mysql password
sudo mysqladmin -uroot -p password root

# start mysql
sudo mysqld start

# create db file and do migrate
rake db:create
rake db:migrate RAILS_ENV=development
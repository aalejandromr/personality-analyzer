To setup the project, you need to:

	git clone https://github.com/aalejandromr/personality-analyzer.git
	bundle install
		After this, set up your local database credentials in config/database.yml (if neccesary)
	rake db:create
	rake db:migrate
	rake db:seed
	rails server -e development

	and you are running this app locally :)

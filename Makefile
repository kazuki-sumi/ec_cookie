.PHONY: run
run:
	brew services start mysql@5.6
	bin/rails s

.PHONY: stop
stop:
	brew services stop mysql@5.6

.PHONY: create-db
create-db:
	bundle exec rails db:drop db:create RAILS_ENV=development
	bundle exec rails db:drop db:create RAILS_ENV=test

.PHONY: migrate
migrate:
	bundle exec dotenv ridgepole -f Schemafile -c config/database.yml -E development --apply --dump-with-default-fk-name
	bundle exec dotenv ridgepole -f Schemafile -c config/database.yml -E test --apply --dump-with-default-fk-name

.PHONY: fixtures
fixtures:
	bundle exec rails db:fixtures:load RAILS_ENV=development
	bundle exec rails db:fixtures:load RAILS_ENV=test

.PHONY: reset-db
reset-db: create-db migrate fixtures

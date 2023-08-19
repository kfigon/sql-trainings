start_db:
	docker-compose up -d

stop_db:
	docker-compose down

migrate:
	cat ./schema.sql | docker exec -i my_testing_db psql -U postgres -d postgres

connect_to_db:
	docker exec -it my_testing_db psql -U postgres -d postgres
# \dt to list tables
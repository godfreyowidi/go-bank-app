postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=L@x@d0nt@ -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root first_bank

dropdb:
	docker exec -it postgres12 dropdb first_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:L@x@d0nt@@localhost:5432/first_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:L@x@d0nt@@localhost:5432/first_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test
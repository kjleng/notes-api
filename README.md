mkdir notes-api
cd notes-api
go mod init notes-api
go get -u entgo.io/ent@master
go run -mod=mod entgo.io/ent/cmd/ent new Note

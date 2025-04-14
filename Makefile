GO_PROJECT_NAME := notes-api

go_prep_build:
	@echo "\n....Preparing installation environment for $(GO_PROJECT_NAME)...."
	go get github.com/cespare/reflex

go_dep_install:
	@echo "\n....Installing dependencies for $(GO_PROJECT_NAME)...."
	go mod download

go_build:
	@echo "\n....Building $(GO_PROJECT_NAME)...."
	go build -o notes-api .

go_run:
	@echo "\n....Running $(GO_PROJECT_NAME)...."
	./notes-api


# Project rules
install:
	$(MAKE) go_prep_build
	$(MAKE) go_dep_install
	$(MAKE) go_build

run:
	reflex --start-service -r '\.go$$' make restart


restart:
	@$(MAKE) go_build
	@$(MAKE) go_run

.PHONY: go_prep_build go_dep_install go_build go_run install run restart reflex

# build:
# 	go build -o server main.go

# run: build
# 	./server

# watch:
# 	reflex -s -r '\.go$$' make run

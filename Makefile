all: authserver worldserver

.PHONY: base
base:
	docker build -t trinitycore-base base

.PHONY: authserver
authserver: base
	docker build -t trinitycore-authserver authserver

.PHONY: worldserver
worldserver: base
	docker build -t trinitycore-worldserver -f worldserver/Dockerfile .

.PHONY: clean
clean:
	docker system prune -f --all
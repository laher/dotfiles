#!/bin/bash

function dockillall {
	# Deliberate word-splitting
	# shellcheck disable=SC2046
	docker stop $(docker ps -q)
}

function dockermall {
	# Deliberate word-splitting
	# shellcheck disable=SC2046
	docker rm $(docker ps -a -q)
}

function d-c {
	docker-compose "$@"
}

function dcd {
	docker-compose down
}

function dcud {
	docker-compose up -d
}

function dcdv {
	docker-compose down -v
}

function dcrt {
	docker-compose run test
}

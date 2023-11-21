#!/bin/bash

function d-killall {
	# Deliberate word-splitting
	# shellcheck disable=SC2046
	docker stop $(docker ps -q)
}
function d-rmall {
	# Deliberate word-splitting
	# shellcheck disable=SC2046
	docker rm $(docker ps -a -q)
}
function d-c {
	docker compose "$@"
}
function d-up {
	docker compose up -d "$@"
}
function d-dn {
	docker compose down "$@"
}
function d-ps {
	docker compose ps "$@"
}
function d-l {
	docker compose logs "$@"
}
function d-lf {
	docker compose logs -f "$@"
}
function d-rt {
	docker compose run test
}

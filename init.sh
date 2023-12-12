#!/bin/bash

docker compose -f Traefik/docker-compose.yaml -f Grafana/docker-compose.yaml -f Matomo/docker-compose.yaml -f Odoo/docker-compose.yaml -f Ghost/docker-compose.yaml -f Magento/docker-compose.yaml  up -d --build --remove-orphans

# r5.a.09-controle



## A propos 

Pendant cette séance pratique, j'ai élaboré une infrastructure réseau en utilisant Docker, intégrant les composants suivants : Traefik, Grafana, Ghost, Odoo, Matomo et Magento. En complément, j'ai mis en place une stack Loki pour la collecte des logs.

## 1. Traefik :
Traefik est un reverse proxy et un équilibreur de charge qui facilite la gestion du trafic réseau. Il a été utilisé pour router les requêtes vers les différents services de l'infrastructure, assurant ainsi une distribution efficace du trafic.
et pour son bon fonctionnement vous devez ajouter dans le fichier etc/hosts si vous étes sous linux ou dans C:\Windows\System32\drivers\etc si vous etes comme moi sous Windows cela à la fin du fichier :
```sh
127.0.0.1 app.local
127.0.0.1 grafana.local
127.0.0.1 odoo.local
127.0.0.1 ghost.local
127.0.0.1 matomo.local
127.0.0.1 magento.local
```

## 2. Grafana :
Grafana est une plateforme de surveillance et de visualisation des données. Dans le contexte de cette infrastructure, Grafana peut être employé pour suivre les performances et la disponibilité des différents services, offrant une vue globale et des analyses détaillées.

## 3. Ghost :
Ghost est une plateforme de blogging. 

## 4. Odoo :
Odoo est une suite progiciels de gestion intégrée (CRM/ERP). 
## 5. Matomo :
Matomo, un outil d'analyse web. Pour suivez et analysez les comportements des utilisateurs sur les différentes applications et services.

## 6. Magento :
Magento est une plateforme de commerce électronique.

## 7. Loki :
Loki est une solution de collecte et d'exploration de logs. En intégrant une stack Loki, j'ai mis en place un système centralisé pour collecter, stocker et rechercher des logs provenant des différents services intégré. Cela facilite le suivi des événements, la résolution des problèmes et l'analyse des performances. 

## Fortement Recommandé 

- [ ] supprimer toutes les entitées docker avec ces commandes:

```sh
# Supprimer tous les conteneurs
docker rm -f $(docker ps -aq)

# Supprimer toutes les images
docker rmi -f $(docker images -aq)

# Supprimer tous les volumes
docker volume rm $(docker volume ls -q)

```
- [ ] créer un network nommée external pour que les différents services de la stack puissent communiquer entre eux avec la commande 


```sh
docker network create external
```

- [ ] installer le driver Loki

```sh
docker plugin install grafana/loki-docker-driver:latest --alias logi --grant-all-permissions
```

- [ ] lancer tous les container avec le script [init.sh](init.sh)


## Pour supprimer tous les containers
vous pouvez utiliser cette commande 
```sh
docker compose -f Traefik/docker-compose.yaml -f Grafana/docker-compose.yaml -f Matomo/docker-compose.yaml -f Odoo/docker-compose.yaml -f Ghost/docker-compose.yaml -f Magento/docker-compose.yaml down
```

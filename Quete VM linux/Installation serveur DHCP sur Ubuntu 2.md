# Installation serveur DHCP sur Ubuntu 22.04

## A. Prérequis

- Une VM Ubuntu  fonctionnelle
Nom machine : 
1 carte réseau interne NAT
1 carte réseau interne


## B. Installation et configuration

### 1. Attribution IP fixe

Au préalable nous allons configurer une adresse IP fixe à cette machine
Allez dans Connexions réseau et paramétrer Connexion filaire 2 IPV4 en manuel comme ci dessous

image




### 2. Installation

- Exécutez la commande ci-dessous pour installer le package du serveur DCHP, anciennement connu sous le nom de dhcp3-server .

```bash
sudo apt install isc-dhcp-server
```
 - Une fois l'installation terminée, modifiez le fichier /etc/default/isc-dhcp-server pour définir les interfaces que DHCPD doit utiliser pour répondre aux requêtes DHCP, avec l'option INTERFACES.

```bash
nano /etc/default/isc-dhcp-server
```
définir : INTERFACES="eth1" (on parametre la deuximeme carte réseau)

### 3. Configuration du serveur

Ajouter toutes les informations de votre réseau à envoyer au client 
ouvrez et modifiez le fichier de configuration principal, définissez les options de votre serveur DHCP :

```bash
sudo nano /etc/dhcp/dhcpd.conf
```

A la fin du fichier coller les éléments ci dessous

# Notre configuration pour le réseau 172.20.0.0
subnet 172.20.0.0 netmask 255.255.255.0 {
range 172.20.0.100 172.20.0.200;
option domain-name-servers 8.8.8.8;
option domain-name "reseau.lan";
option routers 172.20.0.254;
option broadcast-address 172.20.0.255;
default-lease-time 600;
max-lease-time 7200;
}

image config dhcp 

Redémarrer le service DHCP

```bash
service isc-dhcp-server restart
```

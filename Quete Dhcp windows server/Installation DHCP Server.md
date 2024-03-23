# Installation DHCP Server

1. Attribuer adresse ip fixe au server Windows
IP : 172.20.0.0
masque : 255.255.255.0

2. Installer le serveeur DHCP
Dans le Server Manager suivre les étapes ci dessous :

- Manage
- -> Next
- Add Roles and Features
- Role-based or feature-based installation -> Next
- Le serveur local est déja selectionné -> Next
- Dans la liste des rôles, cochez "Serveur DHCP" et au sein de la fenêtre qui s'affiche vérifiez que l'option "Include management Tools" soit cochée. Elle permet d'ajouter la console de gestion DHCP sur le serveur. Cliquez sur "Add Features" -> Next
- Laisser cocher les fonctionnalité -> Next
- L'assistant nous rappelle qu'il faut avoir une adresse IP statique sur le serveur DHCP avant de procéder à l'installation de ce rôle. C'est bien le cas, cliquez sur -> Next
- Sernière étape de l'assistant, cliquez sur "Install". Il ne sera pas nécessaire de redémarrer le serveur à la fin de l'installation.

3. Autoriser le serveur DHCP dans l'active Directory

>Cette étape consiste à effectuer deux actions auprès de l'Active Directory_ :
Créer deux groupes de sécurité dans l'AD pour permettre la délégation quant à la gestion du serveur DHCP
Déclarer notre serveur DHCP au sein de l'AD

- cliquer sur le logo "avertissement" puis sur **Complete DHCP configuration**
- cliquer sur commit et close

4. Configurer le serveur DHCP : Déclarer une palage d'adresse IP

Dans le serveur manager, cliquer sur DHCP puis clic droit sur le serveur sélectionné, choisir "DHCP manager" pour ouvrir la console

- Clic sur SRVWIN01
- clic droit sur IPV4 puis clic sur New Scope
- -> Next
- Taper le nom : "SRV-DHCP"
- Start IP address : 172.20.0.100
- End IP address : 172.20.0.200
- Subnet mask : 255.255.255.0
- Ne rien remplir dans la partie Add Exclusions (pas besoin) -> Next
- Laisse la durrée du bail à 8 jours par défaut -> Next
- choisir "Yes, I want to configure these options now" -> Next

- Paramétrage Gateway : taper 172.20.0.254
- Nom de domaine : laisser vide -> Next
- Wins Servers : laisser vide -> Next
- cliquer sur "Yes, I want to activate scope now" et Finish

L'étendue SRV-DHCP apparait bien 
image

5. Créer une réservation IP pour un poste Client Windows 10

Tout d'abord récupérer l'adresse mac du poste client Windows 10
sur virtual box



Dans l'écran ci dessous clic droit sur Rzservations et clic sur New Reservation

Name : PC Client1
ip adress : 172.20.0.10
mac adresse : celle récupérer sur virtual box (du poste client)
Supported types : both

6. Tester le serveur DHCP

Ouvrir la VM PC client1


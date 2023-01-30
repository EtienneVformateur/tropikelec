# tropikelec
Le but de ce projet est d'accompagner les étudiants vers la réalisation des maquettes proposées par Tropikelec.
Cette application permet de se connecter à une batterie SolarScreen de l'entreprise Tropikelec.
Nous ne sommes pas parvenus à recevoir les notifications concernant les informations de la batterie (statut, température, ...)
D'après ce que nous avons pu comprendre, cette batterie utilise un BMS. Nous nous sommes penchés sur la documentation des protocoles RS485/UART/RS232 !
Après avoir activé les notifications, il faut écrire une commande spéciale à la batterie pour qu'elle nous envoie les notifications. C'est cette commande que nous avons pas réussie à trouver.
Pour tenter de recevoir des notifications, nous avons parcourus pas mal de forum/documentation/vidéo. L'application nRF Connect sur smartphone nous a permis de nous connecter à la batterie et d'effectuer des tests rapidement. Sur flutter, nous avons utilisé flutter_blue.

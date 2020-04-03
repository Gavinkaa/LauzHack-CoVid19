# **LauzHack-CoVid19**

**Team :** Mohamed Elasfoury, Douglas Bouchet, Ludovic Burnier, Luke Patel, Lancelot Scheid, Clément Sicard

## **_Concept :_** 

Depuis un mobile, ou depuis un navigateur (Ludo a une licence développeur), proposer une plateforme solidaire pour aider les personnes âgées ou maladie chronique à s'approvisionner en courses ou médicaments 

## **Objectifs** : dans l'ordre d'importance

Créer l'application la plus basique possible d'abord, s'assurer qu'elle fonctionne

**Interfaces :** une pour un utilisateur qui veut qu'on lui cherche ses courses, une autre pour une personne qui veut aider/se faire de la thune

**API** pour inscrire les gens (des deux côtés) :

* `POST` pour inscrire un utilisateur "demandeur"
* `POST` pour inscrire un utilisateur "aideur"
* `POST` pour émettre une commande
* `GET` pour récupérer la liste d'utilisateurs demandeurs
* `GET` pour récupérer la liste d'utilisateurs aideurs
* `GET` pour récupérer la liste des commandes

**Database** avec les users (**Firebase** ?) et les "commandes" en cours

### **Première répartition des tâches :**

* Ludo & Clément : Interface mobile cross-platform (Flutter).

_Possibilité sur web aussi ?_

*  : Interface Web -> Front-end (utiliser Flutter ?)
* Asfoury &  : Début de l'API -> Back-end en **express.js** ? 

## Améliorations envisageables (ou non)

* **Rémunération** ? _Pour les ******* qui veulent se faire de la thune sur le dos des vieux_ -> Moyen de paiement ?

Possibilité de **liste** en photo, ou **base de données simple** avec les aliments de base (ou on peut cocher les aliments voulus) 
--> générer une liste transmise (JSON ?)

* **Hébergement :** Oracle donne des ressources cloud gratuites, Google Cloud aussi

API Migros ?

## Outils :

* Firebase (database)
* Typora (ouvrir le `.md` )
* Flutter (UIs)
* VS Code Live Share
* Google Cloud
* Oracle Cloud : https://drive.google.com/file/d/1UPvejQSHoIrKHw3Fw-qKFMYxPPxhc4K9/
* httpie.org (outil pour faire des APIs), ou postman.com

* Lien de notre Drive (ou on mettra graphiques, idées, ... le zbeul quoi) : https://drive.google.com/drive/u/1/folders/1DzSI9QdS-BeEFgqGevs7EABQHhK4jORz

* Lien du Zoom (persistent inch'Allah) : https://us04web.zoom.us/j/745713320?pwd=N082ZVRRcXYrMzljR2ZFOWEycmRtUT09


# GlobalGroupTravel - CRM Salesforce

CRM Salesforce pour GlobalGroupTravel, entreprise spécialisée dans la gestion 
de voyages de groupe à l'international.

## Description

Ce projet implémente le back-end complet d'une solution CRM sur Salesforce 
permettant aux commerciaux de suivre les ventes, les clients et les contrats.

## Objets Salesforce

- **Account** : informations clients et de contact
- **Opportunity** : suivi des ventes et transactions
- **Contract** : gestion des contrats et dates d'expiration
- **User** : gestion des commerciaux et accès
- **Task** : historique des interactions clients
- **Trip__c** : objet custom pour les voyages de groupe

## Fonctionnalités développées

- Création automatique d'un Trip__c lors d'une opportunité gagnée (GGT-02)
- Validation des dates de début/fin sur Trip__c (GGT-03)
- Annulation automatique des voyages avec moins de 10 participants (GGT-04)
- Mise à jour automatique des statuts des voyages (GGT-05)

## Stack technique

- Salesforce DX (SFDX)
- Apex (Triggers, Classes, Batchs, Schedulers)
- VS Code + Salesforce Extension Pack

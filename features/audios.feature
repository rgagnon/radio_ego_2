#language: fr

Fonctionnalité: La page index

  La page index affiche des audios pouvant intéresser l'utilisateur

Contexte:
  Étant donné les audios suivants:
    | title  | listen_count |
    | title1 | 0            |
    | title2 | 1            |
    | title3 | 2            |
    | title4 | 3            |
    | title5 | 3            |
    | title6 | 4            |

Scénario: Affiche la section des audios les plus écoutés
  Étant donné que je navigue sur "home page"
  Alors la liste "des plus entendus" devrait afficher:
    | title6 |
    | title4 |
    | title5 |
    | title3 |
    | title2 |
    | title1 |




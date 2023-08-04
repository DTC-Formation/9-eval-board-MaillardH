class Tache {
  String titre;
  String description;

  Tache({required this.titre, required this.description});
}

class GererTache {
  List<Tache> taches = [];

  void ajouterTache(Tache tache) {
    taches.add(tache);
  }

  void supprimerTache(int index) {
    print("Suppression de la tâche à l'indice $index");
    if (index >= 0 && index < taches.length) {
      taches.removeAt(index);
    }
  }
}

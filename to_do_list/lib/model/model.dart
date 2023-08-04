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
    if (index >= 0 && index < taches.length) {
      taches.removeAt(index);
    }
  }
}

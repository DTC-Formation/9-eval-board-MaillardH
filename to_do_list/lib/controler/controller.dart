import 'package:to_do_list/model/modele.dart';

class GererTacheController {
  final GererTache gererTache = GererTache();

  void ajouterTache(Tache tache) {
    gererTache.ajouterTache(tache);
  }

  void supprimerTache(int index) {
    gererTache.supprimerTache(index);
  }

  List<Tache> get tachesController => gererTache.taches;
}

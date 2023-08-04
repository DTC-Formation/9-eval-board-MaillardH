import 'package:to_do_list/model/model.dart';

class TacheController {
  final GererTache _gererTache = GererTache();

  void ajouterTache(Tache tache) {
    _gererTache.ajouterTache(tache);
  }

  void supprimerTache(int index) {
    _gererTache.supprimerTache(index);
  }

  List<Tache> get taches => _gererTache.taches;
}

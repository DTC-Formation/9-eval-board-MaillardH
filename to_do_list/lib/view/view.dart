import 'package:flutter/material.dart';
import 'package:to_do_list/controler/controler.dart';
import 'package:to_do_list/model/model.dart';

class TacheVue extends StatefulWidget {
  @override
  _TacheVueState createState() => _TacheVueState();
}

class _TacheVueState extends State<TacheVue> {
  final TacheController _tacheController = TacheController();
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 8,
        title: Text('Gérer les tâches'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titreController,
              decoration: InputDecoration(labelText: 'Titre de la tâche'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description de la tâche'),
            ),
            ElevatedButton(
              onPressed: () {
                String titre = _titreController.text;
                String description = _descriptionController.text;

                Tache nouvelleTache = Tache(
                  titre: titre,
                  description: description,
                );

                _tacheController.ajouterTache(nouvelleTache);

                _titreController.clear();
                _descriptionController.clear();

                setState(() {});
              },
              child: Text('Ajouter la tâche'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tacheController.taches.length,
                itemBuilder: (context, index) {
                  Tache tache = _tacheController.taches[index];
                  return ListTile(
                    title: Text(tache.titre),
                    subtitle: Text(tache.description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _tacheController.supprimerTache(index);
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

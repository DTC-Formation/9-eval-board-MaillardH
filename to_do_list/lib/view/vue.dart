import 'package:flutter/material.dart';
import 'package:to_do_list/controler/controller.dart';
import 'package:to_do_list/model/modele.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

final GererTacheController gererTacheController = GererTacheController();
final TextEditingController _titreController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoList'),
        backgroundColor: Color.fromARGB(255, 29, 3, 1),
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF00A8E8),
                Color.fromARGB(255, 101, 116, 250)
              ], // Couleurs du dégradé
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AjoutTache(),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: Text(
              'Demmarer'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pagesuivant() {}
}

class AjoutTache extends StatefulWidget {
  const AjoutTache({super.key});

  @override
  State<AjoutTache> createState() => _AjoutTacheState();
}

class _AjoutTacheState extends State<AjoutTache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoList'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _titreController,
                decoration: InputDecoration(labelText: 'Titre de la tâche'),
              ),
              TextField(
                controller: _descriptionController,
                decoration:
                    InputDecoration(labelText: 'Description de la tâche'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF00A8E8),
                      Color.fromARGB(255, 101, 116, 250)
                    ], // Couleurs du dégradé
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: MaterialButton(
                  onPressed: () {
                    afficherBoiteDialogue(context);
                    String titres = _titreController.text;
                    String descriptions = _descriptionController.text;
                    Tache nouvelleTache = Tache(
                      titre: titres,
                      description: descriptions,
                    );

                    gererTacheController.ajouterTache(nouvelleTache);
                    _titreController.clear();
                    _descriptionController.clear();
                    setState(() {});
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  child: Text(
                    'Ajouter la tâche'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void afficherBoiteDialogue(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text('Tâche ajoutée avec succès !'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListTacheVue()),
              );
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

class ListTacheVue extends StatefulWidget {
  const ListTacheVue({super.key});

  @override
  State<ListTacheVue> createState() => _ListTacheVueState();
}

class _ListTacheVueState extends State<ListTacheVue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 208, 150),
        title: Text('titre'),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: gererTacheController.tachesController.length,
        itemBuilder: (context, index) {
          Tache tache = gererTacheController.tachesController[index];

          return ListTile(
            title: Text(tache.titre),
            subtitle: Text(tache.description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                gererTacheController.supprimerTache(index);
                setState(
                  () {},
                );
              },
            ),
          );
        },
      ),
    );
  }
}

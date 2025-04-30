import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "",),
    );
  }
}

class AppHomePage extends StatelessWidget {
  final String title;

  const AppHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: DemoForm());
  }
}

class DemoForm extends StatefulWidget {
  const DemoForm({super.key});

  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {

  bool isOK = false;
  String radioValue = "";
  // String? name;
  // String? age;
  // String? sport;
  String? name, age, sport;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  void updateRadioValue(String value) {
    setState(() {
      radioValue = value;
    });
  }

  String? validateName(value) {
    if (value == null || value.isEmpty) {
      return "Veuillez saisir votre nom";
    }
    if (value.length < 2) {
      return "Votre nom doit contenir au moins 2 caractères";
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return "Veuillez saisir votre age";
    }
    if (int.parse(value) < 0) {
      return "Vous âge ne peut être négatif";
    }
    return null;
  }

  String? validateSport(String? value) {
    if (value == null || value.isEmpty) {
      return "Veuillez choisir un sport";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: validateName,
              onSaved: (value) {
                name = value!;
              },
              decoration: InputDecoration(
                labelText: "Name", hintText: "Veuillez saisir votre nom"
              ),
            ),
            TextFormField(
              controller: ageController,
              validator: validateAge,
              onSaved: (value) {
                age = value!;
              },
              decoration: InputDecoration(
                labelText: "Age", hintText: "Veuillez saisir votre age"
              ),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField<String?>(
              validator: validateSport,
              onSaved: (value) {
                sport = value!;
              },
              items: [
                DropdownMenuItem(value: null,child: Text("- Choisir un sport -"),),
                DropdownMenuItem(value: "Curling", child: Text("Curling")),
                DropdownMenuItem(value: "Air poney", child: Text("Air poney")),
                DropdownMenuItem(value: "Quidditch", child: Text("Quidditch")),
                DropdownMenuItem(value: "Disco foot", child: Text("Disco foot")),
              ],
              onChanged: (value) {}
            ),
            Row(
              children: [
                Checkbox(value: isOK, onChanged: (checked) {
                  setState(() {
                    isOK = checked!;
                  });
                }),
                Text("La <form> ?")
              ],
            ),
            Row(
              children: [
                Text("Oui"),
                Radio<String>(value: "true", groupValue: radioValue, onChanged: (value) => updateRadioValue(value!)),
                Text("NON"),
                Radio<String>(value: "false", groupValue: radioValue, onChanged: (value) => updateRadioValue(value!)),
              ],
            ),
            ElevatedButton(onPressed: () {
              // trigger validation of form fields and save data
              if (_keyForm.currentState!.validate()) {
                _keyForm.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Nom : $name, Age : $age, Sport : $sport")));

                // create JSON/txt/XML... and send
              }
            }, child: Text("Valider"))
          ],
        ),
      ),
    );
  }
}
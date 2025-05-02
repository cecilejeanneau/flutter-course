import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String login = '';
  String password = '';
  bool rememberMe = false;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Veuillez saisir votre adresse e-mail";
    }
    // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    //   return "Veuillez saisir une adresse e-mail valide";
    // }
    if(EmailValidator.validate(value)) {
      return "Format d'adresse e-mail invalide";
    }
    return null;
  }

  String? validatePassword(value) {
    if (value == null || value.trim().isEmpty) {
      return "Veuillez saisir votre mot de passe";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(45),
                offset: Offset(0.0, 3.0), //(x,y)
                blurRadius: 6.0,
                spreadRadius: 2,
              )
            ]
          ),
          child: Form(
              key: _keyForm,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(style: TextStyle(color: Colors.grey), "Connexion"),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      onSaved: (value) {
                          login = value!;
                      },
                      decoration: InputDecoration(
                          labelText: "Identifiant",
                          hintText: "Entrez votre identifiant"),
                    ),
                    TextFormField(
                        validator: validatePassword,
                        onSaved: (value) {
                            password = value!;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Mot de passe",
                            hintText: "Entrez votre mort de passe")),
                    // Row(
                    //   children: [
                    //     Switch(
                    //         value: rememberMe,
                    //         onChanged: (value) => setState(() => rememberMe = value)),
                    //     Text('Mémoriser mes informations'),
                    //   ],
                    // ),
                    SwitchListTile(
                        value: rememberMe,
                        onChanged: (value) => setState(() => rememberMe = value),
                        title: Text('Mémoriser mes informations')
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.teal.shade200)),
                          onPressed: () {
                            if (_keyForm.currentState!.validate()) {
                              _keyForm.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Vous êtes connecté en tant que : $login'),
                                  )
                              );
                              Navigator.pushNamed(context, '/tweet-list-page', arguments: login);
                            }
                          },
                          child: Text('Login', style: TextStyle(color: Colors.white))
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}


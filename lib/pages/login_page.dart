import 'package:flutter/material.dart';
import 'package:traductor_biblico/pages/register_page.dart';
import '../models/user.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variables de correo y contraseña
  final _email = TextEditingController();
  final _password = TextEditingController();

  User userLoad = User.Empty();


  //Función para mostrar un mensaje de alerta si las dos contraseñas no coinciden
  void _showMsg(String msg) {
    final Scaffold = ScaffoldMessenger.of(context);
    Scaffold.showSnackBar(SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Aceptar',
        onPressed: Scaffold.hideCurrentSnackBar,
      ),
    ));
  }

  void _validateUser() {
    if (_email.text == userLoad.email && _password.text == userLoad.password) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      _showMsg("Correo o contraseña incorrecta");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8, vertical: 16), //margenes
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // formulario de conexión
                  const Image(
                    //logo de la app
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 16),
                  // campo de correo electrónico
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo Electrónico',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  // campo de contraseña
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 16),
                  // Boton para iniciar sesión
                  ElevatedButton(
                      onPressed: () {
                        _validateUser(); //función para validar el usuario
                      },
                      child: const Text('Iniciar sesión')),
                  // Boton para ir al formulario de registro
                  TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue)),
                      onPressed: () {
                        //funcion que redirige a la pagina de registro
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      child: const Text('Registrarse'))
                ],
              ),
            ),
          )),
    );
  }
}

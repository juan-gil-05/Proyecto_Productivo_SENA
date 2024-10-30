import 'package:flutter/material.dart';
import 'package:traductor_biblico/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  // Función para cerrar el splash
  void initState() {
    _closeSplash();
    super.initState();
  }
  // Función que cierra el splash despues de 2 segundo y redirige a la pantalla de conexión
  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Pagina que contiene unicamente el logo de la app
      body: Center(
        child: Image(image: AssetImage('assets/images/logo.png')),
      ),
    );
  }
}

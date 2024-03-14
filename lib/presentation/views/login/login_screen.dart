import 'package:countech_app/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                    'assets/logo_countech1.png', // Ruta de tu imagen
                    height: 150.0, // Ajusta la altura según sea necesario
                    width: 150.0, // Ajusta el ancho según sea necesario
                    // Puedes ajustar más propiedades según tus necesidades
                  ),
                  const SizedBox(width: 10.0), // Espacio entre la imagen y el texto
                  
              const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.red), // Cambia el color del borde a rojo
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey[400], // Cambia el color del icono a gris más claro
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.red), // Cambia el color del borde a rojo
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey[400], // Cambia el color del icono a gris más claro
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    color: Colors.grey[400], // Cambia el color del icono a gris más claro

                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
                obscureText: _obscureText,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 52)), // Ajusta el tamaño del botón
                ),
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                    color: Colors.white, // Cambia el color del texto a blanco
                    fontSize: 18.0, // Tamaño del texto más grande
                    fontWeight: FontWeight.bold, // Texto en negrita
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

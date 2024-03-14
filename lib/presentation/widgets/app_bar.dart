import 'package:countech_app/presentation/views/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppMenuBar extends StatelessWidget implements PreferredSizeWidget {
  const AppMenuBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Countech",
        style: TextStyle(
          fontSize: 23,
          fontFamily: 'Caprismo',
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 68, 68, 68),
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(left: 16), // Ajusta el valor según sea necesario
        child: Image.asset(
          'assets/logo_countech.png',
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          color: Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            // Mostrar alerta al presionar el botón de cerrar sesión
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Cerrar Sesión'),
                  content: Text('¿Está seguro de que desea cerrar sesión?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Cerrar la alerta
                      },
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Aquí puedes añadir la lógica para cerrar la sesión
                        Navigator.of(context).pop(); // Cerrar la alerta
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())); // Navega a la pantalla de inicio de sesión
                      },
                      child: Text('Aceptar'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(0, kToolbarHeight);
}

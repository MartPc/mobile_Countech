import 'package:countech_app/presentation/views/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppMenuBar extends StatelessWidget implements PreferredSizeWidget{
  const AppMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Countech",style: TextStyle(
        fontSize: 23,
        fontFamily: 'Caprismo',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      ),
      centerTitle: true,
      backgroundColor:Color.fromARGB(255, 68, 68, 68),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          color: Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        ),
      ]
          );
  }
  
  @override
  // TODO: implement preferredSize
Size get preferredSize => Size(0, kToolbarHeight);

}
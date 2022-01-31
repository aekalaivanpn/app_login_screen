import 'package:app_login_screen/color.dart';
import 'package:app_login_screen/login_page.dart';
import 'package:app_login_screen/map/map_screen.dart';
import 'package:app_login_screen/provider/google_sign_in.dart';
import 'package:app_login_screen/wind/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({Key? key}) : super(key: key);

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  final logindata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Aekalaivan P N'),
              accountEmail: Text('aekalaivanpn@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://media.istockphoto.com/photos/portrait-of-mature-hispanic-man-picture-id805012064?b=1&k=20&m=805012064&s=170667a&w=0&h=7jWoHlRITekFJe0gSCx6CVbpqRWNhGH_KyNH782sqs4=',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                image:
                    DecorationImage(fit: BoxFit.cover, image: NetworkImage('')),
              ),
            ),
            // buildHeader(
            //   onClicked: () {},
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home_filled,
                    onClicked: () {
                      Get.offAll(() => const HomePage());
                    },
                  ),
                  const SizedBox(height: 15),
                  buildMenuItem(
                    text: 'Map',
                    icon: Icons.map,
                    onClicked: () {
                      Get.offAll(() => const MapScreen());
                    },
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.grey[800]),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout();
                      logindata.write('isLoggedIn', false);
                      Get.offAll(() => const LoginPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(text,
          style: const TextStyle(color: Colors.black, fontSize: 17.0)),
      hoverColor: Colors.grey,
      onTap: onClicked,
    );
  }

  Widget buildHeader({
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Row(
            children: const [
              CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://www.pinclipart.com/picdir/middle/95-958614_man-icon-person-logo-png-clipart.png')),
              SizedBox(width: 20),
              Text(
                'Name',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      );
}

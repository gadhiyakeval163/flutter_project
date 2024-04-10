import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('User'),
            accountEmail: Text('user123@gmail.com'),
            currentAccountPicture: CircleAvatar(
                // child: ClipOval(
                //   child: Image.asset('assets/images/user.png'),
                // ),
                ),
            decoration: BoxDecoration(
              color: Colors.grey,
              // image: DecorationImage(
              //   image: AssetImage('assets/images/user2.jpeg'),
              // ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login & Security '),
            onTap: () => print('login clicked'),
          ),
          ListTile(
            leading: const Icon(Icons.manage_accounts),
            title: const Text('Manage Apps'),
            onTap: () => print('manage apps clicked'),
          ),
          ListTile(
            leading: const Icon(Icons.library_add),
            title: const Text('Content Library'),
            onTap: () => print('content library clicked'),
          ),
          ListTile(
            leading: const Icon(Icons.device_unknown),
            title: const Text('Devices'),
            onTap: () => print('devices clicked'),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Manage Your Profile'),
            onTap: () => print('profile clicked'),
          ),
          ListTile(
            leading: const Icon(Icons.settings_accessibility),
            title: const Text('Default Purchase Setting'),
            onTap: () => print('setting clicked'),
          ),
          ListTile(
            leading: const Icon(Icons.card_membership),
            title: const Text('Memberships & Subscription'),
            onTap: () => print('memberships clicked'),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.perm_contact_calendar_outlined),
            title: const Text('Manage Your Seller Account'),
            onTap: () => print('seller account clicked'),
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Bussiness Account'),
            onTap: () => print('bussiness account clicked'),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Feedback'),
            onTap: () => print('Help clicked'),
          ),
        ],
      ),
    );
  }
}

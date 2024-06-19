import 'package:clone_e_commerce/screens/LoginScreen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String phoneNumber = '+84987754740';
  String address = '123 Main Street, Springfield';
  String dateOfBirth = 'December 10, 2002';

  void _editField(String title, String currentValue, Function(String) onSave) {
    TextEditingController controller =
        TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter new $title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.black,
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/logo/logoV.jpeg'), // Đường dẫn tới ảnh đại diện của bạn
            ),
            const SizedBox(height: 20),
            const Text(
              'Viet Ta',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'viettta1012@gmail.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone Number'),
              subtitle: Text(phoneNumber),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _editField('Phone Number', phoneNumber, (newValue) {
                    setState(() {
                      phoneNumber = newValue;
                    });
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Address'),
              subtitle: Text(address),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _editField('Address', address, (newValue) {
                    setState(() {
                      address = newValue;
                    });
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text('Date of Birth'),
              subtitle: Text(dateOfBirth),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _editField('Date of Birth', dateOfBirth, (newValue) {
                    setState(() {
                      dateOfBirth = newValue;
                    });
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle log out action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF67C4A7),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

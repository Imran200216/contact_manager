import 'package:contact_manager/models/user_contact_model.dart';
import 'package:contact_manager/screens/add_user_contact_screen.dart';
import 'package:contact_manager/widgets/cm_contact_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CM Users'),
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddUserContactScreen()),
            );
          },
          child: Icon(Icons.person_add),
        ),

        body: ValueListenableBuilder(
          valueListenable: Hive.box("CMContacts").listenable(),
          builder: (context, box, _) {
            if (box.isEmpty) {
              return const Center(child: Text("No contacts added yet."));
            }

            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final data = box.getAt(index);
                final contact = UserContactModel.fromMap(data);

                return CmContactCard(
                  userName: contact.userName,
                  userPhoneNumber: contact.userPhoneNumber,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

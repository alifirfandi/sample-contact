import 'dart:math';

import 'package:flutter/material.dart';

import '../model/user.dart';

class EditPage extends StatefulWidget {
  final User? user;
  final int index;

  const EditPage({Key? key, this.user, this.index = -1}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.user?.name ?? "");
    TextEditingController locationController =
        TextEditingController(text: widget.user?.location ?? "");
    TextEditingController emailController =
        TextEditingController(text: widget.user?.email ?? "");
    TextEditingController instagramController =
        TextEditingController(text: widget.user?.instagram ?? "");
    TextEditingController twitterController =
        TextEditingController(text: widget.user?.twitter ?? "");
    TextEditingController youtubeController =
        TextEditingController(text: widget.user?.youtube ?? "");

    return Scaffold(
      backgroundColor: const Color(0xFF1A2421),
      appBar: AppBar(
        title: Text(widget.index == -1 ? "Add Contact" : "Edit Contact"),
        backgroundColor: const Color(0xFF1A2421),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                label: Text('Name', style: colorWhiteLabel),
              ),
              controller: nameController,
              validator: (value) {
                if (isEmpty(value)) return 'Please enter some text';
                return null;
              },
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                label: Text('Location', style: colorWhiteLabel),
              ),
              controller: locationController,
              validator: (value) {
                if (isEmpty(value)) return 'Please enter some text';
                return null;
              },
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                label: Text('Email', style: colorWhiteLabel),
              ),
              controller: emailController,
              validator: (value) {
                if (isEmpty(value)) return 'Please enter some text';
                return null;
              },
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                label: Text('Instagram', style: colorWhiteLabel),
              ),
              controller: instagramController,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                label: Text('Twitter', style: colorWhiteLabel),
              ),
              controller: twitterController,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                label: Text('Youtube', style: colorWhiteLabel),
              ),
              controller: youtubeController,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Empty Data')),
                  );
                } else {
                  if (widget.index == -1) {
                    User.users.add(
                      User(
                        image: "assets/${Random().nextInt(5) + 20}.jpg",
                        name: nameController.text,
                        location: locationController.text,
                        email: emailController.text,
                        instagram: instagramController.text,
                        twitter: twitterController.text,
                        youtube: youtubeController.text,
                      ),
                    );
                  } else {
                    User.users[widget.index] = User(
                      image: User.users[widget.index].image,
                      name: nameController.text,
                      location: locationController.text,
                      email: emailController.text,
                      instagram: instagramController.text,
                      twitter: twitterController.text,
                      youtube: youtubeController.text,
                    );
                  }
                }
              },
              child: Text(widget.index == -1 ? 'Add' : 'Save'),
            )
          ],
        ),
      ),
    );
  }

  bool isEmpty(String? value) => value == null || value.isEmpty;

  TextStyle colorWhiteLabel = TextStyle(color: Colors.white.withOpacity(0.5));
}

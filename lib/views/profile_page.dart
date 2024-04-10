import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kilele_health/constants.dart';
import 'package:kilele_health/main.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController =
        useTextEditingController();
    final TextEditingController _emailController = useTextEditingController();
    final ImagePicker _imagePicker = ImagePicker();

    File image;
    User? user = FirebaseAuth.instance.currentUser;
    var username = useState(user?.displayName);
    var email = useState(user?.email);
    // username.value = user.displayName;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    void getImage() async {
      // Create an instance of ImagePicker
      final ImagePicker _imagePicker = ImagePicker();

      // Pick an image from the gallery
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

      // Check if an image is picked
      if (pickedFile != null) {
        // Create a File object from the picked image path
        File image = File(pickedFile.path);

        // Get the current user
        User? user = _auth.currentUser;

        // Check if user is not null
        if (user != null) {
          // Upload the image to Firebase Storage
          Reference storageRef = FirebaseStorage.instance
              .ref()
              .child('user_profile_images')
              .child('${user.uid}.jpg');

          UploadTask uploadTask = storageRef.putFile(image);
          await uploadTask;

          // Get the download URL of the uploaded image
          String photoURL = await storageRef.getDownloadURL();

          // Update the user's photo URL
          await user.updatePhotoURL(photoURL);
        }
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: const Alignment(1, 1.2),
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                Card(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: KileleGrey,
                    shape: CircleBorder(side: BorderSide(color: KileleBrown)),
                    child: IconButton(
                      onPressed: () {
                        getImage();
                      },
                      icon: Icon(Icons.edit),
                    )),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          labelText: '${username.value}',
                          border: InputBorder.none),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: '${email.value}',
                          border: InputBorder.none),
                    ),
                  )),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Change Password Logic
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Change Password'),
                      content: Text('This is where you change your password.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Change Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save Changes Logic
                final username = _usernameController.text;
                final email = _emailController.text;

                // Do something with the updated data, like save it to a database
                print('Username: $username');
                print('Email: $email');
                print(FirebaseAuth.instance.currentUser);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

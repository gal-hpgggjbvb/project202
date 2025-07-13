import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/custom_widgets/custom_listtile.dart';

import '../../cache/cache_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;

  Future<void> pickImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    // if(image == null) return ;

    // final imageTemporary = File(image!.path) ;
    setState(() {
      image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              InkWell(
                onTap: () => pickImageFromGallery(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: image == null
                        ? Image.asset("images/4 - Copy.jpg", fit: BoxFit.cover)
                        : Image.file(image!),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Profile Info Tiles
              CustomListTile(
                iconData: Icons.person,
                title: 'Name',
                subtitle: '${CacheHelper().getData(key: 'name') ?? 'name here'}',
              ),
              CustomListTile(
                iconData: Icons.badge,
                title: 'ID',
                subtitle:
                '${CacheHelper().getData(key: 'id')?.substring(0, 7) ?? 'id'}...',
                showCopyIcon: true,
              ),
              CustomListTile(
                iconData: Icons.phone_android,
                title: 'Phone',
                subtitle: '${CacheHelper().getData(key: 'phone') ?? 'Not set'}',
              ),
              CustomListTile(
                iconData: Icons.email,
                title: 'Email',
                subtitle: '${CacheHelper().getData(key: 'email') ?? 'email here'}',
              ),

              const SizedBox(height: 100),

              // Edit Button
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text(
                    "Edit Profile",
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.orange,
                    elevation: 4,
                    shadowColor: Colors.orangeAccent,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  onPressed: () => print('go'),
                ),
              ),

              const SizedBox(height: 110), // Push version to bottom visually

              // App Version Text
              const Text(
                'v1.0.0',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );

  }
}

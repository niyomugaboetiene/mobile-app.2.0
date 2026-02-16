import 'package:flutter/material.dart';

class ProfileEditor extends StatefulWidget {
  const ProfileEditor({super.key});

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  String name = "";
  String title = "";
  String location = "";
  bool isAvailable = false;

  void resetFields() {
    setState(() {
      name = "";
      title = "";
      location = "";
      isAvailable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Card Editor"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // Profile Picture
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),

            const SizedBox(height: 20),

            // Name Field
            TextField(
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),

            const SizedBox(height: 10),

            // Title Field
            TextField(
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),

            const SizedBox(height: 10),

            // Location Field
            TextField(
              decoration: const InputDecoration(
                labelText: "Location",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  location = value;
                });
              },
            ),

            const SizedBox(height: 10),

            // Switch
            SwitchListTile(
              title: const Text("Available for hire"),
              value: isAvailable,
              onChanged: (value) {
                setState(() {
                  isAvailable = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Preview Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(name.isEmpty ? "Your Name" : name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(title.isEmpty ? "Your Title" : title),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 5),
                        Text(location.isEmpty ? "Your Location" : location),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isAvailable ? Icons.check_circle : Icons.cancel,
                          color: isAvailable ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 5),
                        Text(isAvailable ? "Available for hire" : "Not available"),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Reset Button
            ElevatedButton(
              onPressed: resetFields,
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}

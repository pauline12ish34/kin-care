import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../providers/app_provider.dart';
import '../../theme/app_theme.dart';

class ProfileSetupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emergencyContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Setup')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Set up your profile', style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 24),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person, color: AppTheme.primaryBlue),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      prefixIcon: Icon(Icons.location_on, color: AppTheme.accentGreen),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: emergencyContactController,
                    decoration: InputDecoration(
                      labelText: 'Emergency Contact',
                      prefixIcon: Icon(Icons.phone, color: AppTheme.emergencyRed),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: Icon(Icons.check_circle, color: Colors.white),
                    label: Text('Save & Continue'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 48),
                    ),
                    onPressed: () {
                      final user = UserModel(
                        name: nameController.text,
                        phone: '', // phone can be set from login if needed
                        location: locationController.text,
                        emergencyContact: emergencyContactController.text,
                      );
                      Provider.of<AppProvider>(context, listen: false).setUser(user);
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

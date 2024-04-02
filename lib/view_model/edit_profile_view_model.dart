import 'package:flutter/material.dart';

class EditProfileViewModel extends ChangeNotifier {
  String _selectedGender = 'male';

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _dobController;
  late TextEditingController _locationController;
  late TextEditingController _zipCodeController;

  TextEditingController get nameController => _nameController;
  String get selectedGender => _selectedGender;

  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;
  TextEditingController get dobController => _dobController;
  TextEditingController get locationController => _locationController;
  TextEditingController get zipCodeController => _zipCodeController;

  EditProfileViewModel() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _dobController = TextEditingController();
    _locationController = TextEditingController();
    _zipCodeController = TextEditingController();
  }

  void setSelectedGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _locationController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }
}

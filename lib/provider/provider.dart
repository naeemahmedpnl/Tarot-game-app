import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tarrot/view_model/commom_view_model/selected_tab_view_model.dart';
import 'package:tarrot/view_model/edit_profile_view_model.dart';

import '../view_model/commom_view_model/password_visibility_view_mode.dart';
import '../view_model/user_existing_view_model.dart';
import '/view_model/auth_view_model.dart';

List<SingleChildWidget> providersConst = [
  // AUTH VIEW MODEL
  ChangeNotifierProvider(
    create: (context) => AuthViewModel(),
  ),

  // USER EXISTING PROVIDER
  ChangeNotifierProvider(
    create: (context) => UserExistenceProvider(),
  ),

  // PASSWORD VISIBILITY VIEW MODEL
  ChangeNotifierProvider(
    create: (context) => PasswordVisibilityViewModel(),
  ),

  // Bottom Tab Bar  VIEW MODEL
  ChangeNotifierProvider(
    create: (context) => SelectedTabViewModel(),
  ),

  // Gender View VIEW MODEL
  ChangeNotifierProvider(
    create: (context) => EditProfileViewModel(),
  ),
];

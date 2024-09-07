import 'package:flcore/core/operations/mixins/auth.dart';

abstract class IAuthProvider with SignIn, SignOut, SignUp {}

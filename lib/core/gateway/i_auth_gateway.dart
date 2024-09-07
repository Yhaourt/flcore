import 'package:flcore/core/operations/mixins/auth.dart';

abstract class IAuthGateway with SignIn, SignOut, SignUp {}

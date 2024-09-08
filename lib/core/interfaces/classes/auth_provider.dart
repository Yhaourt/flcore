import 'package:flcore/core/interfaces/operations/auth.dart';

abstract class IAuthProvider
    implements ISignUp, ISignIn, ISignOut, IRefreshToken {}

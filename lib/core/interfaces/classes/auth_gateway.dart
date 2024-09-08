import 'package:flcore/core/interfaces/operations/auth.dart';

abstract class IAuthGateway
    implements ISignUp, ISignIn, ISignOut, IRefreshToken {}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services/UserService.dart';
import 'package:services/getaway/FirebaseAuthGtaway.dart';

class ServicesProvider extends StatelessWidget {
  final Widget child;

  const ServicesProvider({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserService>(
          create: (context) => UserService(
            firebaseAuthGetaway: FirebaseAuthGetaway(),
          ),
        )
      ],
      child: child,
    );
  }
}

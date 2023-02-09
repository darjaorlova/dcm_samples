import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class A {}

class B {}

class C {}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static Widget withProviders() {
    return MultiProvider(
      providers: [
        Provider<A>(create: (_) => A()),
        Provider<B>(create: (_) => B()),
        Provider<C>(create: (_) => C()),
      ],
      child: const MyApp(),
    );
  }
}

class _MyAppState extends State<MyApp> {
  late final A a;
  late final B b;
  late final C c;

  @override
  void initState() {
    super.initState();
    // ignore: prefer-moving-to-variable
    a = context.read();
    // ignore: prefer-moving-to-variable
    b = context.read();
    // ignore: prefer-moving-to-variable
    c = context.read();

    /// Proposal - can add ignore parameters to avoid using "// ignore" comment for every line
    /// - prefer-moving-to-variable
    ///     ignored-parameters:
    ///       - context.read()
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class ManyArgs {
  final String a;
  final String b;
  final String c;

  const ManyArgs({
    required this.a,
    required this.b,
    required this.c,
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ManyArgs manyArgs;

  @override
  void initState() {
    super.initState();
    /// `sss` is an academic example, in real life could be `context.read` in a Provider
    const sss = 'sss';
    manyArgs = const ManyArgs(
      a: sss,
      b: sss,
      // ignore: no-equal-arguments
      c: sss,
    );

    /// Instead of
    /// - no-equal-arguments:
    ///     ignored-parameters:
    ///       - a
    ///       - b
    ///       - c
    ///
    /// Can we make also possible to ignore actual arguments
    /// - no-equal-arguments:
    ///     ignored-parameters:
    ///       - a
    ///       ...
    ///     ignored-arguments:
    ///       - sss
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

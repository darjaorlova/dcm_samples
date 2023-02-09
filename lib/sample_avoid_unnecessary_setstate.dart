import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // X - bad, `build` always gets called after `didUpdateWidget`, so `setState` is redundant & will cause an extra rebuild
    // DCM rule `avoid-unnecessary-setstate` works as expected
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// From the docs of the `build` method about how often the framework calls it:
    /// "After a dependency of this State object changes (e.g., an InheritedWidget referenced by the previous build changes)." [https://api.flutter.dev/flutter/widgets/State/build.html]
    /// From the docs of the `didChangeDependencies` [https://api.flutter.dev/flutter/widgets/State/didChangeDependencies.html]
    /// "Called when a dependency of this State object changes."
    /// "For example, if the previous call to build referenced an InheritedWidget that later changed, the framework would call this method to notify this object about the change."
    /// "Subclasses rarely override this method because the framework always calls build after a dependency changes."
    // X - bad, `build` always gets called after `didChangeDependencies`, so `setState` is redundant & will cause an extra rebuild
    // DCM rule `avoid-unnecessary-setstate` should highlight `setState` (same as in `didUpdateWidget`)
    setState(() {});
  }
}

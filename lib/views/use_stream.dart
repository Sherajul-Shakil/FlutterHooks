import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStreamPage extends HookWidget {
  const UseStreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());
    return Scaffold(
      appBar: AppBar(
        title: const Text("useStream Hooks example"),
      ),
      body: Center(
        child: Text(dateTime.data ?? "Home Page"),
      ),
    );
  }
}

Stream<String> getTime() => Stream.periodic(
    const Duration(seconds: 1), (_) => DateTime.now().toIso8601String());

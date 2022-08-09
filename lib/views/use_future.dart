import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

const url =
    'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';

class UseFuturePage extends HookWidget {
  const UseFuturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(() => NetworkAssetBundle(Uri.parse(url))
        .load(url)
        .then((data) => data.buffer.asUint8List())
        .then((data) => Image.memory(data)));

    final snapshot = useFuture(future);

    return Scaffold(
        appBar: AppBar(
          title: const Text("useFuture Hooks example"),
        ),
        body: Column(
          children: [snapshot.data].compactMap().toList(),
        ));
  }
}

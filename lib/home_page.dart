import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_tut/use_stream.dart';

import 'text_editing_controllar.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //UseStream Hooks
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UseStreamPage(),
                  ),
                );
              },
              child: const Text("useStream"),
            ),
            //useTextEditiong Controllar, useEffect, useState
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextEditingControllarPage(),
                  ),
                );
              },
              child: const Text("useTextEditiongControllar"),
            ),
          ],
        ),
      ),
    );
  }
}

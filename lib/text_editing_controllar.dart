import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextEditingControllarPage extends HookWidget {
  const TextEditingControllarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllar = useTextEditingController();
    final text = useState("");
    useEffect(() {
      controllar.addListener(() {
        text.value = controllar.text;
      });
      return null;
    }, [controllar]);
    //here controllar is the key.
    //no change on controllar, don't rebuild useEffect
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Editing Controllar"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controllar,
          ),
          SizedBox(
            height: 10,
          ),
          Text("You typed, ${text.value}"),
        ],
      ),
    );
  }
}

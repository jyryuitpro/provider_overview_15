import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  late int _value;

  void update(int newValue) {
    _value = newValue;
  }

  String get title => 'You clicked $_value times';
}

class ProxyProviderCreateUpdate extends StatefulWidget {
  const ProxyProviderCreateUpdate({Key? key}) : super(key: key);

  @override
  _ProxyProviderCreateUpdateState createState() => _ProxyProviderCreateUpdateState();
}

class _ProxyProviderCreateUpdateState extends State<ProxyProviderCreateUpdate> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print('counter: $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProxyProvider update'),
      ),
      body: Center(
        child: ProxyProvider0<Translations>(
          create: (_) => Translations(),
          update: (_, Translations? translations) {
            translations!..update(counter);
            return translations;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(),
              SizedBox(
                height: 20.0,
              ),
              IncreaseButton(increment: increment),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.watch<Translations>().title;
    return Text(
      title,
      style: TextStyle(fontSize: 28.0),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  final VoidCallback increment;

  const IncreaseButton({Key? key, required this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increment,
      child: Text(
        'INCREASE',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}

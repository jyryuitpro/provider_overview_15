import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  final int _value;

  Translations(this._value);

  String get title => 'You clicked $_value times';
}

class WhyProxyProvider extends StatefulWidget {
  const WhyProxyProvider({Key? key}) : super(key: key);

  @override
  _WhyProxyProviderState createState() => _WhyProxyProviderState();
}

class _WhyProxyProviderState extends State<WhyProxyProvider> {
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
        title: Text('Why ProxyProvider'),
      ),
      body: Center(
        child: Provider<Translations>(
          create: (_) => Translations(counter),
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
    final title = Provider.of<Translations>(context).title;
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

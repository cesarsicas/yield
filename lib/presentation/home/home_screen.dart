import 'package:flutter/material.dart';
import 'package:flutter_yield/presentation/home/home_presenter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //todo inject and make async
  final presenter = HomePresenter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext buildContext) {
    final items = presenter.getInvestmentTypes();
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose an option"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index].title}'),
            onTap: () {
              router(context, items[index].route);
            },
          );
        },
      ),
    );
  }

  void router(BuildContext context, String route) {
    if (route != null && route != "") {
      Navigator.of(context).pushNamed(route);
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('To do this someday!'),
      ));
    }
  }

}

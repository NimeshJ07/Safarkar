import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title:
            Text("SafarKar", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Text("SafarKar", style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}

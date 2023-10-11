import 'package:flutter/material.dart';
import 'package:safar_kar/src/features/authentication/models/model_onboard.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({
    Key? key, // Add Key? key here
    required this.model,
  }) : super(key: key);

  final ModelOnBoard model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(30.0),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.45,
          ),
          Column(
            children: [
              Text(model.title,
                  style: Theme.of(context).textTheme.headlineSmall),
              Text(model.subTitle, textAlign: TextAlign.center),
            ],
          ),
          Text(model.cnt, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}

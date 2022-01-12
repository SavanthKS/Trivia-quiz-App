import 'package:flutter/material.dart';
import 'package:trivia_app/screen/screen_three.dart';
import '../provider/api_provider.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "TRIVIA APP",
                style: TextStyle(fontSize: 30),
              ),
            ),
            body: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${context.read<ApiProvider>().questionIndex + 1}",
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    Text(context.read<ApiProvider>().currentQuestion.question),
                    const Text("Chose",
                        style: TextStyle(color: Colors.blue, fontSize: 18)),
                    for (int i = 0;
                        i <
                            context
                                .watch<ApiProvider>()
                                .currentQuestion
                                .incorrectAnswers
                                .length;
                        i++)
                      CustomListTile(
                          data: context
                              .watch<ApiProvider>()
                              .currentQuestion
                              .incorrectAnswers[i]),
                    CustomListTile(
                        data: context
                            .watch<ApiProvider>()
                            .currentQuestion
                            .correctAnswer),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ApiProvider>().updateScore();
                            if (context.read<ApiProvider>().questionIndex < 9) {
                              context.read<ApiProvider>().incrementQuestion();
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          (const ScreenThree())));
                            }
                          },
                          child: Text(
                              context.watch<ApiProvider>().questionIndex == 9
                                  ? "SUBMIT"
                                  : "NEXT",
                              style: const TextStyle(color: Colors.blue)),
                        ),
                      ],
                    )
                  ],
                ))));
  }
}

class CustomListTile extends StatefulWidget {
  final String data;
  const CustomListTile({required this.data, Key? key}) : super(key: key);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.data),
      leading: Radio<String>(
          value: widget.data,
          groupValue: context.watch<ApiProvider>().selectedAnswer,
          onChanged: (String? value) {
            if (value != null) {
              context.read<ApiProvider>().setSelectedAnswer(value);
            }
          }),
    );
  }
}

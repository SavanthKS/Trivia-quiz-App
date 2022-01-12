import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/screen/screen_two.dart';
import '../provider/api_provider.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Your Score is",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "${context.read<ApiProvider>().score}/100",
              style: const TextStyle(fontSize: 40),
            ),
            const Spacer(),
            SizedBox(
              width: 180,
              child: ElevatedButton(
                  onPressed: () async {
                    bool success =
                        await context.read<ApiProvider>().fetchData();
                    if (success) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (const ScreenTwo())));
                    }
                  },
                  child: const Text("RETAKE TRIVIA",
                      style: TextStyle(color: Colors.blue))),
            ),
            const Spacer()
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:trivia_app/provider/api_provider.dart';
import 'package:trivia_app/screen/screen_two.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: (context.watch<ApiProvider>().dataLoading)
            ? const SizedBox(
                child: CircularProgressIndicator(), height: 50, width: 50)
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "TRIVIA APP",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "TAKE TRIVIA",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Icon(Icons.arrow_forward_outlined)
                        ],
                      )),
                )
              ]),
      )),
    );
  }
}

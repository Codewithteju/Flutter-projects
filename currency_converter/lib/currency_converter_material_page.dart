import 'package:flutter/material.dart';

class CurrencyConverterState extends StatefulWidget {
  const CurrencyConverterState({super.key});

  @override
  State<CurrencyConverterState> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverterState> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void convert() {
    setState(
      () {
        if (textEditingController.text == "0" ||
            textEditingController.text == "") {
          result = 0;
        } else {
          result = double.parse(textEditingController.text) * 89.25;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black26,
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Currency_Converter"),
        centerTitle: false,
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${result == 0 || result == 0.0 ? result.toStringAsFixed(0) : result.toStringAsFixed(2)} INR",
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: "Please Enter the Amount in EUR",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                  ),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (val) => setState(
                  () {
                    if (val == "0" || val == "") {
                      result = 0;
                    } else {
                      result = double.parse(textEditingController.text) * 89.25;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  convert();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Convert",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

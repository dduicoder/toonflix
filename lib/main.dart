import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              top: 48,
              bottom: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hi, Selena",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Welcome back",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                Column(
                  children: [
                    Text(
                      "Total Balance:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      "\$69420",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Button(
                          text: "Request",
                          textColor: Colors.white,
                          backgroundColor: Color(0xFF1F2123),
                        ),
                        Button(
                          text: "Transfer",
                          textColor: Colors.black,
                          backgroundColor: Color(0xFFF1B33B),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(color: Colors.white.withOpacity(0.75)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Column(
                  children: const [
                    CurrencyCard(
                      index: 0,
                      name: "Euro",
                      amount: "6428",
                      code: "EUR",
                      icon: Icons.euro_rounded,
                      mainColor: Colors.white,
                      backgroundColor: Color(0xFF1F2123),
                    ),
                    CurrencyCard(
                      index: 1,
                      name: "Dollar",
                      amount: "3120",
                      code: "USD",
                      icon: Icons.attach_money_rounded,
                      mainColor: Color(0xFF1F2123),
                      backgroundColor: Colors.white,
                    ),
                    CurrencyCard(
                      index: 2,
                      name: "Bitcoin",
                      amount: "2800",
                      code: "BTC",
                      icon: Icons.currency_bitcoin_rounded,
                      mainColor: Colors.white,
                      backgroundColor: Color(0xFF1F2123),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(
        fontFamily: "Inter",
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

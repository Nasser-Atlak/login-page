import 'package:flutter/material.dart';

class LoginBox extends StatelessWidget {
  const LoginBox({super.key, required this.loginImage});
  final String loginImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        loginImage,
        height: size.height * 0.053,
      ),
    );
  }
}

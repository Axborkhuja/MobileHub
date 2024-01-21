import 'package:flutter/material.dart';

class notLogedBody extends StatelessWidget {
  const notLogedBody({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Stack(
      children: [
        Positioned(
            child: Image.asset(
          "assets/notLogin.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.contain,
          alignment: Alignment.centerRight,
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                width: 350,

                height: 60, // Adjust the height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(brightness==Brightness.light?'assets/notLogin.png':'assets/notLoginD.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color:brightness==Brightness.dark? Colors.white10:Colors.black12,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Center(
                    child: Text(
                      "Login/Sign up",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black, // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

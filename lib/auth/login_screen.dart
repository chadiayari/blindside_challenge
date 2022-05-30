import 'package:blindside_challenge/components/input_field.dart';
import 'package:blindside_challenge/services/shared_pref.dart';
import 'package:blindside_challenge/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> with WidgetsBindingObserver {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  signIn(email, password, userID) async {
    (await UserService().signIn(email, password));
  }

  loading() {
    Loader.show(
      context,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: const CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Sign in",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: size.height * 0.1),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Email"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: LoginInputField(
                hintText: "exmp@example.com",
                onPressed: () {},
                inputController: emailController,
                pwd: false,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Password"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: LoginInputField(
                hintText: "*****",
                onPressed: () {},
                inputController: passwordController,
                pwd: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
              child: MaterialButton(
                minWidth: size.width * 0.4,
                height: 50,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ]),
                onPressed: emailController.text == "" ||
                        passwordController.text == ""
                    ? null
                    : () async {
                        setState(() {
                          loading();
                        });

                        try {
                          await UserService().signIn(
                              emailController.text, passwordController.text);
                          if (await SharedPref().read("user") != null) {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) =>
                            //             const HomeScreen()));
                          }
                        } catch (error) {
                          Loader.hide();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Login incorrect'),
                            ),
                          );
                        }
                      },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

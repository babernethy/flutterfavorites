import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/login/state/authnotifier.dart';
import 'package:lottie/lottie.dart';

// borrowed from https://github.com/skanaujiya/Login-App

class FancyLoginUI extends HookConsumerWidget {
  const FancyLoginUI(this.context, this.ref);

  final BuildContext context;
  final WidgetRef ref;

  void click(BuildContext context, WidgetRef ref, String userid) {
    ref.read(authStateProvider.notifier).signIn(userid, "P@ssw0rd");
    context.go('/');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    {
      final useridController = useTextEditingController();
      final pwdController = useTextEditingController();

      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.purpleAccent,
                  Colors.amber,
                  Colors.blue,
                ])),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 200,
                  width: 300,
                  child: LottieBuilder.asset("assets/lottie/login2.json"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 325,
                  height: 470,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Please Login to Your Account",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 260,
                        height: 60,
                        child: TextField(
                          controller: useridController,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.red,
                              ),
                              labelText: "Email Address",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 260,
                        height: 60,
                        child: TextField(
                          controller: pwdController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.eyeSlash,
                                color: Colors.red,
                              ),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forget Password",
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: 250,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              gradient: LinearGradient(colors: [
                                Color(0xFF8A2387),
                                Color(0xFFE94057),
                                Color(0xFFF27121),
                              ])),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          click(context, ref, useridController.value.text);
                        },
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        "Or Login using Social Media Account",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                click(context, ref, 'Facebook');
                              },
                              icon: const Icon(FontAwesomeIcons.facebook,
                                  color: Colors.blue)),
                          IconButton(
                              onPressed: () {
                                click(context, ref, 'Google');
                              },
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                color: Colors.redAccent,
                              )),
                          IconButton(
                              onPressed: () {
                                click(context, ref, 'Twitter');
                              },
                              icon: const Icon(
                                FontAwesomeIcons.twitter,
                                color: Colors.orangeAccent,
                              )),
                          IconButton(
                              onPressed: () {
                                click(context, ref, 'LinkedIn');
                              },
                              icon: const Icon(
                                FontAwesomeIcons.linkedinIn,
                                color: Colors.green,
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}

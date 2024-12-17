import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:http/http.dart' as http;

mixin PasswordlessMixin {

  void showPasswordlessStepper({
    TargetKeyFunc? targetGkF,
    required String gcrServerUrl,
    required ValueChanged<String> onSignedInF,
    required ScrollControllerName? scName,
  }) {
    fco.showOverlay(
      targetGkF: targetGkF,
      calloutContent: PasswordlessStepper(
          gcrServerUrl: gcrServerUrl,
          onSignedInF: onSignedInF),
      calloutConfig: CalloutConfig(
        cId: "passwordless-stepper",
        initialCalloutW: 600,
        initialCalloutH: 200,
        initialTargetAlignment: Alignment.bottomCenter,
        initialCalloutAlignment: Alignment.topCenter,
        arrowType: ArrowType.THIN,
        arrowColor: Colors.blue[900],
        finalSeparation: 60,
        // fillColor: Colors.purpleAccent,
        barrier: CalloutBarrier(
          opacity: 0.25,
          onTappedF: () async {
            fco.dismiss("passwordless-stepper");
          },
        ),
        notUsingHydratedStorage: true,
        scrollControllerName: scName,
      ),
    );
  }
}

class PasswordlessStepper extends StatefulWidget {
  final String gcrServerUrl;
  final ValueChanged<String> onSignedInF;

  const PasswordlessStepper({
    required this.gcrServerUrl,
    required this.onSignedInF,
    super.key,});

  @override
  State<PasswordlessStepper> createState() => PasswordlessStepperState();

  static PasswordlessStepperState? of(BuildContext context) =>
      context.findAncestorStateOfType<PasswordlessStepperState>();

  // if email gets sent ok, returns the token embedded in that email
  static Future<String?> cloudRunCreateTokenAndEmailVerificationLinkToUser({
    required String gcrServerUrl,
    required String userEa,
  }) async {
    Map<String, dynamic> map = {'ea': userEa, 'app': 'algc'};
    final messageBody = json.encode(map);

    final response = await http.Client().post(
      Uri.parse('$gcrServerUrl/passwordless/emailUserAConfirmButton'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: messageBody,
    );

    final responseBody = response.body;
    map = jsonDecode(responseBody);

    return response.statusCode == 200 ? map['token'] : null;
  }
}

class PasswordlessStepperState extends State<PasswordlessStepper> {
  String? token;
  int index = 0;
  late FocusNode focusNode;
  late TextEditingController eaController;

  String? get ea =>
      fco.emailIsValid(eaController.text) ? eaController.text : null;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    eaController = TextEditingController();
    fco.afterNextBuildDo(() {
      Future.delayed(Duration.zero, () {
        focusNode.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    eaController.dispose();
    super.dispose();
  }

  void back() {
    if (!mounted) return;
    if (index > 0) {
      setState(() {
        index = max(0, index - 1);
      });
    }
  }

  void forward() {
    if (!mounted) return;
    if (index <= 0) {
      setState(() {
        index++;
      });
    }
  }

  void refresh({VoidCallback? f}) {
    if (!mounted) return;
    setState(() => f?.call());
  }

  void setEaAndToken(String theEa, String theToken) {
    if (!mounted) return;
    setState(() {
      token = theToken;
      forward();
    });
  }

  bool userHasConfirmed() {
    return fco.hiveBox?.get('vea') == ea;
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      currentStep: index,
      onStepCancel: () {
        back();
      },
      onStepContinue: () {
        forward();
      },
      onStepTapped: (int theIndex) {
        if (!mounted) return;
        setState(() {
          index = theIndex;
        });
      },
      stepIconBuilder: (index, stepState) {
        Color color = Colors.white;
        // if (index == 0 && token != null) color = Colors.black12;
        if (index == 1 && ea == null) color = Colors.black12;
        if (index == 2 && !userHasConfirmed()) color = Colors.black12;
        return fco.coloredText('${index + 1}',
            color: color); ////const Offstage();
      },
      controlsBuilder: (_, __) => const Offstage(),
      steps: <Step>[
        Step(
          title: fco.coloredText(
            token != null ? ea ?? '?' : 'Enter your email address',
            color: token != null ? Colors.black45 : Colors.black,
          ),
          content: Step1(
            parentState: this,
            gcrServerUrl: widget.gcrServerUrl,
          ),
        ),
        Step(
          title: fco.blink(fco.coloredText(
            'Check your Email',
            color: ea != null ? Colors.black : Colors.black12,
            fontWeight: ea != null ? FontWeight.bold : FontWeight.normal,
          )),
          content: Step2(this),
        ),
      ],
    );
  }
}

class Step1 extends StatelessWidget {
  final PasswordlessStepperState parentState;
  final String gcrServerUrl;


  const Step1(
      {required this.gcrServerUrl, required this.parentState, super.key});

  @override
  Widget build(BuildContext context) =>
      StatefulBuilder(
        builder: (context, StateSetter setState) =>
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 340,
                    height: 70,
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your Email Address',
                      ),
                      autofocus: true,
                      controller: parentState.eaController,
                      focusNode: parentState.focusNode,
                      maxLines: 1,
                      onChanged: (s) {
                        setState(() {});
                      },
                      onEditingComplete: () async {
                        _emailAddressEntered();
                      },
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'monospace',
                          color: parentState.eaController.text.isEmpty ||
                              fco.emailIsValid(parentState.eaController.text)
                              ? Colors.blue[900]
                              : Colors.red,
                          fontWeight: parentState.eaController.text.isEmpty ||
                              fco.emailIsValid(parentState.eaController.text)
                              ? FontWeight.w400
                              : FontWeight.w900,
                          background: fco.whiteBgPaint),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _emailAddressEntered();
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: fco.emailIsValid(parentState.eaController.text)
                          ? Colors.blue
                          : Colors.red,
                    )),
              ],
            ),
      );

  Future<void> _emailAddressEntered() async {
    if (fco.emailIsValid(parentState.eaController.text)) {
      // check whether already signed in
      if (parentState.userHasConfirmed()) {
        _showAlreadySignInToast();
        fco.dismiss("passwordless-stepper");
      }
      String? token = await PasswordlessStepper
          .cloudRunCreateTokenAndEmailVerificationLinkToUser(
          gcrServerUrl: gcrServerUrl,
          userEa: parentState.eaController.text);
      if (token != null) {
        parentState.setEaAndToken(
          parentState.eaController.text,
          token,
        );
      }
    }
  }

  void _showAlreadySignInToast() {
    fco.showToast(
      removeAfterMs: 5000,
      calloutConfig: CalloutConfig(
        cId: "already-signed-in",
        gravity: Alignment.topCenter,
        fillColor: Colors.yellow,
        initialCalloutW: fco.scrW * .8,
        initialCalloutH: 40,
        scrollControllerName: null,
      ),
      calloutContent: Padding(
          padding: const EdgeInsets.all(10),
          child: fco.coloredText('You are already signed in on this device.',
              color: Colors.blueAccent)),
    );
  }
}

class Step2 extends StatelessWidget {
  final PasswordlessStepperState parentState;

  const Step2(this.parentState, {super.key});

  @override
  Widget build(BuildContext context) {
    if (parentState.ea == null || parentState.token == null) {
      fco.afterMsDelayDo(5000, () {
        parentState.back();
      });
      return fco.coloredText(
        'Enter your email address to get started.',
        fontSize: 24,
        color: Colors.purpleAccent,
      );
    }

    return parentState.userHasConfirmed()
        ? const Text('You are already signed in.')
        : Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // check user is actually signed in now by checking firestore
                if (parentState.token != null &&
                    await fco.modelRepo.tokenConfirmed(parentState.token!)) {
                  final String? vea = fco.hiveBox?.get('vea');
                  if (vea != parentState.ea) {
                    await fco.hiveBox?.put('vea', parentState.ea);
                  }
                  parentState.widget.onSignedInF(parentState.ea!);
                  fco.dismiss("passwordless-stepper");
                  _showConfirmedOKToast();
                } else {
                  parentState.refresh(f: () {
                    _showWaitingForYouToConfirmToast();
                  });
                }
              },
              child: fco.coloredText('I tapped the button in the email',
                  color: Colors.blue, fontSize: 24),
            ),
            fco.coloredText(
                "\n(NOTE - if you can't find it, it's probably in your spam email folder)"),
          ],
        ));
  }

  void _showConfirmedOKToast() {
    fco.showToast(
      removeAfterMs: 3000,
      calloutConfig: CalloutConfig(
        cId: "sign-in-confirmed",
        gravity: Alignment.topCenter,
        fillColor: Colors.yellow,
        initialCalloutW: fco.scrW * .8,
        initialCalloutH: 40,
        scrollControllerName: null,
      ),
      calloutContent: Padding(
          padding: const EdgeInsets.all(10),
          child: fco.coloredText('You are signed in as ${parentState.ea}',
              color: Colors.blueAccent)),
    );
  }

  void _showWaitingForYouToConfirmToast() {
    fco.showToast(
      removeAfterMs: 5000,
      calloutConfig: CalloutConfig(
        cId: "waiting-for-confirmation-button",
        gravity: Alignment.topCenter,
        fillColor: Colors.yellow,
        initialCalloutW: fco.scrW * .8,
        initialCalloutH: 40,
        scrollControllerName: null,
      ),
      calloutContent: Padding(
          padding: const EdgeInsets.all(10),
          child: fco.coloredText(
              'Waiting for you to tap the button in the email we sent you...',
              color: Colors.blueAccent)),
    );
  }
}

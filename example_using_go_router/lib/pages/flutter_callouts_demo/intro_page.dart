import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'callout_following_scroll_demo.dart';
import 'callout_with_barrier_demo.dart';
import 'callout_with_pointer_demo.dart';
import 'decoration_demo.dart';
import 'iframe_page.dart';
import 'toast_demo.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => IntroPageState();
}

/// it's important to add the mixin, because callouts are animated
class IntroPageState extends State<IntroPage> {

  double get fontSize {
    double result = fco.scrW < 600 ? 12.0 : 18.0;
    return result;
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: fco.scrW * .6,
            height: fco.scrH * .95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Welcome to the flutter_callouts pkg demo\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaler: TextScaler.linear(1.4),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'This Flutter API can be used to create flutter overlays (callouts) that can be shown over your app\n\n',
                        style: TextStyle(fontStyle: FontStyle.normal, fontSize: fontSize),
                      ),
        
                      TextSpan(
                        text: "Callouts are great for highlighting or pointing stuff out, or for popping up messages (toasts etc).\n\n",
                        style: TextStyle(fontStyle: FontStyle.normal, fontSize: fontSize),
                      ),
        
                      TextSpan(
                        text:
                        "Flutter apps tend to have much more functionality, so adding callouts can really help declutter the ui,\nand help your users understand your app faster.\n\n",
                        style: TextStyle(fontStyle: FontStyle.normal, fontSize: fontSize),
                      ),
        
                      TextSpan(
                        text: "The API is quite comprehensive. Here are a series of demos to show off the package's capabilities...\n",
                        style: TextStyle(fontStyle: FontStyle.normal, fontSize: fontSize),
                      ),
                    ],
                  ),
                ),
        
                IntrinsicHeight(
                    child: Column(
                      children: [
                        FilledButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ScrollingDemo())),
                          child: const Text('Simple callout demo'),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BarrierDemo())),
                          child: const Text('Barrier demo'),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PointerDemo())),
                          child: const Text('Target Pointer demo'),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ToastDemoPage())),
                          child: const Text('Toasts demo'),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const IFramePage())),
                          child: const Text('Iframe demo'),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DecorationDemoPage())),
                          child: const Text('Decoration Shape demo'),
                        ),
                      ],
                    ),
                  ),
                const Spacer(),
                const Text(
                  "\n\nBTW - We also offer another pkg (flutter_content), "
                      "built on top of this one, "
                      "that extends this API with an accompanying admin UI. It "
                      "makes it easy to configure your callouts and store "
                      "those configurations as json in firestore, and also to"
                      " publish in the callouts your own editorial content "
                      "(text, images, files, videos, polls etc)"
                      " in real time from your firestore database.",
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

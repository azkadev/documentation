import 'package:documentation/scheme/scheme.dart';
import 'package:flutter/material.dart';

import 'package:documentation/page/landing/landing.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

class DocumentationApp extends StatefulWidget {
  final DocumentationData documentationData;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const DocumentationApp(
      {super.key,
      required this.documentationData,
      required this.generalLibFlutterApp});

  @override
  State<DocumentationApp> createState() => _DocumentationAppState();
}

class _DocumentationAppState extends State<DocumentationApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigate();
    });
  }

  void navigate() async {
    setState(() {});

    Future(() async {
      await Future.delayed(Durations.extralong4);
      // ignore: use_build_context_synchronously
      context.navigator().push(MaterialPageRoute(
        builder: (context) {
          return LandingPageDocumentation(
            documentationData: widget.documentationData,
            generalLibFlutterApp: widget.generalLibFlutterApp,
          );
        },
      ));
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

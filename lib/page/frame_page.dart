import 'package:flutter/material.dart';
import 'package:flutter_windows_application/page/home_page.dart';
import 'package:window_manager/window_manager.dart' hide WindowCaption;

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          HomePage(),
          Align(
            alignment: Alignment.topCenter,
            child: DragToMoveArea(
              child: SizedBox(
                height: 60,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

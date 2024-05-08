import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:take_screenshot/controllers/screenshot_controller.dart';
import 'package:take_screenshot/widgets/take_screenshot_widget.dart';

/// Capture screenshot of all children.
class ScreenShotWidget extends StatefulWidget {
	final List<Widget> children;
	final ScreenShotController? controller;
	final CrossAxisAlignment crossAxisAlignment;
  const ScreenShotWidget({Key? key, required this.children, this.controller, this.crossAxisAlignment = CrossAxisAlignment.start}) : super(key: key);

  @override
  State<ScreenShotWidget> createState() => _ScreenShotWidgetState();
}

class _ScreenShotWidgetState extends State<ScreenShotWidget> {
	late GlobalKey _repaintKey;

	Future<Uint8List> _capturePng() async {
		RenderRepaintBoundary? boundary = _repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

		ui.Image image = await boundary.toImage(pixelRatio: MediaQuery.of(context).devicePixelRatio);
		ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
		Uint8List pngBytes = byteData?.buffer.asUint8List() ?? Uint8List(0);
		
		return pngBytes;
	}

	@override
  void initState() {
    super.initState();
		_repaintKey = GlobalKey();
		widget.controller?.setCaptureScreenShotMethod(_capturePng);

    Future.delayed(
      Duration.zero,
      () => TakeScreenShot.of(context)?.addController(widget.controller ?? ScreenShotController(_capturePng)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _repaintKey,
      child: Column(
				crossAxisAlignment: widget.crossAxisAlignment,
        children: widget.children,
      ),
    );
  }
}
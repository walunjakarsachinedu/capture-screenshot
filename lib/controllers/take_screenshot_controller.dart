
import 'dart:typed_data';

import 'package:take_screenshot/controllers/screenshot_controller.dart';

class TakeScreenShotController {

	/// This list will get initialize when passed to `TakeScreenShot` widget.
	List<ScreenShotController>? screenshotControllers;

	/// Capture the screenshot all decendant `ScreenShotWidget`.
	Future<List<Uint8List>> captureScreenshots() async {
		if(screenshotControllers == null) return [];

		List<Uint8List> images = [];
		for(var controller in List.from(screenshotControllers!)) {
		  images.add(await controller.captureScreenShot!());
		}
		return images;
	}
}
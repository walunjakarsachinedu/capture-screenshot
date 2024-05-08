import 'dart:typed_data';

class ScreenShotController {
	Future<Uint8List> Function()? captureScreenShot; 

	ScreenShotController([this.captureScreenShot]);
}
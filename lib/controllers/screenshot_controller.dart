import 'dart:typed_data';

class ScreenShotController {
	Future<Uint8List> Function()? _captureScreenShot; 

	Future<Uint8List> captureScreenShot() async {
		if(_captureScreenShot == null) throw Exception("ScreenShotController is not wrapped inside ScreenShotWidget. Make sure to wrap inside the ScreenShotWidget.");
		return await _captureScreenShot!();
	}

	void setCaptureScreenShotMethod( Future<Uint8List> Function()? captureScreenShotMethod) {
		_captureScreenShot = 	captureScreenShotMethod;
	}

	ScreenShotController([this._captureScreenShot]);
}
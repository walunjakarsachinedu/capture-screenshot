import 'package:flutter/material.dart';
import 'package:take_screenshot/controllers/screenshot_controller.dart';
import 'package:take_screenshot/controllers/take_screenshot_controller.dart';


class TakeScreenShot extends InheritedWidget {
	final TakeScreenShotController controller;
	final List<ScreenShotController> _screenshotControllers = [];

	/// Helps to take screenshot of all descendant `ScreenShotWidgets`.
  TakeScreenShot({required Widget child, required this.controller}) : super(child: child, key: UniqueKey()) {
		controller.screenshotControllers = _screenshotControllers;
	}
	
  void addController(ScreenShotController controller) => _screenshotControllers.add(controller);

	static TakeScreenShot? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<TakeScreenShot>();

	@override
	bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
import 'package:flutter/material.dart';
import 'home_page_provider_locator.dart'

if (dart.library.io) 'home_page_provider_mobile.dart'
if (dart.library.html) 'home_page_provider_web.dart' ;

// final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

abstract class HomePageProvider {
  factory HomePageProvider() => getHomePageProvider();
  Widget getWebOrMobileHomePage(Widget webHomePage, Widget mobileHomePage);

}
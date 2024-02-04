import 'package:flutter/material.dart';

import 'home_page_provider.dart';

HomePageProvider getHomePageProvider() => WebHomePageProvider();

class WebHomePageProvider implements HomePageProvider {
  @override
  Widget getWebOrMobileHomePage(Widget webHomePage, Widget mobileHomePage) => webHomePage;
}

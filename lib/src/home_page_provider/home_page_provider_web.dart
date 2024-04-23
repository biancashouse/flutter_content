import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';

import 'home_page_provider.dart';

HomePageProvider getHomePageProvider() => WebHomePageProvider();

class WebHomePageProvider implements HomePageProvider {
  @override
  Widget getWebOrMobileHomePage(Widget webHomePage, Widget mobileHomePage) =>
      BlocBuilder<CAPIBloC, CAPIState>(
          buildWhen: (previous, current) => current.force != previous.force && !current.onlyTargetsWrappers,
          builder: (innerContext, state) {
        return webHomePage;
      });
}

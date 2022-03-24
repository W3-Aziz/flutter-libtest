import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_practics/app/routes/app_pages.dart';

class FirstMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  bool isAuthenticated = true;

  @override
  RouteSettings? redirect(String? route) {
    print("Middle-ware called redirect()");
    if (isAuthenticated == false) {
      return RouteSettings(name: Routes.LOGIN);
    }
  }

  //This function will be called  before anything created we can use it to
  // change something about the page or give it new page
  @override
  GetPage? onPageCalled(GetPage? page) {
    print("Middle-ware called onPageCalled()");
    return super.onPageCalled(page);
  }

  //This function will be called right before the Bindings are initialized.
  // Here we can change Bindings for this page.
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    print("Middle-ware called onBindingsStart()");
    return super.onBindingsStart(bindings);
  }

  //This function will be called right after the Bindings are initialized.
  // Here we can do something after  bindings created and before creating the page widget.
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    print("Middle-ware called onPageBuildStart()");
    return super.onPageBuildStart(page);
  }

  // Page build and widgets of page will be shown
  @override
  Widget onPageBuilt(Widget page) {
    print("Middle-ware called onPageBuilt()");
    return super.onPageBuilt(page);
  }

  //This function will be called right after disposing all the related objects
  // (Controllers, views, ...) of the page.
  @override
  void onPageDispose() {
    print("Middle-ware called onPageDispose()");
    super.onPageDispose();
  }
}

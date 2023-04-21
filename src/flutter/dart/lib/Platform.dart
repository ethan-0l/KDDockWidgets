/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import 'package:KDDockWidgets/View.dart';
import 'package:KDDockWidgets/WindowOverlayWidget.dart';
import 'package:KDDockWidgetsBindings/Bindings.dart' as KDDockWidgetBindings;
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsCore.dart'
    as KDDWBindingsCore;

import 'ViewFactory.dart';

class Platform extends KDDockWidgetBindings.Platform_flutter {
  late final WindowOverlayWidget windowOverlayWidget;

  var floatingWindows = <KDDWBindingsCore.FloatingWindow>[];

  @override
  String name() {
    return "flutter";
  }

  static Platform plat() {
    var p = KDDockWidgetBindings.Platform_flutter.platformFlutter();

    return KDDockWidgetBindings.Platform_flutter.fromCache(p.thisCpp)
        as Platform;
  }

  @override
  KDDWBindingsCore.ViewFactory createDefaultViewFactory() {
    return ViewFactory();
  }

  @override
  KDDWBindingsCore.View tests_createView(
      KDDockWidgetBindings.CreateViewOptions opts,
      {required KDDWBindingsCore.View? parent}) {
    return View(null, 0, parent as View);
  }

  @override
  KDDWBindingsCore.View createView(KDDWBindingsCore.Controller? controller,
      {required KDDWBindingsCore.View? parent}) {
    print("Platform: createView");
    return KDDockWidgetBindings.View_flutter(controller, 0, parent);
  }

  @override
  onFloatingWindowCreated(KDDWBindingsCore.FloatingWindow? fw) {
    floatingWindows.add(fw!);
    rebuildWindowOverlay();
  }

  @override
  onFloatingWindowDestroyed(KDDWBindingsCore.FloatingWindow? fw) {
    floatingWindows.remove(fw!);
    rebuildWindowOverlay();
  }

  void rebuildWindowOverlay() {
    final state = WindowOverlayWidget.globalKey().currentState;
    if (state != null) {
      state.onFloatingWindowCountChanged();
    }
  }

  @override
  void dumpManagedBacktrace() {
    print(StackTrace.current);
  }
}

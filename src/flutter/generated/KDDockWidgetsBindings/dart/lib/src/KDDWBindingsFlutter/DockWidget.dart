/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import '../TypeHelpers.dart';
import '../../Bindings.dart';
import '../../Bindings_KDDWBindingsCore.dart' as KDDWBindingsCore;
import '../../Bindings_KDDWBindingsFlutter.dart' as KDDWBindingsFlutter;
import '../../LibraryLoader.dart';

var _dylib = Library.instance().dylib;

class DockWidget extends KDDWBindingsFlutter.View {
  DockWidget.fromCppPointer(var cppPointer, [var needsAutoDelete = false])
      : super.fromCppPointer(cppPointer, needsAutoDelete) {}
  DockWidget.init() : super.init() {}
  factory DockWidget.fromCache(var cppPointer, [needsAutoDelete = false]) {
    if (KDDWBindingsCore.View.isCached(cppPointer)) {
      var instance =
          KDDWBindingsCore.View.s_dartInstanceByCppPtr[cppPointer.address];
      if (instance != null) return instance as DockWidget;
    }
    return DockWidget.fromCppPointer(cppPointer, needsAutoDelete);
  } //DockWidget(const QString & uniqueName, QFlags<KDDockWidgets::DockWidgetOption> options, QFlags<KDDockWidgets::LayoutSaverOption> layoutSaverOptions)
  DockWidget(String? uniqueName, {int options = 0, int layoutSaverOptions = 0})
      : super.init() {
    final voidstar_Func_voidstar_int_int func = _dylib
        .lookup<
                ffi.NativeFunction<
                    voidstar_Func_voidstar_ffi_Int32_ffi_Int32_FFI>>(
            'c_KDDockWidgets__flutter__DockWidget__constructor_QString_DockWidgetOptions_LayoutSaverOptions')
        .asFunction();
    thisCpp = func(
        uniqueName?.toNativeUtf8() ?? ffi.nullptr, options, layoutSaverOptions);
    KDDWBindingsCore.View.s_dartInstanceByCppPtr[thisCpp.address] = this;
    registerCallbacks();
  }
  static void activateWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::activateWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.activateWindow();
  }

  static int close_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::close()! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.close();
    return result ? 1 : 0;
  }

  static void createPlatformWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::createPlatformWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.createPlatformWindow();
  } // dockWidget() const

  KDDWBindingsCore.DockWidget dockWidget() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__DockWidget__dockWidget')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return KDDWBindingsCore.DockWidget.fromCppPointer(result, false);
  }

  static int flags_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::flags() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.flags();
    return result;
  }

  static ffi.Pointer<void> geometry_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::geometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.geometry();
    return result.thisCpp;
  }

  static void grabMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::grabMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.grabMouse();
  }

  static int hasFocus_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::hasFocus() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.hasFocus();
    return result ? 1 : 0;
  }

  static void hide_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::hide()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.hide();
  }

  static void init_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::init()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.init();
  }

  static int isActiveWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::isActiveWindow() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isActiveWindow();
    return result ? 1 : 0;
  }

  static int isExplicitlyHidden_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::isExplicitlyHidden() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isExplicitlyHidden();
    return result ? 1 : 0;
  }

  static int isMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::isMaximized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMaximized();
    return result ? 1 : 0;
  }

  static int isMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::isMinimized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMinimized();
    return result ? 1 : 0;
  }

  static int isMounted_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::isMounted() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMounted();
    return result ? 1 : 0;
  }

  static int isNull_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::isNull() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isNull();
    return result ? 1 : 0;
  }

  static int isRootView_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::isRootView() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isRootView();
    return result ? 1 : 0;
  }

  static int isVisible_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::isVisible() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isVisible();
    return result ? 1 : 0;
  }

  static ffi.Pointer<void> mapFromGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> globalPt) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::mapFromGlobal(QPoint globalPt) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapFromGlobal(QPoint.fromCppPointer(globalPt));
    return result.thisCpp;
  }

  static ffi.Pointer<void> mapTo_calledFromC(ffi.Pointer<void> thisCpp,
      ffi.Pointer<void>? parent, ffi.Pointer<void> pos) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::mapTo(KDDockWidgets::Core::View * parent, QPoint pos) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapTo(
        (parent == null || parent.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(parent),
        QPoint.fromCppPointer(pos));
    return result.thisCpp;
  }

  static ffi.Pointer<void> mapToGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> localPt) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::mapToGlobal(QPoint localPt) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapToGlobal(QPoint.fromCppPointer(localPt));
    return result.thisCpp;
  }

  static ffi.Pointer<void> maxSizeHint_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::maxSizeHint() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.maxSizeHint();
    return result.thisCpp;
  }

  static ffi.Pointer<void> minSize_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::minSize() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minSize();
    return result.thisCpp;
  }

  static void move_2_calledFromC(ffi.Pointer<void> thisCpp, int x, int y) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::move(int x, int y)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.move_2(x, y);
  }

  static ffi.Pointer<void> normalGeometry_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::normalGeometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.normalGeometry();
    return result.thisCpp;
  }

  static void onChildAdded_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::onChildAdded(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildAdded((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void onChildRemoved_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::onChildRemoved(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildRemoved((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void onChildVisibilityChanged_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::onChildVisibilityChanged(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onChildVisibilityChanged(
        (childView == null || childView.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void onGeometryChanged_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::onGeometryChanged()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onGeometryChanged();
  }

  static void onRebuildRequested_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::onRebuildRequested()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onRebuildRequested();
  }

  static int onResize_2_calledFromC(ffi.Pointer<void> thisCpp, int h, int w) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::onResize(int h, int w)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.onResize_2(h, w);
    return result ? 1 : 0;
  }

  static void raise_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::raise()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raise();
  }

  static void raiseAndActivate_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::raiseAndActivate()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseAndActivate();
  }

  static void raiseChild_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? childView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::raiseChild(KDDockWidgets::Core::View * childView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseChild((childView == null || childView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(childView));
  }

  static void raiseWindow_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? rootView) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::raiseWindow(KDDockWidgets::Core::View * rootView)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseWindow((rootView == null || rootView.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(rootView));
  }

  static void releaseKeyboard_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::releaseKeyboard()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseKeyboard();
  }

  static void releaseMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::releaseMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseMouse();
  }

  static void setCursor_calledFromC(ffi.Pointer<void> thisCpp, int shape) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setCursor(Qt::CursorShape shape)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setCursor(shape);
  }

  static void setFixedHeight_calledFromC(ffi.Pointer<void> thisCpp, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setFixedHeight(int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedHeight(h);
  }

  static void setFixedWidth_calledFromC(ffi.Pointer<void> thisCpp, int w) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setFixedWidth(int w)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedWidth(w);
  }

  static void setGeometry_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> geometry) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setGeometry(QRect geometry)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setGeometry(QRect.fromCppPointer(geometry));
  }

  static void setHeight_calledFromC(ffi.Pointer<void> thisCpp, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setHeight(int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setHeight(h);
  }

  static void setMaximumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setMaximumSize(QSize sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMaximumSize(QSize.fromCppPointer(sz));
  }

  static void setMinimumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setMinimumSize(QSize sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMinimumSize(QSize.fromCppPointer(sz));
  }

  static void setMouseTracking_calledFromC(
      ffi.Pointer<void> thisCpp, int enable) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setMouseTracking(bool enable)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMouseTracking(enable != 0);
  }

  static void setParent_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? parent) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setParent(KDDockWidgets::Core::View * parent)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setParent((parent == null || parent.address == 0)
        ? null
        : KDDWBindingsCore.View.fromCppPointer(parent));
  }

  static void setSize_2_calledFromC(ffi.Pointer<void> thisCpp, int w, int h) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setSize(int w, int h)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setSize_2(w, h);
  }

  static void setViewName_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? name) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setViewName(const QString & name)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setViewName(QString.fromCppPointer(name).toDartString());
  }

  static void setVisible_calledFromC(ffi.Pointer<void> thisCpp, int visible) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setVisible(bool visible)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setVisible(visible != 0);
  }

  static void setWidth_calledFromC(ffi.Pointer<void> thisCpp, int w) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setWidth(int w)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWidth(w);
  }

  static void setWindowOpacity_calledFromC(
      ffi.Pointer<void> thisCpp, double v) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setWindowOpacity(double v)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowOpacity(v);
  }

  static void setWindowTitle_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? title) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setWindowTitle(const QString & title)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowTitle(QString.fromCppPointer(title).toDartString());
  }

  static void setZOrder_calledFromC(ffi.Pointer<void> thisCpp, int z) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::setZOrder(int z)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setZOrder(z);
  }

  static void show_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::show()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.show();
  }

  static void showMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::showMaximized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMaximized();
  }

  static void showMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::showMinimized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMinimized();
  }

  static void showNormal_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::showNormal()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showNormal();
  }

  static void update_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::update()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.update();
  }

  static ffi.Pointer<void> viewName_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .View.s_dartInstanceByCppPtr[thisCpp.address] as DockWidget;
    if (dartInstance == null) {
      print(
          "Dart instance not found for DockWidget::viewName() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.viewName();
    return result.thisCpp;
  }

  void release() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__DockWidget__destructor')
        .asFunction();
    func(thisCpp);
  }

  String cFunctionSymbolName(int methodId) {
    switch (methodId) {
      case 825:
        return "c_KDDockWidgets__flutter__DockWidget__activateWindow";
      case 835:
        return "c_KDDockWidgets__flutter__DockWidget__close";
      case 837:
        return "c_KDDockWidgets__flutter__DockWidget__createPlatformWindow";
      case 843:
        return "c_KDDockWidgets__flutter__DockWidget__flags";
      case 844:
        return "c_KDDockWidgets__flutter__DockWidget__geometry";
      case 845:
        return "c_KDDockWidgets__flutter__DockWidget__grabMouse";
      case 848:
        return "c_KDDockWidgets__flutter__DockWidget__hasFocus";
      case 850:
        return "c_KDDockWidgets__flutter__DockWidget__hide";
      case 852:
        return "c_KDDockWidgets__flutter__DockWidget__init";
      case 854:
        return "c_KDDockWidgets__flutter__DockWidget__isActiveWindow";
      case 855:
        return "c_KDDockWidgets__flutter__DockWidget__isExplicitlyHidden";
      case 856:
        return "c_KDDockWidgets__flutter__DockWidget__isMaximized";
      case 857:
        return "c_KDDockWidgets__flutter__DockWidget__isMinimized";
      case 927:
        return "c_KDDockWidgets__flutter__DockWidget__isMounted";
      case 858:
        return "c_KDDockWidgets__flutter__DockWidget__isNull";
      case 859:
        return "c_KDDockWidgets__flutter__DockWidget__isRootView";
      case 860:
        return "c_KDDockWidgets__flutter__DockWidget__isVisible";
      case 861:
        return "c_KDDockWidgets__flutter__DockWidget__mapFromGlobal_QPoint";
      case 862:
        return "c_KDDockWidgets__flutter__DockWidget__mapTo_View_QPoint";
      case 863:
        return "c_KDDockWidgets__flutter__DockWidget__mapToGlobal_QPoint";
      case 864:
        return "c_KDDockWidgets__flutter__DockWidget__maxSizeHint";
      case 865:
        return "c_KDDockWidgets__flutter__DockWidget__minSize";
      case 869:
        return "c_KDDockWidgets__flutter__DockWidget__move_int_int";
      case 870:
        return "c_KDDockWidgets__flutter__DockWidget__normalGeometry";
      case 930:
        return "c_KDDockWidgets__flutter__DockWidget__onChildAdded_View";
      case 931:
        return "c_KDDockWidgets__flutter__DockWidget__onChildRemoved_View";
      case 932:
        return "c_KDDockWidgets__flutter__DockWidget__onChildVisibilityChanged_View";
      case 934:
        return "c_KDDockWidgets__flutter__DockWidget__onGeometryChanged";
      case 936:
        return "c_KDDockWidgets__flutter__DockWidget__onRebuildRequested";
      case 872:
        return "c_KDDockWidgets__flutter__DockWidget__onResize_int_int";
      case 874:
        return "c_KDDockWidgets__flutter__DockWidget__raise";
      case 875:
        return "c_KDDockWidgets__flutter__DockWidget__raiseAndActivate";
      case 939:
        return "c_KDDockWidgets__flutter__DockWidget__raiseChild_View";
      case 940:
        return "c_KDDockWidgets__flutter__DockWidget__raiseWindow_View";
      case 877:
        return "c_KDDockWidgets__flutter__DockWidget__releaseKeyboard";
      case 878:
        return "c_KDDockWidgets__flutter__DockWidget__releaseMouse";
      case 881:
        return "c_KDDockWidgets__flutter__DockWidget__setCursor_CursorShape";
      case 882:
        return "c_KDDockWidgets__flutter__DockWidget__setFixedHeight_int";
      case 883:
        return "c_KDDockWidgets__flutter__DockWidget__setFixedWidth_int";
      case 884:
        return "c_KDDockWidgets__flutter__DockWidget__setGeometry_QRect";
      case 885:
        return "c_KDDockWidgets__flutter__DockWidget__setHeight_int";
      case 886:
        return "c_KDDockWidgets__flutter__DockWidget__setMaximumSize_QSize";
      case 887:
        return "c_KDDockWidgets__flutter__DockWidget__setMinimumSize_QSize";
      case 888:
        return "c_KDDockWidgets__flutter__DockWidget__setMouseTracking_bool";
      case 889:
        return "c_KDDockWidgets__flutter__DockWidget__setParent_View";
      case 891:
        return "c_KDDockWidgets__flutter__DockWidget__setSize_int_int";
      case 892:
        return "c_KDDockWidgets__flutter__DockWidget__setViewName_QString";
      case 893:
        return "c_KDDockWidgets__flutter__DockWidget__setVisible_bool";
      case 894:
        return "c_KDDockWidgets__flutter__DockWidget__setWidth_int";
      case 895:
        return "c_KDDockWidgets__flutter__DockWidget__setWindowOpacity_double";
      case 896:
        return "c_KDDockWidgets__flutter__DockWidget__setWindowTitle_QString";
      case 897:
        return "c_KDDockWidgets__flutter__DockWidget__setZOrder_int";
      case 898:
        return "c_KDDockWidgets__flutter__DockWidget__show";
      case 899:
        return "c_KDDockWidgets__flutter__DockWidget__showMaximized";
      case 900:
        return "c_KDDockWidgets__flutter__DockWidget__showMinimized";
      case 901:
        return "c_KDDockWidgets__flutter__DockWidget__showNormal";
      case 903:
        return "c_KDDockWidgets__flutter__DockWidget__update";
      case 904:
        return "c_KDDockWidgets__flutter__DockWidget__viewName";
    }
    return super.cFunctionSymbolName(methodId);
  }

  static String methodNameFromId(int methodId) {
    switch (methodId) {
      case 825:
        return "activateWindow";
      case 835:
        return "close";
      case 837:
        return "createPlatformWindow";
      case 843:
        return "flags";
      case 844:
        return "geometry";
      case 845:
        return "grabMouse";
      case 848:
        return "hasFocus";
      case 850:
        return "hide";
      case 852:
        return "init";
      case 854:
        return "isActiveWindow";
      case 855:
        return "isExplicitlyHidden";
      case 856:
        return "isMaximized";
      case 857:
        return "isMinimized";
      case 927:
        return "isMounted";
      case 858:
        return "isNull";
      case 859:
        return "isRootView";
      case 860:
        return "isVisible";
      case 861:
        return "mapFromGlobal";
      case 862:
        return "mapTo";
      case 863:
        return "mapToGlobal";
      case 864:
        return "maxSizeHint";
      case 865:
        return "minSize";
      case 869:
        return "move_2";
      case 870:
        return "normalGeometry";
      case 930:
        return "onChildAdded";
      case 931:
        return "onChildRemoved";
      case 932:
        return "onChildVisibilityChanged";
      case 934:
        return "onGeometryChanged";
      case 936:
        return "onRebuildRequested";
      case 872:
        return "onResize_2";
      case 874:
        return "raise";
      case 875:
        return "raiseAndActivate";
      case 939:
        return "raiseChild";
      case 940:
        return "raiseWindow";
      case 877:
        return "releaseKeyboard";
      case 878:
        return "releaseMouse";
      case 881:
        return "setCursor";
      case 882:
        return "setFixedHeight";
      case 883:
        return "setFixedWidth";
      case 884:
        return "setGeometry";
      case 885:
        return "setHeight";
      case 886:
        return "setMaximumSize";
      case 887:
        return "setMinimumSize";
      case 888:
        return "setMouseTracking";
      case 889:
        return "setParent";
      case 891:
        return "setSize_2";
      case 892:
        return "setViewName";
      case 893:
        return "setVisible";
      case 894:
        return "setWidth";
      case 895:
        return "setWindowOpacity";
      case 896:
        return "setWindowTitle";
      case 897:
        return "setZOrder";
      case 898:
        return "show";
      case 899:
        return "showMaximized";
      case 900:
        return "showMinimized";
      case 901:
        return "showNormal";
      case 903:
        return "update";
      case 904:
        return "viewName";
    }
    throw Error();
  }

  void registerCallbacks() {
    assert(thisCpp != null);
    final RegisterMethodIsReimplementedCallback registerCallback = _dylib
        .lookup<ffi.NativeFunction<RegisterMethodIsReimplementedCallback_FFI>>(
            'c_KDDockWidgets__flutter__DockWidget__registerVirtualMethodCallback')
        .asFunction();
    final callback825 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.activateWindow_calledFromC);
    registerCallback(thisCpp, callback825, 825);
    const callbackExcept835 = 0;
    final callback835 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.close_calledFromC, callbackExcept835);
    registerCallback(thisCpp, callback835, 835);
    final callback837 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsCore.View.createPlatformWindow_calledFromC);
    registerCallback(thisCpp, callback837, 837);
    const callbackExcept843 = 0;
    final callback843 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.flags_calledFromC, callbackExcept843);
    registerCallback(thisCpp, callback843, 843);
    final callback844 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.geometry_calledFromC);
    registerCallback(thisCpp, callback844, 844);
    final callback845 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.grabMouse_calledFromC);
    registerCallback(thisCpp, callback845, 845);
    const callbackExcept848 = 0;
    final callback848 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.hasFocus_calledFromC, callbackExcept848);
    registerCallback(thisCpp, callback848, 848);
    final callback850 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.hide_calledFromC);
    registerCallback(thisCpp, callback850, 850);
    final callback852 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.DockWidget.init_calledFromC);
    registerCallback(thisCpp, callback852, 852);
    const callbackExcept854 = 0;
    final callback854 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isActiveWindow_calledFromC, callbackExcept854);
    registerCallback(thisCpp, callback854, 854);
    const callbackExcept855 = 0;
    final callback855 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isExplicitlyHidden_calledFromC,
        callbackExcept855);
    registerCallback(thisCpp, callback855, 855);
    const callbackExcept856 = 0;
    final callback856 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMaximized_calledFromC, callbackExcept856);
    registerCallback(thisCpp, callback856, 856);
    const callbackExcept857 = 0;
    final callback857 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMinimized_calledFromC, callbackExcept857);
    registerCallback(thisCpp, callback857, 857);
    const callbackExcept927 = 0;
    final callback927 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isMounted_calledFromC, callbackExcept927);
    registerCallback(thisCpp, callback927, 927);
    const callbackExcept858 = 0;
    final callback858 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsCore.View.isNull_calledFromC, callbackExcept858);
    registerCallback(thisCpp, callback858, 858);
    const callbackExcept859 = 0;
    final callback859 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isRootView_calledFromC, callbackExcept859);
    registerCallback(thisCpp, callback859, 859);
    const callbackExcept860 = 0;
    final callback860 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.isVisible_calledFromC, callbackExcept860);
    registerCallback(thisCpp, callback860, 860);
    final callback861 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapFromGlobal_calledFromC);
    registerCallback(thisCpp, callback861, 861);
    final callback862 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapTo_calledFromC);
    registerCallback(thisCpp, callback862, 862);
    final callback863 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.mapToGlobal_calledFromC);
    registerCallback(thisCpp, callback863, 863);
    final callback864 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.DockWidget.maxSizeHint_calledFromC);
    registerCallback(thisCpp, callback864, 864);
    final callback865 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.DockWidget.minSize_calledFromC);
    registerCallback(thisCpp, callback865, 865);
    final callback869 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.move_2_calledFromC);
    registerCallback(thisCpp, callback869, 869);
    final callback870 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.normalGeometry_calledFromC);
    registerCallback(thisCpp, callback870, 870);
    final callback930 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildAdded_calledFromC);
    registerCallback(thisCpp, callback930, 930);
    final callback931 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildRemoved_calledFromC);
    registerCallback(thisCpp, callback931, 931);
    final callback932 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.onChildVisibilityChanged_calledFromC);
    registerCallback(thisCpp, callback932, 932);
    final callback934 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.onGeometryChanged_calledFromC);
    registerCallback(thisCpp, callback934, 934);
    final callback936 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.onRebuildRequested_calledFromC);
    registerCallback(thisCpp, callback936, 936);
    const callbackExcept872 = 0;
    final callback872 =
        ffi.Pointer.fromFunction<bool_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsCore.View.onResize_2_calledFromC, callbackExcept872);
    registerCallback(thisCpp, callback872, 872);
    final callback874 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.raise_calledFromC);
    registerCallback(thisCpp, callback874, 874);
    final callback875 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.raiseAndActivate_calledFromC);
    registerCallback(thisCpp, callback875, 875);
    final callback939 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.raiseChild_calledFromC);
    registerCallback(thisCpp, callback939, 939);
    final callback940 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.raiseWindow_calledFromC);
    registerCallback(thisCpp, callback940, 940);
    final callback877 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.releaseKeyboard_calledFromC);
    registerCallback(thisCpp, callback877, 877);
    final callback878 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.releaseMouse_calledFromC);
    registerCallback(thisCpp, callback878, 878);
    final callback881 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setCursor_calledFromC);
    registerCallback(thisCpp, callback881, 881);
    final callback882 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setFixedHeight_calledFromC);
    registerCallback(thisCpp, callback882, 882);
    final callback883 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setFixedWidth_calledFromC);
    registerCallback(thisCpp, callback883, 883);
    final callback884 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setGeometry_calledFromC);
    registerCallback(thisCpp, callback884, 884);
    final callback885 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setHeight_calledFromC);
    registerCallback(thisCpp, callback885, 885);
    final callback886 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setMaximumSize_calledFromC);
    registerCallback(thisCpp, callback886, 886);
    final callback887 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setMinimumSize_calledFromC);
    registerCallback(thisCpp, callback887, 887);
    final callback888 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            KDDWBindingsFlutter.View.setMouseTracking_calledFromC);
    registerCallback(thisCpp, callback888, 888);
    final callback889 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setParent_calledFromC);
    registerCallback(thisCpp, callback889, 889);
    final callback891 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setSize_2_calledFromC);
    registerCallback(thisCpp, callback891, 891);
    final callback892 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setViewName_calledFromC);
    registerCallback(thisCpp, callback892, 892);
    final callback893 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            KDDWBindingsFlutter.View.setVisible_calledFromC);
    registerCallback(thisCpp, callback893, 893);
    final callback894 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setWidth_calledFromC);
    registerCallback(thisCpp, callback894, 894);
    final callback895 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Double_FFI>(
            KDDWBindingsFlutter.View.setWindowOpacity_calledFromC);
    registerCallback(thisCpp, callback895, 895);
    final callback896 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.View.setWindowTitle_calledFromC);
    registerCallback(thisCpp, callback896, 896);
    final callback897 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.View.setZOrder_calledFromC);
    registerCallback(thisCpp, callback897, 897);
    final callback898 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.show_calledFromC);
    registerCallback(thisCpp, callback898, 898);
    final callback899 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showMaximized_calledFromC);
    registerCallback(thisCpp, callback899, 899);
    final callback900 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showMinimized_calledFromC);
    registerCallback(thisCpp, callback900, 900);
    final callback901 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.showNormal_calledFromC);
    registerCallback(thisCpp, callback901, 901);
    final callback903 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.update_calledFromC);
    registerCallback(thisCpp, callback903, 903);
    final callback904 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.View.viewName_calledFromC);
    registerCallback(thisCpp, callback904, 904);
  }
}

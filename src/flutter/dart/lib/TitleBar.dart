/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB TitleBar company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import 'package:KDDockWidgets/View_mixin.dart';
import 'package:KDDockWidgets/PositionedWidget.dart';
import 'package:KDDockWidgetsBindings/Bindings.dart' as KDDockWidgetBindings;
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsCore.dart'
    as KDDWBindingsCore;
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsFlutter.dart'
    as KDDWBindingsFlutter;

import 'package:flutter/material.dart';

class TitleBar extends KDDWBindingsFlutter.TitleBar with View_mixin {
  TitleBar(KDDWBindingsCore.TitleBar? titleBar, KDDWBindingsCore.View? parent)
      : super(titleBar, parent: parent) {
    m_fillsParent = true;
    initMixin(this, debugName: "TitleBar");
    print("TitleBar CTOR");
  }

  Widget createFlutterWidget() {
    return TitleBarWidget(kddwView, this, key: widgetKey);
  }
}

class TitleBarWidget extends PositionedWidget {
  final TitleBar TitleBarView;
  TitleBarWidget(var kddwView, this.TitleBarView, {Key? key})
      : super(kddwView, key: key);

  @override
  State<PositionedWidget> createState() {
    return TitleBarPositionedWidgetState(kddwView, TitleBarView);
  }
}

class TitleBarPositionedWidgetState extends PositionedWidgetState {
  final TitleBar titleBarView;

  TitleBarPositionedWidgetState(var kddwView, this.titleBarView)
      : super(kddwView);

  @override
  Widget buildContents() {
    return SizedBox(
        height: 30,
        child: Container(
            padding: EdgeInsets.fromLTRB(8, 3, 5, 0),
            color: Color(0xffF6E8EA),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    titleBarView.asTitleBarController().title().toDartString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: Icon(Icons.close))
              ],
            )));
  }
}

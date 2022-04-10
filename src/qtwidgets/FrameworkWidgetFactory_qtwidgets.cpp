/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2022 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "FrameworkWidgetFactory_qtwidgets.h"
#include "Config.h"

#include "private/indicators/ClassicIndicators_p.h"
#include "private/indicators/NullIndicators_p.h"
#include "private/Utils_p.h"

#include "controllers/TabBar.h"
#include "controllers/Stack.h"
#include "controllers/FloatingWindow.h"

#include "private/indicators/SegmentedIndicators_p.h"

#include "qtwidgets/views/FloatingWindow_qtwidgets.h"
#include "qtwidgets/views/DockWidget_qtwidgets.h"
#include "qtwidgets/views/Frame_qtwidgets.h"
#include "qtwidgets/views/MainWindow_qtwidgets.h"
#include "qtwidgets/views/View_qtwidgets.h"
#include "qtwidgets/views/Separator_qtwidgets.h"
#include "qtwidgets/views/TitleBar_qtwidgets.h"
#include "qtwidgets/views/TabBar_qtwidgets.h"
#include "qtwidgets/views/SideBar_qtwidgets.h"
#include "qtwidgets/views/Stack_qtwidgets.h"
#include "qtwidgets/views/MainWindow_qtwidgets.h"

#include <QRubberBand>
#include <QToolButton>


// clazy:excludeall=ctor-missing-parent-argument

using namespace KDDockWidgets;


DefaultWidgetFactory_qtwidgets::~DefaultWidgetFactory_qtwidgets()
{
}

View *DefaultWidgetFactory_qtwidgets::createMainWindow(Controllers::MainWindow *mainWindow, View *parent, Qt::WindowFlags flags) const
{
    return new Views::MainWindow_qtwidgets(mainWindow, parent ? static_cast<Views::View_qtwidgets<QMainWindow> *>(parent) : nullptr, flags);
}

View *DefaultWidgetFactory_qtwidgets::createDockWidget(Controllers::DockWidget *dw, Qt::WindowFlags flags) const
{
    return new Views::DockWidget_qtwidgets(dw, flags);
}

View *DefaultWidgetFactory_qtwidgets::createFrame(Controllers::Frame *controller, View *parent = nullptr,
                                                  FrameOptions) const
{
    // TODOv2: Remove options
    return new Views::Frame_qtwidgets(controller, parent ? parent->asQWidget() : nullptr);
}

View *DefaultWidgetFactory_qtwidgets::createTitleBar(Controllers::TitleBar *titleBar, Controllers::Frame *frame) const
{
    return new Views::TitleBar_qtwidgets(titleBar, frame->view()->asQWidget());
}

View *DefaultWidgetFactory_qtwidgets::createTitleBar(Controllers::TitleBar *titleBar, Controllers::FloatingWindow *fw) const
{
    return new Views::TitleBar_qtwidgets(titleBar, fw ? fw->view()->asQWidget() : nullptr);
}

View *DefaultWidgetFactory_qtwidgets::createTabBar(Controllers::TabBar *tabBar, View *parent) const
{
    return new Views::TabBar_qtwidgets(tabBar, parent->asQWidget());
}

View *DefaultWidgetFactory_qtwidgets::createTabWidget(Controllers::Stack *controller, Controllers::Frame *parent) const
{
    return new Views::Stack_qtwidgets(controller, parent);
}

View *DefaultWidgetFactory_qtwidgets::createSeparator(Controllers::Separator *controller, View *parent) const
{
    return new Views::Separator_qtwidgets(controller, parent ? static_cast<Views::View_qtwidgets<QWidget> *>(parent) : nullptr);
}

View *DefaultWidgetFactory_qtwidgets::createFloatingWindow(Controllers::FloatingWindow *controller,
                                                           Controllers::MainWindow *parent, Qt::WindowFlags windowFlags) const
{
    auto mainwindow = qobject_cast<QMainWindow *>(parent ? parent->view()->asQWidget() : nullptr);
    return new Views::FloatingWindow_qtwidgets(controller, mainwindow, windowFlags);
}

DropIndicatorOverlayInterface *DefaultWidgetFactory_qtwidgets::createDropIndicatorOverlay(DropArea *dropArea) const
{
#ifdef Q_OS_WASM
    // On WASM windows don't support translucency, which is required for the classic indicators.
    return new SegmentedIndicators(dropArea);
#endif

    switch (s_dropIndicatorType) {
    case DropIndicatorType::Classic:
        return new ClassicIndicators(dropArea);
    case DropIndicatorType::Segmented:
        return new SegmentedIndicators(dropArea);
    case DropIndicatorType::None:
        return new NullIndicators(dropArea);
    }

    return new ClassicIndicators(dropArea);
}

QWidgetOrQuick *DefaultWidgetFactory_qtwidgets::createRubberBand(QWidgetOrQuick *parent) const
{
    return new QRubberBand(QRubberBand::Rectangle, parent);
}

View *DefaultWidgetFactory_qtwidgets::createSideBar(Controllers::SideBar *controller,
                                                    Controllers::MainWindow *parent) const
{
    return new Views::SideBar_qtwidgets(controller, parent->view()->asQWidget());
}

QAbstractButton *DefaultWidgetFactory_qtwidgets::createTitleBarButton(QWidget *parent, TitleBarButtonType type) const
{
    if (!parent) {
        qWarning() << Q_FUNC_INFO << "Parent not provided";
        return nullptr;
    }

    auto button = new Views::Button(parent);
    button->setIcon(iconForButtonType(type, parent->devicePixelRatioF()));

    return button;
}

// iconForButtonType impl is the same for QtQuick and QtWidgets
QIcon DefaultWidgetFactory_qtwidgets::iconForButtonType(TitleBarButtonType type, qreal dpr) const
{
    QString iconName;
    switch (type) {
    case TitleBarButtonType::AutoHide:
        iconName = QStringLiteral("auto-hide");
        break;
    case TitleBarButtonType::UnautoHide:
        iconName = QStringLiteral("unauto-hide");
        break;
    case TitleBarButtonType::Close:
        iconName = QStringLiteral("close");
        break;
    case TitleBarButtonType::Minimize:
        iconName = QStringLiteral("min");
        break;
    case TitleBarButtonType::Maximize:
        iconName = QStringLiteral("max");
        break;
    case TitleBarButtonType::Normal:
        // We're using the same icon as dock/float
        iconName = QStringLiteral("dock-float");
        break;
    case TitleBarButtonType::Float:
        iconName = QStringLiteral("dock-float");
        break;
    }

    if (iconName.isEmpty())
        return {};

    QIcon icon(QStringLiteral(":/img/%1.png").arg(iconName));
    if (!scalingFactorIsSupported(dpr))
        return icon;

    // Not using Qt's sugar syntax, which doesn't support 1.5x anyway when we need it.
    // Simply add the high-res files and Qt will pick them when needed

    if (scalingFactorIsSupported(1.5))
        icon.addFile(QStringLiteral(":/img/%1-1.5x.png").arg(iconName));

    icon.addFile(QStringLiteral(":/img/%1-2x.png").arg(iconName));

    return icon;
}

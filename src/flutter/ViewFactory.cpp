/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "ViewFactory.h"
#include "Config.h"

#include "core/Utils_p.h"

#include "kddockwidgets/core/TabBar.h"
#include "kddockwidgets/core/Stack.h"
#include "kddockwidgets/core/FloatingWindow.h"
#include "kddockwidgets/core/indicators/ClassicIndicators.h"
#include "kddockwidgets/core/indicators/NullIndicators.h"
#include "kddockwidgets/core/indicators/SegmentedIndicators.h"
#include "kddockwidgets/core/MainWindow.h"

// #include "qtwidgets/views/ClassicIndicatorsWindow.h"
// #include "qtwidgets/views/SegmentedIndicatorsOverlay.h"
// #include "qtwidgets/views/FloatingWindow.h"
// #include "qtwidgets/views/DockWidget.h"
// #include "qtwidgets/views/DropArea.h"
// #include "qtwidgets/views/Group.h"
// #include "qtwidgets/views/View.h"
// #include "qtwidgets/views/Separator.h"
// #include "qtwidgets/views/TitleBar.h"
// #include "qtwidgets/views/TabBar.h"
// #include "qtwidgets/views/SideBar.h"
// #include "qtwidgets/views/Stack.h"
// #include "qtwidgets/views/MainWindow.h"
// #include "qtwidgets/views/MDILayout.h"
// #include "qtwidgets/views/RubberBand.h"

#include "views/ClassicIndicatorWindowViewInterface.h"


// clazy:excludeall=ctor-missing-parent-argument

using namespace KDDockWidgets;
using namespace KDDockWidgets::flutter;

ViewFactory::~ViewFactory()
{
}

Core::View *ViewFactory::createDockWidget(const QString &, DockWidgetOptions, LayoutSaverOptions,
                                          Qt::WindowFlags) const
{
    return {};
}


Core::View *ViewFactory::createGroup(Core::Group *, Core::View *) const
{
    Q_ASSERT(false);
    return {};
}

Core::View *ViewFactory::createTitleBar(Core::TitleBar *, Core::View *) const
{
    return {};
}

Core::View *ViewFactory::createTabBar(Core::TabBar *, Core::View *) const
{
    return {};
}

Core::View *ViewFactory::createStack(Core::Stack *, Core::View *) const
{
    return {};
}

Core::View *ViewFactory::createSeparator(Core::Separator *, Core::View *) const
{
    return {};
}

Core::View *ViewFactory::createFloatingWindow(Core::FloatingWindow *,
                                              Core::MainWindow *, Qt::WindowFlags) const
{
    return {};
}

Core::View *ViewFactory::createRubberBand(Core::View *) const
{
    return nullptr;
}

Core::View *ViewFactory::createSideBar(Core::SideBar *, Core::View *) const
{
    return {};
}

QAbstractButton *ViewFactory::createTitleBarButton(QWidget *, TitleBarButtonType) const
{
    return nullptr;
}

// iconForButtonType impl is the same for QtQuick and QtWidgets
Icon ViewFactory::iconForButtonType(TitleBarButtonType, qreal) const
{
    return {};
}

Core::View *ViewFactory::createDropArea(Core::DropArea *, Core::View *) const
{
    return {};
}

Core::View *ViewFactory::createMDILayout(Core::MDILayout *, Core::View *) const
{
    return {};
}

Core::View *
ViewFactory::createSegmentedDropIndicatorOverlayView(Core::SegmentedIndicators *,
                                                     Core::View *) const
{
    return {};
}

Core::ClassicIndicatorWindowViewInterface *
ViewFactory::createClassicIndicatorWindow(Core::ClassicIndicators *) const
{
    return {};
}
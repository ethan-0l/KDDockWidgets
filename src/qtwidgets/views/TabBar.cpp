/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "TabBar.h"
#include "Stack.h"
#include "DockWidget.h"
#include "kddockwidgets/core/DockWidget.h"
#include "kddockwidgets/core/TabBar.h"
#include "kddockwidgets/core/Stack.h"
#include "core/Utils_p.h"
#include "core/Logging_p.h"
#include "Config.h"
#include "kddockwidgets/ViewFactory.h"
#include "kddockwidgets/core/DockRegistry.h"

#include <QMouseEvent>
#include <QApplication>
#include <QProxyStyle>

using namespace KDDockWidgets;
using namespace KDDockWidgets::qtwidgets;

namespace KDDockWidgets {
namespace { // anonymous namespace to silence -Wweak-vtables
class MyProxy : public QProxyStyle
{
public:
    MyProxy()
        : QProxyStyle(qApp->style())
    {
        setParent(qApp);
    }

    int styleHint(QStyle::StyleHint hint, const QStyleOption *option = nullptr,
                  const QWidget *widget = nullptr,
                  QStyleHintReturn *returnData = nullptr) const override
    {
        if (hint == QStyle::SH_Widget_Animation_Duration) {
            // QTabBar has a bug which causes the paint event to dereference a tab which was already
            // removed. Because, after the tab being removed, the d->pressedIndex is only reset
            // after the animation ends. So disable the animation. Crash can be repro by enabling
            // movable tabs, and detaching a tab quickly from a floating window containing two dock
            // widgets. Reproduced on Windows
            return 0;
        }
        return baseStyle()->styleHint(hint, option, widget, returnData);
    }
};
}

static MyProxy *proxyStyle()
{
    static auto *proxy = new MyProxy;
    return proxy;
}

}


TabBar::TabBar(Core::TabBar *controller, QWidget *parent)
    : View_qtwidgets(controller, Core::ViewType::TabBar, parent)
    , TabBarViewInterface(controller)
    , m_controller(controller)
{
    setStyle(proxyStyle());
}

void TabBar::init()
{
    connect(this, &QTabBar::currentChanged, m_tabBar, &Core::TabBar::setCurrentIndex);
}

int TabBar::tabAt(QPoint localPos) const
{
    return QTabBar::tabAt(localPos);
}

void TabBar::mousePressEvent(QMouseEvent *e)
{
    m_controller->onMousePress(e->pos());
    QTabBar::mousePressEvent(e);
}

void TabBar::mouseMoveEvent(QMouseEvent *e)
{
    if (count() > 1) {
        // Only allow to re-order tabs if we have more than 1 tab, otherwise it's just weird.
        QTabBar::mouseMoveEvent(e);
    }
}

void TabBar::mouseDoubleClickEvent(QMouseEvent *e)
{
    m_controller->onMouseDoubleClick(e->pos());
}

bool TabBar::event(QEvent *ev)
{
    // Qt has a bug in QWidgetPrivate::deepestFocusProxy(), it doesn't honour visibility
    // of the focus scope. Once an hidden widget is focused the chain is broken and tab
    // stops working (#180)

    auto parent = parentWidget();
    if (!parent)
        return QTabBar::event(ev);

    const bool result = QTabBar::event(ev);

    if (ev->type() == QEvent::Show) {
        parent->setFocusProxy(this);
    } else if (ev->type() == QEvent::Hide) {
        parent->setFocusProxy(nullptr);
    }

    return result;
}

QString TabBar::text(int index) const
{
    return tabText(index);
}

QRect TabBar::rectForTab(int index) const
{
    return QTabBar::tabRect(index);
}

void TabBar::moveTabTo(int from, int to)
{
    moveTab(from, to);
}

void TabBar::tabInserted(int index)
{
    QTabBar::tabInserted(index);
    Q_EMIT dockWidgetInserted(index);
}

void TabBar::tabRemoved(int index)
{
    QTabBar::tabRemoved(index);
    Q_EMIT dockWidgetRemoved(index);
}

void TabBar::setCurrentIndex(int index)
{
    QTabBar::setCurrentIndex(index);
}

QTabWidget *TabBar::tabWidget() const
{
    if (auto tw = dynamic_cast<Stack *>(m_controller->stack()->view()))
        return tw;

    qWarning() << Q_FUNC_INFO << "Unexpected null QTabWidget";
    return nullptr;
}

void TabBar::renameTab(int index, const QString &text)
{
    setTabText(index, text);
}

void TabBar::changeTabIcon(int index, const QIcon &icon)
{
    setTabIcon(index, icon);
}

void TabBar::removeDockWidget(Core::DockWidget *dw)
{
    auto tabWidget = static_cast<QTabWidget *>(View_qt::asQWidget(m_tabBar->stack()));
    tabWidget->removeTab(m_tabBar->indexOfDockWidget(dw));
}

void TabBar::insertDockWidget(int index, Core::DockWidget *dw, const QIcon &icon,
                              const QString &title)
{
    auto tabWidget = static_cast<QTabWidget *>(View_qt::asQWidget(m_tabBar->stack()));
    tabWidget->insertTab(index, View_qt::asQWidget(dw), icon, title);
}

void TabBar::setTabsAreMovable(bool are)
{
    QTabBar::setMovable(are);
}

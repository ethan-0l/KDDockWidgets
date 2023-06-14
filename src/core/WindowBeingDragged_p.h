/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#ifndef KD_WINDOWBEINGDRAGGED_P_H
#define KD_WINDOWBEINGDRAGGED_P_H

#include "kddockwidgets/docks_export.h"
#include "core/View.h"
#include "core/ViewGuard.h"

#include <QPointer>

namespace KDDockWidgets {

namespace Core {

class Group;
class FloatingWindow;
class Layout;
class Draggable;

struct DOCKS_EXPORT_FOR_UNIT_TESTS WindowBeingDragged
{
public:
    explicit WindowBeingDragged(FloatingWindow *fw, Draggable *draggable);

#ifdef DOCKS_DEVELOPER_MODE
    // For tests.
    explicit WindowBeingDragged(FloatingWindow *fw);
#endif

    virtual ~WindowBeingDragged();
    void init();

    FloatingWindow *floatingWindow() const;

    /// Convenience that returns the floating window as a view (QWidget/QQuickItem/etc) instead of the controller
    Core::View *floatingWindowView() const;

    ///@brief grabs or releases the mouse
    void grabMouse(bool grab);

    /// @brief returns whether this window being dragged contains the specified drop area
    /// useful since we don't want to drop onto ourselves.
    bool contains(Layout *) const;

    ///@brief returns the affinities of the window being dragged
    virtual QStringList affinities() const;

    ///@brief size of the window being dragged contents
    virtual QSize size() const;

    /// @brief returns the min-size of the window being dragged contents
    virtual QSize minSize() const;

    /// @brief returns the max-size of the window being dragged contents
    virtual QSize maxSize() const;

    /// @brief Returns a pixmap representing this Window. For purposes of QDrag. Wayland only.
    virtual Pixmap pixmap() const;

    /// @brief Returns the list of dock widgets being dragged
    virtual QVector<DockWidget *> dockWidgets() const;

    /// @brief Returns the draggable
    Draggable *draggable() const;

    void updateTransparency(bool enable);

protected:
    explicit WindowBeingDragged(Draggable *);
    Q_DISABLE_COPY(WindowBeingDragged)
    QPointer<FloatingWindow> m_floatingWindow;
    Draggable *const m_draggable;
    View *m_draggableView = nullptr;
    ViewGuard m_guard;
};

struct WindowBeingDraggedWayland : public WindowBeingDragged
{
public:
    explicit WindowBeingDraggedWayland(Draggable *draggable);
    ~WindowBeingDraggedWayland() override;

    QSize size() const override;
    QSize minSize() const override;
    QSize maxSize() const override;
    Pixmap pixmap() const override;
    QStringList affinities() const override;
    QVector<DockWidget *> dockWidgets() const override;

    // These two are set for Wayland only, where we can't make the floating window immediately (no
    // way to position it) So we're dragging either a group with multiple dock widgets or a single
    // tab, keep them here. It's important to know what we're dragging, so drop rubber band respect
    // min/max sizes.
    QPointer<Group> m_group;
    QPointer<DockWidget> m_dockWidget;
};

}

}

#endif

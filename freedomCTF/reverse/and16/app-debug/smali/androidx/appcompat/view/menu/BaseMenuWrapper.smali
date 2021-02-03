.class abstract Landroidx/appcompat/view/menu/BaseMenuWrapper;
.super Ljava/lang/Object;
.source "BaseMenuWrapper.java"


# instance fields
.field final mContext:Landroid/content/Context;

.field private mMenuItems:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/core/internal/view/SupportMenuItem;",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSubMenus:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/core/internal/view/SupportSubMenu;",
            "Landroid/view/SubMenu;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mContext:Landroid/content/Context;

    .line 39
    return-void
.end method


# virtual methods
.method final getMenuItemWrapper(Landroid/view/MenuItem;)Landroid/view/MenuItem;
    .locals 4
    .param p1, "menuItem"    # Landroid/view/MenuItem;

    .line 42
    instance-of v0, p1, Landroidx/core/internal/view/SupportMenuItem;

    if-eqz v0, :cond_2

    .line 43
    move-object v0, p1

    check-cast v0, Landroidx/core/internal/view/SupportMenuItem;

    .line 46
    .local v0, "supportMenuItem":Landroidx/core/internal/view/SupportMenuItem;
    iget-object v1, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    if-nez v1, :cond_0

    .line 47
    new-instance v1, Landroidx/collection/ArrayMap;

    invoke-direct {v1}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v1, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    .line 51
    :cond_0
    iget-object v1, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MenuItem;

    .line 53
    .local v1, "wrappedItem":Landroid/view/MenuItem;
    if-nez v1, :cond_1

    .line 55
    new-instance v2, Landroidx/appcompat/view/menu/MenuItemWrapperICS;

    iget-object v3, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, v0}, Landroidx/appcompat/view/menu/MenuItemWrapperICS;-><init>(Landroid/content/Context;Landroidx/core/internal/view/SupportMenuItem;)V

    move-object v1, v2

    .line 56
    iget-object v2, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    :cond_1
    return-object v1

    .line 61
    .end local v0    # "supportMenuItem":Landroidx/core/internal/view/SupportMenuItem;
    .end local v1    # "wrappedItem":Landroid/view/MenuItem;
    :cond_2
    return-object p1
.end method

.method final getSubMenuWrapper(Landroid/view/SubMenu;)Landroid/view/SubMenu;
    .locals 4
    .param p1, "subMenu"    # Landroid/view/SubMenu;

    .line 65
    instance-of v0, p1, Landroidx/core/internal/view/SupportSubMenu;

    if-eqz v0, :cond_2

    .line 66
    move-object v0, p1

    check-cast v0, Landroidx/core/internal/view/SupportSubMenu;

    .line 69
    .local v0, "supportSubMenu":Landroidx/core/internal/view/SupportSubMenu;
    iget-object v1, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    if-nez v1, :cond_0

    .line 70
    new-instance v1, Landroidx/collection/ArrayMap;

    invoke-direct {v1}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v1, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    .line 73
    :cond_0
    iget-object v1, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/SubMenu;

    .line 75
    .local v1, "wrappedMenu":Landroid/view/SubMenu;
    if-nez v1, :cond_1

    .line 76
    new-instance v2, Landroidx/appcompat/view/menu/SubMenuWrapperICS;

    iget-object v3, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, v0}, Landroidx/appcompat/view/menu/SubMenuWrapperICS;-><init>(Landroid/content/Context;Landroidx/core/internal/view/SupportSubMenu;)V

    move-object v1, v2

    .line 77
    iget-object v2, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    :cond_1
    return-object v1

    .line 81
    .end local v0    # "supportSubMenu":Landroidx/core/internal/view/SupportSubMenu;
    .end local v1    # "wrappedMenu":Landroid/view/SubMenu;
    :cond_2
    return-object p1
.end method

.method final internalClear()V
    .locals 1

    .line 86
    iget-object v0, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 87
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 89
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    if-eqz v0, :cond_1

    .line 90
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 92
    :cond_1
    return-void
.end method

.method final internalRemoveGroup(I)V
    .locals 3
    .param p1, "groupId"    # I

    .line 95
    iget-object v0, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 96
    return-void

    .line 99
    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 102
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroidx/core/internal/view/SupportMenuItem;>;"
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 103
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MenuItem;

    .line 104
    .local v1, "menuItem":Landroid/view/MenuItem;
    invoke-interface {v1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v2

    if-ne p1, v2, :cond_1

    .line 105
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 108
    .end local v1    # "menuItem":Landroid/view/MenuItem;
    :cond_2
    return-void
.end method

.method final internalRemoveItem(I)V
    .locals 3
    .param p1, "id"    # I

    .line 111
    iget-object v0, p0, Landroidx/appcompat/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 112
    return-void

    .line 115
    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 118
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroidx/core/internal/view/SupportMenuItem;>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 119
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MenuItem;

    .line 120
    .local v1, "menuItem":Landroid/view/MenuItem;
    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    if-ne p1, v2, :cond_1

    .line 121
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 125
    .end local v1    # "menuItem":Landroid/view/MenuItem;
    :cond_2
    return-void
.end method

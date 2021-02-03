.class public Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;
.super Landroid/view/ViewGroup;
.source "BottomNavigationMenuView.java"

# interfaces
.implements Landroidx/appcompat/view/menu/MenuView;


# static fields
.field private static final ACTIVE_ANIMATION_DURATION_MS:J = 0x73L

.field private static final CHECKED_STATE_SET:[I

.field private static final DISABLED_STATE_SET:[I

.field private static final ITEM_POOL_SIZE:I = 0x5


# instance fields
.field private final activeItemMaxWidth:I

.field private final activeItemMinWidth:I

.field private badgeDrawables:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/google/android/material/badge/BadgeDrawable;",
            ">;"
        }
    .end annotation
.end field

.field private buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

.field private final inactiveItemMaxWidth:I

.field private final inactiveItemMinWidth:I

.field private itemBackground:Landroid/graphics/drawable/Drawable;

.field private itemBackgroundRes:I

.field private final itemHeight:I

.field private itemHorizontalTranslationEnabled:Z

.field private itemIconSize:I

.field private itemIconTint:Landroid/content/res/ColorStateList;

.field private final itemPool:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;",
            ">;"
        }
    .end annotation
.end field

.field private itemTextAppearanceActive:I

.field private itemTextAppearanceInactive:I

.field private final itemTextColorDefault:Landroid/content/res/ColorStateList;

.field private itemTextColorFromUser:Landroid/content/res/ColorStateList;

.field private labelVisibilityMode:I

.field private menu:Landroidx/appcompat/view/menu/MenuBuilder;

.field private final onClickListener:Landroid/view/View$OnClickListener;

.field private presenter:Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;

.field private selectedItemId:I

.field private selectedItemPosition:I

.field private final set:Landroidx/transition/TransitionSet;

.field private tempChildWidths:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 60
    const/4 v0, 0x1

    new-array v1, v0, [I

    const v2, 0x10100a0

    const/4 v3, 0x0

    aput v2, v1, v3

    sput-object v1, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->CHECKED_STATE_SET:[I

    .line 61
    new-array v0, v0, [I

    const v1, -0x101009e

    aput v1, v0, v3

    sput-object v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->DISABLED_STATE_SET:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 95
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 99
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 70
    new-instance v0, Landroidx/core/util/Pools$SynchronizedPool;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroidx/core/util/Pools$SynchronizedPool;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemPool:Landroidx/core/util/Pools$Pool;

    .line 77
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    .line 78
    iput v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    .line 89
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    .line 100
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 101
    .local v2, "res":Landroid/content/res/Resources;
    sget v3, Lcom/google/android/material/R$dimen;->design_bottom_navigation_item_max_width:I

    .line 102
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->inactiveItemMaxWidth:I

    .line 103
    sget v3, Lcom/google/android/material/R$dimen;->design_bottom_navigation_item_min_width:I

    .line 104
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->inactiveItemMinWidth:I

    .line 105
    sget v3, Lcom/google/android/material/R$dimen;->design_bottom_navigation_active_item_max_width:I

    .line 106
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->activeItemMaxWidth:I

    .line 107
    sget v3, Lcom/google/android/material/R$dimen;->design_bottom_navigation_active_item_min_width:I

    .line 108
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->activeItemMinWidth:I

    .line 109
    sget v3, Lcom/google/android/material/R$dimen;->design_bottom_navigation_height:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemHeight:I

    .line 110
    const v3, 0x1010038

    invoke-virtual {p0, v3}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->createDefaultColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextColorDefault:Landroid/content/res/ColorStateList;

    .line 112
    new-instance v3, Landroidx/transition/AutoTransition;

    invoke-direct {v3}, Landroidx/transition/AutoTransition;-><init>()V

    iput-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->set:Landroidx/transition/TransitionSet;

    .line 113
    invoke-virtual {v3, v0}, Landroidx/transition/TransitionSet;->setOrdering(I)Landroidx/transition/TransitionSet;

    .line 114
    const-wide/16 v4, 0x73

    invoke-virtual {v3, v4, v5}, Landroidx/transition/TransitionSet;->setDuration(J)Landroidx/transition/TransitionSet;

    .line 115
    new-instance v0, Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;

    invoke-direct {v0}, Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;-><init>()V

    invoke-virtual {v3, v0}, Landroidx/transition/TransitionSet;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroidx/transition/TransitionSet;

    .line 116
    new-instance v0, Lcom/google/android/material/internal/TextScale;

    invoke-direct {v0}, Lcom/google/android/material/internal/TextScale;-><init>()V

    invoke-virtual {v3, v0}, Landroidx/transition/TransitionSet;->addTransition(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    .line 118
    new-instance v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView$1;

    invoke-direct {v0, p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView$1;-><init>(Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;)V

    iput-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->onClickListener:Landroid/view/View$OnClickListener;

    .line 129
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->tempChildWidths:[I

    .line 130
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;)Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;

    .line 56
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->presenter:Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;)Landroidx/appcompat/view/menu/MenuBuilder;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;

    .line 56
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    return-object v0
.end method

.method private getNewItem()Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    .locals 3

    .line 587
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v0}, Landroidx/core/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    .line 588
    .local v0, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    if-nez v0, :cond_0

    .line 589
    new-instance v1, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;-><init>(Landroid/content/Context;)V

    move-object v0, v1

    .line 591
    :cond_0
    return-object v0
.end method

.method private isShifting(II)Z
    .locals 3
    .param p1, "labelVisibilityMode"    # I
    .param p2, "childCount"    # I

    .line 599
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne p1, v2, :cond_0

    const/4 v2, 0x3

    if-le p2, v2, :cond_1

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    :goto_0
    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method private isValidId(I)Z
    .locals 1
    .param p1, "viewId"    # I

    .line 712
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private removeUnusedBadges()V
    .locals 4

    .line 683
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 685
    .local v0, "activeKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroidx/appcompat/view/menu/MenuBuilder;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 686
    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v2, v1}, Landroidx/appcompat/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 685
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 689
    .end local v1    # "i":I
    :cond_0
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 690
    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    .line 691
    .local v2, "key":I
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 692
    iget-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->delete(I)V

    .line 689
    .end local v2    # "key":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 695
    .end local v1    # "i":I
    :cond_2
    return-void
.end method

.method private setBadgeIfNeeded(Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;)V
    .locals 2
    .param p1, "child"    # Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    .line 670
    invoke-virtual {p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->getId()I

    move-result v0

    .line 671
    .local v0, "childId":I
    invoke-direct {p0, v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->isValidId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 673
    return-void

    .line 676
    :cond_0
    iget-object v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/badge/BadgeDrawable;

    .line 677
    .local v1, "badgeDrawable":Lcom/google/android/material/badge/BadgeDrawable;
    if-eqz v1, :cond_1

    .line 678
    invoke-virtual {p1, v1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setBadge(Lcom/google/android/material/badge/BadgeDrawable;)V

    .line 680
    :cond_1
    return-void
.end method

.method private validateMenuItemId(I)V
    .locals 3
    .param p1, "viewId"    # I

    .line 716
    invoke-direct {p0, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->isValidId(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 719
    return-void

    .line 717
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " is not a valid view id"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public buildMenuView()V
    .locals 6

    .line 497
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->removeAllViews()V

    .line 498
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 499
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    .line 500
    .local v4, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    if-eqz v4, :cond_0

    .line 501
    iget-object v5, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v5, v4}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 502
    invoke-virtual {v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->removeBadge()V

    .line 499
    .end local v4    # "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 507
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroidx/appcompat/view/menu/MenuBuilder;->size()I

    move-result v0

    if-nez v0, :cond_2

    .line 508
    iput v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    .line 509
    iput v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    .line 510
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    .line 511
    return-void

    .line 513
    :cond_2
    invoke-direct {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->removeUnusedBadges()V

    .line 515
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroidx/appcompat/view/menu/MenuBuilder;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    iput-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    .line 516
    iget v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->labelVisibilityMode:I

    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroidx/appcompat/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {p0, v0, v2}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->isShifting(II)Z

    move-result v0

    .line 517
    .local v0, "shifting":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v3}, Landroidx/appcompat/view/menu/MenuBuilder;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_5

    .line 518
    iget-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->presenter:Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;->setUpdateSuspended(Z)V

    .line 519
    iget-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v3, v2}, Landroidx/appcompat/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 520
    iget-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->presenter:Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;

    invoke-virtual {v3, v1}, Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;->setUpdateSuspended(Z)V

    .line 521
    invoke-direct {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getNewItem()Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    move-result-object v3

    .line 522
    .local v3, "child":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    aput-object v3, v4, v2

    .line 523
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemIconTint:Landroid/content/res/ColorStateList;

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 524
    iget v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemIconSize:I

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setIconSize(I)V

    .line 526
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextColorDefault:Landroid/content/res/ColorStateList;

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 527
    iget v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextAppearanceInactive:I

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextAppearanceInactive(I)V

    .line 528
    iget v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextAppearanceActive:I

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextAppearanceActive(I)V

    .line 529
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextColorFromUser:Landroid/content/res/ColorStateList;

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 530
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_3

    .line 531
    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 533
    :cond_3
    iget v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemBackgroundRes:I

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setItemBackground(I)V

    .line 535
    :goto_2
    invoke-virtual {v3, v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setShifting(Z)V

    .line 536
    iget v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->labelVisibilityMode:I

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setLabelVisibilityMode(I)V

    .line 537
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v4, v2}, Landroidx/appcompat/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    check-cast v4, Landroidx/appcompat/view/menu/MenuItemImpl;

    invoke-virtual {v3, v4, v1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->initialize(Landroidx/appcompat/view/menu/MenuItemImpl;I)V

    .line 538
    invoke-virtual {v3, v2}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setItemPosition(I)V

    .line 539
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 540
    iget v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v4, v2}, Landroidx/appcompat/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    iget v5, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    if-ne v4, v5, :cond_4

    .line 541
    iput v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    .line 543
    :cond_4
    invoke-direct {p0, v3}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->setBadgeIfNeeded(Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;)V

    .line 544
    invoke-virtual {p0, v3}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->addView(Landroid/view/View;)V

    .line 517
    .end local v3    # "child":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 546
    .end local v2    # "i":I
    :cond_5
    iget-object v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroidx/appcompat/view/menu/MenuBuilder;->size()I

    move-result v1

    sub-int/2addr v1, v4

    iget v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    .line 547
    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v2, v1}, Landroidx/appcompat/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 548
    return-void
.end method

.method public createDefaultColorStateList(I)Landroid/content/res/ColorStateList;
    .locals 12
    .param p1, "baseColorThemeAttr"    # I

    .line 473
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 474
    .local v0, "value":Landroid/util/TypedValue;
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    .line 475
    return-object v3

    .line 477
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v4, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-static {v1, v4}, Landroidx/appcompat/content/res/AppCompatResources;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 478
    .local v1, "baseColor":Landroid/content/res/ColorStateList;
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 479
    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    sget v5, Landroidx/appcompat/R$attr;->colorPrimary:I

    .line 480
    invoke-virtual {v4, v5, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v4

    if-nez v4, :cond_1

    .line 481
    return-object v3

    .line 483
    :cond_1
    iget v3, v0, Landroid/util/TypedValue;->data:I

    .line 484
    .local v3, "colorPrimary":I
    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    .line 485
    .local v4, "defaultColor":I
    new-instance v5, Landroid/content/res/ColorStateList;

    const/4 v6, 0x3

    new-array v7, v6, [[I

    sget-object v8, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->DISABLED_STATE_SET:[I

    const/4 v9, 0x0

    aput-object v8, v7, v9

    sget-object v10, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->CHECKED_STATE_SET:[I

    aput-object v10, v7, v2

    sget-object v10, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->EMPTY_STATE_SET:[I

    const/4 v11, 0x2

    aput-object v10, v7, v11

    new-array v6, v6, [I

    .line 488
    invoke-virtual {v1, v8, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    aput v8, v6, v9

    aput v3, v6, v2

    aput v4, v6, v11

    invoke-direct {v5, v7, v6}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 485
    return-object v5
.end method

.method findItemView(I)Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    .locals 5
    .param p1, "menuItemId"    # I

    .line 700
    invoke-direct {p0, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->validateMenuItemId(I)V

    .line 701
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_1

    .line 702
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 703
    .local v3, "itemView":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->getId()I

    move-result v4

    if-ne v4, p1, :cond_0

    .line 704
    return-object v3

    .line 702
    .end local v3    # "itemView":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 708
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method getBadge(I)Lcom/google/android/material/badge/BadgeDrawable;
    .locals 1
    .param p1, "menuItemId"    # I

    .line 632
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/badge/BadgeDrawable;

    return-object v0
.end method

.method getBadgeDrawables()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/google/android/material/badge/BadgeDrawable;",
            ">;"
        }
    .end annotation

    .line 618
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    return-object v0
.end method

.method public getIconTintList()Landroid/content/res/ColorStateList;
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemIconTint:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getItemBackground()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 413
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_0

    array-length v1, v0

    if-lez v1, :cond_0

    .line 416
    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    .line 418
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getItemBackgroundRes()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 389
    iget v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemBackgroundRes:I

    return v0
.end method

.method public getItemIconSize()I
    .locals 1

    .line 283
    iget v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemIconSize:I

    return v0
.end method

.method public getItemTextAppearanceActive()I
    .locals 1

    .line 364
    iget v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextAppearanceActive:I

    return v0
.end method

.method public getItemTextAppearanceInactive()I
    .locals 1

    .line 335
    iget v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextAppearanceInactive:I

    return v0
.end method

.method public getItemTextColor()Landroid/content/res/ColorStateList;
    .locals 1

    .line 306
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextColorFromUser:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getLabelVisibilityMode()I
    .locals 1

    .line 445
    iget v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->labelVisibilityMode:I

    return v0
.end method

.method getOrCreateBadge(I)Lcom/google/android/material/badge/BadgeDrawable;
    .locals 2
    .param p1, "menuItemId"    # I

    .line 643
    invoke-direct {p0, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->validateMenuItemId(I)V

    .line 644
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/badge/BadgeDrawable;

    .line 646
    .local v0, "badgeDrawable":Lcom/google/android/material/badge/BadgeDrawable;
    if-nez v0, :cond_0

    .line 647
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/material/badge/BadgeDrawable;->create(Landroid/content/Context;)Lcom/google/android/material/badge/BadgeDrawable;

    move-result-object v0

    .line 648
    iget-object v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 650
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->findItemView(I)Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    move-result-object v1

    .line 651
    .local v1, "itemView":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    if-eqz v1, :cond_1

    .line 652
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setBadge(Lcom/google/android/material/badge/BadgeDrawable;)V

    .line 654
    :cond_1
    return-object v0
.end method

.method public getSelectedItemId()I
    .locals 1

    .line 595
    iget v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    return v0
.end method

.method public getWindowAnimations()I
    .locals 1

    .line 237
    const/4 v0, 0x0

    return v0
.end method

.method public initialize(Landroidx/appcompat/view/menu/MenuBuilder;)V
    .locals 0
    .param p1, "menu"    # Landroidx/appcompat/view/menu/MenuBuilder;

    .line 134
    iput-object p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 135
    return-void
.end method

.method public isItemHorizontalTranslationEnabled()Z
    .locals 1

    .line 468
    iget-boolean v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemHorizontalTranslationEnabled:Z

    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 9
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 217
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getChildCount()I

    move-result v0

    .line 218
    .local v0, "count":I
    sub-int v1, p4, p2

    .line 219
    .local v1, "width":I
    sub-int v2, p5, p3

    .line 220
    .local v2, "height":I
    const/4 v3, 0x0

    .line 221
    .local v3, "used":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v0, :cond_2

    .line 222
    invoke-virtual {p0, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 223
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_0

    .line 224
    goto :goto_2

    .line 226
    :cond_0
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-ne v6, v8, :cond_1

    .line 227
    sub-int v6, v1, v3

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    sub-int/2addr v6, v8

    sub-int v8, v1, v3

    invoke-virtual {v5, v6, v7, v8, v2}, Landroid/view/View;->layout(IIII)V

    goto :goto_1

    .line 229
    :cond_1
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    add-int/2addr v6, v3

    invoke-virtual {v5, v3, v7, v6, v2}, Landroid/view/View;->layout(IIII)V

    .line 231
    :goto_1
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    add-int/2addr v3, v6

    .line 221
    .end local v5    # "child":Landroid/view/View;
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 233
    .end local v4    # "i":I
    :cond_2
    return-void
.end method

.method protected onMeasure(II)V
    .locals 19
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 139
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 141
    .local v1, "width":I
    iget-object v2, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroidx/appcompat/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 143
    .local v2, "visibleCount":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getChildCount()I

    move-result v3

    .line 145
    .local v3, "totalCount":I
    iget v4, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemHeight:I

    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 147
    .local v4, "heightSpec":I
    iget v6, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->labelVisibilityMode:I

    invoke-direct {v0, v6, v2}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->isShifting(II)Z

    move-result v6

    const/16 v8, 0x8

    const/4 v9, 0x1

    if-eqz v6, :cond_7

    iget-boolean v6, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemHorizontalTranslationEnabled:Z

    if-eqz v6, :cond_7

    .line 148
    iget v6, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    invoke-virtual {v0, v6}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 149
    .local v6, "activeChild":Landroid/view/View;
    iget v10, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->activeItemMinWidth:I

    .line 150
    .local v10, "activeItemWidth":I
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v11

    if-eq v11, v8, :cond_0

    .line 153
    iget v11, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->activeItemMaxWidth:I

    const/high16 v12, -0x80000000

    .line 154
    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 153
    invoke-virtual {v6, v11, v4}, Landroid/view/View;->measure(II)V

    .line 155
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 157
    :cond_0
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v11

    if-eq v11, v8, :cond_1

    const/4 v11, 0x1

    goto :goto_0

    :cond_1
    const/4 v11, 0x0

    :goto_0
    sub-int v11, v2, v11

    .line 158
    .local v11, "inactiveCount":I
    iget v12, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->inactiveItemMinWidth:I

    mul-int v12, v12, v11

    sub-int v12, v1, v12

    .line 159
    .local v12, "activeMaxAvailable":I
    iget v13, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->activeItemMaxWidth:I

    .line 160
    invoke-static {v10, v13}, Ljava/lang/Math;->min(II)I

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 161
    .local v13, "activeWidth":I
    sub-int v14, v1, v13

    if-nez v11, :cond_2

    const/4 v15, 0x1

    goto :goto_1

    :cond_2
    move v15, v11

    :goto_1
    div-int/2addr v14, v15

    .line 163
    .local v14, "inactiveMaxAvailable":I
    iget v15, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->inactiveItemMaxWidth:I

    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 164
    .local v15, "inactiveWidth":I
    sub-int v16, v1, v13

    mul-int v17, v15, v11

    sub-int v16, v16, v17

    .line 166
    .local v16, "extra":I
    const/16 v17, 0x0

    move/from16 v5, v17

    .local v5, "i":I
    :goto_2
    if-ge v5, v3, :cond_6

    .line 167
    invoke-virtual {v0, v5}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-eq v7, v8, :cond_4

    .line 168
    iget-object v7, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->tempChildWidths:[I

    iget v8, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    if-ne v5, v8, :cond_3

    move v8, v13

    goto :goto_3

    :cond_3
    move v8, v15

    :goto_3
    aput v8, v7, v5

    .line 172
    if-lez v16, :cond_5

    .line 173
    aget v8, v7, v5

    add-int/2addr v8, v9

    aput v8, v7, v5

    .line 174
    add-int/lit8 v16, v16, -0x1

    goto :goto_4

    .line 177
    :cond_4
    iget-object v7, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->tempChildWidths:[I

    const/4 v8, 0x0

    aput v8, v7, v5

    .line 166
    :cond_5
    :goto_4
    add-int/lit8 v5, v5, 0x1

    const/16 v8, 0x8

    goto :goto_2

    .line 180
    .end local v5    # "i":I
    .end local v6    # "activeChild":Landroid/view/View;
    .end local v10    # "activeItemWidth":I
    .end local v11    # "inactiveCount":I
    .end local v12    # "activeMaxAvailable":I
    .end local v13    # "activeWidth":I
    .end local v14    # "inactiveMaxAvailable":I
    .end local v15    # "inactiveWidth":I
    .end local v16    # "extra":I
    :cond_6
    goto :goto_8

    .line 181
    :cond_7
    if-nez v2, :cond_8

    const/4 v5, 0x1

    goto :goto_5

    :cond_8
    move v5, v2

    :goto_5
    div-int v5, v1, v5

    .line 182
    .local v5, "maxAvailable":I
    iget v6, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->activeItemMaxWidth:I

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 183
    .local v6, "childWidth":I
    mul-int v7, v6, v2

    sub-int v7, v1, v7

    .line 184
    .local v7, "extra":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_6
    if-ge v8, v3, :cond_b

    .line 185
    invoke-virtual {v0, v8}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v10

    const/16 v11, 0x8

    if-eq v10, v11, :cond_9

    .line 186
    iget-object v10, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->tempChildWidths:[I

    aput v6, v10, v8

    .line 187
    if-lez v7, :cond_a

    .line 188
    aget v11, v10, v8

    add-int/2addr v11, v9

    aput v11, v10, v8

    .line 189
    add-int/lit8 v7, v7, -0x1

    goto :goto_7

    .line 192
    :cond_9
    iget-object v10, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->tempChildWidths:[I

    const/4 v11, 0x0

    aput v11, v10, v8

    .line 184
    :cond_a
    :goto_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 197
    .end local v5    # "maxAvailable":I
    .end local v6    # "childWidth":I
    .end local v7    # "extra":I
    .end local v8    # "i":I
    :cond_b
    :goto_8
    const/4 v5, 0x0

    .line 198
    .local v5, "totalWidth":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_9
    if-ge v6, v3, :cond_d

    .line 199
    invoke-virtual {v0, v6}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 200
    .local v7, "child":Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-ne v8, v9, :cond_c

    .line 201
    goto :goto_a

    .line 203
    :cond_c
    iget-object v8, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->tempChildWidths:[I

    aget v8, v8, v6

    .line 204
    const/high16 v10, 0x40000000    # 2.0f

    invoke-static {v8, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 203
    invoke-virtual {v7, v8, v4}, Landroid/view/View;->measure(II)V

    .line 205
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    .line 206
    .local v8, "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    iput v10, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 207
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v5, v10

    .line 198
    .end local v7    # "child":Landroid/view/View;
    .end local v8    # "params":Landroid/view/ViewGroup$LayoutParams;
    :goto_a
    add-int/lit8 v6, v6, 0x1

    goto :goto_9

    .line 209
    .end local v6    # "i":I
    :cond_d
    nop

    .line 211
    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 210
    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v6

    iget v8, v0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemHeight:I

    .line 212
    invoke-static {v8, v4, v7}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v7

    .line 209
    invoke-virtual {v0, v6, v7}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->setMeasuredDimension(II)V

    .line 213
    return-void
.end method

.method removeBadge(I)V
    .locals 3
    .param p1, "menuItemId"    # I

    .line 658
    invoke-direct {p0, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->validateMenuItemId(I)V

    .line 659
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/badge/BadgeDrawable;

    .line 660
    .local v0, "badgeDrawable":Lcom/google/android/material/badge/BadgeDrawable;
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->findItemView(I)Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    move-result-object v1

    .line 661
    .local v1, "itemView":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    if-eqz v1, :cond_0

    .line 662
    invoke-virtual {v1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->removeBadge()V

    .line 664
    :cond_0
    if-eqz v0, :cond_1

    .line 665
    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 667
    :cond_1
    return-void
.end method

.method setBadgeDrawables(Landroid/util/SparseArray;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Lcom/google/android/material/badge/BadgeDrawable;",
            ">;)V"
        }
    .end annotation

    .line 622
    .local p1, "badgeDrawables":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/material/badge/BadgeDrawable;>;"
    iput-object p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->badgeDrawables:Landroid/util/SparseArray;

    .line 623
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_0

    .line 624
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 625
    .local v3, "itemView":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->getId()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/material/badge/BadgeDrawable;

    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setBadge(Lcom/google/android/material/badge/BadgeDrawable;)V

    .line 624
    .end local v3    # "itemView":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 628
    :cond_0
    return-void
.end method

.method public setIconTintList(Landroid/content/res/ColorStateList;)V
    .locals 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .line 246
    iput-object p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemIconTint:Landroid/content/res/ColorStateList;

    .line 247
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_0

    .line 248
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 249
    .local v3, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 248
    .end local v3    # "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 252
    :cond_0
    return-void
.end method

.method public setItemBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .line 398
    iput-object p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemBackground:Landroid/graphics/drawable/Drawable;

    .line 399
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_0

    .line 400
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 401
    .local v3, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    .line 400
    .end local v3    # "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 404
    :cond_0
    return-void
.end method

.method public setItemBackgroundRes(I)V
    .locals 4
    .param p1, "background"    # I

    .line 373
    iput p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemBackgroundRes:I

    .line 374
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_0

    .line 375
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 376
    .local v3, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setItemBackground(I)V

    .line 375
    .end local v3    # "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 379
    :cond_0
    return-void
.end method

.method public setItemHorizontalTranslationEnabled(Z)V
    .locals 0
    .param p1, "itemHorizontalTranslationEnabled"    # Z

    .line 457
    iput-boolean p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemHorizontalTranslationEnabled:Z

    .line 458
    return-void
.end method

.method public setItemIconSize(I)V
    .locals 4
    .param p1, "iconSize"    # I

    .line 272
    iput p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemIconSize:I

    .line 273
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_0

    .line 274
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 275
    .local v3, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setIconSize(I)V

    .line 274
    .end local v3    # "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 278
    :cond_0
    return-void
.end method

.method public setItemTextAppearanceActive(I)V
    .locals 5
    .param p1, "textAppearanceRes"    # I

    .line 344
    iput p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextAppearanceActive:I

    .line 345
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_1

    .line 346
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 347
    .local v3, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextAppearanceActive(I)V

    .line 350
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextColorFromUser:Landroid/content/res/ColorStateList;

    if-eqz v4, :cond_0

    .line 351
    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 346
    .end local v3    # "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 355
    :cond_1
    return-void
.end method

.method public setItemTextAppearanceInactive(I)V
    .locals 5
    .param p1, "textAppearanceRes"    # I

    .line 315
    iput p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextAppearanceInactive:I

    .line 316
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_1

    .line 317
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 318
    .local v3, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextAppearanceInactive(I)V

    .line 321
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextColorFromUser:Landroid/content/res/ColorStateList;

    if-eqz v4, :cond_0

    .line 322
    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 317
    .end local v3    # "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 326
    :cond_1
    return-void
.end method

.method public setItemTextColor(Landroid/content/res/ColorStateList;)V
    .locals 4
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .line 292
    iput-object p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->itemTextColorFromUser:Landroid/content/res/ColorStateList;

    .line 293
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-eqz v0, :cond_0

    .line 294
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 295
    .local v3, "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    invoke-virtual {v3, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 294
    .end local v3    # "item":Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 298
    :cond_0
    return-void
.end method

.method public setLabelVisibilityMode(I)V
    .locals 0
    .param p1, "labelVisibilityMode"    # I

    .line 436
    iput p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->labelVisibilityMode:I

    .line 437
    return-void
.end method

.method public setPresenter(Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;)V
    .locals 0
    .param p1, "presenter"    # Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;

    .line 493
    iput-object p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->presenter:Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;

    .line 494
    return-void
.end method

.method tryRestoreSelectedItemId(I)V
    .locals 4
    .param p1, "itemId"    # I

    .line 605
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroidx/appcompat/view/menu/MenuBuilder;->size()I

    move-result v0

    .line 606
    .local v0, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 607
    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v2, v1}, Landroidx/appcompat/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 608
    .local v2, "item":Landroid/view/MenuItem;
    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    if-ne p1, v3, :cond_0

    .line 609
    iput p1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    .line 610
    iput v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    .line 611
    const/4 v3, 0x1

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 612
    goto :goto_1

    .line 606
    .end local v2    # "item":Landroid/view/MenuItem;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 615
    .end local v1    # "i":I
    :cond_1
    :goto_1
    return-void
.end method

.method public updateMenuView()V
    .locals 7

    .line 551
    iget-object v0, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    if-eqz v0, :cond_6

    iget-object v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 555
    :cond_0
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/MenuBuilder;->size()I

    move-result v0

    .line 556
    .local v0, "menuSize":I
    iget-object v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    array-length v1, v1

    if-eq v0, v1, :cond_1

    .line 558
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buildMenuView()V

    .line 559
    return-void

    .line 562
    :cond_1
    iget v1, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    .line 564
    .local v1, "previousSelectedId":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_3

    .line 565
    iget-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v3, v2}, Landroidx/appcompat/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 566
    .local v3, "item":Landroid/view/MenuItem;
    invoke-interface {v3}, Landroid/view/MenuItem;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 567
    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    iput v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    .line 568
    iput v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemPosition:I

    .line 564
    .end local v3    # "item":Landroid/view/MenuItem;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 571
    .end local v2    # "i":I
    :cond_3
    iget v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->selectedItemId:I

    if-eq v1, v2, :cond_4

    .line 573
    iget-object v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->set:Landroidx/transition/TransitionSet;

    invoke-static {p0, v2}, Landroidx/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V

    .line 576
    :cond_4
    iget v2, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->labelVisibilityMode:I

    iget-object v3, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v3}, Landroidx/appcompat/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {p0, v2, v3}, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->isShifting(II)Z

    move-result v2

    .line 577
    .local v2, "shifting":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v0, :cond_5

    .line 578
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->presenter:Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;->setUpdateSuspended(Z)V

    .line 579
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    aget-object v4, v4, v3

    iget v5, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->labelVisibilityMode:I

    invoke-virtual {v4, v5}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setLabelVisibilityMode(I)V

    .line 580
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    aget-object v4, v4, v3

    invoke-virtual {v4, v2}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->setShifting(Z)V

    .line 581
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->buttons:[Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;

    aget-object v4, v4, v3

    iget-object v5, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->menu:Landroidx/appcompat/view/menu/MenuBuilder;

    invoke-virtual {v5, v3}, Landroidx/appcompat/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v5

    check-cast v5, Landroidx/appcompat/view/menu/MenuItemImpl;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lcom/google/android/material/bottomnavigation/BottomNavigationItemView;->initialize(Landroidx/appcompat/view/menu/MenuItemImpl;I)V

    .line 582
    iget-object v4, p0, Lcom/google/android/material/bottomnavigation/BottomNavigationMenuView;->presenter:Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;

    invoke-virtual {v4, v6}, Lcom/google/android/material/bottomnavigation/BottomNavigationPresenter;->setUpdateSuspended(Z)V

    .line 577
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 584
    .end local v3    # "i":I
    :cond_5
    return-void

    .line 552
    .end local v0    # "menuSize":I
    .end local v1    # "previousSelectedId":I
    .end local v2    # "shifting":Z
    :cond_6
    :goto_2
    return-void
.end method

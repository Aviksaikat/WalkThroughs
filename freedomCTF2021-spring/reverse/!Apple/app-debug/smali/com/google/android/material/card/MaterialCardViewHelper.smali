.class Lcom/google/android/material/card/MaterialCardViewHelper;
.super Ljava/lang/Object;
.source "MaterialCardViewHelper.java"


# static fields
.field private static final CARD_VIEW_SHADOW_MULTIPLIER:F = 1.5f

.field private static final CHECKED_ICON_LAYER_INDEX:I = 0x2

.field private static final CHECKED_STATE_SET:[I

.field private static final COS_45:D

.field private static final DEFAULT_STROKE_VALUE:I = -0x1


# instance fields
.field private final bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

.field private checkable:Z

.field private checkedIcon:Landroid/graphics/drawable/Drawable;

.field private final checkedIconMargin:I

.field private final checkedIconSize:I

.field private checkedIconTint:Landroid/content/res/ColorStateList;

.field private clickableForegroundDrawable:Landroid/graphics/drawable/LayerDrawable;

.field private compatRippleDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

.field private fgDrawable:Landroid/graphics/drawable/Drawable;

.field private final foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

.field private foregroundShapeDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

.field private isBackgroundOverwritten:Z

.field private final materialCardView:Lcom/google/android/material/card/MaterialCardView;

.field private rippleColor:Landroid/content/res/ColorStateList;

.field private rippleDrawable:Landroid/graphics/drawable/Drawable;

.field private shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

.field private strokeColor:Landroid/content/res/ColorStateList;

.field private strokeWidth:I

.field private final userContentPadding:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 62
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    sput-object v0, Lcom/google/android/material/card/MaterialCardViewHelper;->CHECKED_STATE_SET:[I

    .line 67
    const-wide v0, 0x4046800000000000L    # 45.0

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    sput-wide v0, Lcom/google/android/material/card/MaterialCardViewHelper;->COS_45:D

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/card/MaterialCardView;Landroid/util/AttributeSet;II)V
    .locals 4
    .param p1, "card"    # Lcom/google/android/material/card/MaterialCardView;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->userContentPadding:Landroid/graphics/Rect;

    .line 116
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->isBackgroundOverwritten:Z

    .line 124
    iput-object p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 125
    new-instance v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {p1}, Lcom/google/android/material/card/MaterialCardView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p2, p3, p4}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 126
    invoke-virtual {p1}, Lcom/google/android/material/card/MaterialCardView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->initializeElevationOverlay(Landroid/content/Context;)V

    .line 127
    const v1, -0xbbbbbc

    invoke-virtual {v0, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setShadowColor(I)V

    .line 128
    nop

    .line 129
    invoke-virtual {v0}, Lcom/google/android/material/shape/MaterialShapeDrawable;->getShapeAppearanceModel()Lcom/google/android/material/shape/ShapeAppearanceModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/shape/ShapeAppearanceModel;->toBuilder()Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    move-result-object v0

    .line 131
    .local v0, "shapeAppearanceModelBuilder":Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;
    nop

    .line 132
    invoke-virtual {p1}, Lcom/google/android/material/card/MaterialCardView;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/google/android/material/R$styleable;->CardView:[I

    sget v3, Lcom/google/android/material/R$style;->CardView:I

    .line 133
    invoke-virtual {v1, p2, v2, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 134
    .local v1, "cardViewAttributes":Landroid/content/res/TypedArray;
    sget v2, Lcom/google/android/material/R$styleable;->CardView_cardCornerRadius:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 136
    sget v2, Lcom/google/android/material/R$styleable;->CardView_cardCornerRadius:I

    const/4 v3, 0x0

    .line 137
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    .line 136
    invoke-virtual {v0, v2}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->setAllCornerSizes(F)Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    .line 140
    :cond_0
    new-instance v2, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>()V

    iput-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 141
    invoke-virtual {v0}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->build()Lcom/google/android/material/shape/ShapeAppearanceModel;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/android/material/card/MaterialCardViewHelper;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 143
    invoke-virtual {p1}, Lcom/google/android/material/card/MaterialCardView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 145
    .local v2, "resources":Landroid/content/res/Resources;
    sget v3, Lcom/google/android/material/R$dimen;->mtrl_card_checked_icon_margin:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconMargin:I

    .line 146
    sget v3, Lcom/google/android/material/R$dimen;->mtrl_card_checked_icon_size:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconSize:I

    .line 148
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 149
    return-void
.end method

.method private calculateActualCornerPadding()F
    .locals 4

    .line 538
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 541
    invoke-virtual {v0}, Lcom/google/android/material/shape/ShapeAppearanceModel;->getTopLeftCorner()Lcom/google/android/material/shape/CornerTreatment;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->getTopLeftCornerResolvedSize()F

    move-result v1

    .line 540
    invoke-direct {p0, v0, v1}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateCornerPaddingForCornerTreatment(Lcom/google/android/material/shape/CornerTreatment;F)F

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 543
    invoke-virtual {v1}, Lcom/google/android/material/shape/ShapeAppearanceModel;->getTopRightCorner()Lcom/google/android/material/shape/CornerTreatment;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 544
    invoke-virtual {v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->getTopRightCornerResolvedSize()F

    move-result v2

    .line 542
    invoke-direct {p0, v1, v2}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateCornerPaddingForCornerTreatment(Lcom/google/android/material/shape/CornerTreatment;F)F

    move-result v1

    .line 539
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 547
    invoke-virtual {v1}, Lcom/google/android/material/shape/ShapeAppearanceModel;->getBottomRightCorner()Lcom/google/android/material/shape/CornerTreatment;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 548
    invoke-virtual {v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->getBottomRightCornerResolvedSize()F

    move-result v2

    .line 546
    invoke-direct {p0, v1, v2}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateCornerPaddingForCornerTreatment(Lcom/google/android/material/shape/CornerTreatment;F)F

    move-result v1

    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 550
    invoke-virtual {v2}, Lcom/google/android/material/shape/ShapeAppearanceModel;->getBottomLeftCorner()Lcom/google/android/material/shape/CornerTreatment;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 551
    invoke-virtual {v3}, Lcom/google/android/material/shape/MaterialShapeDrawable;->getBottomLeftCornerResolvedSize()F

    move-result v3

    .line 549
    invoke-direct {p0, v2, v3}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateCornerPaddingForCornerTreatment(Lcom/google/android/material/shape/CornerTreatment;F)F

    move-result v2

    .line 545
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 538
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method private calculateCornerPaddingForCornerTreatment(Lcom/google/android/material/shape/CornerTreatment;F)F
    .locals 4
    .param p1, "treatment"    # Lcom/google/android/material/shape/CornerTreatment;
    .param p2, "size"    # F

    .line 555
    instance-of v0, p1, Lcom/google/android/material/shape/RoundedCornerTreatment;

    if-eqz v0, :cond_0

    .line 556
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sget-wide v2, Lcom/google/android/material/card/MaterialCardViewHelper;->COS_45:D

    sub-double/2addr v0, v2

    float-to-double v2, p2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    double-to-float v0, v0

    return v0

    .line 557
    :cond_0
    instance-of v0, p1, Lcom/google/android/material/shape/CutCornerTreatment;

    if-eqz v0, :cond_1

    .line 558
    const/high16 v0, 0x40000000    # 2.0f

    div-float v0, p2, v0

    return v0

    .line 560
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private calculateHorizontalBackgroundPadding()F
    .locals 2

    .line 503
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getMaxCardElevation()F

    move-result v0

    .line 504
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->shouldAddCornerPaddingOutsideCardBackground()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateActualCornerPadding()F

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-float/2addr v0, v1

    .line 503
    return v0
.end method

.method private calculateVerticalBackgroundPadding()F
    .locals 2

    .line 493
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getMaxCardElevation()F

    move-result v0

    const/high16 v1, 0x3fc00000    # 1.5f

    mul-float v0, v0, v1

    .line 494
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->shouldAddCornerPaddingOutsideCardBackground()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateActualCornerPadding()F

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-float/2addr v0, v1

    .line 493
    return v0
.end method

.method private canClipToOutline()Z
    .locals 2

    .line 508
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0}, Lcom/google/android/material/shape/MaterialShapeDrawable;->isRoundRect()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private createCheckedIconLayer()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 611
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 612
    .local v0, "checkedLayer":Landroid/graphics/drawable/StateListDrawable;
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    .line 613
    sget-object v2, Lcom/google/android/material/card/MaterialCardViewHelper;->CHECKED_STATE_SET:[I

    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 615
    :cond_0
    return-object v0
.end method

.method private createCompatRippleDrawable()Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 593
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 594
    .local v0, "rippleDrawable":Landroid/graphics/drawable/StateListDrawable;
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->createForegroundShapeDrawable()Lcom/google/android/material/shape/MaterialShapeDrawable;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->compatRippleDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 595
    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v1, v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 596
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    const v3, 0x10100a7

    aput v3, v1, v2

    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->compatRippleDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 597
    return-object v0
.end method

.method private createForegroundRippleDrawable()Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 582
    sget-boolean v0, Lcom/google/android/material/ripple/RippleUtils;->USE_FRAMEWORK_RIPPLE:Z

    if-eqz v0, :cond_0

    .line 583
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->createForegroundShapeDrawable()Lcom/google/android/material/shape/MaterialShapeDrawable;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundShapeDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 585
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleColor:Landroid/content/res/ColorStateList;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundShapeDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-object v0

    .line 588
    :cond_0
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->createCompatRippleDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method private createForegroundShapeDrawable()Lcom/google/android/material/shape/MaterialShapeDrawable;
    .locals 2

    .line 620
    new-instance v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-direct {v0, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    return-object v0
.end method

.method private getClickableForeground()Landroid/graphics/drawable/Drawable;
    .locals 5

    .line 565
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 566
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->createForegroundRippleDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleDrawable:Landroid/graphics/drawable/Drawable;

    .line 569
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->clickableForegroundDrawable:Landroid/graphics/drawable/LayerDrawable;

    if-nez v0, :cond_1

    .line 570
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->createCheckedIconLayer()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 571
    .local v0, "checkedLayer":Landroid/graphics/drawable/Drawable;
    new-instance v1, Landroid/graphics/drawable/LayerDrawable;

    const/4 v2, 0x3

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleDrawable:Landroid/graphics/drawable/Drawable;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v0, v2, v3

    invoke-direct {v1, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->clickableForegroundDrawable:Landroid/graphics/drawable/LayerDrawable;

    .line 574
    sget v2, Lcom/google/android/material/R$id;->mtrl_card_checked_layer_id:I

    invoke-virtual {v1, v3, v2}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    .line 577
    .end local v0    # "checkedLayer":Landroid/graphics/drawable/Drawable;
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->clickableForegroundDrawable:Landroid/graphics/drawable/LayerDrawable;

    return-object v0
.end method

.method private getParentCardViewCalculatedCornerPadding()F
    .locals 4

    .line 512
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getPreventCornerOverlap()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 513
    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getUseCompatPadding()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 514
    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sget-wide v2, Lcom/google/android/material/card/MaterialCardViewHelper;->COS_45:D

    sub-double/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v2}, Lcom/google/android/material/card/MaterialCardView;->getCardViewRadius()F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    double-to-float v0, v0

    return v0

    .line 516
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private insetDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 11
    .param p1, "originalDrawable"    # Landroid/graphics/drawable/Drawable;

    .line 468
    const/4 v0, 0x0

    .line 469
    .local v0, "insetVertical":I
    const/4 v1, 0x0

    .line 470
    .local v1, "insetHorizontal":I
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-ge v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 471
    .local v2, "isPreLollipop":Z
    :goto_0
    if-nez v2, :cond_1

    iget-object v3, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v3}, Lcom/google/android/material/card/MaterialCardView;->getUseCompatPadding()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 473
    :cond_1
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateVerticalBackgroundPadding()F

    move-result v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v0, v3

    .line 474
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateHorizontalBackgroundPadding()F

    move-result v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v1, v3

    .line 476
    :cond_2
    new-instance v10, Lcom/google/android/material/card/MaterialCardViewHelper$1;

    move-object v3, v10

    move-object v4, p0

    move-object v5, p1

    move v6, v1

    move v7, v0

    move v8, v1

    move v9, v0

    invoke-direct/range {v3 .. v9}, Lcom/google/android/material/card/MaterialCardViewHelper$1;-><init>(Lcom/google/android/material/card/MaterialCardViewHelper;Landroid/graphics/drawable/Drawable;IIII)V

    return-object v10
.end method

.method private shouldAddCornerPaddingInsideCardBackground()Z
    .locals 1

    .line 520
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getPreventCornerOverlap()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->canClipToOutline()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private shouldAddCornerPaddingOutsideCardBackground()Z
    .locals 1

    .line 524
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getPreventCornerOverlap()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 525
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->canClipToOutline()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 526
    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getUseCompatPadding()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 524
    :goto_0
    return v0
.end method

.method private updateInsetForeground(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "insetForeground"    # Landroid/graphics/drawable/Drawable;

    .line 448
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 449
    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/InsetDrawable;

    if-eqz v0, :cond_0

    .line 450
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/InsetDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 452
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-direct {p0, p1}, Lcom/google/android/material/card/MaterialCardViewHelper;->insetDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/card/MaterialCardView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 454
    :goto_0
    return-void
.end method

.method private updateRippleColor()V
    .locals 2

    .line 602
    sget-boolean v0, Lcom/google/android/material/ripple/RippleUtils;->USE_FRAMEWORK_RIPPLE:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 603
    check-cast v0, Landroid/graphics/drawable/RippleDrawable;

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    goto :goto_0

    .line 604
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->compatRippleDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_1

    .line 605
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 607
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method forceRippleRedraw()V
    .locals 7

    .line 411
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 412
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 416
    .local v0, "bounds":Landroid/graphics/Rect;
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 417
    .local v1, "bottom":I
    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleDrawable:Landroid/graphics/drawable/Drawable;

    iget v3, v0, Landroid/graphics/Rect;->left:I

    iget v4, v0, Landroid/graphics/Rect;->top:I

    iget v5, v0, Landroid/graphics/Rect;->right:I

    add-int/lit8 v6, v1, -0x1

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 418
    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleDrawable:Landroid/graphics/drawable/Drawable;

    iget v3, v0, Landroid/graphics/Rect;->left:I

    iget v4, v0, Landroid/graphics/Rect;->top:I

    iget v5, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {v2, v3, v4, v5, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 420
    .end local v0    # "bounds":Landroid/graphics/Rect;
    .end local v1    # "bottom":I
    :cond_0
    return-void
.end method

.method getBackground()Lcom/google/android/material/shape/MaterialShapeDrawable;
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    return-object v0
.end method

.method getCardBackgroundColor()Landroid/content/res/ColorStateList;
    .locals 1

    .line 247
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0}, Lcom/google/android/material/shape/MaterialShapeDrawable;->getFillColor()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method getCheckedIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 375
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method getCheckedIconTint()Landroid/content/res/ColorStateList;
    .locals 1

    .line 365
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconTint:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method getCornerRadius()F
    .locals 1

    .line 283
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0}, Lcom/google/android/material/shape/MaterialShapeDrawable;->getTopLeftCornerResolvedSize()F

    move-result v0

    return v0
.end method

.method getProgress()F
    .locals 1

    .line 299
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0}, Lcom/google/android/material/shape/MaterialShapeDrawable;->getInterpolation()F

    move-result v0

    return v0
.end method

.method getRippleColor()Landroid/content/res/ColorStateList;
    .locals 1

    .line 370
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method getShapeAppearanceModel()Lcom/google/android/material/shape/ShapeAppearanceModel;
    .locals 1

    .line 439
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    return-object v0
.end method

.method getStrokeColor()I
    .locals 1

    .line 216
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeColor:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    :goto_0
    return v0
.end method

.method getStrokeColorStateList()Landroid/content/res/ColorStateList;
    .locals 1

    .line 221
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method getStrokeWidth()I
    .locals 1

    .line 234
    iget v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeWidth:I

    return v0
.end method

.method getUserContentPadding()Landroid/graphics/Rect;
    .locals 1

    .line 257
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->userContentPadding:Landroid/graphics/Rect;

    return-object v0
.end method

.method isBackgroundOverwritten()Z
    .locals 1

    .line 198
    iget-boolean v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->isBackgroundOverwritten:Z

    return v0
.end method

.method isCheckable()Z
    .locals 1

    .line 348
    iget-boolean v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkable:Z

    return v0
.end method

.method loadFromAttributes(Landroid/content/res/TypedArray;)V
    .locals 3
    .param p1, "attributes"    # Landroid/content/res/TypedArray;

    .line 152
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 153
    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/google/android/material/R$styleable;->MaterialCardView_strokeColor:I

    .line 152
    invoke-static {v0, p1, v1}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeColor:Landroid/content/res/ColorStateList;

    .line 156
    if-nez v0, :cond_0

    .line 157
    const/4 v0, -0x1

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeColor:Landroid/content/res/ColorStateList;

    .line 160
    :cond_0
    sget v0, Lcom/google/android/material/R$styleable;->MaterialCardView_strokeWidth:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeWidth:I

    .line 161
    sget v0, Lcom/google/android/material/R$styleable;->MaterialCardView_android_checkable:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkable:Z

    .line 162
    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v2, v0}, Lcom/google/android/material/card/MaterialCardView;->setLongClickable(Z)V

    .line 163
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 164
    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/google/android/material/R$styleable;->MaterialCardView_checkedIconTint:I

    .line 163
    invoke-static {v0, p1, v2}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconTint:Landroid/content/res/ColorStateList;

    .line 165
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 167
    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/google/android/material/R$styleable;->MaterialCardView_checkedIcon:I

    .line 166
    invoke-static {v0, p1, v2}, Lcom/google/android/material/resources/MaterialResources;->getDrawable(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 165
    invoke-virtual {p0, v0}, Lcom/google/android/material/card/MaterialCardViewHelper;->setCheckedIcon(Landroid/graphics/drawable/Drawable;)V

    .line 169
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 171
    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/google/android/material/R$styleable;->MaterialCardView_rippleColor:I

    .line 170
    invoke-static {v0, p1, v2}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleColor:Landroid/content/res/ColorStateList;

    .line 172
    if-nez v0, :cond_1

    .line 173
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    sget v2, Lcom/google/android/material/R$attr;->colorControlHighlight:I

    .line 175
    invoke-static {v0, v2}, Lcom/google/android/material/color/MaterialColors;->getColor(Landroid/view/View;I)I

    move-result v0

    .line 174
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleColor:Landroid/content/res/ColorStateList;

    .line 178
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 180
    invoke-virtual {v0}, Lcom/google/android/material/card/MaterialCardView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/google/android/material/R$styleable;->MaterialCardView_cardForegroundColor:I

    .line 179
    invoke-static {v0, p1, v2}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 184
    .local v0, "foregroundColor":Landroid/content/res/ColorStateList;
    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-nez v0, :cond_2

    .line 185
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    goto :goto_0

    :cond_2
    move-object v1, v0

    .line 184
    :goto_0
    invoke-virtual {v2, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 187
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateRippleColor()V

    .line 188
    invoke-virtual {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateElevation()V

    .line 189
    invoke-virtual {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateStroke()V

    .line 191
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {p0, v2}, Lcom/google/android/material/card/MaterialCardViewHelper;->insetDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/material/card/MaterialCardView;->setBackgroundInternal(Landroid/graphics/drawable/Drawable;)V

    .line 192
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 193
    invoke-virtual {v1}, Lcom/google/android/material/card/MaterialCardView;->isClickable()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->getClickableForeground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_1

    :cond_3
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    :goto_1
    iput-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->fgDrawable:Landroid/graphics/drawable/Drawable;

    .line 194
    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-direct {p0, v1}, Lcom/google/android/material/card/MaterialCardViewHelper;->insetDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/google/android/material/card/MaterialCardView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 195
    return-void
.end method

.method onMeasure(II)V
    .locals 9
    .param p1, "measuredWidth"    # I
    .param p2, "measuredHeight"    # I

    .line 393
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->clickableForegroundDrawable:Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_1

    .line 394
    iget v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconMargin:I

    sub-int v1, p1, v0

    iget v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconSize:I

    sub-int/2addr v1, v2

    .line 395
    .local v1, "left":I
    sub-int v0, p2, v0

    sub-int/2addr v0, v2

    .line 396
    .local v0, "bottom":I
    iget v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconMargin:I

    .line 397
    .local v2, "right":I
    iget-object v3, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-static {v3}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 399
    move v3, v2

    .line 400
    .local v3, "tmp":I
    move v2, v1

    .line 401
    move v1, v3

    .line 404
    .end local v3    # "tmp":I
    :cond_0
    iget-object v3, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->clickableForegroundDrawable:Landroid/graphics/drawable/LayerDrawable;

    const/4 v4, 0x2

    iget v6, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconMargin:I

    move v5, v1

    move v7, v2

    move v8, v0

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 407
    .end local v0    # "bottom":I
    .end local v1    # "left":I
    .end local v2    # "right":I
    :cond_1
    return-void
.end method

.method setBackgroundOverwritten(Z)V
    .locals 0
    .param p1, "isBackgroundOverwritten"    # Z

    .line 202
    iput-boolean p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->isBackgroundOverwritten:Z

    .line 203
    return-void
.end method

.method setCardBackgroundColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .line 243
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 244
    return-void
.end method

.method setCheckable(Z)V
    .locals 0
    .param p1, "checkable"    # Z

    .line 344
    iput-boolean p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkable:Z

    .line 345
    return-void
.end method

.method setCheckedIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 3
    .param p1, "checkedIcon"    # Landroid/graphics/drawable/Drawable;

    .line 379
    iput-object p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIcon:Landroid/graphics/drawable/Drawable;

    .line 380
    if-eqz p1, :cond_0

    .line 381
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIcon:Landroid/graphics/drawable/Drawable;

    .line 382
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconTint:Landroid/content/res/ColorStateList;

    invoke-static {v0, v1}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 385
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->clickableForegroundDrawable:Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_1

    .line 386
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->createCheckedIconLayer()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 387
    .local v0, "checkedLayer":Landroid/graphics/drawable/Drawable;
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->clickableForegroundDrawable:Landroid/graphics/drawable/LayerDrawable;

    sget v2, Lcom/google/android/material/R$id;->mtrl_card_checked_layer_id:I

    invoke-virtual {v1, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 390
    .end local v0    # "checkedLayer":Landroid/graphics/drawable/Drawable;
    :cond_1
    return-void
.end method

.method setCheckedIconTint(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "checkedIconTint"    # Landroid/content/res/ColorStateList;

    .line 357
    iput-object p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIconTint:Landroid/content/res/ColorStateList;

    .line 358
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->checkedIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 359
    invoke-static {v0, p1}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 361
    :cond_0
    return-void
.end method

.method setCornerRadius(F)V
    .locals 1
    .param p1, "cornerRadius"    # F

    .line 270
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/ShapeAppearanceModel;->withCornerSize(F)Lcom/google/android/material/shape/ShapeAppearanceModel;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/card/MaterialCardViewHelper;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 271
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->fgDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 272
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->shouldAddCornerPaddingOutsideCardBackground()Z

    move-result v0

    if-nez v0, :cond_0

    .line 273
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->shouldAddCornerPaddingInsideCardBackground()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 274
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateContentPadding()V

    .line 277
    :cond_1
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->shouldAddCornerPaddingOutsideCardBackground()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 278
    invoke-virtual {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateInsets()V

    .line 280
    :cond_2
    return-void
.end method

.method setProgress(F)V
    .locals 1
    .param p1, "progress"    # F

    .line 287
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setInterpolation(F)V

    .line 288
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_0

    .line 289
    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setInterpolation(F)V

    .line 292
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundShapeDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_1

    .line 293
    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setInterpolation(F)V

    .line 295
    :cond_1
    return-void
.end method

.method setRippleColor(Landroid/content/res/ColorStateList;)V
    .locals 0
    .param p1, "rippleColor"    # Landroid/content/res/ColorStateList;

    .line 352
    iput-object p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->rippleColor:Landroid/content/res/ColorStateList;

    .line 353
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateRippleColor()V

    .line 354
    return-void
.end method

.method setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V
    .locals 1
    .param p1, "shapeAppearanceModel"    # Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 423
    iput-object p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 424
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 425
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_0

    .line 426
    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 429
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundShapeDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_1

    .line 430
    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 433
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->compatRippleDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_2

    .line 434
    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 436
    :cond_2
    return-void
.end method

.method setStrokeColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "strokeColor"    # Landroid/content/res/ColorStateList;

    .line 206
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeColor:Landroid/content/res/ColorStateList;

    if-ne v0, p1, :cond_0

    .line 207
    return-void

    .line 210
    :cond_0
    iput-object p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeColor:Landroid/content/res/ColorStateList;

    .line 211
    invoke-virtual {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateStroke()V

    .line 212
    return-void
.end method

.method setStrokeWidth(I)V
    .locals 1
    .param p1, "strokeWidth"    # I

    .line 225
    iget v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeWidth:I

    if-ne p1, v0, :cond_0

    .line 226
    return-void

    .line 228
    :cond_0
    iput p1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeWidth:I

    .line 229
    invoke-virtual {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateStroke()V

    .line 230
    return-void
.end method

.method setUserContentPadding(IIII)V
    .locals 1
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 251
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->userContentPadding:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 252
    invoke-virtual {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateContentPadding()V

    .line 253
    return-void
.end method

.method updateClickable()V
    .locals 2

    .line 261
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->fgDrawable:Landroid/graphics/drawable/Drawable;

    .line 262
    .local v0, "previousFgDrawable":Landroid/graphics/drawable/Drawable;
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    .line 263
    invoke-virtual {v1}, Lcom/google/android/material/card/MaterialCardView;->isClickable()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->getClickableForeground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    :goto_0
    iput-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->fgDrawable:Landroid/graphics/drawable/Drawable;

    .line 264
    if-eq v0, v1, :cond_1

    .line 265
    invoke-direct {p0, v1}, Lcom/google/android/material/card/MaterialCardViewHelper;->updateInsetForeground(Landroid/graphics/drawable/Drawable;)V

    .line 267
    :cond_1
    return-void
.end method

.method updateContentPadding()V
    .locals 7

    .line 326
    nop

    .line 327
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->shouldAddCornerPaddingInsideCardBackground()Z

    move-result v0

    if-nez v0, :cond_1

    .line 328
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->shouldAddCornerPaddingOutsideCardBackground()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 331
    .local v0, "includeCornerPadding":Z
    :goto_1
    if-eqz v0, :cond_2

    .line 333
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->calculateActualCornerPadding()F

    move-result v1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    .line 334
    :goto_2
    invoke-direct {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->getParentCardViewCalculatedCornerPadding()F

    move-result v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    .line 336
    .local v1, "contentPaddingOffset":I
    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    iget-object v3, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->userContentPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, v1

    iget-object v4, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->userContentPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v1

    iget-object v5, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->userContentPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    add-int/2addr v5, v1

    iget-object v6, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->userContentPadding:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v6, v1

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/google/android/material/card/MaterialCardView;->setAncestorContentPadding(IIII)V

    .line 341
    return-void
.end method

.method updateElevation()V
    .locals 2

    .line 303
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    invoke-virtual {v1}, Lcom/google/android/material/card/MaterialCardView;->getCardElevation()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setElevation(F)V

    .line 304
    return-void
.end method

.method updateInsets()V
    .locals 2

    .line 308
    invoke-virtual {p0}, Lcom/google/android/material/card/MaterialCardViewHelper;->isBackgroundOverwritten()Z

    move-result v0

    if-nez v0, :cond_0

    .line 309
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->bgDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {p0, v1}, Lcom/google/android/material/card/MaterialCardViewHelper;->insetDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/card/MaterialCardView;->setBackgroundInternal(Landroid/graphics/drawable/Drawable;)V

    .line 311
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->materialCardView:Lcom/google/android/material/card/MaterialCardView;

    iget-object v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->fgDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1}, Lcom/google/android/material/card/MaterialCardViewHelper;->insetDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/card/MaterialCardView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 312
    return-void
.end method

.method updateStroke()V
    .locals 3

    .line 315
    iget-object v0, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->foregroundContentDrawable:Lcom/google/android/material/shape/MaterialShapeDrawable;

    iget v1, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeWidth:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/google/android/material/card/MaterialCardViewHelper;->strokeColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setStroke(FLandroid/content/res/ColorStateList;)V

    .line 316
    return-void
.end method

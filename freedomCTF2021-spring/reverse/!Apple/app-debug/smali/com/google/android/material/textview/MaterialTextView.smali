.class public Lcom/google/android/material/textview/MaterialTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "MaterialTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/material/textview/MaterialTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 81
    const v0, 0x1010084

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/textview/MaterialTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 86
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/material/textview/MaterialTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 87
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 91
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 93
    invoke-static {p1}, Lcom/google/android/material/textview/MaterialTextView;->canApplyTextAppearanceLineHeight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    .line 96
    .local v0, "theme":Landroid/content/res/Resources$Theme;
    invoke-static {p1, v0, p2, p3, p4}, Lcom/google/android/material/textview/MaterialTextView;->viewAttrsHasLineHeight(Landroid/content/Context;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;II)Z

    move-result v1

    if-nez v1, :cond_0

    .line 97
    invoke-static {v0, p2, p3, p4}, Lcom/google/android/material/textview/MaterialTextView;->findViewAppearanceResourceId(Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;II)I

    move-result v1

    .line 98
    .local v1, "resId":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 99
    invoke-direct {p0, v0, v1}, Lcom/google/android/material/textview/MaterialTextView;->applyLineHeightFromViewAppearance(Landroid/content/res/Resources$Theme;I)V

    .line 103
    .end local v0    # "theme":Landroid/content/res/Resources$Theme;
    .end local v1    # "resId":I
    :cond_0
    return-void
.end method

.method private applyLineHeightFromViewAppearance(Landroid/content/res/Resources$Theme;I)V
    .locals 5
    .param p1, "theme"    # Landroid/content/res/Resources$Theme;
    .param p2, "resId"    # I

    .line 115
    sget-object v0, Lcom/google/android/material/R$styleable;->MaterialTextAppearance:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 116
    .local v0, "attributes":Landroid/content/res/TypedArray;
    nop

    .line 118
    invoke-virtual {p0}, Lcom/google/android/material/textview/MaterialTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [I

    sget v3, Lcom/google/android/material/R$styleable;->MaterialTextAppearance_android_lineHeight:I

    const/4 v4, 0x0

    aput v3, v2, v4

    sget v3, Lcom/google/android/material/R$styleable;->MaterialTextAppearance_lineHeight:I

    const/4 v4, 0x1

    aput v3, v2, v4

    .line 117
    invoke-static {v1, v0, v2}, Lcom/google/android/material/textview/MaterialTextView;->readFirstAvailableDimension(Landroid/content/Context;Landroid/content/res/TypedArray;[I)I

    move-result v1

    .line 122
    .local v1, "lineHeight":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 124
    if-ltz v1, :cond_0

    .line 125
    invoke-virtual {p0, v1}, Lcom/google/android/material/textview/MaterialTextView;->setLineHeight(I)V

    .line 127
    :cond_0
    return-void
.end method

.method private static canApplyTextAppearanceLineHeight(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 130
    sget v0, Lcom/google/android/material/R$attr;->textAppearanceLineHeightEnabled:I

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/google/android/material/resources/MaterialAttributes;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v0

    return v0
.end method

.method private static findViewAppearanceResourceId(Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;II)I
    .locals 3
    .param p0, "theme"    # Landroid/content/res/Resources$Theme;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .line 168
    sget-object v0, Lcom/google/android/material/R$styleable;->MaterialTextView:[I

    .line 169
    invoke-virtual {p0, p1, v0, p2, p3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 171
    .local v0, "attributes":Landroid/content/res/TypedArray;
    sget v1, Lcom/google/android/material/R$styleable;->MaterialTextView_android_textAppearance:I

    .line 172
    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 173
    .local v1, "appearanceAttrId":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 174
    return v1
.end method

.method private static varargs readFirstAvailableDimension(Landroid/content/Context;Landroid/content/res/TypedArray;[I)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attributes"    # Landroid/content/res/TypedArray;
    .param p2, "indices"    # [I

    .line 137
    const/4 v0, -0x1

    .line 139
    .local v0, "lineHeight":I
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_0

    if-gez v0, :cond_0

    .line 140
    aget v2, p2, v1

    const/4 v3, -0x1

    invoke-static {p0, p1, v2, v3}, Lcom/google/android/material/resources/MaterialResources;->getDimensionPixelSize(Landroid/content/Context;Landroid/content/res/TypedArray;II)I

    move-result v0

    .line 139
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 143
    .end local v1    # "index":I
    :cond_0
    return v0
.end method

.method private static viewAttrsHasLineHeight(Landroid/content/Context;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;II)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "theme"    # Landroid/content/res/Resources$Theme;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 152
    sget-object v0, Lcom/google/android/material/R$styleable;->MaterialTextView:[I

    .line 153
    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 155
    .local v0, "attributes":Landroid/content/res/TypedArray;
    const/4 v1, 0x2

    new-array v1, v1, [I

    sget v2, Lcom/google/android/material/R$styleable;->MaterialTextView_android_lineHeight:I

    const/4 v3, 0x0

    aput v2, v1, v3

    sget v2, Lcom/google/android/material/R$styleable;->MaterialTextView_lineHeight:I

    const/4 v4, 0x1

    aput v2, v1, v4

    .line 156
    invoke-static {p0, v0, v1}, Lcom/google/android/material/textview/MaterialTextView;->readFirstAvailableDimension(Landroid/content/Context;Landroid/content/res/TypedArray;[I)I

    move-result v1

    .line 161
    .local v1, "lineHeight":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 163
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3
.end method


# virtual methods
.method public setTextAppearance(Landroid/content/Context;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .line 107
    invoke-super {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 109
    invoke-static {p1}, Lcom/google/android/material/textview/MaterialTextView;->canApplyTextAppearanceLineHeight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/google/android/material/textview/MaterialTextView;->applyLineHeightFromViewAppearance(Landroid/content/res/Resources$Theme;I)V

    .line 112
    :cond_0
    return-void
.end method

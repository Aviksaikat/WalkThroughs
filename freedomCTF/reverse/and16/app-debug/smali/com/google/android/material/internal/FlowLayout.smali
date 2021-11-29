.class public Lcom/google/android/material/internal/FlowLayout;
.super Landroid/view/ViewGroup;
.source "FlowLayout.java"


# instance fields
.field private itemSpacing:I

.field private lineSpacing:I

.field private singleLine:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/material/internal/FlowLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/internal/FlowLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/material/internal/FlowLayout;->singleLine:Z

    .line 59
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/internal/FlowLayout;->loadFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 65
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/material/internal/FlowLayout;->singleLine:Z

    .line 67
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/internal/FlowLayout;->loadFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 68
    return-void
.end method

.method private static getMeasuredDimension(III)I
    .locals 1
    .param p0, "size"    # I
    .param p1, "mode"    # I
    .param p2, "childrenEdge"    # I

    .line 177
    const/high16 v0, -0x80000000

    if-eq p1, v0, :cond_1

    const/high16 v0, 0x40000000    # 2.0f

    if-eq p1, v0, :cond_0

    .line 183
    return p2

    .line 179
    :cond_0
    return p0

    .line 181
    :cond_1
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method private loadFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 71
    nop

    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/google/android/material/R$styleable;->FlowLayout:[I

    const/4 v2, 0x0

    invoke-virtual {v0, p2, v1, v2, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 73
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v1, Lcom/google/android/material/R$styleable;->FlowLayout_lineSpacing:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/internal/FlowLayout;->lineSpacing:I

    .line 74
    sget v1, Lcom/google/android/material/R$styleable;->FlowLayout_itemSpacing:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/internal/FlowLayout;->itemSpacing:I

    .line 75
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 76
    return-void
.end method


# virtual methods
.method protected getItemSpacing()I
    .locals 1

    .line 87
    iget v0, p0, Lcom/google/android/material/internal/FlowLayout;->itemSpacing:I

    return v0
.end method

.method protected getLineSpacing()I
    .locals 1

    .line 79
    iget v0, p0, Lcom/google/android/material/internal/FlowLayout;->lineSpacing:I

    return v0
.end method

.method public isSingleLine()Z
    .locals 1

    .line 96
    iget-boolean v0, p0, Lcom/google/android/material/internal/FlowLayout;->singleLine:Z

    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 16
    .param p1, "sizeChanged"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 189
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getChildCount()I

    move-result v1

    if-nez v1, :cond_0

    .line 191
    return-void

    .line 194
    :cond_0
    invoke-static/range {p0 .. p0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    move v1, v2

    .line 195
    .local v1, "isRtl":Z
    if-eqz v1, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingRight()I

    move-result v2

    goto :goto_1

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingLeft()I

    move-result v2

    .line 196
    .local v2, "paddingStart":I
    :goto_1
    if-eqz v1, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingLeft()I

    move-result v3

    goto :goto_2

    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingRight()I

    move-result v3

    .line 197
    .local v3, "paddingEnd":I
    :goto_2
    move v4, v2

    .line 198
    .local v4, "childStart":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingTop()I

    move-result v5

    .line 199
    .local v5, "childTop":I
    move v6, v5

    .line 202
    .local v6, "childBottom":I
    sub-int v7, p4, p2

    sub-int/2addr v7, v3

    .line 204
    .local v7, "maxChildEnd":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getChildCount()I

    move-result v9

    if-ge v8, v9, :cond_8

    .line 205
    invoke-virtual {v0, v8}, Lcom/google/android/material/internal/FlowLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 207
    .local v9, "child":Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v10

    const/16 v11, 0x8

    if-ne v10, v11, :cond_4

    .line 208
    goto :goto_5

    .line 211
    :cond_4
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 212
    .local v10, "lp":Landroid/view/ViewGroup$LayoutParams;
    const/4 v11, 0x0

    .line 213
    .local v11, "startMargin":I
    const/4 v12, 0x0

    .line 214
    .local v12, "endMargin":I
    instance-of v13, v10, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v13, :cond_5

    .line 215
    move-object v13, v10

    check-cast v13, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 216
    .local v13, "marginLp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-static {v13}, Landroidx/core/view/MarginLayoutParamsCompat;->getMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v11

    .line 217
    invoke-static {v13}, Landroidx/core/view/MarginLayoutParamsCompat;->getMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v12

    .line 220
    .end local v13    # "marginLp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_5
    add-int v13, v4, v11

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    add-int/2addr v13, v14

    .line 222
    .local v13, "childEnd":I
    iget-boolean v14, v0, Lcom/google/android/material/internal/FlowLayout;->singleLine:Z

    if-nez v14, :cond_6

    if-le v13, v7, :cond_6

    .line 223
    move v4, v2

    .line 224
    iget v14, v0, Lcom/google/android/material/internal/FlowLayout;->lineSpacing:I

    add-int v5, v6, v14

    .line 227
    :cond_6
    add-int v14, v4, v11

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v14, v15

    .line 228
    .end local v13    # "childEnd":I
    .local v14, "childEnd":I
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    add-int/2addr v13, v5

    .line 230
    .end local v6    # "childBottom":I
    .local v13, "childBottom":I
    if-eqz v1, :cond_7

    .line 231
    sub-int v6, v7, v14

    sub-int v15, v7, v4

    sub-int/2addr v15, v11

    invoke-virtual {v9, v6, v5, v15, v13}, Landroid/view/View;->layout(IIII)V

    goto :goto_4

    .line 234
    :cond_7
    add-int v6, v4, v11

    invoke-virtual {v9, v6, v5, v14, v13}, Landroid/view/View;->layout(IIII)V

    .line 237
    :goto_4
    add-int v6, v11, v12

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v6, v15

    iget v15, v0, Lcom/google/android/material/internal/FlowLayout;->itemSpacing:I

    add-int/2addr v6, v15

    add-int/2addr v4, v6

    move v6, v13

    .line 204
    .end local v9    # "child":Landroid/view/View;
    .end local v10    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .end local v11    # "startMargin":I
    .end local v12    # "endMargin":I
    .end local v13    # "childBottom":I
    .end local v14    # "childEnd":I
    .restart local v6    # "childBottom":I
    :goto_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 239
    .end local v8    # "i":I
    :cond_8
    return-void
.end method

.method protected onMeasure(II)V
    .locals 21
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 106
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 107
    .local v1, "width":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 109
    .local v2, "widthMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 110
    .local v3, "height":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 112
    .local v4, "heightMode":I
    const/high16 v5, -0x80000000

    if-eq v2, v5, :cond_1

    const/high16 v5, 0x40000000    # 2.0f

    if-ne v2, v5, :cond_0

    goto :goto_0

    :cond_0
    const v5, 0x7fffffff

    goto :goto_1

    :cond_1
    :goto_0
    move v5, v1

    .line 117
    .local v5, "maxWidth":I
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingLeft()I

    move-result v6

    .line 118
    .local v6, "childLeft":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingTop()I

    move-result v7

    .line 119
    .local v7, "childTop":I
    move v8, v7

    .line 120
    .local v8, "childBottom":I
    move v9, v6

    .line 121
    .local v9, "childRight":I
    const/4 v10, 0x0

    .line 122
    .local v10, "maxChildRight":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingRight()I

    move-result v11

    sub-int v11, v5, v11

    .line 123
    .local v11, "maxRight":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getChildCount()I

    move-result v13

    if-ge v12, v13, :cond_7

    .line 124
    invoke-virtual {v0, v12}, Lcom/google/android/material/internal/FlowLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 126
    .local v13, "child":Landroid/view/View;
    invoke-virtual {v13}, Landroid/view/View;->getVisibility()I

    move-result v14

    const/16 v15, 0x8

    if-ne v14, v15, :cond_2

    .line 127
    move/from16 v14, p1

    move/from16 v15, p2

    move/from16 v16, v5

    goto/16 :goto_5

    .line 129
    :cond_2
    move/from16 v14, p1

    move/from16 v15, p2

    invoke-virtual {v0, v13, v14, v15}, Lcom/google/android/material/internal/FlowLayout;->measureChild(Landroid/view/View;II)V

    .line 131
    move/from16 v16, v5

    .end local v5    # "maxWidth":I
    .local v16, "maxWidth":I
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 132
    .local v5, "lp":Landroid/view/ViewGroup$LayoutParams;
    const/16 v17, 0x0

    .line 133
    .local v17, "leftMargin":I
    const/16 v18, 0x0

    .line 134
    .local v18, "rightMargin":I
    move/from16 v19, v7

    .end local v7    # "childTop":I
    .local v19, "childTop":I
    instance-of v7, v5, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v7, :cond_3

    .line 135
    move-object v7, v5

    check-cast v7, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 136
    .local v7, "marginLp":Landroid/view/ViewGroup$MarginLayoutParams;
    move-object/from16 v20, v5

    .end local v5    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .local v20, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v5, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int v17, v17, v5

    .line 137
    iget v5, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int v18, v18, v5

    goto :goto_3

    .line 134
    .end local v7    # "marginLp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v20    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .restart local v5    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_3
    move-object/from16 v20, v5

    .line 140
    .end local v5    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .restart local v20    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :goto_3
    add-int v5, v6, v17

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v5, v7

    .line 145
    .end local v9    # "childRight":I
    .local v5, "childRight":I
    if-le v5, v11, :cond_4

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->isSingleLine()Z

    move-result v7

    if-nez v7, :cond_4

    .line 146
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingLeft()I

    move-result v6

    .line 147
    iget v7, v0, Lcom/google/android/material/internal/FlowLayout;->lineSpacing:I

    add-int/2addr v7, v8

    .end local v19    # "childTop":I
    .local v7, "childTop":I
    goto :goto_4

    .line 150
    .end local v7    # "childTop":I
    .restart local v19    # "childTop":I
    :cond_4
    move/from16 v7, v19

    .end local v19    # "childTop":I
    .restart local v7    # "childTop":I
    :goto_4
    add-int v9, v6, v17

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v19

    add-int v9, v9, v19

    .line 151
    .end local v5    # "childRight":I
    .restart local v9    # "childRight":I
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v7

    .line 154
    .end local v8    # "childBottom":I
    .local v5, "childBottom":I
    if-le v9, v10, :cond_5

    .line 155
    move v10, v9

    .line 158
    :cond_5
    add-int v8, v17, v18

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v19

    add-int v8, v8, v19

    move/from16 v19, v5

    .end local v5    # "childBottom":I
    .local v19, "childBottom":I
    iget v5, v0, Lcom/google/android/material/internal/FlowLayout;->itemSpacing:I

    add-int/2addr v8, v5

    add-int/2addr v6, v8

    .line 163
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getChildCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v12, v5, :cond_6

    .line 164
    add-int v10, v10, v18

    move/from16 v8, v19

    goto :goto_5

    .line 163
    :cond_6
    move/from16 v8, v19

    .line 123
    .end local v13    # "child":Landroid/view/View;
    .end local v17    # "leftMargin":I
    .end local v18    # "rightMargin":I
    .end local v19    # "childBottom":I
    .end local v20    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .restart local v8    # "childBottom":I
    :goto_5
    add-int/lit8 v12, v12, 0x1

    move/from16 v5, v16

    goto/16 :goto_2

    .end local v16    # "maxWidth":I
    .local v5, "maxWidth":I
    :cond_7
    move/from16 v16, v5

    move/from16 v19, v7

    .line 168
    .end local v5    # "maxWidth":I
    .end local v7    # "childTop":I
    .end local v12    # "i":I
    .restart local v16    # "maxWidth":I
    .local v19, "childTop":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingRight()I

    move-result v5

    add-int/2addr v10, v5

    .line 169
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/internal/FlowLayout;->getPaddingBottom()I

    move-result v5

    add-int/2addr v8, v5

    .line 171
    invoke-static {v1, v2, v10}, Lcom/google/android/material/internal/FlowLayout;->getMeasuredDimension(III)I

    move-result v5

    .line 172
    .local v5, "finalWidth":I
    invoke-static {v3, v4, v8}, Lcom/google/android/material/internal/FlowLayout;->getMeasuredDimension(III)I

    move-result v7

    .line 173
    .local v7, "finalHeight":I
    invoke-virtual {v0, v5, v7}, Lcom/google/android/material/internal/FlowLayout;->setMeasuredDimension(II)V

    .line 174
    return-void
.end method

.method protected setItemSpacing(I)V
    .locals 0
    .param p1, "itemSpacing"    # I

    .line 91
    iput p1, p0, Lcom/google/android/material/internal/FlowLayout;->itemSpacing:I

    .line 92
    return-void
.end method

.method protected setLineSpacing(I)V
    .locals 0
    .param p1, "lineSpacing"    # I

    .line 83
    iput p1, p0, Lcom/google/android/material/internal/FlowLayout;->lineSpacing:I

    .line 84
    return-void
.end method

.method public setSingleLine(Z)V
    .locals 0
    .param p1, "singleLine"    # Z

    .line 101
    iput-boolean p1, p0, Lcom/google/android/material/internal/FlowLayout;->singleLine:Z

    .line 102
    return-void
.end method

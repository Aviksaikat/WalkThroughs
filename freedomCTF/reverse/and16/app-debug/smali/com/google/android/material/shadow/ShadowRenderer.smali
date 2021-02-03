.class public Lcom/google/android/material/shadow/ShadowRenderer;
.super Ljava/lang/Object;
.source "ShadowRenderer.java"


# static fields
.field private static final COLOR_ALPHA_END:I = 0x0

.field private static final COLOR_ALPHA_MIDDLE:I = 0x14

.field private static final COLOR_ALPHA_START:I = 0x44

.field private static final cornerColors:[I

.field private static final cornerPositions:[F

.field private static final edgeColors:[I

.field private static final edgePositions:[F


# instance fields
.field private final cornerShadowPaint:Landroid/graphics/Paint;

.field private final edgeShadowPaint:Landroid/graphics/Paint;

.field private final scratch:Landroid/graphics/Path;

.field private shadowEndColor:I

.field private shadowMiddleColor:I

.field private final shadowPaint:Landroid/graphics/Paint;

.field private shadowStartColor:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 59
    const/4 v0, 0x3

    new-array v1, v0, [I

    sput-object v1, Lcom/google/android/material/shadow/ShadowRenderer;->edgeColors:[I

    .line 61
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/material/shadow/ShadowRenderer;->edgePositions:[F

    .line 63
    const/4 v0, 0x4

    new-array v1, v0, [I

    sput-object v1, Lcom/google/android/material/shadow/ShadowRenderer;->cornerColors:[I

    .line 65
    new-array v0, v0, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/android/material/shadow/ShadowRenderer;->cornerPositions:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 70
    const/high16 v0, -0x1000000

    invoke-direct {p0, v0}, Lcom/google/android/material/shadow/ShadowRenderer;-><init>(I)V

    .line 71
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "color"    # I

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->scratch:Landroid/graphics/Path;

    .line 74
    invoke-virtual {p0, p1}, Lcom/google/android/material/shadow/ShadowRenderer;->setShadowColor(I)V

    .line 76
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->cornerShadowPaint:Landroid/graphics/Paint;

    .line 77
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 79
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowPaint:Landroid/graphics/Paint;

    .line 80
    iget v2, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowStartColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/google/android/material/shadow/ShadowRenderer;->edgeShadowPaint:Landroid/graphics/Paint;

    .line 83
    return-void
.end method


# virtual methods
.method public drawCornerShadow(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Landroid/graphics/RectF;IFF)V
    .locals 22
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "matrix"    # Landroid/graphics/Matrix;
    .param p3, "bounds"    # Landroid/graphics/RectF;
    .param p4, "elevation"    # I
    .param p5, "startAngle"    # F
    .param p6, "sweepAngle"    # F

    .line 128
    move-object/from16 v0, p0

    move-object/from16 v7, p3

    move/from16 v8, p4

    move/from16 v9, p6

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    cmpg-float v3, v9, v3

    if-gez v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    move v10, v3

    .line 130
    .local v10, "drawShadowInsideBounds":Z
    iget-object v11, v0, Lcom/google/android/material/shadow/ShadowRenderer;->scratch:Landroid/graphics/Path;

    .line 132
    .local v11, "arcBounds":Landroid/graphics/Path;
    const/4 v3, 0x3

    const/4 v4, 0x2

    if-eqz v10, :cond_1

    .line 133
    sget-object v5, Lcom/google/android/material/shadow/ShadowRenderer;->cornerColors:[I

    aput v2, v5, v2

    .line 134
    iget v2, v0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowEndColor:I

    aput v2, v5, v1

    .line 135
    iget v2, v0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowMiddleColor:I

    aput v2, v5, v4

    .line 136
    iget v2, v0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowStartColor:I

    aput v2, v5, v3

    move/from16 v12, p5

    goto :goto_1

    .line 139
    :cond_1
    invoke-virtual {v11}, Landroid/graphics/Path;->rewind()V

    .line 140
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->centerY()F

    move-result v6

    invoke-virtual {v11, v5, v6}, Landroid/graphics/Path;->moveTo(FF)V

    .line 141
    move/from16 v12, p5

    invoke-virtual {v11, v7, v12, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 142
    invoke-virtual {v11}, Landroid/graphics/Path;->close()V

    .line 144
    neg-int v5, v8

    int-to-float v5, v5

    neg-int v6, v8

    int-to-float v6, v6

    invoke-virtual {v7, v5, v6}, Landroid/graphics/RectF;->inset(FF)V

    .line 145
    sget-object v5, Lcom/google/android/material/shadow/ShadowRenderer;->cornerColors:[I

    aput v2, v5, v2

    .line 146
    iget v2, v0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowStartColor:I

    aput v2, v5, v1

    .line 147
    iget v2, v0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowMiddleColor:I

    aput v2, v5, v4

    .line 148
    iget v2, v0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowEndColor:I

    aput v2, v5, v3

    .line 151
    :goto_1
    int-to-float v2, v8

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    div-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v13, v3, v2

    .line 152
    .local v13, "startRatio":F
    sub-float/2addr v3, v13

    div-float/2addr v3, v5

    add-float v14, v13, v3

    .line 153
    .local v14, "midRatio":F
    sget-object v20, Lcom/google/android/material/shadow/ShadowRenderer;->cornerPositions:[F

    aput v13, v20, v1

    .line 154
    aput v14, v20, v4

    .line 156
    iget-object v1, v0, Lcom/google/android/material/shadow/ShadowRenderer;->cornerShadowPaint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/RadialGradient;

    .line 158
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->centerX()F

    move-result v16

    .line 159
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->centerY()F

    move-result v17

    .line 160
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float v18, v3, v5

    sget-object v19, Lcom/google/android/material/shadow/ShadowRenderer;->cornerColors:[I

    sget-object v21, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v15, v2

    invoke-direct/range {v15 .. v21}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 156
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 167
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 168
    invoke-virtual/range {p1 .. p2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 170
    if-nez v10, :cond_2

    .line 171
    sget-object v1, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    move-object/from16 v15, p1

    invoke-virtual {v15, v11, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    goto :goto_2

    .line 170
    :cond_2
    move-object/from16 v15, p1

    .line 174
    :goto_2
    const/4 v5, 0x1

    iget-object v6, v0, Lcom/google/android/material/shadow/ShadowRenderer;->cornerShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move/from16 v3, p5

    move/from16 v4, p6

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 175
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 176
    return-void
.end method

.method public drawEdgeShadow(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Landroid/graphics/RectF;I)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "transform"    # Landroid/graphics/Matrix;
    .param p3, "bounds"    # Landroid/graphics/RectF;
    .param p4, "elevation"    # I

    .line 94
    iget v0, p3, Landroid/graphics/RectF;->bottom:F

    int-to-float v1, p4

    add-float/2addr v0, v1

    iput v0, p3, Landroid/graphics/RectF;->bottom:F

    .line 95
    neg-int v0, p4

    int-to-float v0, v0

    const/4 v1, 0x0

    invoke-virtual {p3, v1, v0}, Landroid/graphics/RectF;->offset(FF)V

    .line 97
    sget-object v7, Lcom/google/android/material/shadow/ShadowRenderer;->edgeColors:[I

    iget v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowEndColor:I

    const/4 v1, 0x0

    aput v0, v7, v1

    .line 98
    iget v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowMiddleColor:I

    const/4 v1, 0x1

    aput v0, v7, v1

    .line 99
    iget v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowStartColor:I

    const/4 v1, 0x2

    aput v0, v7, v1

    .line 101
    iget-object v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->edgeShadowPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/LinearGradient;

    iget v3, p3, Landroid/graphics/RectF;->left:F

    iget v4, p3, Landroid/graphics/RectF;->top:F

    iget v5, p3, Landroid/graphics/RectF;->left:F

    iget v6, p3, Landroid/graphics/RectF;->bottom:F

    sget-object v8, Lcom/google/android/material/shadow/ShadowRenderer;->edgePositions:[F

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v2, v1

    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 111
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 112
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 113
    iget-object v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->edgeShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p3, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 114
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 115
    return-void
.end method

.method public getShadowPaint()Landroid/graphics/Paint;
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public setShadowColor(I)V
    .locals 1
    .param p1, "color"    # I

    .line 86
    const/16 v0, 0x44

    invoke-static {p1, v0}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowStartColor:I

    .line 87
    const/16 v0, 0x14

    invoke-static {p1, v0}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowMiddleColor:I

    .line 88
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/shadow/ShadowRenderer;->shadowEndColor:I

    .line 89
    return-void
.end method

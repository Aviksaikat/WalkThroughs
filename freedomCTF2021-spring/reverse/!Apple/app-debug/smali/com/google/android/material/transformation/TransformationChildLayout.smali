.class public Lcom/google/android/material/transformation/TransformationChildLayout;
.super Lcom/google/android/material/circularreveal/CircularRevealFrameLayout;
.source "TransformationChildLayout.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/material/transformation/TransformationChildLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 42
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/circularreveal/CircularRevealFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    return-void
.end method

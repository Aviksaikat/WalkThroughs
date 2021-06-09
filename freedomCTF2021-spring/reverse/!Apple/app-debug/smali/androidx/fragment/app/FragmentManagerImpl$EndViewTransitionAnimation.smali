.class Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;
.super Landroid/view/animation/AnimationSet;
.source "FragmentManagerImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/FragmentManagerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EndViewTransitionAnimation"
.end annotation


# instance fields
.field private mAnimating:Z

.field private final mChild:Landroid/view/View;

.field private mEnded:Z

.field private final mParent:Landroid/view/ViewGroup;

.field private mTransitionEnded:Z


# direct methods
.method constructor <init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;
    .param p2, "parent"    # Landroid/view/ViewGroup;
    .param p3, "child"    # Landroid/view/View;

    .line 3433
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 3429
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mAnimating:Z

    .line 3434
    iput-object p2, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mParent:Landroid/view/ViewGroup;

    .line 3435
    iput-object p3, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mChild:Landroid/view/View;

    .line 3436
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->addAnimation(Landroid/view/animation/Animation;)V

    .line 3439
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 3440
    return-void
.end method


# virtual methods
.method public getTransformation(JLandroid/view/animation/Transformation;)Z
    .locals 3
    .param p1, "currentTime"    # J
    .param p3, "t"    # Landroid/view/animation/Transformation;

    .line 3444
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mAnimating:Z

    .line 3445
    iget-boolean v1, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mEnded:Z

    if-eqz v1, :cond_0

    .line 3446
    iget-boolean v1, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mTransitionEnded:Z

    xor-int/2addr v0, v1

    return v0

    .line 3448
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/animation/AnimationSet;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v1

    .line 3449
    .local v1, "more":Z
    if-nez v1, :cond_1

    .line 3450
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mEnded:Z

    .line 3451
    iget-object v2, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mParent:Landroid/view/ViewGroup;

    invoke-static {v2, p0}, Landroidx/core/view/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroidx/core/view/OneShotPreDrawListener;

    .line 3453
    :cond_1
    return v0
.end method

.method public getTransformation(JLandroid/view/animation/Transformation;F)Z
    .locals 3
    .param p1, "currentTime"    # J
    .param p3, "outTransformation"    # Landroid/view/animation/Transformation;
    .param p4, "scale"    # F

    .line 3459
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mAnimating:Z

    .line 3460
    iget-boolean v1, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mEnded:Z

    if-eqz v1, :cond_0

    .line 3461
    iget-boolean v1, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mTransitionEnded:Z

    xor-int/2addr v0, v1

    return v0

    .line 3463
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/animation/AnimationSet;->getTransformation(JLandroid/view/animation/Transformation;F)Z

    move-result v1

    .line 3464
    .local v1, "more":Z
    if-nez v1, :cond_1

    .line 3465
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mEnded:Z

    .line 3466
    iget-object v2, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mParent:Landroid/view/ViewGroup;

    invoke-static {v2, p0}, Landroidx/core/view/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroidx/core/view/OneShotPreDrawListener;

    .line 3468
    :cond_1
    return v0
.end method

.method public run()V
    .locals 2

    .line 3473
    iget-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mEnded:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mAnimating:Z

    if-eqz v0, :cond_0

    .line 3474
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mAnimating:Z

    .line 3476
    iget-object v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mParent:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 3478
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mParent:Landroid/view/ViewGroup;

    iget-object v1, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mChild:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 3479
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManagerImpl$EndViewTransitionAnimation;->mTransitionEnded:Z

    .line 3481
    :goto_0
    return-void
.end method

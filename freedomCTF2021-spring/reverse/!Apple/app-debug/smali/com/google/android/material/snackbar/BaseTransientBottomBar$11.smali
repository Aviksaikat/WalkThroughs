.class Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BaseTransientBottomBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/snackbar/BaseTransientBottomBar;->startFadeOutAnimation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

.field final synthetic val$event:I


# direct methods
.method constructor <init>(Lcom/google/android/material/snackbar/BaseTransientBottomBar;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/android/material/snackbar/BaseTransientBottomBar;

    .line 894
    .local p0, "this":Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;, "Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;"
    iput-object p1, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;->this$0:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

    iput p2, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;->val$event:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animator"    # Landroid/animation/Animator;

    .line 897
    .local p0, "this":Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;, "Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;"
    iget-object v0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;->this$0:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

    iget v1, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$11;->val$event:I

    invoke-virtual {v0, v1}, Lcom/google/android/material/snackbar/BaseTransientBottomBar;->onViewHidden(I)V

    .line 898
    return-void
.end method
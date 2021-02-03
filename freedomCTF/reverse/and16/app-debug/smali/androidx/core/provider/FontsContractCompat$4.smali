.class final Landroidx/core/provider/FontsContractCompat$4;
.super Ljava/lang/Object;
.source "FontsContractCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/core/provider/FontsContractCompat;->requestFontInternal(Landroid/content/Context;Landroidx/core/provider/FontRequest;Landroidx/core/provider/FontsContractCompat$FontRequestCallback;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$appContext:Landroid/content/Context;

.field final synthetic val$callback:Landroidx/core/provider/FontsContractCompat$FontRequestCallback;

.field final synthetic val$callerThreadHandler:Landroid/os/Handler;

.field final synthetic val$request:Landroidx/core/provider/FontRequest;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/core/provider/FontRequest;Landroid/os/Handler;Landroidx/core/provider/FontsContractCompat$FontRequestCallback;)V
    .locals 0

    .line 541
    iput-object p1, p0, Landroidx/core/provider/FontsContractCompat$4;->val$appContext:Landroid/content/Context;

    iput-object p2, p0, Landroidx/core/provider/FontsContractCompat$4;->val$request:Landroidx/core/provider/FontRequest;

    iput-object p3, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    iput-object p4, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callback:Landroidx/core/provider/FontsContractCompat$FontRequestCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 547
    :try_start_0
    iget-object v0, p0, Landroidx/core/provider/FontsContractCompat$4;->val$appContext:Landroid/content/Context;

    iget-object v1, p0, Landroidx/core/provider/FontsContractCompat$4;->val$request:Landroidx/core/provider/FontRequest;

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Landroidx/core/provider/FontsContractCompat;->fetchFonts(Landroid/content/Context;Landroid/os/CancellationSignal;Landroidx/core/provider/FontRequest;)Landroidx/core/provider/FontsContractCompat$FontFamilyResult;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 557
    .local v0, "result":Landroidx/core/provider/FontsContractCompat$FontFamilyResult;
    nop

    .line 559
    invoke-virtual {v0}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->getStatusCode()I

    move-result v1

    if-eqz v1, :cond_2

    .line 560
    invoke-virtual {v0}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->getStatusCode()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 581
    iget-object v1, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v2, Landroidx/core/provider/FontsContractCompat$4$4;

    invoke-direct {v2, p0}, Landroidx/core/provider/FontsContractCompat$4$4;-><init>(Landroidx/core/provider/FontsContractCompat$4;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 588
    return-void

    .line 571
    :cond_0
    iget-object v1, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v2, Landroidx/core/provider/FontsContractCompat$4$3;

    invoke-direct {v2, p0}, Landroidx/core/provider/FontsContractCompat$4$3;-><init>(Landroidx/core/provider/FontsContractCompat$4;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 578
    return-void

    .line 562
    :cond_1
    iget-object v1, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v2, Landroidx/core/provider/FontsContractCompat$4$2;

    invoke-direct {v2, p0}, Landroidx/core/provider/FontsContractCompat$4$2;-><init>(Landroidx/core/provider/FontsContractCompat$4;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 569
    return-void

    .line 592
    :cond_2
    invoke-virtual {v0}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->getFonts()[Landroidx/core/provider/FontsContractCompat$FontInfo;

    move-result-object v1

    .line 593
    .local v1, "fonts":[Landroidx/core/provider/FontsContractCompat$FontInfo;
    if-eqz v1, :cond_8

    array-length v3, v1

    if-nez v3, :cond_3

    goto :goto_2

    .line 603
    :cond_3
    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_6

    aget-object v5, v1, v4

    .line 604
    .local v5, "font":Landroidx/core/provider/FontsContractCompat$FontInfo;
    invoke-virtual {v5}, Landroidx/core/provider/FontsContractCompat$FontInfo;->getResultCode()I

    move-result v6

    if-eqz v6, :cond_5

    .line 607
    invoke-virtual {v5}, Landroidx/core/provider/FontsContractCompat$FontInfo;->getResultCode()I

    move-result v2

    .line 608
    .local v2, "resultCode":I
    if-gez v2, :cond_4

    .line 611
    iget-object v3, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v4, Landroidx/core/provider/FontsContractCompat$4$6;

    invoke-direct {v4, p0}, Landroidx/core/provider/FontsContractCompat$4$6;-><init>(Landroidx/core/provider/FontsContractCompat$4;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 619
    :cond_4
    iget-object v3, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v4, Landroidx/core/provider/FontsContractCompat$4$7;

    invoke-direct {v4, p0, v2}, Landroidx/core/provider/FontsContractCompat$4$7;-><init>(Landroidx/core/provider/FontsContractCompat$4;I)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 626
    :goto_1
    return-void

    .line 603
    .end local v2    # "resultCode":I
    .end local v5    # "font":Landroidx/core/provider/FontsContractCompat$FontInfo;
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 630
    :cond_6
    iget-object v3, p0, Landroidx/core/provider/FontsContractCompat$4;->val$appContext:Landroid/content/Context;

    invoke-static {v3, v2, v1}, Landroidx/core/provider/FontsContractCompat;->buildTypeface(Landroid/content/Context;Landroid/os/CancellationSignal;[Landroidx/core/provider/FontsContractCompat$FontInfo;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 632
    .local v2, "typeface":Landroid/graphics/Typeface;
    if-nez v2, :cond_7

    .line 635
    iget-object v3, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v4, Landroidx/core/provider/FontsContractCompat$4$8;

    invoke-direct {v4, p0}, Landroidx/core/provider/FontsContractCompat$4$8;-><init>(Landroidx/core/provider/FontsContractCompat$4;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 642
    return-void

    .line 645
    :cond_7
    iget-object v3, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v4, Landroidx/core/provider/FontsContractCompat$4$9;

    invoke-direct {v4, p0, v2}, Landroidx/core/provider/FontsContractCompat$4$9;-><init>(Landroidx/core/provider/FontsContractCompat$4;Landroid/graphics/Typeface;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 651
    return-void

    .line 594
    .end local v2    # "typeface":Landroid/graphics/Typeface;
    :cond_8
    :goto_2
    iget-object v2, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v3, Landroidx/core/provider/FontsContractCompat$4$5;

    invoke-direct {v3, p0}, Landroidx/core/provider/FontsContractCompat$4$5;-><init>(Landroidx/core/provider/FontsContractCompat$4;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 601
    return-void

    .line 548
    .end local v0    # "result":Landroidx/core/provider/FontsContractCompat$FontFamilyResult;
    .end local v1    # "fonts":[Landroidx/core/provider/FontsContractCompat$FontInfo;
    :catch_0
    move-exception v0

    .line 549
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    iget-object v1, p0, Landroidx/core/provider/FontsContractCompat$4;->val$callerThreadHandler:Landroid/os/Handler;

    new-instance v2, Landroidx/core/provider/FontsContractCompat$4$1;

    invoke-direct {v2, p0}, Landroidx/core/provider/FontsContractCompat$4$1;-><init>(Landroidx/core/provider/FontsContractCompat$4;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 556
    return-void
.end method

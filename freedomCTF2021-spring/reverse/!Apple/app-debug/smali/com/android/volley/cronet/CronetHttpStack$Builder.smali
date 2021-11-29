.class public Lcom/android/volley/cronet/CronetHttpStack$Builder;
.super Ljava/lang/Object;
.source "CronetHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/cronet/CronetHttpStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static final DEFAULT_POOL_SIZE:I = 0x1000


# instance fields
.field private final context:Landroid/content/Context;

.field private mCronetEngine:Lorg/chromium/net/CronetEngine;

.field private mCurlCommandLogger:Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

.field private mCurlLoggingEnabled:Z

.field private mLogAuthTokensInCurlCommands:Z

.field private mPool:Lcom/android/volley/toolbox/ByteArrayPool;

.field private mRequestListener:Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

.field private mUrlRewriter:Lcom/android/volley/toolbox/UrlRewriter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 416
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 417
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->context:Landroid/content/Context;

    .line 418
    return-void
.end method


# virtual methods
.method public build()Lcom/android/volley/cronet/CronetHttpStack;
    .locals 10

    .line 499
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCronetEngine:Lorg/chromium/net/CronetEngine;

    if-nez v0, :cond_0

    .line 500
    new-instance v0, Lorg/chromium/net/CronetEngine$Builder;

    iget-object v1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lorg/chromium/net/CronetEngine$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lorg/chromium/net/CronetEngine$Builder;->build()Lorg/chromium/net/CronetEngine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCronetEngine:Lorg/chromium/net/CronetEngine;

    .line 502
    :cond_0
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mUrlRewriter:Lcom/android/volley/toolbox/UrlRewriter;

    if-nez v0, :cond_1

    .line 503
    new-instance v0, Lcom/android/volley/cronet/CronetHttpStack$Builder$1;

    invoke-direct {v0, p0}, Lcom/android/volley/cronet/CronetHttpStack$Builder$1;-><init>(Lcom/android/volley/cronet/CronetHttpStack$Builder;)V

    iput-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mUrlRewriter:Lcom/android/volley/toolbox/UrlRewriter;

    .line 511
    :cond_1
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mRequestListener:Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

    if-nez v0, :cond_2

    .line 512
    new-instance v0, Lcom/android/volley/cronet/CronetHttpStack$Builder$2;

    invoke-direct {v0, p0}, Lcom/android/volley/cronet/CronetHttpStack$Builder$2;-><init>(Lcom/android/volley/cronet/CronetHttpStack$Builder;)V

    iput-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mRequestListener:Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

    .line 514
    :cond_2
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    if-nez v0, :cond_3

    .line 515
    new-instance v0, Lcom/android/volley/toolbox/ByteArrayPool;

    const/16 v1, 0x1000

    invoke-direct {v0, v1}, Lcom/android/volley/toolbox/ByteArrayPool;-><init>(I)V

    iput-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 517
    :cond_3
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCurlCommandLogger:Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

    if-nez v0, :cond_4

    .line 518
    new-instance v0, Lcom/android/volley/cronet/CronetHttpStack$Builder$3;

    invoke-direct {v0, p0}, Lcom/android/volley/cronet/CronetHttpStack$Builder$3;-><init>(Lcom/android/volley/cronet/CronetHttpStack$Builder;)V

    iput-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCurlCommandLogger:Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

    .line 526
    :cond_4
    new-instance v0, Lcom/android/volley/cronet/CronetHttpStack;

    iget-object v2, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCronetEngine:Lorg/chromium/net/CronetEngine;

    iget-object v3, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    iget-object v4, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mUrlRewriter:Lcom/android/volley/toolbox/UrlRewriter;

    iget-object v5, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mRequestListener:Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

    iget-boolean v6, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCurlLoggingEnabled:Z

    iget-object v7, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCurlCommandLogger:Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

    iget-boolean v8, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mLogAuthTokensInCurlCommands:Z

    const/4 v9, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v9}, Lcom/android/volley/cronet/CronetHttpStack;-><init>(Lorg/chromium/net/CronetEngine;Lcom/android/volley/toolbox/ByteArrayPool;Lcom/android/volley/toolbox/UrlRewriter;Lcom/android/volley/cronet/CronetHttpStack$RequestListener;ZLcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;ZLcom/android/volley/cronet/CronetHttpStack$1;)V

    return-object v0
.end method

.method public setCronetEngine(Lorg/chromium/net/CronetEngine;)Lcom/android/volley/cronet/CronetHttpStack$Builder;
    .locals 0
    .param p1, "engine"    # Lorg/chromium/net/CronetEngine;

    .line 422
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCronetEngine:Lorg/chromium/net/CronetEngine;

    .line 423
    return-object p0
.end method

.method public setCurlCommandLogger(Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;)Lcom/android/volley/cronet/CronetHttpStack$Builder;
    .locals 0
    .param p1, "curlCommandLogger"    # Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

    .line 477
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCurlCommandLogger:Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

    .line 478
    return-object p0
.end method

.method public setCurlLoggingEnabled(Z)Lcom/android/volley/cronet/CronetHttpStack$Builder;
    .locals 0
    .param p1, "curlLoggingEnabled"    # Z

    .line 461
    iput-boolean p1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mCurlLoggingEnabled:Z

    .line 462
    return-object p0
.end method

.method public setLogAuthTokensInCurlCommands(Z)Lcom/android/volley/cronet/CronetHttpStack$Builder;
    .locals 0
    .param p1, "logAuthTokensInCurlCommands"    # Z

    .line 494
    iput-boolean p1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mLogAuthTokensInCurlCommands:Z

    .line 495
    return-object p0
.end method

.method public setPool(Lcom/android/volley/toolbox/ByteArrayPool;)Lcom/android/volley/cronet/CronetHttpStack$Builder;
    .locals 0
    .param p1, "pool"    # Lcom/android/volley/toolbox/ByteArrayPool;

    .line 428
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 429
    return-object p0
.end method

.method public setRequestListener(Lcom/android/volley/cronet/CronetHttpStack$RequestListener;)Lcom/android/volley/cronet/CronetHttpStack$Builder;
    .locals 0
    .param p1, "requestListener"    # Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

    .line 440
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mRequestListener:Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

    .line 441
    return-object p0
.end method

.method public setUrlRewriter(Lcom/android/volley/toolbox/UrlRewriter;)Lcom/android/volley/cronet/CronetHttpStack$Builder;
    .locals 0
    .param p1, "urlRewriter"    # Lcom/android/volley/toolbox/UrlRewriter;

    .line 434
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack$Builder;->mUrlRewriter:Lcom/android/volley/toolbox/UrlRewriter;

    .line 435
    return-object p0
.end method

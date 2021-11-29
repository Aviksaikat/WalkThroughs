.class public Lcom/android/volley/toolbox/NoAsyncCache;
.super Lcom/android/volley/AsyncCache;
.source "NoAsyncCache.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/android/volley/AsyncCache;-><init>()V

    return-void
.end method


# virtual methods
.method public clear(Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;

    .line 25
    invoke-interface {p1}, Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;->onWriteComplete()V

    .line 26
    return-void
.end method

.method public get(Ljava/lang/String;Lcom/android/volley/AsyncCache$OnGetCompleteCallback;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/android/volley/AsyncCache$OnGetCompleteCallback;

    .line 15
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lcom/android/volley/AsyncCache$OnGetCompleteCallback;->onGetComplete(Lcom/android/volley/Cache$Entry;)V

    .line 16
    return-void
.end method

.method public initialize(Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;

    .line 30
    invoke-interface {p1}, Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;->onWriteComplete()V

    .line 31
    return-void
.end method

.method public invalidate(Ljava/lang/String;ZLcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "fullExpire"    # Z
    .param p3, "callback"    # Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;

    .line 35
    invoke-interface {p3}, Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;->onWriteComplete()V

    .line 36
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "entry"    # Lcom/android/volley/Cache$Entry;
    .param p3, "callback"    # Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;

    .line 20
    invoke-interface {p3}, Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;->onWriteComplete()V

    .line 21
    return-void
.end method

.method public remove(Ljava/lang/String;Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;

    .line 40
    invoke-interface {p2}, Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;->onWriteComplete()V

    .line 41
    return-void
.end method

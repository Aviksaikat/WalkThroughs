.class public abstract Lcom/android/volley/toolbox/AsyncHttpStack;
.super Lcom/android/volley/toolbox/BaseHttpStack;
.source "AsyncHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/AsyncHttpStack$Response;,
        Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;
    }
.end annotation


# instance fields
.field private mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

.field private mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/android/volley/toolbox/BaseHttpStack;-><init>()V

    return-void
.end method


# virtual methods
.method public final executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/android/volley/toolbox/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 105
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .local p2, "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 106
    .local v0, "latch":Ljava/util/concurrent/CountDownLatch;
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 107
    .local v1, "entry":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lcom/android/volley/toolbox/AsyncHttpStack$Response;>;"
    new-instance v2, Lcom/android/volley/toolbox/AsyncHttpStack$1;

    invoke-direct {v2, p0, v1, v0}, Lcom/android/volley/toolbox/AsyncHttpStack$1;-><init>(Lcom/android/volley/toolbox/AsyncHttpStack;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {p0, p1, p2, v2}, Lcom/android/volley/toolbox/AsyncHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V

    .line 145
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    nop

    .line 151
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/volley/toolbox/AsyncHttpStack$Response;

    .line 152
    .local v2, "response":Lcom/android/volley/toolbox/AsyncHttpStack$Response;
    iget-object v3, v2, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    if-eqz v3, :cond_0

    .line 153
    iget-object v3, v2, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    return-object v3

    .line 154
    :cond_0
    iget-object v3, v2, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->ioException:Ljava/io/IOException;

    if-eqz v3, :cond_1

    .line 155
    iget-object v3, v2, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->ioException:Ljava/io/IOException;

    throw v3

    .line 157
    :cond_1
    iget-object v3, v2, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->authFailureError:Lcom/android/volley/AuthFailureError;

    throw v3

    .line 146
    .end local v2    # "response":Lcom/android/volley/toolbox/AsyncHttpStack$Response;
    :catch_0
    move-exception v2

    .line 147
    .local v2, "e":Ljava/lang/InterruptedException;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "while waiting for CountDownLatch"

    invoke-static {v2, v4, v3}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 148
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 149
    new-instance v3, Ljava/io/InterruptedIOException;

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public abstract executeRequest(Lcom/android/volley/Request;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;",
            ")V"
        }
    .end annotation
.end method

.method protected getBlockingExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/android/volley/toolbox/AsyncHttpStack;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method protected getNonBlockingExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/android/volley/toolbox/AsyncHttpStack;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1, "executor"    # Ljava/util/concurrent/ExecutorService;

    .line 78
    iput-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 79
    return-void
.end method

.method public setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1, "executor"    # Ljava/util/concurrent/ExecutorService;

    .line 69
    iput-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 70
    return-void
.end method

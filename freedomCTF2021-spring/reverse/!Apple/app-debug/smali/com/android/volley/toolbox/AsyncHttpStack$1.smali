.class Lcom/android/volley/toolbox/AsyncHttpStack$1;
.super Ljava/lang/Object;
.source "AsyncHttpStack.java"

# interfaces
.implements Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/toolbox/AsyncHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/toolbox/AsyncHttpStack;

.field final synthetic val$entry:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/AsyncHttpStack;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/volley/toolbox/AsyncHttpStack;

    .line 110
    iput-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->this$0:Lcom/android/volley/toolbox/AsyncHttpStack;

    iput-object p2, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$entry:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p3, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthError(Lcom/android/volley/AuthFailureError;)V
    .locals 2
    .param p1, "authFailureError"    # Lcom/android/volley/AuthFailureError;

    .line 124
    new-instance v0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, p1, v1}, Lcom/android/volley/toolbox/AsyncHttpStack$Response;-><init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;Lcom/android/volley/toolbox/AsyncHttpStack$1;)V

    .line 129
    .local v0, "response":Lcom/android/volley/toolbox/AsyncHttpStack$Response;
    iget-object v1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$entry:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 130
    iget-object v1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 131
    return-void
.end method

.method public onError(Ljava/io/IOException;)V
    .locals 2
    .param p1, "ioException"    # Ljava/io/IOException;

    .line 135
    new-instance v0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1, v1, v1}, Lcom/android/volley/toolbox/AsyncHttpStack$Response;-><init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;Lcom/android/volley/toolbox/AsyncHttpStack$1;)V

    .line 140
    .local v0, "response":Lcom/android/volley/toolbox/AsyncHttpStack$Response;
    iget-object v1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$entry:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 141
    iget-object v1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 142
    return-void
.end method

.method public onSuccess(Lcom/android/volley/toolbox/HttpResponse;)V
    .locals 2
    .param p1, "httpResponse"    # Lcom/android/volley/toolbox/HttpResponse;

    .line 113
    new-instance v0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, v1, v1}, Lcom/android/volley/toolbox/AsyncHttpStack$Response;-><init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;Lcom/android/volley/toolbox/AsyncHttpStack$1;)V

    .line 118
    .local v0, "response":Lcom/android/volley/toolbox/AsyncHttpStack$Response;
    iget-object v1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$entry:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 119
    iget-object v1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 120
    return-void
.end method

.class public Lcom/android/volley/toolbox/BasicAsyncNetwork;
.super Lcom/android/volley/AsyncNetwork;
.source "BasicAsyncNetwork.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;,
        Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;,
        Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;
    }
.end annotation


# instance fields
.field private final mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

.field private final mPool:Lcom/android/volley/toolbox/ByteArrayPool;


# direct methods
.method private constructor <init>(Lcom/android/volley/toolbox/AsyncHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V
    .locals 0
    .param p1, "httpStack"    # Lcom/android/volley/toolbox/AsyncHttpStack;
    .param p2, "pool"    # Lcom/android/volley/toolbox/ByteArrayPool;

    .line 55
    invoke-direct {p0}, Lcom/android/volley/AsyncNetwork;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    .line 57
    iput-object p2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 58
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/volley/toolbox/AsyncHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;Lcom/android/volley/toolbox/BasicAsyncNetwork$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/volley/toolbox/AsyncHttpStack;
    .param p2, "x1"    # Lcom/android/volley/toolbox/ByteArrayPool;
    .param p3, "x2"    # Lcom/android/volley/toolbox/BasicAsyncNetwork$1;

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/android/volley/toolbox/BasicAsyncNetwork;-><init>(Lcom/android/volley/toolbox/AsyncHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;JLcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/volley/toolbox/BasicAsyncNetwork;
    .param p1, "x1"    # Lcom/android/volley/Request;
    .param p2, "x2"    # J
    .param p4, "x3"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p5, "x4"    # Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    .line 46
    invoke-direct/range {p0 .. p5}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onRequestSucceeded(Lcom/android/volley/Request;JLcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V
    .locals 0
    .param p0, "x0"    # Lcom/android/volley/toolbox/BasicAsyncNetwork;
    .param p1, "x1"    # Lcom/android/volley/Request;
    .param p2, "x2"    # Lcom/android/volley/AsyncNetwork$OnRequestComplete;
    .param p3, "x3"    # Ljava/io/IOException;
    .param p4, "x4"    # J
    .param p6, "x5"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p7, "x6"    # [B

    .line 46
    invoke-direct/range {p0 .. p7}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onRequestFailed(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/volley/toolbox/BasicAsyncNetwork;)Lcom/android/volley/toolbox/ByteArrayPool;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/toolbox/BasicAsyncNetwork;

    .line 46
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/volley/toolbox/BasicAsyncNetwork;JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V
    .locals 0
    .param p0, "x0"    # Lcom/android/volley/toolbox/BasicAsyncNetwork;
    .param p1, "x1"    # J
    .param p3, "x2"    # I
    .param p4, "x3"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p5, "x4"    # Lcom/android/volley/Request;
    .param p6, "x5"    # Lcom/android/volley/AsyncNetwork$OnRequestComplete;
    .param p7, "x6"    # Ljava/util/List;
    .param p8, "x7"    # [B

    .line 46
    invoke-direct/range {p0 .. p8}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onResponseRead(JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V

    return-void
.end method

.method private onRequestFailed(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V
    .locals 6
    .param p2, "callback"    # Lcom/android/volley/AsyncNetwork$OnRequestComplete;
    .param p3, "exception"    # Ljava/io/IOException;
    .param p4, "requestStartMs"    # J
    .param p6, "httpResponse"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p7, "responseContents"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            "Ljava/io/IOException;",
            "J",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "[B)V"
        }
    .end annotation

    .line 135
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    nop

    .line 136
    move-object v0, p1

    move-object v1, p3

    move-wide v2, p4

    move-object v4, p6

    move-object v5, p7

    :try_start_0
    invoke-static/range {v0 .. v5}, Lcom/android/volley/toolbox/NetworkUtility;->shouldRetryException(Lcom/android/volley/Request;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    move-result-object v0

    .line 139
    .local v0, "retryInfo":Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    invoke-virtual {p0}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;

    invoke-direct {v2, p0, p1, v0, p2}, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;-><init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V

    .line 140
    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lcom/android/volley/VolleyError; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .end local v0    # "retryInfo":Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, "volleyError":Lcom/android/volley/VolleyError;
    invoke-interface {p2, v0}, Lcom/android/volley/AsyncNetwork$OnRequestComplete;->onError(Lcom/android/volley/VolleyError;)V

    .line 144
    .end local v0    # "volleyError":Lcom/android/volley/VolleyError;
    :goto_0
    return-void
.end method

.method private onRequestSucceeded(Lcom/android/volley/Request;JLcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    .locals 17
    .param p2, "requestStartMs"    # J
    .param p4, "httpResponse"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p5, "callback"    # Lcom/android/volley/AsyncNetwork$OnRequestComplete;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;J",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            ")V"
        }
    .end annotation

    .line 80
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getStatusCode()I

    move-result v10

    .line 81
    .local v10, "statusCode":I
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getHeaders()Ljava/util/List;

    move-result-object v11

    .line 83
    .local v11, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    const/16 v0, 0x130

    if-ne v10, v0, :cond_0

    .line 84
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long v0, v0, p2

    .line 85
    .local v0, "requestDuration":J
    nop

    .line 86
    move-object/from16 v12, p1

    invoke-static {v12, v0, v1, v11}, Lcom/android/volley/toolbox/NetworkUtility;->getNotModifiedNetworkResponse(Lcom/android/volley/Request;JLjava/util/List;)Lcom/android/volley/NetworkResponse;

    move-result-object v2

    .line 85
    move-object/from16 v13, p5

    invoke-interface {v13, v2}, Lcom/android/volley/AsyncNetwork$OnRequestComplete;->onSuccess(Lcom/android/volley/NetworkResponse;)V

    .line 88
    return-void

    .line 91
    .end local v0    # "requestDuration":J
    :cond_0
    move-object/from16 v12, p1

    move-object/from16 v13, p5

    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getContentBytes()[B

    move-result-object v0

    .line 92
    .local v0, "responseContents":[B
    if-nez v0, :cond_1

    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v1

    if-nez v1, :cond_1

    .line 95
    const/4 v1, 0x0

    new-array v0, v1, [B

    move-object v14, v0

    goto :goto_0

    .line 98
    :cond_1
    move-object v14, v0

    .end local v0    # "responseContents":[B
    .local v14, "responseContents":[B
    :goto_0
    if-eqz v14, :cond_2

    .line 99
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    move v3, v10

    move-object/from16 v4, p4

    move-object/from16 v5, p1

    move-object/from16 v6, p5

    move-object v7, v11

    move-object v8, v14

    invoke-direct/range {v0 .. v8}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onResponseRead(JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V

    .line 107
    return-void

    .line 113
    :cond_2
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v15

    .line 114
    .local v15, "inputStream":Ljava/io/InputStream;
    invoke-virtual/range {p0 .. p0}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v9

    new-instance v8, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;

    move-object v0, v8

    move-object/from16 v1, p0

    move-object v2, v15

    move-object/from16 v3, p4

    move-object/from16 v4, p1

    move-object/from16 v5, p5

    move-wide/from16 v6, p2

    move-object v12, v8

    move-object v8, v11

    move-object/from16 v16, v11

    move-object v11, v9

    .end local v11    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    .local v16, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    move v9, v10

    invoke-direct/range {v0 .. v9}, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;-><init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Ljava/io/InputStream;Lcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;JLjava/util/List;I)V

    .line 115
    invoke-interface {v11, v12}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 124
    return-void
.end method

.method private onResponseRead(JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V
    .locals 14
    .param p1, "requestStartMs"    # J
    .param p3, "statusCode"    # I
    .param p4, "httpResponse"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p6, "callback"    # Lcom/android/volley/AsyncNetwork$OnRequestComplete;
    .param p8, "responseContents"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;[B)V"
        }
    .end annotation

    .line 217
    .local p5, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .local p7, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    move/from16 v8, p3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long v9, v0, p1

    .line 218
    .local v9, "requestLifetime":J
    move-object/from16 v11, p5

    move-object/from16 v12, p8

    invoke-static {v9, v10, v11, v12, v8}, Lcom/android/volley/toolbox/NetworkUtility;->logSlowRequests(JLcom/android/volley/Request;[BI)V

    .line 220
    const/16 v0, 0xc8

    if-lt v8, v0, :cond_1

    const/16 v0, 0x12b

    if-le v8, v0, :cond_0

    move-object/from16 v13, p6

    goto :goto_0

    .line 231
    :cond_0
    new-instance v7, Lcom/android/volley/NetworkResponse;

    const/4 v3, 0x0

    .line 236
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long v4, v0, p1

    move-object v0, v7

    move/from16 v1, p3

    move-object/from16 v2, p8

    move-object/from16 v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    .line 231
    move-object/from16 v13, p6

    invoke-interface {v13, v7}, Lcom/android/volley/AsyncNetwork$OnRequestComplete;->onSuccess(Lcom/android/volley/NetworkResponse;)V

    .line 238
    return-void

    .line 220
    :cond_1
    move-object/from16 v13, p6

    .line 221
    :goto_0
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3}, Ljava/io/IOException;-><init>()V

    move-object v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    move-wide v4, p1

    move-object/from16 v6, p4

    move-object/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onRequestFailed(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V

    .line 228
    return-void
.end method


# virtual methods
.method public performRequest(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    .locals 11
    .param p2, "callback"    # Lcom/android/volley/AsyncNetwork$OnRequestComplete;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            ")V"
        }
    .end annotation

    .line 172
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    invoke-virtual {p0}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 176
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    .line 178
    .local v7, "requestStartMs":J
    nop

    .line 179
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/Cache$Entry;

    move-result-object v0

    invoke-static {v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->getCacheHeaders(Lcom/android/volley/Cache$Entry;)Ljava/util/Map;

    move-result-object v0

    .line 180
    .local v0, "additionalRequestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v9, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    new-instance v10, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;

    move-object v1, v10

    move-object v2, p0

    move-object v3, p1

    move-wide v4, v7

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;-><init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;JLcom/android/volley/AsyncNetwork$OnRequestComplete;)V

    invoke-virtual {v9, p1, v0, v10}, Lcom/android/volley/toolbox/AsyncHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V

    .line 205
    return-void

    .line 173
    .end local v0    # "additionalRequestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "requestStartMs":J
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "mBlockingExecuter must be set before making a request"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/ExecutorService;

    .line 63
    invoke-super {p0, p1}, Lcom/android/volley/AsyncNetwork;->setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 64
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    invoke-virtual {v0, p1}, Lcom/android/volley/toolbox/AsyncHttpStack;->setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 65
    return-void
.end method

.method public setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/ExecutorService;

    .line 70
    invoke-super {p0, p1}, Lcom/android/volley/AsyncNetwork;->setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 71
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    invoke-virtual {v0, p1}, Lcom/android/volley/toolbox/AsyncHttpStack;->setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 72
    return-void
.end method

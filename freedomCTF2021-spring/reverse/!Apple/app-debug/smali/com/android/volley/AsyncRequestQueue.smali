.class public Lcom/android/volley/AsyncRequestQueue;
.super Lcom/android/volley/RequestQueue;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/AsyncRequestQueue$ThrowingCache;,
        Lcom/android/volley/AsyncRequestQueue$Builder;,
        Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;,
        Lcom/android/volley/AsyncRequestQueue$CachePutTask;,
        Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;,
        Lcom/android/volley/AsyncRequestQueue$NetworkTask;,
        Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;,
        Lcom/android/volley/AsyncRequestQueue$CacheParseTask;,
        Lcom/android/volley/AsyncRequestQueue$CacheTask;
    }
.end annotation


# static fields
.field private static final DEFAULT_BLOCKING_THREAD_POOL_SIZE:I = 0x4


# instance fields
.field private final mAsyncCache:Lcom/android/volley/AsyncCache;

.field private mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

.field private final mCacheInitializationLock:Ljava/lang/Object;

.field private mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

.field private volatile mIsCacheInitialized:Z

.field private final mNetwork:Lcom/android/volley/AsyncNetwork;

.field private mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

.field private mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

.field private final mRequestsAwaitingCacheInitialization:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;


# direct methods
.method private constructor <init>(Lcom/android/volley/Cache;Lcom/android/volley/AsyncNetwork;Lcom/android/volley/AsyncCache;Lcom/android/volley/ResponseDelivery;Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;)V
    .locals 2
    .param p1, "cache"    # Lcom/android/volley/Cache;
    .param p2, "network"    # Lcom/android/volley/AsyncNetwork;
    .param p3, "asyncCache"    # Lcom/android/volley/AsyncCache;
    .param p4, "responseDelivery"    # Lcom/android/volley/ResponseDelivery;
    .param p5, "executorFactory"    # Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    .line 118
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p4}, Lcom/android/volley/RequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/Network;ILcom/android/volley/ResponseDelivery;)V

    .line 87
    new-instance v1, Lcom/android/volley/WaitingRequestManager;

    invoke-direct {v1, p0}, Lcom/android/volley/WaitingRequestManager;-><init>(Lcom/android/volley/RequestQueue;)V

    iput-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    .line 95
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mRequestsAwaitingCacheInitialization:Ljava/util/List;

    .line 97
    iput-boolean v0, p0, Lcom/android/volley/AsyncRequestQueue;->mIsCacheInitialized:Z

    .line 98
    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mCacheInitializationLock:Ljava/lang/Object;

    .line 119
    iput-object p3, p0, Lcom/android/volley/AsyncRequestQueue;->mAsyncCache:Lcom/android/volley/AsyncCache;

    .line 120
    iput-object p2, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    .line 121
    iput-object p5, p0, Lcom/android/volley/AsyncRequestQueue;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    .line 122
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/volley/Cache;Lcom/android/volley/AsyncNetwork;Lcom/android/volley/AsyncCache;Lcom/android/volley/ResponseDelivery;Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;Lcom/android/volley/AsyncRequestQueue$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/volley/Cache;
    .param p2, "x1"    # Lcom/android/volley/AsyncNetwork;
    .param p3, "x2"    # Lcom/android/volley/AsyncCache;
    .param p4, "x3"    # Lcom/android/volley/ResponseDelivery;
    .param p5, "x4"    # Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;
    .param p6, "x5"    # Lcom/android/volley/AsyncRequestQueue$1;

    .line 50
    invoke-direct/range {p0 .. p5}, Lcom/android/volley/AsyncRequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/AsyncNetwork;Lcom/android/volley/AsyncCache;Lcom/android/volley/ResponseDelivery;Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/AsyncRequestQueue;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/volley/AsyncRequestQueue;

    .line 50
    invoke-direct {p0}, Lcom/android/volley/AsyncRequestQueue;->onCacheInitializationComplete()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncCache;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/AsyncRequestQueue;

    .line 50
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mAsyncCache:Lcom/android/volley/AsyncCache;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/AsyncRequestQueue;

    .line 50
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Cache$Entry;Lcom/android/volley/Request;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/volley/AsyncRequestQueue;
    .param p1, "x1"    # Lcom/android/volley/Cache$Entry;
    .param p2, "x2"    # Lcom/android/volley/Request;

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/android/volley/AsyncRequestQueue;->handleEntry(Lcom/android/volley/Cache$Entry;Lcom/android/volley/Request;)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/WaitingRequestManager;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/AsyncRequestQueue;

    .line 50
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/AsyncRequestQueue;

    .line 50
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncNetwork;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/AsyncRequestQueue;

    .line 50
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/android/volley/AsyncRequestQueue;
    .param p1, "x1"    # Lcom/android/volley/Request;
    .param p2, "x2"    # Lcom/android/volley/Response;
    .param p3, "x3"    # Z

    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/android/volley/AsyncRequestQueue;->finishRequest(Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V

    return-void
.end method

.method private finishRequest(Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V
    .locals 1
    .param p3, "cached"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/Response<",
            "*>;Z)V"
        }
    .end annotation

    .line 480
    .local p1, "mRequest":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .local p2, "response":Lcom/android/volley/Response;, "Lcom/android/volley/Response<*>;"
    if-eqz p3, :cond_0

    .line 481
    const-string v0, "network-cache-written"

    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 484
    :cond_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->markDelivered()V

    .line 485
    invoke-virtual {p0}, Lcom/android/volley/AsyncRequestQueue;->getResponseDelivery()Lcom/android/volley/ResponseDelivery;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    .line 486
    invoke-virtual {p1, p2}, Lcom/android/volley/Request;->notifyListenerResponseReceived(Lcom/android/volley/Response;)V

    .line 487
    return-void
.end method

.method private static getBlockingQueue()Ljava/util/concurrent/PriorityBlockingQueue;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/PriorityBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .line 512
    new-instance v0, Ljava/util/concurrent/PriorityBlockingQueue;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$3;

    invoke-direct {v1}, Lcom/android/volley/AsyncRequestQueue$3;-><init>()V

    const/16 v2, 0xb

    invoke-direct {v0, v2, v1}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>(ILjava/util/Comparator;)V

    return-object v0
.end method

.method private handleEntry(Lcom/android/volley/Cache$Entry;Lcom/android/volley/Request;)V
    .locals 10
    .param p1, "entry"    # Lcom/android/volley/Cache$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Cache$Entry;",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    .line 267
    .local p2, "mRequest":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    if-nez p1, :cond_1

    .line 268
    const-string v0, "cache-miss"

    invoke-virtual {p2, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 270
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p2}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 271
    invoke-virtual {p0, p2}, Lcom/android/volley/AsyncRequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    .line 273
    :cond_0
    return-void

    .line 280
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 283
    .local v7, "currentTimeMillis":J
    invoke-virtual {p1, v7, v8}, Lcom/android/volley/Cache$Entry;->isExpired(J)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 284
    const-string v0, "cache-hit-expired"

    invoke-virtual {p2, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 285
    invoke-virtual {p2, p1}, Lcom/android/volley/Request;->setCacheEntry(Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Request;

    .line 286
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p2}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 287
    invoke-virtual {p0, p2}, Lcom/android/volley/AsyncRequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    .line 289
    :cond_2
    return-void

    .line 293
    :cond_3
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p2

    move-object v4, p1

    move-wide v5, v7

    invoke-direct/range {v1 .. v6}, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Cache$Entry;J)V

    invoke-interface {v0, v9}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 294
    return-void
.end method

.method private onCacheInitializationComplete()V
    .locals 3

    .line 215
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mCacheInitializationLock:Ljava/lang/Object;

    monitor-enter v0

    .line 216
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue;->mRequestsAwaitingCacheInitialization:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 217
    .local v1, "requestsToDispatch":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Request<*>;>;"
    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue;->mRequestsAwaitingCacheInitialization:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 218
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/volley/AsyncRequestQueue;->mIsCacheInitialized:Z

    .line 219
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/volley/Request;

    .line 223
    .local v2, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    invoke-virtual {p0, v2}, Lcom/android/volley/AsyncRequestQueue;->beginRequest(Lcom/android/volley/Request;)V

    .line 224
    .end local v2    # "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    goto :goto_0

    .line 225
    :cond_0
    return-void

    .line 219
    .end local v1    # "requestsToDispatch":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Request<*>;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method


# virtual methods
.method beginRequest(Lcom/android/volley/Request;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    .line 192
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<TT;>;"
    iget-boolean v0, p0, Lcom/android/volley/AsyncRequestQueue;->mIsCacheInitialized:Z

    if-nez v0, :cond_1

    .line 193
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mCacheInitializationLock:Ljava/lang/Object;

    monitor-enter v0

    .line 194
    :try_start_0
    iget-boolean v1, p0, Lcom/android/volley/AsyncRequestQueue;->mIsCacheInitialized:Z

    if-nez v1, :cond_0

    .line 195
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mRequestsAwaitingCacheInitialization:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    monitor-exit v0

    return-void

    .line 198
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 202
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->shouldCache()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 203
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mAsyncCache:Lcom/android/volley/AsyncCache;

    if-eqz v0, :cond_2

    .line 204
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$CacheTask;

    invoke-direct {v1, p0, p1}, Lcom/android/volley/AsyncRequestQueue$CacheTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 206
    :cond_2
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$CacheTask;

    invoke-direct {v1, p0, p1}, Lcom/android/volley/AsyncRequestQueue$CacheTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 209
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/volley/AsyncRequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    .line 211
    :goto_1
    return-void
.end method

.method sendRequestOverNetwork(Lcom/android/volley/Request;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    .line 229
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<TT;>;"
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    invoke-direct {v1, p0, p1}, Lcom/android/volley/AsyncRequestQueue$NetworkTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 230
    return-void
.end method

.method public start()V
    .locals 2

    .line 127
    invoke-virtual {p0}, Lcom/android/volley/AsyncRequestQueue;->stop()V

    .line 130
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    invoke-static {}, Lcom/android/volley/AsyncRequestQueue;->getBlockingQueue()Ljava/util/concurrent/PriorityBlockingQueue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;->createNonBlockingExecutor(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 131
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    invoke-static {}, Lcom/android/volley/AsyncRequestQueue;->getBlockingQueue()Ljava/util/concurrent/PriorityBlockingQueue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;->createBlockingExecutor(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 132
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    invoke-virtual {v0}, Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;->createNonBlockingScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 133
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncNetwork;->setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 134
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncNetwork;->setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 135
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncNetwork;->setNonBlockingScheduledExecutor(Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 138
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mAsyncCache:Lcom/android/volley/AsyncCache;

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$1;

    invoke-direct {v1, p0}, Lcom/android/volley/AsyncRequestQueue$1;-><init>(Lcom/android/volley/AsyncRequestQueue;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$2;

    invoke-direct {v1, p0}, Lcom/android/volley/AsyncRequestQueue$2;-><init>(Lcom/android/volley/AsyncRequestQueue;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 168
    :goto_0
    return-void
.end method

.method public stop()V
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 174
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 175
    iput-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_1

    .line 178
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 179
    iput-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 181
    :cond_1
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_2

    .line 182
    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    .line 183
    iput-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 185
    :cond_2
    return-void
.end method

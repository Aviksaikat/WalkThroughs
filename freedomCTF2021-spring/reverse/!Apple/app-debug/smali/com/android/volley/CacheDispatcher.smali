.class public Lcom/android/volley/CacheDispatcher;
.super Ljava/lang/Thread;
.source "CacheDispatcher.java"


# static fields
.field private static final DEBUG:Z


# instance fields
.field private final mCache:Lcom/android/volley/Cache;

.field private final mCacheQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final mDelivery:Lcom/android/volley/ResponseDelivery;

.field private final mNetworkQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field private volatile mQuit:Z

.field private final mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    sget-boolean v0, Lcom/android/volley/VolleyLog;->DEBUG:Z

    sput-boolean v0, Lcom/android/volley/CacheDispatcher;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/Cache;Lcom/android/volley/ResponseDelivery;)V
    .locals 1
    .param p3, "cache"    # Lcom/android/volley/Cache;
    .param p4, "delivery"    # Lcom/android/volley/ResponseDelivery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;",
            "Lcom/android/volley/Cache;",
            "Lcom/android/volley/ResponseDelivery;",
            ")V"
        }
    .end annotation

    .line 66
    .local p1, "cacheQueue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Lcom/android/volley/Request<*>;>;"
    .local p2, "networkQueue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Lcom/android/volley/Request<*>;>;"
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/volley/CacheDispatcher;->mQuit:Z

    .line 67
    iput-object p1, p0, Lcom/android/volley/CacheDispatcher;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    .line 68
    iput-object p2, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    .line 69
    iput-object p3, p0, Lcom/android/volley/CacheDispatcher;->mCache:Lcom/android/volley/Cache;

    .line 70
    iput-object p4, p0, Lcom/android/volley/CacheDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    .line 71
    new-instance v0, Lcom/android/volley/WaitingRequestManager;

    invoke-direct {v0, p0, p2, p4}, Lcom/android/volley/WaitingRequestManager;-><init>(Lcom/android/volley/CacheDispatcher;Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/ResponseDelivery;)V

    iput-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    .line 72
    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/CacheDispatcher;)Ljava/util/concurrent/BlockingQueue;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/CacheDispatcher;

    .line 31
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method private processRequest()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/Request;

    .line 115
    .local v0, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    invoke-virtual {p0, v0}, Lcom/android/volley/CacheDispatcher;->processRequest(Lcom/android/volley/Request;)V

    .line 116
    return-void
.end method


# virtual methods
.method processRequest(Lcom/android/volley/Request;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 120
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    const-string v0, "cache-queue-take"

    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 121
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->sendEvent(I)V

    .line 125
    const/4 v1, 0x2

    :try_start_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->isCanceled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 126
    const-string v0, "cache-discard-canceled"

    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    .line 127
    return-void

    .line 131
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/android/volley/CacheDispatcher;->mCache:Lcom/android/volley/Cache;

    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/android/volley/Cache;->get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;

    move-result-object v2

    .line 132
    .local v2, "entry":Lcom/android/volley/Cache$Entry;
    if-nez v2, :cond_2

    .line 133
    const-string v0, "cache-miss"

    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 135
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p1}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 136
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 209
    :cond_1
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    .line 138
    return-void

    .line 145
    :cond_2
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 148
    .local v3, "currentTimeMillis":J
    invoke-virtual {v2, v3, v4}, Lcom/android/volley/Cache$Entry;->isExpired(J)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 149
    const-string v0, "cache-hit-expired"

    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 150
    invoke-virtual {p1, v2}, Lcom/android/volley/Request;->setCacheEntry(Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Request;

    .line 151
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p1}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 152
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 209
    :cond_3
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    .line 154
    return-void

    .line 158
    :cond_4
    :try_start_3
    const-string v5, "cache-hit"

    invoke-virtual {p1, v5}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 159
    new-instance v5, Lcom/android/volley/NetworkResponse;

    iget-object v6, v2, Lcom/android/volley/Cache$Entry;->data:[B

    iget-object v7, v2, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    invoke-direct {v5, v6, v7}, Lcom/android/volley/NetworkResponse;-><init>([BLjava/util/Map;)V

    .line 160
    invoke-virtual {p1, v5}, Lcom/android/volley/Request;->parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;

    move-result-object v5

    .line 162
    .local v5, "response":Lcom/android/volley/Response;, "Lcom/android/volley/Response<*>;"
    const-string v6, "cache-hit-parsed"

    invoke-virtual {p1, v6}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v5}, Lcom/android/volley/Response;->isSuccess()Z

    move-result v6

    if-nez v6, :cond_6

    .line 165
    const-string v6, "cache-parsing-failed"

    invoke-virtual {p1, v6}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 166
    iget-object v6, p0, Lcom/android/volley/CacheDispatcher;->mCache:Lcom/android/volley/Cache;

    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Lcom/android/volley/Cache;->invalidate(Ljava/lang/String;Z)V

    .line 167
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->setCacheEntry(Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Request;

    .line 168
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p1}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 169
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 209
    :cond_5
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    .line 171
    return-void

    .line 173
    :cond_6
    :try_start_4
    invoke-virtual {v2, v3, v4}, Lcom/android/volley/Cache$Entry;->refreshNeeded(J)Z

    move-result v6

    if-nez v6, :cond_7

    .line 175
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    invoke-interface {v0, p1, v5}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    goto :goto_0

    .line 180
    :cond_7
    const-string v6, "cache-hit-refresh-needed"

    invoke-virtual {p1, v6}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 181
    invoke-virtual {p1, v2}, Lcom/android/volley/Request;->setCacheEntry(Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Request;

    .line 183
    iput-boolean v0, v5, Lcom/android/volley/Response;->intermediate:Z

    .line 185
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p1}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 188
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    new-instance v6, Lcom/android/volley/CacheDispatcher$1;

    invoke-direct {v6, p0, p1}, Lcom/android/volley/CacheDispatcher$1;-><init>(Lcom/android/volley/CacheDispatcher;Lcom/android/volley/Request;)V

    invoke-interface {v0, p1, v5, v6}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    goto :goto_0

    .line 205
    :cond_8
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    invoke-interface {v0, p1, v5}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 209
    .end local v2    # "entry":Lcom/android/volley/Cache$Entry;
    .end local v3    # "currentTimeMillis":J
    .end local v5    # "response":Lcom/android/volley/Response;, "Lcom/android/volley/Response<*>;"
    :goto_0
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    .line 210
    nop

    .line 211
    return-void

    .line 209
    :catchall_0
    move-exception v0

    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    throw v0
.end method

.method public quit()V
    .locals 1

    .line 79
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/volley/CacheDispatcher;->mQuit:Z

    .line 80
    invoke-virtual {p0}, Lcom/android/volley/CacheDispatcher;->interrupt()V

    .line 81
    return-void
.end method

.method public run()V
    .locals 4

    .line 85
    sget-boolean v0, Lcom/android/volley/CacheDispatcher;->DEBUG:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    new-array v0, v1, [Ljava/lang/Object;

    const-string v2, "start new dispatcher"

    invoke-static {v2, v0}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 86
    :cond_0
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 89
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mCache:Lcom/android/volley/Cache;

    invoke-interface {v0}, Lcom/android/volley/Cache;->initialize()V

    .line 93
    :goto_0
    :try_start_0
    invoke-direct {p0}, Lcom/android/volley/CacheDispatcher;->processRequest()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :goto_1
    goto :goto_0

    .line 94
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/InterruptedException;
    iget-boolean v2, p0, Lcom/android/volley/CacheDispatcher;->mQuit:Z

    if-eqz v2, :cond_1

    .line 97
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 98
    return-void

    .line 100
    :cond_1
    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "Ignoring spurious interrupt of CacheDispatcher thread; use quit() to terminate it"

    invoke-static {v3, v2}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .end local v0    # "e":Ljava/lang/InterruptedException;
    goto :goto_1
.end method

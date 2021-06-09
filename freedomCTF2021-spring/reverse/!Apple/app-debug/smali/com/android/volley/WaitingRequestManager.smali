.class Lcom/android/volley/WaitingRequestManager;
.super Ljava/lang/Object;
.source "WaitingRequestManager.java"

# interfaces
.implements Lcom/android/volley/Request$NetworkRequestCompleteListener;


# instance fields
.field private final mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

.field private final mNetworkQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final mRequestQueue:Lcom/android/volley/RequestQueue;

.field private final mResponseDelivery:Lcom/android/volley/ResponseDelivery;

.field private final mWaitingRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/volley/Request<",
            "*>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/android/volley/CacheDispatcher;Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/ResponseDelivery;)V
    .locals 1
    .param p1, "cacheDispatcher"    # Lcom/android/volley/CacheDispatcher;
    .param p3, "responseDelivery"    # Lcom/android/volley/ResponseDelivery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/CacheDispatcher;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;",
            "Lcom/android/volley/ResponseDelivery;",
            ")V"
        }
    .end annotation

    .line 75
    .local p2, "networkQueue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Lcom/android/volley/Request<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    .line 77
    iput-object p3, p0, Lcom/android/volley/WaitingRequestManager;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    .line 78
    iput-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    .line 79
    iput-object p2, p0, Lcom/android/volley/WaitingRequestManager;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    .line 80
    return-void
.end method

.method constructor <init>(Lcom/android/volley/RequestQueue;)V
    .locals 1
    .param p1, "requestQueue"    # Lcom/android/volley/RequestQueue;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    .line 66
    iput-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    .line 67
    invoke-virtual {p1}, Lcom/android/volley/RequestQueue;->getResponseDelivery()Lcom/android/volley/ResponseDelivery;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    .line 69
    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    .line 70
    return-void
.end method


# virtual methods
.method declared-synchronized maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)Z"
        }
    .end annotation

    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    monitor-enter p0

    .line 149
    :try_start_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, "cacheKey":Ljava/lang/String;
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    .line 154
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 155
    .local v1, "stagedRequests":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Request<*>;>;"
    if-nez v1, :cond_0

    .line 156
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v4

    .line 158
    .end local p0    # "this":Lcom/android/volley/WaitingRequestManager;
    :cond_0
    const-string v4, "waiting-for-response"

    invoke-virtual {p1, v4}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 159
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    iget-object v4, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-boolean v4, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-eqz v4, :cond_1

    .line 162
    const-string v4, "Request for cacheKey=%s is in flight, putting on hold."

    new-array v5, v2, [Ljava/lang/Object;

    aput-object v0, v5, v3

    invoke-static {v4, v5}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    :cond_1
    monitor-exit p0

    return v2

    .line 168
    .end local v1    # "stagedRequests":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Request<*>;>;"
    :cond_2
    :try_start_1
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    const/4 v4, 0x0

    invoke-interface {v1, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    invoke-virtual {p1, p0}, Lcom/android/volley/Request;->setNetworkRequestCompleteListener(Lcom/android/volley/Request$NetworkRequestCompleteListener;)V

    .line 170
    sget-boolean v1, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-eqz v1, :cond_3

    .line 171
    const-string v1, "new request, sending to network %s"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 173
    :cond_3
    monitor-exit p0

    return v3

    .line 148
    .end local v0    # "cacheKey":Ljava/lang/String;
    .end local p1    # "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onNoUsableResponseReceived(Lcom/android/volley/Request;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    monitor-enter p0

    .line 110
    :try_start_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "cacheKey":Ljava/lang/String;
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 112
    .local v1, "waitingRequests":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Request<*>;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 113
    sget-boolean v2, Lcom/android/volley/VolleyLog;->DEBUG:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    .line 114
    const-string v2, "%d waiting requests for cacheKey=%s; resend to network"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 116
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    aput-object v0, v5, v3

    .line 114
    invoke-static {v2, v5}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 118
    .end local p0    # "this":Lcom/android/volley/WaitingRequestManager;
    :cond_0
    invoke-interface {v1, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/volley/Request;

    .line 119
    .local v2, "nextInLine":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    iget-object v5, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v5, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    invoke-virtual {v2, p0}, Lcom/android/volley/Request;->setNetworkRequestCompleteListener(Lcom/android/volley/Request$NetworkRequestCompleteListener;)V

    .line 122
    iget-object v5, p0, Lcom/android/volley/WaitingRequestManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    if-eqz v5, :cond_1

    .line 124
    invoke-virtual {v5, v2}, Lcom/android/volley/RequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    goto :goto_0

    .line 125
    :cond_1
    iget-object v5, p0, Lcom/android/volley/WaitingRequestManager;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/android/volley/WaitingRequestManager;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_2

    .line 128
    :try_start_1
    invoke-interface {v5, v2}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    goto :goto_0

    .line 129
    :catch_0
    move-exception v5

    .line 130
    .local v5, "iex":Ljava/lang/InterruptedException;
    :try_start_2
    const-string v6, "Couldn\'t add request to queue. %s"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    invoke-static {v6, v3}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 132
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 134
    iget-object v3, p0, Lcom/android/volley/WaitingRequestManager;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    invoke-virtual {v3}, Lcom/android/volley/CacheDispatcher;->quit()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 138
    .end local v2    # "nextInLine":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .end local v5    # "iex":Ljava/lang/InterruptedException;
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    .line 109
    .end local v0    # "cacheKey":Ljava/lang/String;
    .end local v1    # "waitingRequests":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Request<*>;>;"
    .end local p1    # "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onResponseReceived(Lcom/android/volley/Request;Lcom/android/volley/Response;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/Response<",
            "*>;)V"
        }
    .end annotation

    .line 85
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .local p2, "response":Lcom/android/volley/Response;, "Lcom/android/volley/Response<*>;"
    iget-object v0, p2, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    if-eqz v0, :cond_3

    iget-object v0, p2, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    invoke-virtual {v0}, Lcom/android/volley/Cache$Entry;->isExpired()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 89
    :cond_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "cacheKey":Ljava/lang/String;
    monitor-enter p0

    .line 92
    :try_start_0
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 93
    .local v1, "waitingRequests":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Request<*>;>;"
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    if-eqz v1, :cond_2

    .line 95
    sget-boolean v2, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-eqz v2, :cond_1

    .line 96
    const-string v2, "Releasing %d waiting requests for cacheKey=%s."

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 98
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    .line 96
    invoke-static {v2, v3}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/volley/Request;

    .line 102
    .local v3, "waiting":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    iget-object v4, p0, Lcom/android/volley/WaitingRequestManager;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    invoke-interface {v4, v3, p2}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    .line 103
    .end local v3    # "waiting":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    goto :goto_0

    .line 105
    :cond_2
    return-void

    .line 93
    .end local v1    # "waitingRequests":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Request<*>;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 86
    .end local v0    # "cacheKey":Ljava/lang/String;
    :cond_3
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/volley/WaitingRequestManager;->onNoUsableResponseReceived(Lcom/android/volley/Request;)V

    .line 87
    return-void
.end method

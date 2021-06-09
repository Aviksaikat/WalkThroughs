.class final Lcom/android/volley/toolbox/NetworkUtility;
.super Ljava/lang/Object;
.source "NetworkUtility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    }
.end annotation


# static fields
.field private static final SLOW_REQUEST_THRESHOLD_MS:I = 0xbb8


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static attemptRetryOnException(Lcom/android/volley/Request;Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)V
    .locals 7
    .param p1, "retryInfo"    # Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 125
    .local p0, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    invoke-virtual {p0}, Lcom/android/volley/Request;->getRetryPolicy()Lcom/android/volley/RetryPolicy;

    move-result-object v0

    .line 126
    .local v0, "retryPolicy":Lcom/android/volley/RetryPolicy;
    invoke-virtual {p0}, Lcom/android/volley/Request;->getTimeoutMs()I

    move-result v1

    .line 128
    .local v1, "oldTimeout":I
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    :try_start_0
    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->access$000(Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)Lcom/android/volley/VolleyError;

    move-result-object v5

    invoke-interface {v0, v5}, Lcom/android/volley/RetryPolicy;->retry(Lcom/android/volley/VolleyError;)V
    :try_end_0
    .catch Lcom/android/volley/VolleyError; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    nop

    .line 135
    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->access$100(Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v2

    const-string v2, "%s-retry [timeout=%s]"

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 136
    return-void

    .line 129
    :catch_0
    move-exception v5

    .line 130
    .local v5, "e":Lcom/android/volley/VolleyError;
    new-array v4, v4, [Ljava/lang/Object;

    .line 132
    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->access$100(Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v2

    .line 131
    const-string v2, "%s-timeout-giveup [timeout=%s]"

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 130
    invoke-virtual {p0, v2}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 133
    throw v5
.end method

.method static getNotModifiedNetworkResponse(Lcom/android/volley/Request;JLjava/util/List;)Lcom/android/volley/NetworkResponse;
    .locals 11
    .param p1, "requestDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;J",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;)",
            "Lcom/android/volley/NetworkResponse;"
        }
    .end annotation

    .line 67
    .local p0, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .local p3, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    invoke-virtual {p0}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/Cache$Entry;

    move-result-object v0

    .line 68
    .local v0, "entry":Lcom/android/volley/Cache$Entry;
    if-nez v0, :cond_0

    .line 69
    new-instance v8, Lcom/android/volley/NetworkResponse;

    const/16 v2, 0x130

    const/4 v3, 0x0

    const/4 v4, 0x1

    move-object v1, v8

    move-wide v5, p1

    move-object v7, p3

    invoke-direct/range {v1 .. v7}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    return-object v8

    .line 77
    :cond_0
    invoke-static {p3, v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->combineHeaders(Ljava/util/List;Lcom/android/volley/Cache$Entry;)Ljava/util/List;

    move-result-object v9

    .line 78
    .local v9, "combinedHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    new-instance v10, Lcom/android/volley/NetworkResponse;

    const/16 v3, 0x130

    iget-object v4, v0, Lcom/android/volley/Cache$Entry;->data:[B

    const/4 v5, 0x1

    move-object v2, v10

    move-wide v6, p1

    move-object v8, v9

    invoke-direct/range {v2 .. v8}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    return-object v10
.end method

.method static inputStreamToBytes(Ljava/io/InputStream;ILcom/android/volley/toolbox/ByteArrayPool;)[B
    .locals 7
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "contentLength"    # I
    .param p2, "pool"    # Lcom/android/volley/toolbox/ByteArrayPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    const-string v0, "Error occurred when closing InputStream"

    new-instance v1, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

    invoke-direct {v1, p2, p1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;-><init>(Lcom/android/volley/toolbox/ByteArrayPool;I)V

    .line 90
    .local v1, "bytes":Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;
    const/4 v2, 0x0

    .line 92
    .local v2, "buffer":[B
    const/16 v3, 0x400

    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p2, v3}, Lcom/android/volley/toolbox/ByteArrayPool;->getBuf(I)[B

    move-result-object v3

    move-object v2, v3

    .line 94
    :goto_0
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v5, v3

    .local v5, "count":I
    const/4 v6, -0x1

    if-eq v3, v6, :cond_0

    .line 95
    invoke-virtual {v1, v2, v4, v5}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {v1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    if-eqz p0, :cond_1

    .line 102
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 104
    :catch_0
    move-exception v6

    .line 107
    .local v6, "e":Ljava/io/IOException;
    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v4}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    .line 108
    .end local v6    # "e":Ljava/io/IOException;
    :cond_1
    :goto_1
    nop

    .line 109
    :goto_2
    invoke-virtual {p2, v2}, Lcom/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 110
    invoke-virtual {v1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    .line 97
    return-object v3

    .line 99
    .end local v5    # "count":I
    :catchall_0
    move-exception v3

    .line 101
    if-eqz p0, :cond_2

    .line 102
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 104
    :catch_1
    move-exception v5

    .line 107
    .local v5, "e":Ljava/io/IOException;
    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v4}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_4

    .line 108
    .end local v5    # "e":Ljava/io/IOException;
    :cond_2
    :goto_3
    nop

    .line 109
    :goto_4
    invoke-virtual {p2, v2}, Lcom/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 110
    invoke-virtual {v1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    goto :goto_6

    :goto_5
    throw v3

    :goto_6
    goto :goto_5
.end method

.method static logSlowRequests(JLcom/android/volley/Request;[BI)V
    .locals 3
    .param p0, "requestLifetime"    # J
    .param p3, "responseContents"    # [B
    .param p4, "statusCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/android/volley/Request<",
            "*>;[BI)V"
        }
    .end annotation

    .line 53
    .local p2, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    sget-boolean v0, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-nez v0, :cond_0

    const-wide/16 v0, 0xbb8

    cmp-long v2, p0, v0

    if-lez v2, :cond_2

    .line 54
    :cond_0
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    .line 58
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 59
    if-eqz p3, :cond_1

    array-length v2, p3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_0

    :cond_1
    const-string v2, "null"

    :goto_0
    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 60
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    .line 61
    invoke-virtual {p2}, Lcom/android/volley/Request;->getRetryPolicy()Lcom/android/volley/RetryPolicy;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/volley/RetryPolicy;->getCurrentRetryCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 54
    const-string v1, "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]"

    invoke-static {v1, v0}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    :cond_2
    return-void
.end method

.method static shouldRetryException(Lcom/android/volley/Request;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    .locals 12
    .param p1, "exception"    # Ljava/io/IOException;
    .param p2, "requestStartMs"    # J
    .param p4, "httpResponse"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p5, "responseContents"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/io/IOException;",
            "J",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "[B)",
            "Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 161
    .local p0, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    move-object v0, p1

    instance-of v1, v0, Ljava/net/SocketTimeoutException;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 162
    new-instance v1, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance v3, Lcom/android/volley/TimeoutError;

    invoke-direct {v3}, Lcom/android/volley/TimeoutError;-><init>()V

    const-string v4, "socket"

    invoke-direct {v1, v4, v3, v2}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object v1

    .line 163
    :cond_0
    instance-of v1, v0, Ljava/net/MalformedURLException;

    if-nez v1, :cond_9

    .line 167
    if-eqz p4, :cond_7

    .line 168
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getStatusCode()I

    move-result v1

    .line 175
    .local v1, "statusCode":I
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const-string v4, "Unexpected response code %d for %s"

    invoke-static {v4, v3}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 177
    if-eqz p5, :cond_6

    .line 179
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getHeaders()Ljava/util/List;

    move-result-object v10

    .line 180
    .local v10, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    new-instance v11, Lcom/android/volley/NetworkResponse;

    const/4 v6, 0x0

    .line 185
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long v7, v3, p2

    move-object v3, v11

    move v4, v1

    move-object/from16 v5, p5

    move-object v9, v10

    invoke-direct/range {v3 .. v9}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    .line 187
    .local v3, "networkResponse":Lcom/android/volley/NetworkResponse;
    const/16 v4, 0x191

    if-eq v1, v4, :cond_5

    const/16 v4, 0x193

    if-ne v1, v4, :cond_1

    goto :goto_1

    .line 191
    :cond_1
    const/16 v4, 0x190

    if-lt v1, v4, :cond_3

    const/16 v4, 0x1f3

    if-le v1, v4, :cond_2

    goto :goto_0

    .line 193
    :cond_2
    new-instance v2, Lcom/android/volley/ClientError;

    invoke-direct {v2, v3}, Lcom/android/volley/ClientError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw v2

    .line 195
    :cond_3
    :goto_0
    const/16 v4, 0x1f4

    if-lt v1, v4, :cond_4

    const/16 v4, 0x257

    if-gt v1, v4, :cond_4

    .line 196
    invoke-virtual {p0}, Lcom/android/volley/Request;->shouldRetryServerErrors()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 197
    new-instance v4, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance v5, Lcom/android/volley/ServerError;

    invoke-direct {v5, v3}, Lcom/android/volley/ServerError;-><init>(Lcom/android/volley/NetworkResponse;)V

    const-string v6, "server"

    invoke-direct {v4, v6, v5, v2}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object v4

    .line 201
    :cond_4
    new-instance v2, Lcom/android/volley/ServerError;

    invoke-direct {v2, v3}, Lcom/android/volley/ServerError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw v2

    .line 189
    :cond_5
    :goto_1
    new-instance v4, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance v5, Lcom/android/volley/AuthFailureError;

    invoke-direct {v5, v3}, Lcom/android/volley/AuthFailureError;-><init>(Lcom/android/volley/NetworkResponse;)V

    const-string v6, "auth"

    invoke-direct {v4, v6, v5, v2}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object v4

    .line 203
    .end local v3    # "networkResponse":Lcom/android/volley/NetworkResponse;
    .end local v10    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    :cond_6
    new-instance v3, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance v4, Lcom/android/volley/NetworkError;

    invoke-direct {v4}, Lcom/android/volley/NetworkError;-><init>()V

    const-string v5, "network"

    invoke-direct {v3, v5, v4, v2}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object v3

    .line 170
    .end local v1    # "statusCode":I
    :cond_7
    invoke-virtual {p0}, Lcom/android/volley/Request;->shouldRetryConnectionErrors()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 171
    new-instance v1, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance v3, Lcom/android/volley/NoConnectionError;

    invoke-direct {v3}, Lcom/android/volley/NoConnectionError;-><init>()V

    const-string v4, "connection"

    invoke-direct {v1, v4, v3, v2}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object v1

    .line 173
    :cond_8
    new-instance v1, Lcom/android/volley/NoConnectionError;

    invoke-direct {v1, p1}, Lcom/android/volley/NoConnectionError;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 164
    :cond_9
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad URL "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

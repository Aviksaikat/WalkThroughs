.class public Lcom/android/volley/toolbox/BasicNetwork;
.super Ljava/lang/Object;
.source "BasicNetwork.java"

# interfaces
.implements Lcom/android/volley/Network;


# static fields
.field private static final DEFAULT_POOL_SIZE:I = 0x1000


# instance fields
.field private final mBaseHttpStack:Lcom/android/volley/toolbox/BaseHttpStack;

.field protected final mHttpStack:Lcom/android/volley/toolbox/HttpStack;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final mPool:Lcom/android/volley/toolbox/ByteArrayPool;


# direct methods
.method public constructor <init>(Lcom/android/volley/toolbox/BaseHttpStack;)V
    .locals 2
    .param p1, "httpStack"    # Lcom/android/volley/toolbox/BaseHttpStack;

    .line 77
    new-instance v0, Lcom/android/volley/toolbox/ByteArrayPool;

    const/16 v1, 0x1000

    invoke-direct {v0, v1}, Lcom/android/volley/toolbox/ByteArrayPool;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/BaseHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Lcom/android/volley/toolbox/BaseHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V
    .locals 0
    .param p1, "httpStack"    # Lcom/android/volley/toolbox/BaseHttpStack;
    .param p2, "pool"    # Lcom/android/volley/toolbox/ByteArrayPool;

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicNetwork;->mBaseHttpStack:Lcom/android/volley/toolbox/BaseHttpStack;

    .line 89
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicNetwork;->mHttpStack:Lcom/android/volley/toolbox/HttpStack;

    .line 90
    iput-object p2, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 91
    return-void
.end method

.method public constructor <init>(Lcom/android/volley/toolbox/HttpStack;)V
    .locals 2
    .param p1, "httpStack"    # Lcom/android/volley/toolbox/HttpStack;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 57
    new-instance v0, Lcom/android/volley/toolbox/ByteArrayPool;

    const/16 v1, 0x1000

    invoke-direct {v0, v1}, Lcom/android/volley/toolbox/ByteArrayPool;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/HttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lcom/android/volley/toolbox/HttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V
    .locals 1
    .param p1, "httpStack"    # Lcom/android/volley/toolbox/HttpStack;
    .param p2, "pool"    # Lcom/android/volley/toolbox/ByteArrayPool;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicNetwork;->mHttpStack:Lcom/android/volley/toolbox/HttpStack;

    .line 69
    new-instance v0, Lcom/android/volley/toolbox/AdaptedHttpStack;

    invoke-direct {v0, p1}, Lcom/android/volley/toolbox/AdaptedHttpStack;-><init>(Lcom/android/volley/toolbox/HttpStack;)V

    iput-object v0, p0, Lcom/android/volley/toolbox/BasicNetwork;->mBaseHttpStack:Lcom/android/volley/toolbox/BaseHttpStack;

    .line 70
    iput-object p2, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 71
    return-void
.end method

.method protected static convertHeaders([Lcom/android/volley/Header;)Ljava/util/Map;
    .locals 4
    .param p0, "headers"    # [Lcom/android/volley/Header;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/volley/Header;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 161
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 162
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 163
    aget-object v2, p0, v1

    invoke-virtual {v2}, Lcom/android/volley/Header;->getName()Ljava/lang/String;

    move-result-object v2

    aget-object v3, p0, v1

    invoke-virtual {v3}, Lcom/android/volley/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 165
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method


# virtual methods
.method public performRequest(Lcom/android/volley/Request;)Lcom/android/volley/NetworkResponse;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)",
            "Lcom/android/volley/NetworkResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 95
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    move-object/from16 v1, p0

    move-object/from16 v8, p1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    .line 97
    .local v9, "requestStart":J
    :goto_0
    const/4 v2, 0x0

    .line 98
    .local v2, "httpResponse":Lcom/android/volley/toolbox/HttpResponse;
    const/4 v3, 0x0

    .line 99
    .local v3, "responseContents":[B
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    .line 102
    .local v4, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    nop

    .line 103
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/Cache$Entry;

    move-result-object v0

    invoke-static {v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->getCacheHeaders(Lcom/android/volley/Cache$Entry;)Ljava/util/Map;

    move-result-object v0

    .line 104
    .local v0, "additionalRequestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v5, v1, Lcom/android/volley/toolbox/BasicNetwork;->mBaseHttpStack:Lcom/android/volley/toolbox/BaseHttpStack;

    invoke-virtual {v5, v8, v0}, Lcom/android/volley/toolbox/BaseHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;

    move-result-object v5

    move-object v2, v5

    .line 105
    invoke-virtual {v2}, Lcom/android/volley/toolbox/HttpResponse;->getStatusCode()I

    move-result v5

    .line 107
    .local v5, "statusCode":I
    invoke-virtual {v2}, Lcom/android/volley/toolbox/HttpResponse;->getHeaders()Ljava/util/List;

    move-result-object v6

    move-object v4, v6

    .line 109
    const/16 v6, 0x130

    if-ne v5, v6, :cond_0

    .line 110
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v9

    .line 111
    .local v6, "requestDuration":J
    invoke-static {v8, v6, v7, v4}, Lcom/android/volley/toolbox/NetworkUtility;->getNotModifiedNetworkResponse(Lcom/android/volley/Request;JLjava/util/List;)Lcom/android/volley/NetworkResponse;

    move-result-object v11

    return-object v11

    .line 116
    .end local v6    # "requestDuration":J
    :cond_0
    invoke-virtual {v2}, Lcom/android/volley/toolbox/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v6

    .line 117
    .local v6, "inputStream":Ljava/io/InputStream;
    if-eqz v6, :cond_1

    .line 118
    nop

    .line 120
    invoke-virtual {v2}, Lcom/android/volley/toolbox/HttpResponse;->getContentLength()I

    move-result v7

    iget-object v11, v1, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 119
    invoke-static {v6, v7, v11}, Lcom/android/volley/toolbox/NetworkUtility;->inputStreamToBytes(Ljava/io/InputStream;ILcom/android/volley/toolbox/ByteArrayPool;)[B

    move-result-object v7

    move-object v3, v7

    goto :goto_1

    .line 124
    :cond_1
    const/4 v7, 0x0

    new-array v7, v7, [B

    move-object v3, v7

    .line 128
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    sub-long v14, v11, v9

    .line 129
    .local v14, "requestLifetime":J
    invoke-static {v14, v15, v8, v3, v5}, Lcom/android/volley/toolbox/NetworkUtility;->logSlowRequests(JLcom/android/volley/Request;[BI)V

    .line 132
    const/16 v7, 0xc8

    if-lt v5, v7, :cond_2

    const/16 v7, 0x12b

    if-gt v5, v7, :cond_2

    .line 135
    new-instance v7, Lcom/android/volley/NetworkResponse;

    const/16 v16, 0x0

    .line 139
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    sub-long v17, v11, v9

    move-object v11, v7

    move v12, v5

    move-object v13, v3

    move-wide/from16 v19, v14

    .end local v14    # "requestLifetime":J
    .local v19, "requestLifetime":J
    move/from16 v14, v16

    move-wide/from16 v15, v17

    move-object/from16 v17, v4

    invoke-direct/range {v11 .. v17}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    .line 135
    return-object v7

    .line 132
    .end local v19    # "requestLifetime":J
    .restart local v14    # "requestLifetime":J
    :cond_2
    move-wide/from16 v19, v14

    .line 133
    .end local v14    # "requestLifetime":J
    .restart local v19    # "requestLifetime":J
    new-instance v7, Ljava/io/IOException;

    invoke-direct {v7}, Ljava/io/IOException;-><init>()V

    .end local v2    # "httpResponse":Lcom/android/volley/toolbox/HttpResponse;
    .end local v3    # "responseContents":[B
    .end local v4    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    .end local v9    # "requestStart":J
    .end local p1    # "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    throw v7
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    .end local v0    # "additionalRequestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "statusCode":I
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .end local v19    # "requestLifetime":J
    .restart local v2    # "httpResponse":Lcom/android/volley/toolbox/HttpResponse;
    .restart local v3    # "responseContents":[B
    .restart local v4    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    .restart local v9    # "requestStart":J
    .restart local p1    # "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    :catch_0
    move-exception v0

    move-object v11, v3

    move-object v12, v4

    move-object v3, v0

    move-object v0, v2

    .line 144
    .end local v2    # "httpResponse":Lcom/android/volley/toolbox/HttpResponse;
    .end local v4    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    .local v0, "httpResponse":Lcom/android/volley/toolbox/HttpResponse;
    .local v3, "e":Ljava/io/IOException;
    .local v11, "responseContents":[B
    .local v12, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    nop

    .line 145
    move-object/from16 v2, p1

    move-wide v4, v9

    move-object v6, v0

    move-object v7, v11

    invoke-static/range {v2 .. v7}, Lcom/android/volley/toolbox/NetworkUtility;->shouldRetryException(Lcom/android/volley/Request;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    move-result-object v2

    .line 148
    .local v2, "retryInfo":Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    invoke-static {v8, v2}, Lcom/android/volley/toolbox/NetworkUtility;->attemptRetryOnException(Lcom/android/volley/Request;Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)V

    .line 150
    .end local v0    # "httpResponse":Lcom/android/volley/toolbox/HttpResponse;
    .end local v2    # "retryInfo":Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    .end local v3    # "e":Ljava/io/IOException;
    .end local v11    # "responseContents":[B
    .end local v12    # "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    goto/16 :goto_0
.end method

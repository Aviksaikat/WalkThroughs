.class public Lcom/android/volley/cronet/CronetHttpStack;
.super Lcom/android/volley/toolbox/AsyncHttpStack;
.source "CronetHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;,
        Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;,
        Lcom/android/volley/cronet/CronetHttpStack$RequestListener;,
        Lcom/android/volley/cronet/CronetHttpStack$Builder;,
        Lcom/android/volley/cronet/CronetHttpStack$SetUpRequestTask;
    }
.end annotation


# instance fields
.field private final mCronetEngine:Lorg/chromium/net/CronetEngine;

.field private final mCurlCommandLogger:Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

.field private final mCurlLoggingEnabled:Z

.field private final mLogAuthTokensInCurlCommands:Z

.field private final mPool:Lcom/android/volley/toolbox/ByteArrayPool;

.field private final mRequestListener:Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

.field private final mUrlRewriter:Lcom/android/volley/toolbox/UrlRewriter;


# direct methods
.method private constructor <init>(Lorg/chromium/net/CronetEngine;Lcom/android/volley/toolbox/ByteArrayPool;Lcom/android/volley/toolbox/UrlRewriter;Lcom/android/volley/cronet/CronetHttpStack$RequestListener;ZLcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;Z)V
    .locals 0
    .param p1, "cronetEngine"    # Lorg/chromium/net/CronetEngine;
    .param p2, "pool"    # Lcom/android/volley/toolbox/ByteArrayPool;
    .param p3, "urlRewriter"    # Lcom/android/volley/toolbox/UrlRewriter;
    .param p4, "requestListener"    # Lcom/android/volley/cronet/CronetHttpStack$RequestListener;
    .param p5, "curlLoggingEnabled"    # Z
    .param p6, "curlCommandLogger"    # Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;
    .param p7, "logAuthTokensInCurlCommands"    # Z

    .line 79
    invoke-direct {p0}, Lcom/android/volley/toolbox/AsyncHttpStack;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack;->mCronetEngine:Lorg/chromium/net/CronetEngine;

    .line 81
    iput-object p2, p0, Lcom/android/volley/cronet/CronetHttpStack;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 82
    iput-object p3, p0, Lcom/android/volley/cronet/CronetHttpStack;->mUrlRewriter:Lcom/android/volley/toolbox/UrlRewriter;

    .line 83
    iput-object p4, p0, Lcom/android/volley/cronet/CronetHttpStack;->mRequestListener:Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

    .line 84
    iput-boolean p5, p0, Lcom/android/volley/cronet/CronetHttpStack;->mCurlLoggingEnabled:Z

    .line 85
    iput-object p6, p0, Lcom/android/volley/cronet/CronetHttpStack;->mCurlCommandLogger:Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

    .line 86
    iput-boolean p7, p0, Lcom/android/volley/cronet/CronetHttpStack;->mLogAuthTokensInCurlCommands:Z

    .line 88
    invoke-virtual {p4, p0}, Lcom/android/volley/cronet/CronetHttpStack$RequestListener;->initialize(Lcom/android/volley/cronet/CronetHttpStack;)V

    .line 89
    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/net/CronetEngine;Lcom/android/volley/toolbox/ByteArrayPool;Lcom/android/volley/toolbox/UrlRewriter;Lcom/android/volley/cronet/CronetHttpStack$RequestListener;ZLcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;ZLcom/android/volley/cronet/CronetHttpStack$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/chromium/net/CronetEngine;
    .param p2, "x1"    # Lcom/android/volley/toolbox/ByteArrayPool;
    .param p3, "x2"    # Lcom/android/volley/toolbox/UrlRewriter;
    .param p4, "x3"    # Lcom/android/volley/cronet/CronetHttpStack$RequestListener;
    .param p5, "x4"    # Z
    .param p6, "x5"    # Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;
    .param p7, "x6"    # Z
    .param p8, "x7"    # Lcom/android/volley/cronet/CronetHttpStack$1;

    .line 60
    invoke-direct/range {p0 .. p7}, Lcom/android/volley/cronet/CronetHttpStack;-><init>(Lorg/chromium/net/CronetEngine;Lcom/android/volley/toolbox/ByteArrayPool;Lcom/android/volley/toolbox/UrlRewriter;Lcom/android/volley/cronet/CronetHttpStack$RequestListener;ZLcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;Z)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/cronet/CronetHttpStack;)Lcom/android/volley/toolbox/ByteArrayPool;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;

    .line 60
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/volley/cronet/CronetHttpStack;Lorg/chromium/net/UrlResponseInfo;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;
    .param p1, "x1"    # Lorg/chromium/net/UrlResponseInfo;

    .line 60
    invoke-direct {p0, p1}, Lcom/android/volley/cronet/CronetHttpStack;->getContentLength(Lorg/chromium/net/UrlResponseInfo;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/android/volley/cronet/CronetHttpStack;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;

    .line 60
    invoke-virtual {p0}, Lcom/android/volley/cronet/CronetHttpStack;->getNonBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/volley/cronet/CronetHttpStack;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;

    .line 60
    invoke-virtual {p0}, Lcom/android/volley/cronet/CronetHttpStack;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/volley/cronet/CronetHttpStack;)Lcom/android/volley/cronet/CronetHttpStack$RequestListener;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;

    .line 60
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack;->mRequestListener:Lcom/android/volley/cronet/CronetHttpStack$RequestListener;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/volley/cronet/CronetHttpStack;Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Lcom/android/volley/Request;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;
    .param p1, "x1"    # Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;
    .param p2, "x2"    # Lcom/android/volley/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 60
    invoke-direct {p0, p1, p2}, Lcom/android/volley/cronet/CronetHttpStack;->setHttpMethod(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Lcom/android/volley/Request;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/volley/cronet/CronetHttpStack;Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Lcom/android/volley/Request;Ljava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;
    .param p1, "x1"    # Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;
    .param p2, "x2"    # Lcom/android/volley/Request;
    .param p3, "x3"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 60
    invoke-direct {p0, p1, p2, p3}, Lcom/android/volley/cronet/CronetHttpStack;->setRequestHeaders(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Lcom/android/volley/Request;Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/volley/cronet/CronetHttpStack;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;

    .line 60
    invoke-virtual {p0}, Lcom/android/volley/cronet/CronetHttpStack;->getNonBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/volley/cronet/CronetHttpStack;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;

    .line 60
    iget-boolean v0, p0, Lcom/android/volley/cronet/CronetHttpStack;->mCurlLoggingEnabled:Z

    return v0
.end method

.method static synthetic access$800(Lcom/android/volley/cronet/CronetHttpStack;Ljava/lang/String;Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;

    .line 60
    invoke-direct {p0, p1, p2}, Lcom/android/volley/cronet/CronetHttpStack;->generateCurlCommand(Ljava/lang/String;Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/volley/cronet/CronetHttpStack;)Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;
    .locals 1
    .param p0, "x0"    # Lcom/android/volley/cronet/CronetHttpStack;

    .line 60
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack;->mCurlCommandLogger:Lcom/android/volley/cronet/CronetHttpStack$CurlCommandLogger;

    return-object v0
.end method

.method private addBodyIfExists(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Ljava/lang/String;[B)V
    .locals 0
    .param p1, "requestParameters"    # Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "body"    # [B

    .line 304
    invoke-virtual {p1, p2, p3}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setBody(Ljava/lang/String;[B)V

    .line 305
    return-void
.end method

.method private generateCurlCommand(Ljava/lang/String;Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;)Ljava/lang/String;
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "requestParameters"    # Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;

    .line 331
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "curl "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 334
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "-X "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->getHttpMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    invoke-virtual {p2}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->getHeaders()Ljava/util/TreeMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 338
    .local v2, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "--header \""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    iget-boolean v3, p0, Lcom/android/volley/cronet/CronetHttpStack;->mLogAuthTokensInCurlCommands:Z

    if-nez v3, :cond_1

    .line 340
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Authorization"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 341
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Cookie"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 342
    :cond_0
    const-string v3, "[REDACTED]"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 344
    :cond_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    :goto_1
    const-string v3, "\" "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .end local v2    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0

    .line 350
    :cond_2
    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    invoke-virtual {p2}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->getBody()[B

    move-result-object v2

    if-eqz v2, :cond_5

    .line 354
    invoke-virtual {p2}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->getBody()[B

    move-result-object v2

    array-length v2, v2

    const/16 v3, 0x400

    if-lt v2, v3, :cond_3

    .line 355
    const-string v1, " [REQUEST BODY TOO LARGE TO INCLUDE]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 356
    :cond_3
    invoke-direct {p0, p2}, Lcom/android/volley/cronet/CronetHttpStack;->isBinaryContentForLogging(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 357
    invoke-virtual {p2}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->getBody()[B

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1

    .line 358
    .local v1, "base64":Ljava/lang/String;
    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "echo \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\' | base64 -d > /tmp/$$.bin; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 359
    const-string v3, " --data-binary @/tmp/$$.bin"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .end local v1    # "base64":Ljava/lang/String;
    goto :goto_2

    .line 363
    :cond_4
    :try_start_0
    const-string v2, " --data-ascii \""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/String;

    .line 364
    invoke-virtual {p2}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->getBody()[B

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    goto :goto_2

    .line 366
    :catch_0
    move-exception v1

    .line 367
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Could not encode to UTF-8"

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 372
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_5
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getContentLength(Lorg/chromium/net/UrlResponseInfo;)I
    .locals 2
    .param p1, "urlResponseInfo"    # Lorg/chromium/net/UrlResponseInfo;

    .line 322
    invoke-virtual {p1}, Lorg/chromium/net/UrlResponseInfo;->getAllHeaders()Ljava/util/Map;

    move-result-object v0

    const-string v1, "Content-Length"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 323
    .local v0, "content":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 324
    const/16 v1, 0x400

    return v1

    .line 326
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public static getHeaders(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;"
        }
    .end annotation

    .line 224
    .local p0, "headersList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 225
    .local v0, "headers":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 226
    .local v2, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Lcom/android/volley/Header;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Lcom/android/volley/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    .end local v2    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0

    .line 228
    :cond_0
    return-object v0
.end method

.method private getPriority(Lcom/android/volley/Request;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)I"
        }
    .end annotation

    .line 309
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    sget-object v0, Lcom/android/volley/cronet/CronetHttpStack$2;->$SwitchMap$com$android$volley$Request$Priority:[I

    invoke-virtual {p1}, Lcom/android/volley/Request;->getPriority()Lcom/android/volley/Request$Priority;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/volley/Request$Priority;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eq v0, v1, :cond_1

    if-eq v0, v2, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 317
    return v1

    .line 314
    :cond_0
    const/4 v0, 0x4

    return v0

    .line 311
    :cond_1
    return v2
.end method

.method private isBinaryContentForLogging(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;)Z
    .locals 9
    .param p1, "requestParameters"    # Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;

    .line 379
    invoke-virtual {p1}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->getHeaders()Ljava/util/TreeMap;

    move-result-object v0

    const-string v1, "Content-Encoding"

    invoke-virtual {v0, v1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 380
    .local v0, "contentEncoding":Ljava/lang/String;
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 381
    const-string v3, ","

    invoke-static {v0, v3}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 382
    .local v3, "encodings":[Ljava/lang/String;
    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_1

    aget-object v6, v3, v5

    .line 383
    .local v6, "encoding":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v8, "gzip"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 384
    return v2

    .line 382
    .end local v6    # "encoding":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 390
    .end local v3    # "encodings":[Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->getHeaders()Ljava/util/TreeMap;

    move-result-object v3

    const-string v4, "Content-Type"

    invoke-virtual {v3, v4}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 391
    .local v3, "contentType":Ljava/lang/String;
    if-eqz v3, :cond_3

    .line 392
    const-string v4, "text/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 393
    const-string v4, "application/xml"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 394
    const-string v4, "application/json"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    nop

    .line 392
    :goto_1
    return v1

    .line 398
    :cond_3
    return v2
.end method

.method private setHttpMethod(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Lcom/android/volley/Request;)V
    .locals 3
    .param p1, "requestParameters"    # Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 234
    .local p2, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    invoke-virtual {p2}, Lcom/android/volley/Request;->getMethod()I

    move-result v0

    const-string v1, "POST"

    const-string v2, "GET"

    packed-switch v0, :pswitch_data_0

    .line 277
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unknown method type."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 273
    :pswitch_0
    const-string v0, "PATCH"

    invoke-virtual {p1, v0}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 274
    invoke-virtual {p2}, Lcom/android/volley/Request;->getBodyContentType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/android/volley/Request;->getBody()[B

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/android/volley/cronet/CronetHttpStack;->addBodyIfExists(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Ljava/lang/String;[B)V

    .line 275
    goto :goto_0

    .line 270
    :pswitch_1
    const-string v0, "TRACE"

    invoke-virtual {p1, v0}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 271
    goto :goto_0

    .line 267
    :pswitch_2
    const-string v0, "OPTIONS"

    invoke-virtual {p1, v0}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 268
    goto :goto_0

    .line 264
    :pswitch_3
    const-string v0, "HEAD"

    invoke-virtual {p1, v0}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 265
    goto :goto_0

    .line 253
    :pswitch_4
    const-string v0, "DELETE"

    invoke-virtual {p1, v0}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 254
    goto :goto_0

    .line 260
    :pswitch_5
    const-string v0, "PUT"

    invoke-virtual {p1, v0}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 261
    invoke-virtual {p2}, Lcom/android/volley/Request;->getBodyContentType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/android/volley/Request;->getBody()[B

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/android/volley/cronet/CronetHttpStack;->addBodyIfExists(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Ljava/lang/String;[B)V

    .line 262
    goto :goto_0

    .line 256
    :pswitch_6
    invoke-virtual {p1, v1}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 257
    invoke-virtual {p2}, Lcom/android/volley/Request;->getBodyContentType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/android/volley/Request;->getBody()[B

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/android/volley/cronet/CronetHttpStack;->addBodyIfExists(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Ljava/lang/String;[B)V

    .line 258
    goto :goto_0

    .line 250
    :pswitch_7
    invoke-virtual {p1, v2}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 251
    goto :goto_0

    .line 239
    :pswitch_8
    invoke-virtual {p2}, Lcom/android/volley/Request;->getPostBody()[B

    move-result-object v0

    .line 240
    .local v0, "postBody":[B
    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {p1, v1}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 242
    invoke-virtual {p2}, Lcom/android/volley/Request;->getPostBodyContentType()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1, v0}, Lcom/android/volley/cronet/CronetHttpStack;->addBodyIfExists(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Ljava/lang/String;[B)V

    goto :goto_0

    .line 244
    :cond_0
    invoke-virtual {p1, v2}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->setHttpMethod(Ljava/lang/String;)V

    .line 246
    nop

    .line 279
    .end local v0    # "postBody":[B
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setRequestHeaders(Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;Lcom/android/volley/Request;Ljava/util/Map;)V
    .locals 1
    .param p1, "requestParameters"    # Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 294
    .local p2, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .local p3, "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1, p3}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->putAllHeaders(Ljava/util/Map;)V

    .line 296
    invoke-virtual {p2}, Lcom/android/volley/Request;->getHeaders()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->putAllHeaders(Ljava/util/Map;)V

    .line 297
    return-void
.end method


# virtual methods
.method public executeRequest(Lcom/android/volley/Request;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V
    .locals 15
    .param p3, "callback"    # Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;
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

    .line 96
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .local p2, "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object v7, p0

    move-object/from16 v8, p3

    invoke-virtual {p0}, Lcom/android/volley/cronet/CronetHttpStack;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/volley/cronet/CronetHttpStack;->getNonBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 99
    new-instance v0, Lcom/android/volley/cronet/CronetHttpStack$1;

    invoke-direct {v0, p0, v8}, Lcom/android/volley/cronet/CronetHttpStack$1;-><init>(Lcom/android/volley/cronet/CronetHttpStack;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V

    move-object v9, v0

    .line 159
    .local v9, "urlCallback":Lorg/chromium/net/UrlRequest$Callback;
    invoke-virtual/range {p1 .. p1}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, "url":Ljava/lang/String;
    iget-object v1, v7, Lcom/android/volley/cronet/CronetHttpStack;->mUrlRewriter:Lcom/android/volley/toolbox/UrlRewriter;

    invoke-interface {v1, v0}, Lcom/android/volley/toolbox/UrlRewriter;->rewriteUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 161
    .local v10, "rewritten":Ljava/lang/String;
    if-nez v10, :cond_0

    .line 162
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "URL blocked by rewriter: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {v8, v1}, Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;->onError(Ljava/io/IOException;)V

    .line 163
    return-void

    .line 165
    :cond_0
    move-object v11, v10

    .line 169
    .end local v0    # "url":Ljava/lang/String;
    .local v11, "url":Ljava/lang/String;
    iget-object v0, v7, Lcom/android/volley/cronet/CronetHttpStack;->mCronetEngine:Lorg/chromium/net/CronetEngine;

    .line 171
    invoke-virtual {p0}, Lcom/android/volley/cronet/CronetHttpStack;->getNonBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-virtual {v0, v11, v9, v1}, Lorg/chromium/net/CronetEngine;->newUrlRequestBuilder(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/UrlRequest$Builder;

    move-result-object v0

    .line 172
    invoke-virtual {v0}, Lorg/chromium/net/UrlRequest$Builder;->allowDirectExecutor()Lorg/chromium/net/UrlRequest$Builder;

    move-result-object v0

    .line 173
    invoke-virtual {v0}, Lorg/chromium/net/UrlRequest$Builder;->disableCache()Lorg/chromium/net/UrlRequest$Builder;

    move-result-object v0

    .line 174
    invoke-direct/range {p0 .. p1}, Lcom/android/volley/cronet/CronetHttpStack;->getPriority(Lcom/android/volley/Request;)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/UrlRequest$Builder;->setPriority(I)Lorg/chromium/net/UrlRequest$Builder;

    move-result-object v12

    .line 176
    .local v12, "builder":Lorg/chromium/net/UrlRequest$Builder;
    invoke-virtual {p0}, Lcom/android/volley/cronet/CronetHttpStack;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v13

    new-instance v14, Lcom/android/volley/cronet/CronetHttpStack$SetUpRequestTask;

    move-object v0, v14

    move-object v1, p0

    move-object/from16 v2, p1

    move-object v3, v11

    move-object v4, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/android/volley/cronet/CronetHttpStack$SetUpRequestTask;-><init>(Lcom/android/volley/cronet/CronetHttpStack;Lcom/android/volley/Request;Ljava/lang/String;Lorg/chromium/net/UrlRequest$Builder;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V

    .line 177
    invoke-interface {v13, v14}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 179
    return-void

    .line 97
    .end local v9    # "urlCallback":Lorg/chromium/net/UrlRequest$Callback;
    .end local v10    # "rewritten":Ljava/lang/String;
    .end local v11    # "url":Ljava/lang/String;
    .end local v12    # "builder":Lorg/chromium/net/UrlRequest$Builder;
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must set blocking and non-blocking executors"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

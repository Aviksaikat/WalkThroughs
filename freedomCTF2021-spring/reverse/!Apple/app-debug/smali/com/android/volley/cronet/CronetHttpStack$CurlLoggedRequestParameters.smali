.class Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;
.super Ljava/lang/Object;
.source "CronetHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/cronet/CronetHttpStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CurlLoggedRequestParameters"
.end annotation


# instance fields
.field private mBody:[B

.field private final mHeaders:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mHttpMethod:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 582
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 583
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHeaders:Ljava/util/TreeMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/volley/cronet/CronetHttpStack$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/volley/cronet/CronetHttpStack$1;

    .line 582
    invoke-direct {p0}, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;-><init>()V

    return-void
.end method


# virtual methods
.method applyToRequest(Lorg/chromium/net/UrlRequest$Builder;Ljava/util/concurrent/ExecutorService;)V
    .locals 4
    .param p1, "builder"    # Lorg/chromium/net/UrlRequest$Builder;
    .param p2, "nonBlockingExecutor"    # Ljava/util/concurrent/ExecutorService;

    .line 624
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHeaders:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 625
    .local v1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Lorg/chromium/net/UrlRequest$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/UrlRequest$Builder;

    .line 626
    .end local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0

    .line 627
    :cond_0
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHttpMethod:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/chromium/net/UrlRequest$Builder;->setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/UrlRequest$Builder;

    .line 628
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mBody:[B

    if-eqz v0, :cond_1

    .line 629
    invoke-static {v0}, Lorg/chromium/net/UploadDataProviders;->create([B)Lorg/chromium/net/UploadDataProvider;

    move-result-object v0

    .line 630
    .local v0, "dataProvider":Lorg/chromium/net/UploadDataProvider;
    invoke-virtual {p1, v0, p2}, Lorg/chromium/net/UrlRequest$Builder;->setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)Lorg/chromium/net/UrlRequest$Builder;

    .line 632
    .end local v0    # "dataProvider":Lorg/chromium/net/UploadDataProvider;
    :cond_1
    return-void
.end method

.method getBody()[B
    .locals 1

    .line 612
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mBody:[B

    return-object v0
.end method

.method getHeaders()Ljava/util/TreeMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 594
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHeaders:Ljava/util/TreeMap;

    return-object v0
.end method

.method getHttpMethod()Ljava/lang/String;
    .locals 1

    .line 603
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHttpMethod:Ljava/lang/String;

    return-object v0
.end method

.method putAllHeaders(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 599
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHeaders:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->putAll(Ljava/util/Map;)V

    .line 600
    return-void
.end method

.method setBody(Ljava/lang/String;[B)V
    .locals 2
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "body"    # [B

    .line 616
    iput-object p2, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mBody:[B

    .line 617
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHeaders:Ljava/util/TreeMap;

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 619
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHeaders:Ljava/util/TreeMap;

    invoke-virtual {v0, v1, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    :cond_0
    return-void
.end method

.method setHttpMethod(Ljava/lang/String;)V
    .locals 0
    .param p1, "httpMethod"    # Ljava/lang/String;

    .line 607
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack$CurlLoggedRequestParameters;->mHttpMethod:Ljava/lang/String;

    .line 608
    return-void
.end method

.class public abstract Lcom/android/volley/toolbox/BaseHttpStack;
.super Ljava/lang/Object;
.source "BaseHttpStack.java"

# interfaces
.implements Lcom/android/volley/toolbox/HttpStack;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;
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
.end method

.method public final performRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lorg/apache/http/HttpResponse;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 68
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    .local p2, "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, p1, p2}, Lcom/android/volley/toolbox/BaseHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;

    move-result-object v0

    .line 70
    .local v0, "response":Lcom/android/volley/toolbox/HttpResponse;
    new-instance v1, Lorg/apache/http/ProtocolVersion;

    const-string v2, "HTTP"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lorg/apache/http/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    .line 71
    .local v1, "protocolVersion":Lorg/apache/http/ProtocolVersion;
    new-instance v2, Lorg/apache/http/message/BasicStatusLine;

    .line 73
    invoke-virtual {v0}, Lcom/android/volley/toolbox/HttpResponse;->getStatusCode()I

    move-result v3

    const-string v4, ""

    invoke-direct {v2, v1, v3, v4}, Lorg/apache/http/message/BasicStatusLine;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 74
    .local v2, "statusLine":Lorg/apache/http/StatusLine;
    new-instance v3, Lorg/apache/http/message/BasicHttpResponse;

    invoke-direct {v3, v2}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/StatusLine;)V

    .line 76
    .local v3, "apacheResponse":Lorg/apache/http/message/BasicHttpResponse;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .local v4, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    invoke-virtual {v0}, Lcom/android/volley/toolbox/HttpResponse;->getHeaders()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/volley/Header;

    .line 78
    .local v6, "header":Lcom/android/volley/Header;
    new-instance v7, Lorg/apache/http/message/BasicHeader;

    invoke-virtual {v6}, Lcom/android/volley/Header;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6}, Lcom/android/volley/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .end local v6    # "header":Lcom/android/volley/Header;
    goto :goto_0

    .line 80
    :cond_0
    const/4 v5, 0x0

    new-array v5, v5, [Lorg/apache/http/Header;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lorg/apache/http/Header;

    invoke-virtual {v3, v5}, Lorg/apache/http/message/BasicHttpResponse;->setHeaders([Lorg/apache/http/Header;)V

    .line 82
    invoke-virtual {v0}, Lcom/android/volley/toolbox/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 83
    .local v5, "responseStream":Ljava/io/InputStream;
    if-eqz v5, :cond_1

    .line 84
    new-instance v6, Lorg/apache/http/entity/BasicHttpEntity;

    invoke-direct {v6}, Lorg/apache/http/entity/BasicHttpEntity;-><init>()V

    .line 85
    .local v6, "entity":Lorg/apache/http/entity/BasicHttpEntity;
    invoke-virtual {v6, v5}, Lorg/apache/http/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    .line 86
    invoke-virtual {v0}, Lcom/android/volley/toolbox/HttpResponse;->getContentLength()I

    move-result v7

    int-to-long v7, v7

    invoke-virtual {v6, v7, v8}, Lorg/apache/http/entity/BasicHttpEntity;->setContentLength(J)V

    .line 87
    invoke-virtual {v3, v6}, Lorg/apache/http/message/BasicHttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 90
    .end local v6    # "entity":Lorg/apache/http/entity/BasicHttpEntity;
    :cond_1
    return-object v3
.end method

.class Lcom/android/volley/cronet/CronetHttpStack$1;
.super Lorg/chromium/net/UrlRequest$Callback;
.source "CronetHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/cronet/CronetHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field bytesReceived:Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

.field receiveChannel:Ljava/nio/channels/WritableByteChannel;

.field final synthetic this$0:Lcom/android/volley/cronet/CronetHttpStack;

.field final synthetic val$callback:Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;


# direct methods
.method constructor <init>(Lcom/android/volley/cronet/CronetHttpStack;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/volley/cronet/CronetHttpStack;

    .line 100
    iput-object p1, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->this$0:Lcom/android/volley/cronet/CronetHttpStack;

    iput-object p2, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->val$callback:Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;

    invoke-direct {p0}, Lorg/chromium/net/UrlRequest$Callback;-><init>()V

    .line 101
    const/4 p2, 0x0

    iput-object p2, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->bytesReceived:Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

    .line 102
    iput-object p2, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->receiveChannel:Ljava/nio/channels/WritableByteChannel;

    return-void
.end method


# virtual methods
.method public onFailed(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V
    .locals 1
    .param p1, "urlRequest"    # Lorg/chromium/net/UrlRequest;
    .param p2, "urlResponseInfo"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "e"    # Lorg/chromium/net/CronetException;

    .line 155
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->val$callback:Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;

    invoke-interface {v0, p3}, Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;->onError(Ljava/io/IOException;)V

    .line 156
    return-void
.end method

.method public onReadCompleted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "urlRequest"    # Lorg/chromium/net/UrlRequest;
    .param p2, "urlResponseInfo"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 127
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 129
    :try_start_0
    iget-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->receiveChannel:Ljava/nio/channels/WritableByteChannel;

    invoke-interface {v0, p3}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 130
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 131
    invoke-virtual {p1, p3}, Lorg/chromium/net/UrlRequest;->read(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    goto :goto_0

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p1}, Lorg/chromium/net/UrlRequest;->cancel()V

    .line 134
    iget-object v1, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->val$callback:Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;

    invoke-interface {v1, v0}, Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;->onError(Ljava/io/IOException;)V

    .line 136
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method public onRedirectReceived(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)V
    .locals 0
    .param p1, "urlRequest"    # Lorg/chromium/net/UrlRequest;
    .param p2, "urlResponseInfo"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "newLocationUrl"    # Ljava/lang/String;

    .line 109
    invoke-virtual {p1}, Lorg/chromium/net/UrlRequest;->followRedirect()V

    .line 110
    return-void
.end method

.method public onResponseStarted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 3
    .param p1, "urlRequest"    # Lorg/chromium/net/UrlRequest;
    .param p2, "urlResponseInfo"    # Lorg/chromium/net/UrlResponseInfo;

    .line 115
    new-instance v0, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

    iget-object v1, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->this$0:Lcom/android/volley/cronet/CronetHttpStack;

    .line 117
    invoke-static {v1}, Lcom/android/volley/cronet/CronetHttpStack;->access$000(Lcom/android/volley/cronet/CronetHttpStack;)Lcom/android/volley/toolbox/ByteArrayPool;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->this$0:Lcom/android/volley/cronet/CronetHttpStack;

    invoke-static {v2, p2}, Lcom/android/volley/cronet/CronetHttpStack;->access$100(Lcom/android/volley/cronet/CronetHttpStack;Lorg/chromium/net/UrlResponseInfo;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;-><init>(Lcom/android/volley/toolbox/ByteArrayPool;I)V

    iput-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->bytesReceived:Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

    .line 118
    invoke-static {v0}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->receiveChannel:Ljava/nio/channels/WritableByteChannel;

    .line 119
    const/16 v0, 0x400

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/chromium/net/UrlRequest;->read(Ljava/nio/ByteBuffer;)V

    .line 120
    return-void
.end method

.method public onSucceeded(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 4
    .param p1, "urlRequest"    # Lorg/chromium/net/UrlRequest;
    .param p2, "urlResponseInfo"    # Lorg/chromium/net/UrlResponseInfo;

    .line 141
    invoke-virtual {p2}, Lorg/chromium/net/UrlResponseInfo;->getAllHeadersAsList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/android/volley/cronet/CronetHttpStack;->getHeaders(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 142
    .local v0, "headers":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    new-instance v1, Lcom/android/volley/toolbox/HttpResponse;

    .line 144
    invoke-virtual {p2}, Lorg/chromium/net/UrlResponseInfo;->getHttpStatusCode()I

    move-result v2

    iget-object v3, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->bytesReceived:Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

    .line 146
    invoke-virtual {v3}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lcom/android/volley/toolbox/HttpResponse;-><init>(ILjava/util/List;[B)V

    .line 147
    .local v1, "response":Lcom/android/volley/toolbox/HttpResponse;
    iget-object v2, p0, Lcom/android/volley/cronet/CronetHttpStack$1;->val$callback:Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;

    invoke-interface {v2, v1}, Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;->onSuccess(Lcom/android/volley/toolbox/HttpResponse;)V

    .line 148
    return-void
.end method

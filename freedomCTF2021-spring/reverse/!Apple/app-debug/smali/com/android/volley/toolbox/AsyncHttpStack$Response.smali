.class Lcom/android/volley/toolbox/AsyncHttpStack$Response;
.super Ljava/lang/Object;
.source "AsyncHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/AsyncHttpStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Response"
.end annotation


# instance fields
.field authFailureError:Lcom/android/volley/AuthFailureError;

.field httpResponse:Lcom/android/volley/toolbox/HttpResponse;

.field ioException:Ljava/io/IOException;


# direct methods
.method private constructor <init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;)V
    .locals 0
    .param p1, "httpResponse"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p2, "ioException"    # Ljava/io/IOException;
    .param p3, "authFailureError"    # Lcom/android/volley/AuthFailureError;

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    iput-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    .line 171
    iput-object p2, p0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->ioException:Ljava/io/IOException;

    .line 172
    iput-object p3, p0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->authFailureError:Lcom/android/volley/AuthFailureError;

    .line 173
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;Lcom/android/volley/toolbox/AsyncHttpStack$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/volley/toolbox/HttpResponse;
    .param p2, "x1"    # Ljava/io/IOException;
    .param p3, "x2"    # Lcom/android/volley/AuthFailureError;
    .param p4, "x3"    # Lcom/android/volley/toolbox/AsyncHttpStack$1;

    .line 161
    invoke-direct {p0, p1, p2, p3}, Lcom/android/volley/toolbox/AsyncHttpStack$Response;-><init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;)V

    return-void
.end method

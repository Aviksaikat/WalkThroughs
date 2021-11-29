.class public final Lcom/android/volley/toolbox/HttpResponse;
.super Ljava/lang/Object;
.source "HttpResponse.java"


# instance fields
.field private final mContent:Ljava/io/InputStream;

.field private final mContentBytes:[B

.field private final mContentLength:I

.field private final mHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;"
        }
    .end annotation
.end field

.field private final mStatusCode:I


# direct methods
.method public constructor <init>(ILjava/util/List;)V
    .locals 2
    .param p1, "statusCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;)V"
        }
    .end annotation

    .line 41
    .local p2, "headers":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/volley/toolbox/HttpResponse;-><init>(ILjava/util/List;ILjava/io/InputStream;)V

    .line 42
    return-void
.end method

.method public constructor <init>(ILjava/util/List;ILjava/io/InputStream;)V
    .locals 1
    .param p1, "statusCode"    # I
    .param p3, "contentLength"    # I
    .param p4, "content"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;I",
            "Ljava/io/InputStream;",
            ")V"
        }
    .end annotation

    .line 54
    .local p2, "headers":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput p1, p0, Lcom/android/volley/toolbox/HttpResponse;->mStatusCode:I

    .line 56
    iput-object p2, p0, Lcom/android/volley/toolbox/HttpResponse;->mHeaders:Ljava/util/List;

    .line 57
    iput p3, p0, Lcom/android/volley/toolbox/HttpResponse;->mContentLength:I

    .line 58
    iput-object p4, p0, Lcom/android/volley/toolbox/HttpResponse;->mContent:Ljava/io/InputStream;

    .line 59
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mContentBytes:[B

    .line 60
    return-void
.end method

.method public constructor <init>(ILjava/util/List;[B)V
    .locals 1
    .param p1, "statusCode"    # I
    .param p3, "contentBytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;[B)V"
        }
    .end annotation

    .line 70
    .local p2, "headers":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput p1, p0, Lcom/android/volley/toolbox/HttpResponse;->mStatusCode:I

    .line 72
    iput-object p2, p0, Lcom/android/volley/toolbox/HttpResponse;->mHeaders:Ljava/util/List;

    .line 73
    array-length v0, p3

    iput v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mContentLength:I

    .line 74
    iput-object p3, p0, Lcom/android/volley/toolbox/HttpResponse;->mContentBytes:[B

    .line 75
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mContent:Ljava/io/InputStream;

    .line 76
    return-void
.end method


# virtual methods
.method public final getContent()Ljava/io/InputStream;
    .locals 2

    .line 110
    iget-object v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mContent:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 111
    return-object v0

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mContentBytes:[B

    if-eqz v0, :cond_1

    .line 113
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/android/volley/toolbox/HttpResponse;->mContentBytes:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0

    .line 115
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getContentBytes()[B
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mContentBytes:[B

    return-object v0
.end method

.method public final getContentLength()I
    .locals 1

    .line 90
    iget v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mContentLength:I

    return v0
.end method

.method public final getHeaders()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;"
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mHeaders:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final getStatusCode()I
    .locals 1

    .line 80
    iget v0, p0, Lcom/android/volley/toolbox/HttpResponse;->mStatusCode:I

    return v0
.end method

.class Lcom/example/apkchallenge/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/apkchallenge/MainActivity;->callLoginServices()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/apkchallenge/MainActivity;


# direct methods
.method constructor <init>(Lcom/example/apkchallenge/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/example/apkchallenge/MainActivity;

    .line 42
    iput-object p1, p0, Lcom/example/apkchallenge/MainActivity$2;->this$0:Lcom/example/apkchallenge/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .line 45
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "That didn\'t work"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    return-void
.end method

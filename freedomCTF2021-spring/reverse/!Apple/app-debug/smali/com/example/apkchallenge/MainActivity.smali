.class public Lcom/example/apkchallenge/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public callLoginServices()V
    .locals 6

    .line 35
    invoke-static {p0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    .line 36
    .local v0, "queue":Lcom/android/volley/RequestQueue;
    const-string v1, "https://phaleroviamobile.freedomctf.org/secret-message"

    .line 37
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/android/volley/toolbox/StringRequest;

    new-instance v3, Lcom/example/apkchallenge/MainActivity$1;

    invoke-direct {v3, p0}, Lcom/example/apkchallenge/MainActivity$1;-><init>(Lcom/example/apkchallenge/MainActivity;)V

    new-instance v4, Lcom/example/apkchallenge/MainActivity$2;

    invoke-direct {v4, p0}, Lcom/example/apkchallenge/MainActivity$2;-><init>(Lcom/example/apkchallenge/MainActivity;)V

    const/4 v5, 0x0

    invoke-direct {v2, v5, v1, v3, v4}, Lcom/android/volley/toolbox/StringRequest;-><init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 48
    .local v2, "stringRequest":Lcom/android/volley/toolbox/StringRequest;
    invoke-virtual {v0, v2}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 49
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 20
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    const v0, 0x7f0b001c

    invoke-virtual {p0, v0}, Lcom/example/apkchallenge/MainActivity;->setContentView(I)V

    .line 22
    return-void
.end method

.method public sendLogin(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .line 24
    const v0, 0x7f080122

    invoke-virtual {p0, v0}, Lcom/example/apkchallenge/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 25
    .local v0, "usernameView":Landroid/widget/TextView;
    const v1, 0x7f0800c3

    invoke-virtual {p0, v1}, Lcom/example/apkchallenge/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 27
    .local v1, "passwordView":Landroid/widget/TextView;
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 28
    .local v2, "username":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 29
    .local v3, "password":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/example/apkchallenge/MainActivity;->callLoginServices()V

    .line 31
    return-void
.end method

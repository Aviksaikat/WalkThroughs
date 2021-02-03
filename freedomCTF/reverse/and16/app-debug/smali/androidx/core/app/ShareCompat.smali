.class public final Landroidx/core/app/ShareCompat;
.super Ljava/lang/Object;
.source "ShareCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/app/ShareCompat$IntentReader;,
        Landroidx/core/app/ShareCompat$IntentBuilder;
    }
.end annotation


# static fields
.field public static final EXTRA_CALLING_ACTIVITY:Ljava/lang/String; = "androidx.core.app.EXTRA_CALLING_ACTIVITY"

.field public static final EXTRA_CALLING_ACTIVITY_INTEROP:Ljava/lang/String; = "android.support.v4.app.EXTRA_CALLING_ACTIVITY"

.field public static final EXTRA_CALLING_PACKAGE:Ljava/lang/String; = "androidx.core.app.EXTRA_CALLING_PACKAGE"

.field public static final EXTRA_CALLING_PACKAGE_INTEROP:Ljava/lang/String; = "android.support.v4.app.EXTRA_CALLING_PACKAGE"

.field private static final HISTORY_FILENAME_PREFIX:Ljava/lang/String; = ".sharecompat_"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static configureMenuItem(Landroid/view/Menu;ILandroidx/core/app/ShareCompat$IntentBuilder;)V
    .locals 4
    .param p0, "menu"    # Landroid/view/Menu;
    .param p1, "menuItemId"    # I
    .param p2, "shareIntent"    # Landroidx/core/app/ShareCompat$IntentBuilder;

    .line 213
    invoke-interface {p0, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 214
    .local v0, "item":Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 218
    invoke-static {v0, p2}, Landroidx/core/app/ShareCompat;->configureMenuItem(Landroid/view/MenuItem;Landroidx/core/app/ShareCompat$IntentBuilder;)V

    .line 219
    return-void

    .line 215
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not find menu item with id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " in the supplied menu"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static configureMenuItem(Landroid/view/MenuItem;Landroidx/core/app/ShareCompat$IntentBuilder;)V
    .locals 4
    .param p0, "item"    # Landroid/view/MenuItem;
    .param p1, "shareIntent"    # Landroidx/core/app/ShareCompat$IntentBuilder;

    .line 185
    invoke-interface {p0}, Landroid/view/MenuItem;->getActionProvider()Landroid/view/ActionProvider;

    move-result-object v0

    .line 187
    .local v0, "itemProvider":Landroid/view/ActionProvider;
    instance-of v1, v0, Landroid/widget/ShareActionProvider;

    if-nez v1, :cond_0

    .line 188
    new-instance v1, Landroid/widget/ShareActionProvider;

    invoke-virtual {p1}, Landroidx/core/app/ShareCompat$IntentBuilder;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/ShareActionProvider;-><init>(Landroid/content/Context;)V

    .local v1, "provider":Landroid/widget/ShareActionProvider;
    goto :goto_0

    .line 190
    .end local v1    # "provider":Landroid/widget/ShareActionProvider;
    :cond_0
    move-object v1, v0

    check-cast v1, Landroid/widget/ShareActionProvider;

    .line 192
    .restart local v1    # "provider":Landroid/widget/ShareActionProvider;
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ".sharecompat_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    invoke-virtual {p1}, Landroidx/core/app/ShareCompat$IntentBuilder;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 192
    invoke-virtual {v1, v2}, Landroid/widget/ShareActionProvider;->setShareHistoryFileName(Ljava/lang/String;)V

    .line 194
    invoke-virtual {p1}, Landroidx/core/app/ShareCompat$IntentBuilder;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ShareActionProvider;->setShareIntent(Landroid/content/Intent;)V

    .line 195
    invoke-interface {p0, v1}, Landroid/view/MenuItem;->setActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;

    .line 197
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-ge v2, v3, :cond_1

    .line 198
    invoke-interface {p0}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v2

    if-nez v2, :cond_1

    .line 199
    invoke-virtual {p1}, Landroidx/core/app/ShareCompat$IntentBuilder;->createChooserIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    .line 202
    :cond_1
    return-void
.end method

.method public static getCallingActivity(Landroid/app/Activity;)Landroid/content/ComponentName;
    .locals 3
    .param p0, "calledActivity"    # Landroid/app/Activity;

    .line 147
    invoke-virtual {p0}, Landroid/app/Activity;->getCallingActivity()Landroid/content/ComponentName;

    move-result-object v0

    .line 148
    .local v0, "result":Landroid/content/ComponentName;
    if-nez v0, :cond_0

    .line 149
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "androidx.core.app.EXTRA_CALLING_ACTIVITY"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/content/ComponentName;

    .line 150
    if-nez v0, :cond_0

    .line 151
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "android.support.v4.app.EXTRA_CALLING_ACTIVITY"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/content/ComponentName;

    .line 155
    :cond_0
    return-object v0
.end method

.method public static getCallingPackage(Landroid/app/Activity;)Ljava/lang/String;
    .locals 3
    .param p0, "calledActivity"    # Landroid/app/Activity;

    .line 124
    invoke-virtual {p0}, Landroid/app/Activity;->getCallingPackage()Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 126
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "androidx.core.app.EXTRA_CALLING_PACKAGE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 127
    if-nez v0, :cond_0

    .line 128
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "android.support.v4.app.EXTRA_CALLING_PACKAGE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    :cond_0
    return-object v0
.end method

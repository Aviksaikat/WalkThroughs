.class Landroidx/core/graphics/TypefaceCompatBaseImpl;
.super Ljava/lang/Object;
.source "TypefaceCompatBaseImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor;
    }
.end annotation


# static fields
.field private static final INVALID_KEY:I = 0x0

.field private static final TAG:Ljava/lang/String; = "TypefaceCompatBaseImpl"


# instance fields
.field private mFontFamilies:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Landroidx/core/graphics/TypefaceCompatBaseImpl;->mFontFamilies:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method private addFontFamily(Landroid/graphics/Typeface;Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;)V
    .locals 5
    .param p1, "typeface"    # Landroid/graphics/Typeface;
    .param p2, "entry"    # Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;

    .line 219
    invoke-static {p1}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->getUniqueKey(Landroid/graphics/Typeface;)J

    move-result-wide v0

    .line 220
    .local v0, "key":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 221
    iget-object v2, p0, Landroidx/core/graphics/TypefaceCompatBaseImpl;->mFontFamilies:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    :cond_0
    return-void
.end method

.method private findBestEntry(Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;I)Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;
    .locals 2
    .param p1, "entry"    # Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;
    .param p2, "style"    # I

    .line 153
    invoke-virtual {p1}, Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;->getEntries()[Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    move-result-object v0

    new-instance v1, Landroidx/core/graphics/TypefaceCompatBaseImpl$2;

    invoke-direct {v1, p0}, Landroidx/core/graphics/TypefaceCompatBaseImpl$2;-><init>(Landroidx/core/graphics/TypefaceCompatBaseImpl;)V

    invoke-static {v0, p2, v1}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->findBestFont([Ljava/lang/Object;ILandroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    return-object v0
.end method

.method private static findBestFont([Ljava/lang/Object;ILandroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor;)Ljava/lang/Object;
    .locals 11
    .param p1, "style"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I",
            "Landroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 61
    .local p0, "fonts":[Ljava/lang/Object;, "[TT;"
    .local p2, "extractor":Landroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor;, "Landroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor<TT;>;"
    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_0

    const/16 v0, 0x190

    goto :goto_0

    :cond_0
    const/16 v0, 0x2bc

    .line 62
    .local v0, "targetWeight":I
    :goto_0
    and-int/lit8 v1, p1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    .line 64
    .local v1, "isTargetItalic":Z
    :goto_1
    const/4 v4, 0x0

    .line 65
    .local v4, "best":Ljava/lang/Object;, "TT;"
    const v5, 0x7fffffff

    .line 67
    .local v5, "bestScore":I
    array-length v6, p0

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v6, :cond_5

    aget-object v8, p0, v7

    .line 68
    .local v8, "font":Ljava/lang/Object;, "TT;"
    invoke-interface {p2, v8}, Landroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor;->getWeight(Ljava/lang/Object;)I

    move-result v9

    sub-int/2addr v9, v0

    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    move-result v9

    mul-int/lit8 v9, v9, 0x2

    .line 69
    invoke-interface {p2, v8}, Landroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor;->isItalic(Ljava/lang/Object;)Z

    move-result v10

    if-ne v10, v1, :cond_2

    const/4 v10, 0x0

    goto :goto_3

    :cond_2
    const/4 v10, 0x1

    :goto_3
    add-int/2addr v9, v10

    .line 71
    .local v9, "score":I
    if-eqz v4, :cond_3

    if-le v5, v9, :cond_4

    .line 72
    :cond_3
    move-object v4, v8

    .line 73
    move v5, v9

    .line 67
    .end local v8    # "font":Ljava/lang/Object;, "TT;"
    .end local v9    # "score":I
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 76
    :cond_5
    return-object v4
.end method

.method private static getUniqueKey(Landroid/graphics/Typeface;)J
    .locals 6
    .param p0, "typeface"    # Landroid/graphics/Typeface;

    .line 80
    const-string v0, "Could not retrieve font from family."

    const-string v1, "TypefaceCompatBaseImpl"

    const-wide/16 v2, 0x0

    if-nez p0, :cond_0

    .line 81
    return-wide v2

    .line 85
    :cond_0
    :try_start_0
    const-class v4, Landroid/graphics/Typeface;

    const-string v5, "native_instance"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 86
    .local v4, "field":Ljava/lang/reflect/Field;
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 87
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    .line 88
    .local v5, "num":Ljava/lang/Number;
    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 92
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "num":Ljava/lang/Number;
    :catch_0
    move-exception v4

    .line 93
    .local v4, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v1, v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 94
    return-wide v2

    .line 89
    .end local v4    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v4

    .line 90
    .local v4, "e":Ljava/lang/NoSuchFieldException;
    invoke-static {v1, v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 91
    return-wide v2
.end method


# virtual methods
.method public createFromFontFamilyFilesResourceEntry(Landroid/content/Context;Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "entry"    # Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;
    .param p3, "resources"    # Landroid/content/res/Resources;
    .param p4, "style"    # I

    .line 169
    invoke-direct {p0, p2, p4}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->findBestEntry(Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;I)Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    move-result-object v0

    .line 170
    .local v0, "best":Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;
    if-nez v0, :cond_0

    .line 171
    const/4 v1, 0x0

    return-object v1

    .line 173
    :cond_0
    nop

    .line 174
    invoke-virtual {v0}, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->getResourceId()I

    move-result v1

    invoke-virtual {v0}, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->getFileName()Ljava/lang/String;

    move-result-object v2

    .line 173
    invoke-static {p1, p3, v1, v2, p4}, Landroidx/core/graphics/TypefaceCompat;->createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v1

    .line 176
    .local v1, "typeface":Landroid/graphics/Typeface;
    invoke-direct {p0, v1, p2}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->addFontFamily(Landroid/graphics/Typeface;Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;)V

    .line 178
    return-object v1
.end method

.method public createFromFontInfo(Landroid/content/Context;Landroid/os/CancellationSignal;[Landroidx/core/provider/FontsContractCompat$FontInfo;I)Landroid/graphics/Typeface;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cancellationSignal"    # Landroid/os/CancellationSignal;
    .param p3, "fonts"    # [Landroidx/core/provider/FontsContractCompat$FontInfo;
    .param p4, "style"    # I

    .line 137
    array-length v0, p3

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ge v0, v2, :cond_0

    .line 138
    return-object v1

    .line 140
    :cond_0
    invoke-virtual {p0, p3, p4}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->findBestInfo([Landroidx/core/provider/FontsContractCompat$FontInfo;I)Landroidx/core/provider/FontsContractCompat$FontInfo;

    move-result-object v0

    .line 141
    .local v0, "font":Landroidx/core/provider/FontsContractCompat$FontInfo;
    const/4 v2, 0x0

    .line 143
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v0}, Landroidx/core/provider/FontsContractCompat$FontInfo;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v3

    move-object v2, v3

    .line 144
    invoke-virtual {p0, p1, v2}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->createFromInputStream(Landroid/content/Context;Ljava/io/InputStream;)Landroid/graphics/Typeface;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    invoke-static {v2}, Landroidx/core/graphics/TypefaceCompatUtil;->closeQuietly(Ljava/io/Closeable;)V

    .line 144
    return-object v1

    .line 148
    :catchall_0
    move-exception v1

    invoke-static {v2}, Landroidx/core/graphics/TypefaceCompatUtil;->closeQuietly(Ljava/io/Closeable;)V

    throw v1

    .line 145
    :catch_0
    move-exception v3

    .line 146
    .local v3, "e":Ljava/io/IOException;
    nop

    .line 148
    invoke-static {v2}, Landroidx/core/graphics/TypefaceCompatUtil;->closeQuietly(Ljava/io/Closeable;)V

    .line 146
    return-object v1
.end method

.method protected createFromInputStream(Landroid/content/Context;Ljava/io/InputStream;)Landroid/graphics/Typeface;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "is"    # Ljava/io/InputStream;

    .line 114
    invoke-static {p1}, Landroidx/core/graphics/TypefaceCompatUtil;->getTempFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 115
    .local v0, "tmpFile":Ljava/io/File;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 116
    return-object v1

    .line 119
    :cond_0
    :try_start_0
    invoke-static {v0, p2}, Landroidx/core/graphics/TypefaceCompatUtil;->copyToFile(Ljava/io/File;Ljava/io/InputStream;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    .line 120
    nop

    .line 129
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 120
    return-object v1

    .line 122
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 122
    return-object v1

    .line 129
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    throw v1

    .line 123
    :catch_0
    move-exception v2

    .line 127
    .local v2, "e":Ljava/lang/RuntimeException;
    nop

    .line 129
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 127
    return-object v1
.end method

.method public createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resources"    # Landroid/content/res/Resources;
    .param p3, "id"    # I
    .param p4, "path"    # Ljava/lang/String;
    .param p5, "style"    # I

    .line 187
    invoke-static {p1}, Landroidx/core/graphics/TypefaceCompatUtil;->getTempFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 188
    .local v0, "tmpFile":Ljava/io/File;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 189
    return-object v1

    .line 192
    :cond_0
    :try_start_0
    invoke-static {v0, p2, p3}, Landroidx/core/graphics/TypefaceCompatUtil;->copyToFile(Ljava/io/File;Landroid/content/res/Resources;I)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    .line 193
    nop

    .line 202
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 193
    return-object v1

    .line 195
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 202
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 195
    return-object v1

    .line 202
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    throw v1

    .line 196
    :catch_0
    move-exception v2

    .line 200
    .local v2, "e":Ljava/lang/RuntimeException;
    nop

    .line 202
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 200
    return-object v1
.end method

.method protected findBestInfo([Landroidx/core/provider/FontsContractCompat$FontInfo;I)Landroidx/core/provider/FontsContractCompat$FontInfo;
    .locals 1
    .param p1, "fonts"    # [Landroidx/core/provider/FontsContractCompat$FontInfo;
    .param p2, "style"    # I

    .line 99
    new-instance v0, Landroidx/core/graphics/TypefaceCompatBaseImpl$1;

    invoke-direct {v0, p0}, Landroidx/core/graphics/TypefaceCompatBaseImpl$1;-><init>(Landroidx/core/graphics/TypefaceCompatBaseImpl;)V

    invoke-static {p1, p2, v0}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->findBestFont([Ljava/lang/Object;ILandroidx/core/graphics/TypefaceCompatBaseImpl$StyleExtractor;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/provider/FontsContractCompat$FontInfo;

    return-object v0
.end method

.method getFontFamily(Landroid/graphics/Typeface;)Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;
    .locals 5
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .line 211
    invoke-static {p1}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->getUniqueKey(Landroid/graphics/Typeface;)J

    move-result-wide v0

    .line 212
    .local v0, "key":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 213
    const/4 v2, 0x0

    return-object v2

    .line 215
    :cond_0
    iget-object v2, p0, Landroidx/core/graphics/TypefaceCompatBaseImpl;->mFontFamilies:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;

    return-object v2
.end method

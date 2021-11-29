.class public Lcom/android/volley/toolbox/HttpHeaderParser;
.super Ljava/lang/Object;
.source "HttpHeaderParser.java"


# static fields
.field private static final DEFAULT_CONTENT_CHARSET:Ljava/lang/String; = "ISO-8859-1"

.field public static final HEADER_CONTENT_TYPE:Ljava/lang/String; = "Content-Type"

.field private static final RFC1123_OUTPUT_FORMAT:Ljava/lang/String; = "EEE, dd MMM yyyy HH:mm:ss \'GMT\'"

.field private static final RFC1123_PARSE_FORMAT:Ljava/lang/String; = "EEE, dd MMM yyyy HH:mm:ss zzz"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static combineHeaders(Ljava/util/List;Lcom/android/volley/Cache$Entry;)Ljava/util/List;
    .locals 7
    .param p1, "entry"    # Lcom/android/volley/Cache$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;",
            "Lcom/android/volley/Cache$Entry;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;"
        }
    .end annotation

    .line 251
    .local p0, "responseHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    new-instance v0, Ljava/util/TreeSet;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 252
    .local v0, "headerNamesFromNetworkResponse":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 253
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/volley/Header;

    .line 254
    .local v2, "header":Lcom/android/volley/Header;
    invoke-virtual {v2}, Lcom/android/volley/Header;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 255
    .end local v2    # "header":Lcom/android/volley/Header;
    goto :goto_0

    .line 260
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 261
    .local v1, "combinedHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    iget-object v2, p1, Lcom/android/volley/Cache$Entry;->allResponseHeaders:Ljava/util/List;

    if-eqz v2, :cond_3

    .line 262
    iget-object v2, p1, Lcom/android/volley/Cache$Entry;->allResponseHeaders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 263
    iget-object v2, p1, Lcom/android/volley/Cache$Entry;->allResponseHeaders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/volley/Header;

    .line 264
    .local v3, "header":Lcom/android/volley/Header;
    invoke-virtual {v3}, Lcom/android/volley/Header;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 265
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    .end local v3    # "header":Lcom/android/volley/Header;
    :cond_1
    goto :goto_1

    :cond_2
    goto :goto_3

    .line 271
    :cond_3
    iget-object v2, p1, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 272
    iget-object v2, p1, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 273
    .local v3, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 274
    new-instance v4, Lcom/android/volley/Header;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v4, v5, v6}, Lcom/android/volley/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 276
    .end local v3    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    goto :goto_2

    .line 279
    :cond_5
    :goto_3
    return-object v1
.end method

.method static formatEpochAsRfc1123(J)Ljava/lang/String;
    .locals 2
    .param p0, "epoch"    # J

    .line 169
    const-string v0, "EEE, dd MMM yyyy HH:mm:ss \'GMT\'"

    invoke-static {v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->newUsGmtFormatter(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getCacheHeaders(Lcom/android/volley/Cache$Entry;)Ljava/util/Map;
    .locals 6
    .param p0, "entry"    # Lcom/android/volley/Cache$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Cache$Entry;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 284
    if-nez p0, :cond_0

    .line 285
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 288
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 290
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 291
    iget-object v1, p0, Lcom/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    const-string v2, "If-None-Match"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    :cond_1
    iget-wide v1, p0, Lcom/android/volley/Cache$Entry;->lastModified:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_2

    .line 295
    iget-wide v1, p0, Lcom/android/volley/Cache$Entry;->lastModified:J

    .line 296
    invoke-static {v1, v2}, Lcom/android/volley/toolbox/HttpHeaderParser;->formatEpochAsRfc1123(J)Ljava/lang/String;

    move-result-object v1

    .line 295
    const-string v2, "If-Modified-Since"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    :cond_2
    return-object v0
.end method

.method private static newUsGmtFormatter(Ljava/lang/String;)Ljava/text/SimpleDateFormat;
    .locals 2
    .param p0, "format"    # Ljava/lang/String;

    .line 173
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, p0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 174
    .local v0, "formatter":Ljava/text/SimpleDateFormat;
    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 175
    return-object v0
.end method

.method public static parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;
    .locals 29
    .param p0, "response"    # Lcom/android/volley/NetworkResponse;

    .line 62
    move-object/from16 v1, p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 64
    .local v2, "now":J
    iget-object v4, v1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    .line 65
    .local v4, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x0

    if-nez v4, :cond_0

    .line 66
    return-object v5

    .line 69
    :cond_0
    const-wide/16 v6, 0x0

    .line 70
    .local v6, "serverDate":J
    const-wide/16 v8, 0x0

    .line 71
    .local v8, "lastModified":J
    const-wide/16 v10, 0x0

    .line 72
    .local v10, "serverExpires":J
    const-wide/16 v12, 0x0

    .line 73
    .local v12, "softExpire":J
    const-wide/16 v14, 0x0

    .line 74
    .local v14, "finalExpire":J
    const-wide/16 v16, 0x0

    .line 75
    .local v16, "maxAge":J
    const-wide/16 v18, 0x0

    .line 76
    .local v18, "staleWhileRevalidate":J
    const/4 v0, 0x0

    .line 77
    .local v0, "hasCacheControl":Z
    const/16 v20, 0x0

    .line 79
    .local v20, "mustRevalidate":Z
    const/16 v21, 0x0

    .line 82
    .local v21, "serverEtag":Ljava/lang/String;
    const-string v5, "Date"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 83
    .local v5, "headerValue":Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 84
    invoke-static {v5}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v6

    .line 87
    :cond_1
    move/from16 v23, v0

    .end local v0    # "hasCacheControl":Z
    .local v23, "hasCacheControl":Z
    const-string v0, "Cache-Control"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .line 88
    if-eqz v5, :cond_9

    .line 89
    const/16 v23, 0x1

    .line 90
    const/4 v0, 0x0

    move-wide/from16 v24, v8

    .end local v8    # "lastModified":J
    .local v24, "lastModified":J
    const-string v8, ","

    invoke-virtual {v5, v8, v0}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v8

    .line 91
    .local v8, "tokens":[Ljava/lang/String;
    const/4 v0, 0x0

    move v9, v0

    .local v9, "i":I
    :goto_0
    array-length v0, v8

    if-ge v9, v0, :cond_8

    .line 92
    aget-object v0, v8, v9

    move-object/from16 v26, v5

    .end local v5    # "headerValue":Ljava/lang/String;
    .local v26, "headerValue":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 93
    .local v5, "token":Ljava/lang/String;
    const-string v0, "no-cache"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "no-store"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_4

    .line 95
    :cond_2
    const-string v0, "max-age="

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 97
    const/16 v0, 0x8

    :try_start_0
    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v27
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-wide/from16 v16, v27

    .line 99
    :goto_1
    goto :goto_3

    .line 98
    :catch_0
    move-exception v0

    goto :goto_1

    .line 100
    :cond_3
    const-string v0, "stale-while-revalidate="

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 102
    const/16 v0, 0x17

    :try_start_1
    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v27
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-wide/from16 v18, v27

    .line 104
    :goto_2
    goto :goto_3

    .line 103
    :catch_1
    move-exception v0

    goto :goto_2

    .line 105
    :cond_4
    const-string v0, "must-revalidate"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "proxy-revalidate"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 106
    :cond_5
    const/16 v20, 0x1

    .line 91
    .end local v5    # "token":Ljava/lang/String;
    :cond_6
    :goto_3
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v5, v26

    goto :goto_0

    .line 94
    .restart local v5    # "token":Ljava/lang/String;
    :cond_7
    :goto_4
    const/16 v22, 0x0

    return-object v22

    .line 91
    .end local v26    # "headerValue":Ljava/lang/String;
    .local v5, "headerValue":Ljava/lang/String;
    :cond_8
    move-object/from16 v26, v5

    .end local v5    # "headerValue":Ljava/lang/String;
    .restart local v26    # "headerValue":Ljava/lang/String;
    move/from16 v0, v23

    goto :goto_5

    .line 88
    .end local v9    # "i":I
    .end local v24    # "lastModified":J
    .end local v26    # "headerValue":Ljava/lang/String;
    .restart local v5    # "headerValue":Ljava/lang/String;
    .local v8, "lastModified":J
    :cond_9
    move-object/from16 v26, v5

    move-wide/from16 v24, v8

    .end local v5    # "headerValue":Ljava/lang/String;
    .end local v8    # "lastModified":J
    .restart local v24    # "lastModified":J
    .restart local v26    # "headerValue":Ljava/lang/String;
    move/from16 v0, v23

    .line 111
    .end local v23    # "hasCacheControl":Z
    .restart local v0    # "hasCacheControl":Z
    :goto_5
    const-string v5, "Expires"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 112
    .end local v26    # "headerValue":Ljava/lang/String;
    .restart local v5    # "headerValue":Ljava/lang/String;
    if-eqz v5, :cond_a

    .line 113
    invoke-static {v5}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v10

    .line 116
    :cond_a
    const-string v8, "Last-Modified"

    invoke-interface {v4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Ljava/lang/String;

    .line 117
    if-eqz v5, :cond_b

    .line 118
    invoke-static {v5}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v8

    .end local v24    # "lastModified":J
    .restart local v8    # "lastModified":J
    goto :goto_6

    .line 117
    .end local v8    # "lastModified":J
    .restart local v24    # "lastModified":J
    :cond_b
    move-wide/from16 v8, v24

    .line 121
    .end local v24    # "lastModified":J
    .restart local v8    # "lastModified":J
    :goto_6
    move-object/from16 v22, v5

    .end local v5    # "headerValue":Ljava/lang/String;
    .local v22, "headerValue":Ljava/lang/String;
    const-string v5, "ETag"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 125
    .end local v21    # "serverEtag":Ljava/lang/String;
    .local v5, "serverEtag":Ljava/lang/String;
    if-eqz v0, :cond_d

    .line 126
    const-wide/16 v23, 0x3e8

    mul-long v25, v16, v23

    add-long v12, v2, v25

    .line 127
    if-eqz v20, :cond_c

    move-wide/from16 v23, v12

    goto :goto_7

    :cond_c
    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->signum(J)I

    mul-long v23, v23, v18

    add-long v23, v12, v23

    :goto_7
    move-wide/from16 v14, v23

    goto :goto_8

    .line 128
    :cond_d
    const-wide/16 v23, 0x0

    cmp-long v21, v6, v23

    if-lez v21, :cond_e

    cmp-long v21, v10, v6

    if-ltz v21, :cond_e

    .line 130
    sub-long v23, v10, v6

    add-long v12, v2, v23

    .line 131
    move-wide v14, v12

    .line 134
    :cond_e
    :goto_8
    new-instance v21, Lcom/android/volley/Cache$Entry;

    invoke-direct/range {v21 .. v21}, Lcom/android/volley/Cache$Entry;-><init>()V

    move-object/from16 v23, v21

    .line 135
    .local v23, "entry":Lcom/android/volley/Cache$Entry;
    move/from16 v21, v0

    .end local v0    # "hasCacheControl":Z
    .local v21, "hasCacheControl":Z
    iget-object v0, v1, Lcom/android/volley/NetworkResponse;->data:[B

    move-wide/from16 v24, v2

    move-object/from16 v2, v23

    .end local v23    # "entry":Lcom/android/volley/Cache$Entry;
    .local v2, "entry":Lcom/android/volley/Cache$Entry;
    .local v24, "now":J
    iput-object v0, v2, Lcom/android/volley/Cache$Entry;->data:[B

    .line 136
    iput-object v5, v2, Lcom/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    .line 137
    iput-wide v12, v2, Lcom/android/volley/Cache$Entry;->softTtl:J

    .line 138
    iput-wide v14, v2, Lcom/android/volley/Cache$Entry;->ttl:J

    .line 139
    iput-wide v6, v2, Lcom/android/volley/Cache$Entry;->serverDate:J

    .line 140
    iput-wide v8, v2, Lcom/android/volley/Cache$Entry;->lastModified:J

    .line 141
    iput-object v4, v2, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    .line 142
    iget-object v0, v1, Lcom/android/volley/NetworkResponse;->allHeaders:Ljava/util/List;

    iput-object v0, v2, Lcom/android/volley/Cache$Entry;->allResponseHeaders:Ljava/util/List;

    .line 144
    return-object v2
.end method

.method public static parseCharset(Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 212
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "ISO-8859-1"

    invoke-static {p0, v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static parseCharset(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "defaultCharset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 188
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p0, :cond_0

    .line 189
    return-object p1

    .line 191
    :cond_0
    const-string v0, "Content-Type"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 192
    .local v0, "contentType":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 193
    const-string v1, ";"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 194
    .local v1, "params":[Ljava/lang/String;
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_2

    .line 195
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 196
    .local v4, "pair":[Ljava/lang/String;
    array-length v5, v4

    const/4 v6, 0x2

    if-ne v5, v6, :cond_1

    .line 197
    aget-object v5, v4, v2

    const-string v6, "charset"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 198
    const/4 v2, 0x1

    aget-object v2, v4, v2

    return-object v2

    .line 194
    .end local v4    # "pair":[Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 204
    .end local v1    # "params":[Ljava/lang/String;
    .end local v3    # "i":I
    :cond_2
    return-object p1
.end method

.method public static parseDateAsEpoch(Ljava/lang/String;)J
    .locals 5
    .param p0, "dateStr"    # Ljava/lang/String;

    .line 151
    :try_start_0
    const-string v0, "EEE, dd MMM yyyy HH:mm:ss zzz"

    invoke-static {v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->newUsGmtFormatter(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 152
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Ljava/text/ParseException;
    const-string v1, "Unable to parse dateStr: %s, falling back to 0"

    .line 157
    .local v1, "message":Ljava/lang/String;
    const-string v2, "0"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1

    const-string v2, "-1"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 160
    :cond_0
    new-array v2, v4, [Ljava/lang/Object;

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    .line 158
    :cond_1
    :goto_0
    new-array v2, v4, [Ljava/lang/Object;

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 163
    :goto_1
    const-wide/16 v2, 0x0

    return-wide v2
.end method

.method static toAllHeaderList(Ljava/util/Map;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;"
        }
    .end annotation

    .line 230
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 231
    .local v0, "allHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 232
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

    .line 233
    .end local v2    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0

    .line 234
    :cond_0
    return-object v0
.end method

.method static toHeaderMap(Ljava/util/List;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 221
    .local p0, "allHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/android/volley/Header;>;"
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 223
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/volley/Header;

    .line 224
    .local v2, "header":Lcom/android/volley/Header;
    invoke-virtual {v2}, Lcom/android/volley/Header;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/android/volley/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .end local v2    # "header":Lcom/android/volley/Header;
    goto :goto_0

    .line 226
    :cond_0
    return-object v0
.end method

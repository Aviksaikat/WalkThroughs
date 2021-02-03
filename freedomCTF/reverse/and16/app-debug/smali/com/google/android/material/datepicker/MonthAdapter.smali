.class Lcom/google/android/material/datepicker/MonthAdapter;
.super Landroid/widget/BaseAdapter;
.source "MonthAdapter.java"


# static fields
.field static final MAXIMUM_WEEKS:I


# instance fields
.field final calendarConstraints:Lcom/google/android/material/datepicker/CalendarConstraints;

.field calendarStyle:Lcom/google/android/material/datepicker/CalendarStyle;

.field final dateSelector:Lcom/google/android/material/datepicker/DateSelector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/datepicker/DateSelector<",
            "*>;"
        }
    .end annotation
.end field

.field final month:Lcom/google/android/material/datepicker/Month;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 41
    invoke-static {}, Lcom/google/android/material/datepicker/UtcDates;->getUtcCalendar()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->getMaximum(I)I

    move-result v0

    sput v0, Lcom/google/android/material/datepicker/MonthAdapter;->MAXIMUM_WEEKS:I

    return-void
.end method

.method constructor <init>(Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/DateSelector;Lcom/google/android/material/datepicker/CalendarConstraints;)V
    .locals 0
    .param p1, "month"    # Lcom/google/android/material/datepicker/Month;
    .param p3, "calendarConstraints"    # Lcom/google/android/material/datepicker/CalendarConstraints;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/datepicker/Month;",
            "Lcom/google/android/material/datepicker/DateSelector<",
            "*>;",
            "Lcom/google/android/material/datepicker/CalendarConstraints;",
            ")V"
        }
    .end annotation

    .line 52
    .local p2, "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    .line 54
    iput-object p2, p0, Lcom/google/android/material/datepicker/MonthAdapter;->dateSelector:Lcom/google/android/material/datepicker/DateSelector;

    .line 55
    iput-object p3, p0, Lcom/google/android/material/datepicker/MonthAdapter;->calendarConstraints:Lcom/google/android/material/datepicker/CalendarConstraints;

    .line 56
    return-void
.end method

.method private initializeStyles(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 154
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->calendarStyle:Lcom/google/android/material/datepicker/CalendarStyle;

    if-nez v0, :cond_0

    .line 155
    new-instance v0, Lcom/google/android/material/datepicker/CalendarStyle;

    invoke-direct {v0, p1}, Lcom/google/android/material/datepicker/CalendarStyle;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->calendarStyle:Lcom/google/android/material/datepicker/CalendarStyle;

    .line 157
    :cond_0
    return-void
.end method


# virtual methods
.method dayToPosition(I)I
    .locals 2
    .param p1, "day"    # I

    .line 194
    add-int/lit8 v0, p1, -0x1

    .line 195
    .local v0, "offsetFromFirst":I
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method firstPositionInMonth()I
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/Month;->daysFromStartOfWeekToFirstOfMonth()I

    move-result v0

    return v0
.end method

.method public getCount()I
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    iget v0, v0, Lcom/google/android/material/datepicker/Month;->daysInMonth:I

    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getItem(I)Ljava/lang/Long;
    .locals 2
    .param p1, "position"    # I

    .line 74
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/Month;->daysFromStartOfWeekToFirstOfMonth()I

    move-result v0

    if-lt p1, v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MonthAdapter;->lastPositionInMonth()I

    move-result v0

    if-le p1, v0, :cond_0

    goto :goto_0

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/MonthAdapter;->positionToDay(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/datepicker/Month;->getDay(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 75
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 36
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/MonthAdapter;->getItem(I)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .line 82
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    iget v0, v0, Lcom/google/android/material/datepicker/Month;->daysInWeek:I

    div-int v0, p1, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public bridge synthetic getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 36
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/datepicker/MonthAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/TextView;

    move-result-object p1

    return-object p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/TextView;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 101
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/material/datepicker/MonthAdapter;->initializeStyles(Landroid/content/Context;)V

    .line 102
    move-object v0, p2

    check-cast v0, Landroid/widget/TextView;

    .line 103
    .local v0, "day":Landroid/widget/TextView;
    const/4 v1, 0x0

    if-nez p2, :cond_0

    .line 104
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 105
    .local v2, "layoutInflater":Landroid/view/LayoutInflater;
    sget v3, Lcom/google/android/material/R$layout;->mtrl_calendar_day:I

    invoke-virtual {v2, v3, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Landroid/widget/TextView;

    .line 107
    .end local v2    # "layoutInflater":Landroid/view/LayoutInflater;
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v2

    sub-int v2, p1, v2

    .line 108
    .local v2, "offsetPosition":I
    const/4 v3, 0x1

    if-ltz v2, :cond_3

    iget-object v4, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    iget v4, v4, Lcom/google/android/material/datepicker/Month;->daysInMonth:I

    if-lt v2, v4, :cond_1

    goto :goto_1

    .line 112
    :cond_1
    add-int/lit8 v4, v2, 0x1

    .line 114
    .local v4, "dayNumber":I
    iget-object v5, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 115
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    iget-object v5, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v5, v4}, Lcom/google/android/material/datepicker/Month;->getDay(I)J

    move-result-wide v5

    .line 117
    .local v5, "dayInMillis":J
    iget-object v7, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    iget v7, v7, Lcom/google/android/material/datepicker/Month;->year:I

    invoke-static {}, Lcom/google/android/material/datepicker/Month;->today()Lcom/google/android/material/datepicker/Month;

    move-result-object v8

    iget v8, v8, Lcom/google/android/material/datepicker/Month;->year:I

    if-ne v7, v8, :cond_2

    .line 118
    invoke-static {v5, v6}, Lcom/google/android/material/datepicker/DateStrings;->getMonthDayOfWeekDay(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 120
    :cond_2
    invoke-static {v5, v6}, Lcom/google/android/material/datepicker/DateStrings;->getYearMonthDayOfWeekDay(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 122
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 123
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_2

    .line 109
    .end local v4    # "dayNumber":I
    .end local v5    # "dayInMillis":J
    :cond_3
    :goto_1
    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 126
    :goto_2
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/MonthAdapter;->getItem(I)Ljava/lang/Long;

    move-result-object v4

    .line 127
    .local v4, "date":Ljava/lang/Long;
    if-nez v4, :cond_4

    .line 128
    return-object v0

    .line 130
    :cond_4
    iget-object v5, p0, Lcom/google/android/material/datepicker/MonthAdapter;->calendarConstraints:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {v5}, Lcom/google/android/material/datepicker/CalendarConstraints;->getDateValidator()Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-interface {v5, v6, v7}, Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;->isValid(J)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 131
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 132
    iget-object v1, p0, Lcom/google/android/material/datepicker/MonthAdapter;->dateSelector:Lcom/google/android/material/datepicker/DateSelector;

    invoke-interface {v1}, Lcom/google/android/material/datepicker/DateSelector;->getSelectedDays()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 133
    .local v5, "selectedDay":J
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-static {v7, v8}, Lcom/google/android/material/datepicker/UtcDates;->canonicalYearMonthDay(J)J

    move-result-wide v7

    invoke-static {v5, v6}, Lcom/google/android/material/datepicker/UtcDates;->canonicalYearMonthDay(J)J

    move-result-wide v9

    cmp-long v3, v7, v9

    if-nez v3, :cond_5

    .line 134
    iget-object v1, p0, Lcom/google/android/material/datepicker/MonthAdapter;->calendarStyle:Lcom/google/android/material/datepicker/CalendarStyle;

    iget-object v1, v1, Lcom/google/android/material/datepicker/CalendarStyle;->selectedDay:Lcom/google/android/material/datepicker/CalendarItemStyle;

    invoke-virtual {v1, v0}, Lcom/google/android/material/datepicker/CalendarItemStyle;->styleItem(Landroid/widget/TextView;)V

    .line 135
    return-object v0

    .line 137
    .end local v5    # "selectedDay":J
    :cond_5
    goto :goto_3

    .line 139
    :cond_6
    invoke-static {}, Lcom/google/android/material/datepicker/UtcDates;->getTodayCalendar()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v5

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    cmp-long v1, v5, v7

    if-nez v1, :cond_7

    .line 140
    iget-object v1, p0, Lcom/google/android/material/datepicker/MonthAdapter;->calendarStyle:Lcom/google/android/material/datepicker/CalendarStyle;

    iget-object v1, v1, Lcom/google/android/material/datepicker/CalendarStyle;->todayDay:Lcom/google/android/material/datepicker/CalendarItemStyle;

    invoke-virtual {v1, v0}, Lcom/google/android/material/datepicker/CalendarItemStyle;->styleItem(Landroid/widget/TextView;)V

    .line 141
    return-object v0

    .line 143
    :cond_7
    iget-object v1, p0, Lcom/google/android/material/datepicker/MonthAdapter;->calendarStyle:Lcom/google/android/material/datepicker/CalendarStyle;

    iget-object v1, v1, Lcom/google/android/material/datepicker/CalendarStyle;->day:Lcom/google/android/material/datepicker/CalendarItemStyle;

    invoke-virtual {v1, v0}, Lcom/google/android/material/datepicker/CalendarItemStyle;->styleItem(Landroid/widget/TextView;)V

    .line 144
    return-object v0

    .line 147
    :cond_8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 148
    iget-object v1, p0, Lcom/google/android/material/datepicker/MonthAdapter;->calendarStyle:Lcom/google/android/material/datepicker/CalendarStyle;

    iget-object v1, v1, Lcom/google/android/material/datepicker/CalendarStyle;->invalidDay:Lcom/google/android/material/datepicker/CalendarItemStyle;

    invoke-virtual {v1, v0}, Lcom/google/android/material/datepicker/CalendarItemStyle;->styleItem(Landroid/widget/TextView;)V

    .line 149
    return-object v0
.end method

.method public hasStableIds()Z
    .locals 1

    .line 60
    const/4 v0, 0x1

    return v0
.end method

.method isFirstInRow(I)Z
    .locals 1
    .param p1, "position"    # I

    .line 208
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    iget v0, v0, Lcom/google/android/material/datepicker/Month;->daysInWeek:I

    rem-int v0, p1, v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isLastInRow(I)Z
    .locals 2
    .param p1, "position"    # I

    .line 216
    add-int/lit8 v0, p1, 0x1

    iget-object v1, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    iget v1, v1, Lcom/google/android/material/datepicker/Month;->daysInWeek:I

    rem-int/2addr v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method lastPositionInMonth()I
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/Month;->daysFromStartOfWeekToFirstOfMonth()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    iget v1, v1, Lcom/google/android/material/datepicker/Month;->daysInMonth:I

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method positionToDay(I)I
    .locals 1
    .param p1, "position"    # I

    .line 189
    iget-object v0, p0, Lcom/google/android/material/datepicker/MonthAdapter;->month:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/Month;->daysFromStartOfWeekToFirstOfMonth()I

    move-result v0

    sub-int v0, p1, v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method withinMonth(I)Z
    .locals 1
    .param p1, "position"    # I

    .line 200
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v0

    if-lt p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MonthAdapter;->lastPositionInMonth()I

    move-result v0

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

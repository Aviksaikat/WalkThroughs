.class Lcom/google/android/material/datepicker/YearGridAdapter$1;
.super Ljava/lang/Object;
.source "YearGridAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/datepicker/YearGridAdapter;->createYearClickListener(I)Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/material/datepicker/YearGridAdapter;

.field final synthetic val$year:I


# direct methods
.method constructor <init>(Lcom/google/android/material/datepicker/YearGridAdapter;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/android/material/datepicker/YearGridAdapter;

    .line 84
    iput-object p1, p0, Lcom/google/android/material/datepicker/YearGridAdapter$1;->this$0:Lcom/google/android/material/datepicker/YearGridAdapter;

    iput p2, p0, Lcom/google/android/material/datepicker/YearGridAdapter$1;->val$year:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 87
    iget v0, p0, Lcom/google/android/material/datepicker/YearGridAdapter$1;->val$year:I

    iget-object v1, p0, Lcom/google/android/material/datepicker/YearGridAdapter$1;->this$0:Lcom/google/android/material/datepicker/YearGridAdapter;

    invoke-static {v1}, Lcom/google/android/material/datepicker/YearGridAdapter;->access$000(Lcom/google/android/material/datepicker/YearGridAdapter;)Lcom/google/android/material/datepicker/MaterialCalendar;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/material/datepicker/MaterialCalendar;->getCurrentMonth()Lcom/google/android/material/datepicker/Month;

    move-result-object v1

    iget v1, v1, Lcom/google/android/material/datepicker/Month;->month:I

    invoke-static {v0, v1}, Lcom/google/android/material/datepicker/Month;->create(II)Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    .line 88
    .local v0, "moveTo":Lcom/google/android/material/datepicker/Month;
    iget-object v1, p0, Lcom/google/android/material/datepicker/YearGridAdapter$1;->this$0:Lcom/google/android/material/datepicker/YearGridAdapter;

    invoke-static {v1}, Lcom/google/android/material/datepicker/YearGridAdapter;->access$000(Lcom/google/android/material/datepicker/YearGridAdapter;)Lcom/google/android/material/datepicker/MaterialCalendar;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/material/datepicker/MaterialCalendar;->setCurrentMonth(Lcom/google/android/material/datepicker/Month;)V

    .line 89
    iget-object v1, p0, Lcom/google/android/material/datepicker/YearGridAdapter$1;->this$0:Lcom/google/android/material/datepicker/YearGridAdapter;

    invoke-static {v1}, Lcom/google/android/material/datepicker/YearGridAdapter;->access$000(Lcom/google/android/material/datepicker/YearGridAdapter;)Lcom/google/android/material/datepicker/MaterialCalendar;

    move-result-object v1

    sget-object v2, Lcom/google/android/material/datepicker/MaterialCalendar$CalendarSelector;->DAY:Lcom/google/android/material/datepicker/MaterialCalendar$CalendarSelector;

    invoke-virtual {v1, v2}, Lcom/google/android/material/datepicker/MaterialCalendar;->setSelector(Lcom/google/android/material/datepicker/MaterialCalendar$CalendarSelector;)V

    .line 90
    return-void
.end method

.class Lcom/google/android/material/datepicker/MaterialTextInputPicker$1;
.super Ljava/lang/Object;
.source "MaterialTextInputPicker.java"

# interfaces
.implements Lcom/google/android/material/datepicker/OnSelectionChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/datepicker/MaterialTextInputPicker;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/material/datepicker/OnSelectionChangedListener<",
        "TS;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/material/datepicker/MaterialTextInputPicker;


# direct methods
.method constructor <init>(Lcom/google/android/material/datepicker/MaterialTextInputPicker;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/android/material/datepicker/MaterialTextInputPicker;

    .line 78
    .local p0, "this":Lcom/google/android/material/datepicker/MaterialTextInputPicker$1;, "Lcom/google/android/material/datepicker/MaterialTextInputPicker$1;"
    iput-object p1, p0, Lcom/google/android/material/datepicker/MaterialTextInputPicker$1;->this$0:Lcom/google/android/material/datepicker/MaterialTextInputPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSelectionChanged(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 81
    .local p0, "this":Lcom/google/android/material/datepicker/MaterialTextInputPicker$1;, "Lcom/google/android/material/datepicker/MaterialTextInputPicker$1;"
    .local p1, "selection":Ljava/lang/Object;, "TS;"
    iget-object v0, p0, Lcom/google/android/material/datepicker/MaterialTextInputPicker$1;->this$0:Lcom/google/android/material/datepicker/MaterialTextInputPicker;

    iget-object v0, v0, Lcom/google/android/material/datepicker/MaterialTextInputPicker;->onSelectionChangedListeners:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/datepicker/OnSelectionChangedListener;

    .line 82
    .local v1, "listener":Lcom/google/android/material/datepicker/OnSelectionChangedListener;, "Lcom/google/android/material/datepicker/OnSelectionChangedListener<TS;>;"
    invoke-interface {v1, p1}, Lcom/google/android/material/datepicker/OnSelectionChangedListener;->onSelectionChanged(Ljava/lang/Object;)V

    .line 83
    .end local v1    # "listener":Lcom/google/android/material/datepicker/OnSelectionChangedListener;, "Lcom/google/android/material/datepicker/OnSelectionChangedListener<TS;>;"
    goto :goto_0

    .line 84
    :cond_0
    return-void
.end method

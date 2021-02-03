.class Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;
.super Ljava/lang/Object;
.source "AppCompatSpinner.java"

# interfaces
.implements Landroidx/appcompat/widget/AppCompatSpinner$SpinnerPopup;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/AppCompatSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DialogPopup"
.end annotation


# instance fields
.field private mListAdapter:Landroid/widget/ListAdapter;

.field mPopup:Landroidx/appcompat/app/AlertDialog;

.field private mPrompt:Ljava/lang/CharSequence;

.field final synthetic this$0:Landroidx/appcompat/widget/AppCompatSpinner;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/AppCompatSpinner;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/appcompat/widget/AppCompatSpinner;

    .line 848
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 856
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 857
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    .line 858
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    .line 860
    :cond_0
    return-void
.end method

.method public getBackground()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 927
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHintText()Ljava/lang/CharSequence;
    .locals 1

    .line 879
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPrompt:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getHorizontalOffset()I
    .locals 1

    .line 937
    const/4 v0, 0x0

    return v0
.end method

.method public getHorizontalOriginalOffset()I
    .locals 1

    .line 947
    const/4 v0, 0x0

    return v0
.end method

.method public getVerticalOffset()I
    .locals 1

    .line 932
    const/4 v0, 0x0

    return v0
.end method

.method public isShowing()Z
    .locals 1

    .line 864
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->isShowing()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 903
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatSpinner;->setSelection(I)V

    .line 904
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatSpinner;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 905
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    const/4 v1, 0x0

    iget-object v2, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mListAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2, p2}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v2

    invoke-virtual {v0, v1, p2, v2, v3}, Landroidx/appcompat/widget/AppCompatSpinner;->performItemClick(Landroid/view/View;IJ)Z

    .line 907
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->dismiss()V

    .line 908
    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 0
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .line 869
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mListAdapter:Landroid/widget/ListAdapter;

    .line 870
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "bg"    # Landroid/graphics/drawable/Drawable;

    .line 912
    const-string v0, "AppCompatSpinner"

    const-string v1, "Cannot set popup background for MODE_DIALOG, ignoring"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 913
    return-void
.end method

.method public setHorizontalOffset(I)V
    .locals 2
    .param p1, "px"    # I

    .line 922
    const-string v0, "AppCompatSpinner"

    const-string v1, "Cannot set horizontal offset for MODE_DIALOG, ignoring"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 923
    return-void
.end method

.method public setHorizontalOriginalOffset(I)V
    .locals 2
    .param p1, "px"    # I

    .line 942
    const-string v0, "AppCompatSpinner"

    const-string v1, "Cannot set horizontal (original) offset for MODE_DIALOG, ignoring"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 943
    return-void
.end method

.method public setPromptText(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "hintText"    # Ljava/lang/CharSequence;

    .line 874
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPrompt:Ljava/lang/CharSequence;

    .line 875
    return-void
.end method

.method public setVerticalOffset(I)V
    .locals 2
    .param p1, "px"    # I

    .line 917
    const-string v0, "AppCompatSpinner"

    const-string v1, "Cannot set vertical offset for MODE_DIALOG, ignoring"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 918
    return-void
.end method

.method public show(II)V
    .locals 4
    .param p1, "textDirection"    # I
    .param p2, "textAlignment"    # I

    .line 884
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mListAdapter:Landroid/widget/ListAdapter;

    if-nez v0, :cond_0

    .line 885
    return-void

    .line 887
    :cond_0
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatSpinner;->getPopupContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 888
    .local v0, "builder":Landroidx/appcompat/app/AlertDialog$Builder;
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPrompt:Ljava/lang/CharSequence;

    if-eqz v1, :cond_1

    .line 889
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 891
    :cond_1
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mListAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 892
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatSpinner;->getSelectedItemPosition()I

    move-result v2

    .line 891
    invoke-virtual {v0, v1, v2, p0}, Landroidx/appcompat/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    .line 892
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    .line 893
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v1

    .line 894
    .local v1, "listView":Landroid/widget/ListView;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_2

    .line 895
    invoke-virtual {v1, p1}, Landroid/widget/ListView;->setTextDirection(I)V

    .line 896
    invoke-virtual {v1, p2}, Landroid/widget/ListView;->setTextAlignment(I)V

    .line 898
    :cond_2
    iget-object v2, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v2}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 899
    return-void
.end method

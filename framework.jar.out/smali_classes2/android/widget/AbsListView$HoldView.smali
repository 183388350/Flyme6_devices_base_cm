.class Landroid/widget/AbsListView$HoldView;
.super Ljava/lang/Object;
.source "AbsListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/AbsListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HoldView"
.end annotation


# instance fields
.field id:J

.field position:I

.field final synthetic this$0:Landroid/widget/AbsListView;

.field view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/widget/AbsListView;Landroid/view/View;IJ)V
    .locals 0
    .param p1, "this$0"    # Landroid/widget/AbsListView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    iput-object p1, p0, Landroid/widget/AbsListView$HoldView;->this$0:Landroid/widget/AbsListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Landroid/widget/AbsListView$HoldView;->view:Landroid/view/View;

    iput p3, p0, Landroid/widget/AbsListView$HoldView;->position:I

    iput-wide p4, p0, Landroid/widget/AbsListView$HoldView;->id:J

    return-void
.end method

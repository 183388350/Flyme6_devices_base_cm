.class public Lcom/android/server/notification/NotificationFirewallImpl;
.super Ljava/lang/Object;
.source "NotificationFirewallImpl.java"

# interfaces
.implements Lcom/android/server/notification/NotificationFirewall;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/notification/NotificationFirewallImpl$StatusBarNotificationHolder;
    }
.end annotation


# static fields
.field private static FILTER_ACTION_NAME:Ljava/lang/String;

.field public static final INTERCEPT_SYSTEM_APP_NOTIFICATION:Z

.field private static SYSTEM_UI_TOOLS:Ljava/lang/String;

.field private static TAG:Ljava/lang/String;


# instance fields
.field private conn:Landroid/content/ServiceConnection;

.field private mContext:Landroid/content/Context;

.field private remoteService:Lmeizu/notification/INotificationFilterService;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/notification/NotificationFirewallImpl;)Lmeizu/notification/INotificationFilterService;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/server/notification/NotificationFirewallImpl;Lmeizu/notification/INotificationFilterService;)Lmeizu/notification/INotificationFilterService;
    .locals 0

    iput-object p1, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/server/notification/NotificationFirewallImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/server/notification/NotificationFirewallImpl;->startService()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-string v0, "NotificationFirewall"

    sput-object v0, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v0, "com.meizu.notification.FILTER"

    sput-object v0, Lcom/android/server/notification/NotificationFirewallImpl;->FILTER_ACTION_NAME:Ljava/lang/String;

    const-string v0, "com.flyme.systemuitools"

    sput-object v0, Lcom/android/server/notification/NotificationFirewallImpl;->SYSTEM_UI_TOOLS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private startService()V
    .locals 5

    .prologue
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->FILTER_ACTION_NAME:Ljava/lang/String;

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, "intent":Landroid/content/Intent;
    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->SYSTEM_UI_TOOLS:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v2, p0, Lcom/android/server/notification/NotificationFirewallImpl;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/server/notification/NotificationFirewallImpl;->conn:Landroid/content/ServiceConnection;

    const/4 v4, 0x1

    invoke-virtual {v2, v0, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    :catch_0
    move-exception v1

    .local v1, "throwable":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v3, "bindService err"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public decreaseScore(Lmeizu/notification/RankingDaily;)F
    .locals 4
    .param p1, "preDaily"    # Lmeizu/notification/RankingDaily;

    .prologue
    :try_start_0
    iget-object v2, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    invoke-interface {v2, p1}, Lmeizu/notification/INotificationFilterService;->decreaseScore(Lmeizu/notification/RankingDaily;)F
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    :catch_0
    move-exception v1

    .local v1, "throwable":Ljava/lang/Throwable;
    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v3, "decreaseScore throwable="

    invoke-static {v2, v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .end local v1    # "throwable":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    iget v2, p1, Lmeizu/notification/RankingDaily;->score:F

    return v2

    :catch_1
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v3, "decreaseScore RemoteException="

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method public increaseScore(Lmeizu/notification/RankingDaily;)F
    .locals 4
    .param p1, "preDaily"    # Lmeizu/notification/RankingDaily;

    .prologue
    :try_start_0
    iget-object v2, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    invoke-interface {v2, p1}, Lmeizu/notification/INotificationFilterService;->increaseScore(Lmeizu/notification/RankingDaily;)F
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    :catch_0
    move-exception v1

    .local v1, "throwable":Ljava/lang/Throwable;
    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v3, "increaseScore throwable="

    invoke-static {v2, v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .end local v1    # "throwable":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    iget v2, p1, Lmeizu/notification/RankingDaily;->score:F

    return v2

    :catch_1
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v3, "increaseScore RemoteException="

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method public initialize(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    iput-object p1, p0, Lcom/android/server/notification/NotificationFirewallImpl;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/android/server/notification/NotificationFirewallImpl$1;

    invoke-direct {v0, p0}, Lcom/android/server/notification/NotificationFirewallImpl$1;-><init>(Lcom/android/server/notification/NotificationFirewallImpl;)V

    iput-object v0, p0, Lcom/android/server/notification/NotificationFirewallImpl;->conn:Landroid/content/ServiceConnection;

    invoke-direct {p0}, Lcom/android/server/notification/NotificationFirewallImpl;->startService()V

    return-void
.end method

.method public interceptNotification(Landroid/service/notification/StatusBarNotification;ZZ)Z
    .locals 5
    .param p1, "sbn"    # Landroid/service/notification/StatusBarNotification;
    .param p2, "isSystemNotification"    # Z
    .param p3, "isSystemApp"    # Z

    .prologue
    iget-object v3, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    if-eqz v3, :cond_0

    if-eqz p2, :cond_1

    :cond_0
    :goto_0
    const/4 v3, 0x0

    return v3

    :cond_1
    :try_start_0
    iget-object v3, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    new-instance v4, Lcom/android/server/notification/NotificationFirewallImpl$StatusBarNotificationHolder;

    invoke-direct {v4, p1}, Lcom/android/server/notification/NotificationFirewallImpl$StatusBarNotificationHolder;-><init>(Landroid/service/notification/StatusBarNotification;)V

    invoke-interface {v3, v4, p2, p3}, Lmeizu/notification/INotificationFilterService;->interceptNotification(Landroid/service/notification/IStatusBarNotificationHolder;ZZ)Lmeizu/notification/FilterResult;

    move-result-object v1

    .local v1, "result":Lmeizu/notification/FilterResult;
    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-object v4, v1, Lmeizu/notification/FilterResult;->category:Ljava/lang/String;

    iput-object v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v4, v1, Lmeizu/notification/FilterResult;->categoryPriority:I

    iput v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v4, v1, Lmeizu/notification/FilterResult;->notificationPriority:I

    iput v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-object v4, v1, Lmeizu/notification/FilterResult;->tag:Ljava/lang/String;

    iput-object v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->tag:Ljava/lang/String;

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-object v4, v1, Lmeizu/notification/FilterResult;->extras:Landroid/os/Bundle;

    iput-object v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->extras:Landroid/os/Bundle;

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-boolean v4, v1, Lmeizu/notification/FilterResult;->intercept:Z

    iput-boolean v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->intercept:Z

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-boolean v4, v1, Lmeizu/notification/FilterResult;->shouldAffectRanking:Z

    iput-boolean v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectRanking:Z

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-boolean v4, v1, Lmeizu/notification/FilterResult;->shouldAffectIntercept:Z

    iput-boolean v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectIntercept:Z

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v4, v1, Lmeizu/notification/FilterResult;->score:F

    iput v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v4, v1, Lmeizu/notification/FilterResult;->correct_score:F

    iput v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->correct_score:F

    iget-object v3, p1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v4, v1, Lmeizu/notification/FilterResult;->spamScoreUpperLimit:F

    iput v4, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->spamScoreUpperLimit:F

    iget-boolean v3, v1, Lmeizu/notification/FilterResult;->intercept:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return v3

    .end local v1    # "result":Lmeizu/notification/FilterResult;
    :catch_0
    move-exception v2

    .local v2, "throwable":Ljava/lang/Throwable;
    sget-object v3, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v4, "interceptNotification throwable="

    invoke-static {v3, v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    .end local v2    # "throwable":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v3, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v4, "interceptNotification RemoteException="

    invoke-static {v3, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method public getRankingScoreBase(Ljava/lang/String;II)F
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "notificationPriority"    # I
    .param p3, "categoryPriority"    # I

    .prologue
    :try_start_0
    iget-object v2, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/server/notification/NotificationFirewallImpl;->remoteService:Lmeizu/notification/INotificationFilterService;

    invoke-interface {v2, p1, p2, p3}, Lmeizu/notification/INotificationFilterService;->getRankingScoreBase(Ljava/lang/String;II)F
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    :catch_0
    move-exception v1

    .local v1, "throwable":Ljava/lang/Throwable;
    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v3, "getRankingScoreBase throwable="

    invoke-static {v2, v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .end local v1    # "throwable":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    const/high16 v2, 0x42340000    # 45.0f

    return v2

    :catch_1
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lcom/android/server/notification/NotificationFirewallImpl;->TAG:Ljava/lang/String;

    const-string v3, "getRankingScoreBase RemoteException="

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

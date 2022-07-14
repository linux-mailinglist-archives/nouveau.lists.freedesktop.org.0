Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEF357542F
	for <lists+nouveau@lfdr.de>; Thu, 14 Jul 2022 19:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE1810F924;
	Thu, 14 Jul 2022 17:42:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6857710F8BC
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jul 2022 17:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657820575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9AEOUmtX+lVZi2/EB6jnvVw/5MhFema8XEZWIvnJww=;
 b=hpTDMBqaa5r30RHFiU2GuhqorScoy1XulXDGf9AQYuQ4UQbnBIxcHqUm5xRZ230K0VhJ5g
 qd39d6HSK9Co1fRJwdnxiAK4e/4ozh2v7aWFmYsa3V/X8I/4QJHQA0LEIOrfGMlK74HG7b
 Un33n/XsmrP+Ke22W9EFqBgZAdFIel4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-BccJ-5lMNxCZ0y_RxTr4yQ-1; Thu, 14 Jul 2022 13:42:54 -0400
X-MC-Unique: BccJ-5lMNxCZ0y_RxTr4yQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C85418E5383;
 Thu, 14 Jul 2022 17:42:53 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.10.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5DB400EAB2;
 Thu, 14 Jul 2022 17:42:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Jul 2022 13:42:34 -0400
Message-Id: <20220714174234.949259-3-lyude@redhat.com>
In-Reply-To: <20220714174234.949259-1-lyude@redhat.com>
References: <20220714174234.949259-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Nouveau] [PATCH v2 2/2] drm/nouveau: Don't pm_runtime_put_sync(),
 only pm_runtime_put_autosuspend()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

While trying to fix another issue, it occurred to me that I don't actually
think there is any situation where we want pm_runtime_put() in nouveau to
be synchronous. In fact, this kind of just seems like it would cause
issues where we may unexpectedly block a thread we don't expect to be
blocked.

So, let's only use pm_runtime_put_autosuspend().

Changes since v1:
* Use pm_runtime_put_autosuspend(), not pm_runtime_put()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 9f5a45f24e5be..a2f5df568ca54 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -515,7 +515,7 @@ nouveau_display_hpd_work(struct work_struct *work)
 
 	pm_runtime_mark_last_busy(drm->dev->dev);
 noop:
-	pm_runtime_put_sync(drm->dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 5226323e55d34..3c7e0c9d6baf1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -467,7 +467,7 @@ nouveau_fbcon_set_suspend_work(struct work_struct *work)
 	if (state == FBINFO_STATE_RUNNING) {
 		nouveau_fbcon_hotplug_resume(drm->fbcon);
 		pm_runtime_mark_last_busy(drm->dev->dev);
-		pm_runtime_put_sync(drm->dev->dev);
+		pm_runtime_put_autosuspend(drm->dev->dev);
 	}
 }
 
-- 
2.35.3


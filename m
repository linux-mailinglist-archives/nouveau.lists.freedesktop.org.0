Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707B2326F2
	for <lists+nouveau@lfdr.de>; Wed, 29 Jul 2020 23:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A62E6E511;
	Wed, 29 Jul 2020 21:37:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BFA6E7D5
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2020 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596058643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JQ8H1qRxbeXJCsAhz3cMJuwqIVhTmvjHZPRWUqAC/M=;
 b=a+SbmW+5HDXES5EGBTV2yHR3sppGt1C7n2lA42yMELWAleUTn/RDVGVMZjXZoIUGriNQ/k
 G4G5zjxVrRuTu6Xu4SVBbsRKbMRpQEp1VZuJQO5yA3kBxOF69QtWb1THw+I0RoIQkIGxpQ
 05/FA5lVwHQB5QFHkFSHU4i3J93ln5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-4TTm5EAfO5GE5eT5ojlLqQ-1; Wed, 29 Jul 2020 17:37:21 -0400
X-MC-Unique: 4TTm5EAfO5GE5eT5ojlLqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD9191271;
 Wed, 29 Jul 2020 21:37:20 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-146.rdu2.redhat.com [10.10.119.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFF3B61176;
 Wed, 29 Jul 2020 21:37:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 29 Jul 2020 17:37:03 -0400
Message-Id: <20200729213703.119137-10-lyude@redhat.com>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 9/9] drm/nouveau/kms: Handle -EINPROGRESS in
 nouveau_display_acpi_ntfy()
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
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This isn't an error, this just means there's multiple asynchronous
resume requests going at the same time. Treat it like a success.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 79e765ad665d ("drm/nouveau/drm/nouveau: Prevent handling ACPI HPD events too early")
Cc: stable@vger.kernel.org
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index ad63d4f052deb..691bb8d37759e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -462,10 +462,10 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 		return NOTIFY_DONE;
 
 	ret = pm_runtime_get(drm->dev->dev);
-	if (ret == 1 || ret == -EACCES) {
-		/* If the GPU is already awake, or in a state
-		 * where we can't wake it up, it can handle
-		 * it's own hotplug events.
+	if (ret == 1 || ret == -EACCES || ret == -EINPROGRESS) {
+		/* If the GPU is already awake, is waking up, or is in a state
+		 * where we can't wake it up, it can handle its own hotplug
+		 * events.
 		 */
 		pm_runtime_put_autosuspend(drm->dev->dev);
 	} else if (ret == 0) {
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

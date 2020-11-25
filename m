Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE12C48FC
	for <lists+nouveau@lfdr.de>; Wed, 25 Nov 2020 21:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A566E902;
	Wed, 25 Nov 2020 20:27:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179666E902
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 20:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606336036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m28TgjZwi7HhBuSwen4t4g93qkTs31I2N0RIyqGkBQY=;
 b=egLwYVKQPkmTBrSLILaHc334Asi8HoDuWzBAN6ZYKYgYawCQrGnL7XwWYKiBNRMYrKRhLI
 KPedBbvrXCIydVSTeNilKaazI7ycebARIdfbyv3sb1mx7lTsO5y8euv6pPjbW+3r32L7zI
 jrrvTZN4PP845rPdxVOkfwNEUUELfoU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-JyMCtNW5MPmC3Uo8wuyLfw-1; Wed, 25 Nov 2020 15:27:14 -0500
X-MC-Unique: JyMCtNW5MPmC3Uo8wuyLfw-1
Received: by mail-qv1-f69.google.com with SMTP id ca17so3262085qvb.1
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 12:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m28TgjZwi7HhBuSwen4t4g93qkTs31I2N0RIyqGkBQY=;
 b=hAuFgAhLWiL/7bthEZpsuEsvrbwT+ncLcGMXbqY5yNi5Q0YXU55Js1gFw+O+k12y+M
 fTKYsJS3tyef0LYtrUSiju7P9vSqsp5XcNcQSkaar8zkAzMgyZiEPUAOzFE6HgSX3Aiu
 Xr6KOaRNavJr1XnrehA7pRblxtQAjFGl5KebifJPhM1c7yscTqf2+pT5vbFsfCXAGXAt
 sbPHdlQtUdut4F1OsmtrpdePca7BZp4WE8XD76Q7AL/eejunUy3YDw+eBj3ThXvfNCMn
 4o5ioylrFIyEncuzxyHasdSG+f3X9w6tdiVZC1nMiH3QydLcAj+sl+gal2oth+Q0EUWz
 wDVg==
X-Gm-Message-State: AOAM530LBfavnGEVlKJgkvypT+H4k2G8wf27zByPMDNDpS4XVAHLTvI/
 5pYzwuIHIo2HauIREyEJwRnAhTtYLstDMtFZSh4kAV4OpWHgKZg2Hnd4dF2QHtkLvxDZTXDXdN1
 HFWojvh71PnIytuCmmoReFQFWQw==
X-Received: by 2002:a37:4854:: with SMTP id v81mr748208qka.20.1606336033967;
 Wed, 25 Nov 2020 12:27:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTVi4YITmr/yVt0UXkpzCkoAdVjZcIU7pnzNdwrA6y0qo2w8G8fpzl3w+LvWzcj9VOPAQxLw==
X-Received: by 2002:a37:4854:: with SMTP id v81mr748193qka.20.1606336033788;
 Wed, 25 Nov 2020 12:27:13 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a638:b301:9966:d978:493:6a3d])
 by smtp.gmail.com with ESMTPSA id o187sm431772qkb.120.2020.11.25.12.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:27:13 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 25 Nov 2020 15:26:47 -0500
Message-Id: <20201125202648.5220-3-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125202648.5220-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v2 2/3] drm/nouveau: Add a dedicated mutex for the
 clients list
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rather than protecting the nouveau_drm clients list with the lock within
the "client" nouveau_cli, add a dedicated lock to serialize access to
the list. This is both clearer and necessary to avoid lockdep being
upset with us when we need to iterate through all the clients in the
list and potentially lock their mutex, which is the same class as the
lock protecting the entire list.

Cc: stable@vger.kernel.org
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
Changes since v1:
  - Add a mutex_destroy() call when destroying the device struct

 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 ++++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h |  5 +++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4fe4d664c5f2..6ee1adc9bd40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -557,6 +557,7 @@ nouveau_drm_device_init(struct drm_device *dev)
 		nvkm_dbgopt(nouveau_debug, "DRM");
 
 	INIT_LIST_HEAD(&drm->clients);
+	mutex_init(&drm->clients_lock);
 	spin_lock_init(&drm->tile.lock);
 
 	/* workaround an odd issue on nvc1 by disabling the device's
@@ -654,6 +655,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	nvif_parent_dtor(&drm->parent);
+	mutex_destroy(&drm->clients_lock);
 	kfree(drm);
 }
 
@@ -1089,9 +1091,9 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 
 	fpriv->driver_priv = cli;
 
-	mutex_lock(&drm->client.mutex);
+	mutex_lock(&drm->clients_lock);
 	list_add(&cli->head, &drm->clients);
-	mutex_unlock(&drm->client.mutex);
+	mutex_unlock(&drm->clients_lock);
 
 done:
 	if (ret && cli) {
@@ -1117,9 +1119,9 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
 		nouveau_abi16_fini(cli->abi16);
 	mutex_unlock(&cli->mutex);
 
-	mutex_lock(&drm->client.mutex);
+	mutex_lock(&drm->clients_lock);
 	list_del(&cli->head);
-	mutex_unlock(&drm->client.mutex);
+	mutex_unlock(&drm->clients_lock);
 
 	nouveau_cli_fini(cli);
 	kfree(cli);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9d04d1b36434..550e5f335146 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -141,6 +141,11 @@ struct nouveau_drm {
 
 	struct list_head clients;
 
+	/**
+	 * @clients_lock: Protects access to the @clients list of &struct nouveau_cli.
+	 */
+	struct mutex clients_lock;
+
 	u8 old_pm_cap;
 
 	struct {
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

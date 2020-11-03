Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66EE2A5072
	for <lists+nouveau@lfdr.de>; Tue,  3 Nov 2020 20:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4156ECC6;
	Tue,  3 Nov 2020 19:49:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E5A6EC91
 for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2020 19:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604432986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fICmVdTj2/Fz/bKsy3AdpD02+6wD2mrXceXnjGzICc=;
 b=P/oGTm6x6jERniL2pC3jp3j8Fx47t3lGS89v5KuH8/6evubJXRzKfgVIQm/E9O8e7v4xj9
 tv4i35Neb8tltQILR1uhXejPaywGid+xLtMgYqJh6m+zCswnxjQnhkwXPQdxEo/IqnnEmG
 TqiLvqJPGFgGG3aC4ZZkPwiTmPeaNnU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-iPLLpHEWMtKLQlrmLovWQw-1; Tue, 03 Nov 2020 14:49:44 -0500
X-MC-Unique: iPLLpHEWMtKLQlrmLovWQw-1
Received: by mail-qk1-f199.google.com with SMTP id i8so5073102qka.15
 for <nouveau@lists.freedesktop.org>; Tue, 03 Nov 2020 11:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fICmVdTj2/Fz/bKsy3AdpD02+6wD2mrXceXnjGzICc=;
 b=YDvvasHVa+fQR7leFyCbTI05qV/Y7B6HvX4ihPQzGQZaIdfOnrYq6IT7MTGnut2TFu
 3rTbHIi49Mw58/fvX28KhjNXXs1s0mZyw4bt/hrau6rLRKUSK/P65v4+mUWBql6cck1c
 nzCD8jH3tjif45DjCVz34E13HKuyPAFFsL3HOTn7AGEs8KUuNTCDN3VD/wkcERZ3HyM7
 TD8/6+HvHFXIj+Vo4OZNlu2HExTLXRma9DbzxE28vbstkRenwxOUflLt3gAydZJWZ7Go
 gkdqnPiLgGuZ7stoYqdkXb3rJHgTv8SDTX1hcSFu+Jiet+JJTDWmh2PXUBLnY/OEB7oG
 pfcw==
X-Gm-Message-State: AOAM530Z7/o6Y/4oK3O5TyuMhA27L1ChSMktUNefUgH5o9v2W+lqMWJB
 7nNxXMwj5dB31IT5g3SgXQhjBVGdbH9VO27dPl7hnOdujpoO0N+bx//k1OU9ZPfhW5mhtrx0pgU
 cl87hXIOq30+Q8TPKnE+GzxSr9w==
X-Received: by 2002:ae9:efc7:: with SMTP id d190mr21846435qkg.12.1604432984333; 
 Tue, 03 Nov 2020 11:49:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzFFaYIUOW0IiB6homeuWdNgciqo19z+13u9SaE5afk4jLCu8F41CBfMJHpE2CaxDZW7FAQQ==
X-Received: by 2002:ae9:efc7:: with SMTP id d190mr21846412qkg.12.1604432984080; 
 Tue, 03 Nov 2020 11:49:44 -0800 (PST)
Received: from xps13.redhat.com ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id w25sm11392532qkj.85.2020.11.03.11.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 11:49:43 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Tue,  3 Nov 2020 14:49:11 -0500
Message-Id: <20201103194912.184413-3-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103194912.184413-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 2/3] drm/nouveau: Add a dedicated mutex for the
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 9 +++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h | 5 +++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4fe4d664c5f2..d182b877258a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -557,6 +557,7 @@ nouveau_drm_device_init(struct drm_device *dev)
 		nvkm_dbgopt(nouveau_debug, "DRM");
 
 	INIT_LIST_HEAD(&drm->clients);
+	mutex_init(&drm->clients_lock);
 	spin_lock_init(&drm->tile.lock);
 
 	/* workaround an odd issue on nvc1 by disabling the device's
@@ -1089,9 +1090,9 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 
 	fpriv->driver_priv = cli;
 
-	mutex_lock(&drm->client.mutex);
+	mutex_lock(&drm->clients_lock);
 	list_add(&cli->head, &drm->clients);
-	mutex_unlock(&drm->client.mutex);
+	mutex_unlock(&drm->clients_lock);
 
 done:
 	if (ret && cli) {
@@ -1117,9 +1118,9 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
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

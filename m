Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E5369ACFE
	for <lists+nouveau@lfdr.de>; Fri, 17 Feb 2023 14:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033BC10EFFC;
	Fri, 17 Feb 2023 13:48:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1663810EFF6
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 13:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qV+blR6Tkr/sKsOr7dEvAgWdCXkrbGqs9gehh/nqNIE=;
 b=B1Vgb7kgfBTXb+JzODrfpfvV9zwoFZpAzeFJ9h6xfFfwgLZgBQkFf78rcyVQloQsYwotTa
 pT7CrniBUk1uTu3D7LJo0sa4j9UIWAfwTjLWLj3fUGD030lJoLu+twnA0lPS3ldLTuPR19
 W5jCMCnFE+P5bNRcIpuPinM5PCdnTgA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-KlH4MMfNOi-mZJaByXv3sA-1; Fri, 17 Feb 2023 08:48:42 -0500
X-MC-Unique: KlH4MMfNOi-mZJaByXv3sA-1
Received: by mail-ed1-f70.google.com with SMTP id
 cn9-20020a0564020ca900b004a25d8d7593so1229215edb.0
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 05:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qV+blR6Tkr/sKsOr7dEvAgWdCXkrbGqs9gehh/nqNIE=;
 b=URBo54cD72grBIplOORFmrgiVNYiyA4DicHeMCPCMhaw0RIEP0GbiWWW8Js49X2Z9w
 R0sOJqDK+6PpFTzIKXvdpOIkAdN4vOcXDiAP6SGVX2dw+QMo/uY1GgabBrQXrxe/3O/g
 BjMV/vmWEzyXt/HFLWVE9uUPpuzxycKyl0a9jVQzxKNXMUmyZVvFTxAnl4DfEwC8Vsx7
 8279pH2bIdeCQtxxb7D2S3EZx0mQ6OVDxg0k4mWVl2LFUlDmVM2o8xPTWb2YlfKpO427
 jSO0F8M1U9sB9g2yY8cpTxQVT0h9koOwl0/gIYd4cKsyF8b6q6b2SyeOnIzg+dPFKMER
 2Yjg==
X-Gm-Message-State: AO0yUKUgws8/P2c3xp4icd28+TO9tzRW85XFbQOvlPr0SW0kVJV8uDwE
 JDefAKPAI60ZcVH2a4SgiZHrSCLKTadcJ00Uyqs8XgQtW7Q5UDouzAnUbSZqHmVMqi6IHdWlkwf
 x4YtJfdLeWBPxwX+n/essT2mBBQ==
X-Received: by 2002:a05:6402:457:b0:4ad:7640:ff47 with SMTP id
 p23-20020a056402045700b004ad7640ff47mr3317198edw.13.1676641721927; 
 Fri, 17 Feb 2023 05:48:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8TQtlKkchdYFDpX6esHsmxmbuVnZmBvwTb0vwG2PSeRr7Qepshcx1saI0cWGGhV/p6T+nLUA==
X-Received: by 2002:a05:6402:457:b0:4ad:7640:ff47 with SMTP id
 p23-20020a056402045700b004ad7640ff47mr3317181edw.13.1676641721700; 
 Fri, 17 Feb 2023 05:48:41 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a509556000000b004a23558f01fsm2348675eda.43.2023.02.17.05.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:40 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 17 Feb 2023 14:48:14 +0100
Message-Id: <20230217134820.14672-5-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v2 10/16] drm/nouveau: move usercopy
 helpers to nouveau_drv.h
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Move the usercopy helpers to a common driver header file to make it
usable for the new API added in subsequent commits.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 81350e685b50..20a7f31b9082 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -130,6 +130,32 @@ nouveau_cli(struct drm_file *fpriv)
 	return fpriv ? fpriv->driver_priv : NULL;
 }
 
+static inline void
+u_free(void *addr)
+{
+	kvfree(addr);
+}
+
+static inline void *
+u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
+{
+	void *mem;
+	void __user *userptr = (void __force __user *)(uintptr_t)user;
+
+	size *= nmemb;
+
+	mem = kvmalloc(size, GFP_KERNEL);
+	if (!mem)
+		return ERR_PTR(-ENOMEM);
+
+	if (copy_from_user(mem, userptr, size)) {
+		u_free(mem);
+		return ERR_PTR(-EFAULT);
+	}
+
+	return mem;
+}
+
 #include <nvif/object.h>
 #include <nvif/parent.h>
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 08689ced4f6a..4369c8dc8b5b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -613,32 +613,6 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 	return 0;
 }
 
-static inline void
-u_free(void *addr)
-{
-	kvfree(addr);
-}
-
-static inline void *
-u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
-{
-	void *mem;
-	void __user *userptr = (void __force __user *)(uintptr_t)user;
-
-	size *= nmemb;
-
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
-
-	return mem;
-}
-
 static int
 nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				struct drm_nouveau_gem_pushbuf *req,
-- 
2.39.1


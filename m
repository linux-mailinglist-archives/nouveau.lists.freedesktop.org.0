Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7AF724FB3
	for <lists+nouveau@lfdr.de>; Wed,  7 Jun 2023 00:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1066910E3FD;
	Tue,  6 Jun 2023 22:32:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E5610E3F7
 for <nouveau@lists.freedesktop.org>; Tue,  6 Jun 2023 22:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686090735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15bsZMHgn8HdtpEj/sQfVUEhkE1KgujwGvKHw17TRpw=;
 b=NYxkKuE0CaEjgGqI50zLN89RKTFS5666Nm9BbWarHDhVOGJ62bqht0G1pBEK9L2eTa5YgS
 F+qEo/yLvmysICEEeEdo0wQnbCZey7NlMl9EF/VYn//eJfWFFuIrtpuSR5Z8qxYgxM+hTq
 jr9PlxwEBrzana7VyKmUqC0ud65fReE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-Rav1QdeGOMiueuYtCLQcDg-1; Tue, 06 Jun 2023 18:32:13 -0400
X-MC-Unique: Rav1QdeGOMiueuYtCLQcDg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-513f5318ff2so158663a12.3
 for <nouveau@lists.freedesktop.org>; Tue, 06 Jun 2023 15:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686090732; x=1688682732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15bsZMHgn8HdtpEj/sQfVUEhkE1KgujwGvKHw17TRpw=;
 b=hqZFlCguqlUDhBLd3cYrw8jWs+mDnEf7DCGXqnJOc52K9EvdLUYYZCNFNnSm78y9Yw
 Tey7CyNln/QabjrVRFxTKZWUK0rkHRZNaQkJoqCRkTRo63yk4C6KWO+nKHkL5Ywhm6n4
 MyS86udklVdm9i24ct03Nx2D2xobtRsfQnnFumLAajAsjr0a7KiddLqkpgkhSk/Q/zEC
 SSdjPamBAELcnmY+4KRCnInFesLGA8dpDz17sGGgu/aUq2inw+5bLsYCG/jnuyKqX1x5
 Nhyk5WIcE3+yhLSWTPRd32knR1Aky3TplSKcbYVHLCrLmyC2j+QyOXtQSsc2b4Od+8S1
 euew==
X-Gm-Message-State: AC+VfDwSe+hRm+rox7L1AxY8QJEqt0NcxB6CCW4NrxU2O3aRAjuAwZQI
 Pf9w21LTAFkQCbME2Hs/+Vr6kqOkQH94hvo07Tj90rQe+QEwbFdItRD0NpZ5f9gMsL1DUatlP27
 ysKAmaEO7uFxo3udBX0GDyOo3lQ==
X-Received: by 2002:a17:907:16a2:b0:971:eb29:a082 with SMTP id
 hc34-20020a17090716a200b00971eb29a082mr4378744ejc.49.1686090731976; 
 Tue, 06 Jun 2023 15:32:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ77wuF5laRMd8UauVtSJvlbhuOhAjTpsroGVkxnZ20HQdV9jjMT18xE+CzMmaMjweOX7gL+XQ==
X-Received: by 2002:a17:907:16a2:b0:971:eb29:a082 with SMTP id
 hc34-20020a17090716a200b00971eb29a082mr4378734ejc.49.1686090731833; 
 Tue, 06 Jun 2023 15:32:11 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a1709062cc900b009787062d21csm1186055ejr.77.2023.06.06.15.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:32:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Wed,  7 Jun 2023 00:31:24 +0200
Message-Id: <20230606223130.6132-9-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v4 08/14] drm/nouveau: move usercopy
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
index 45ca4eb98f54..a48f42aaeab9 100644
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
2.40.1


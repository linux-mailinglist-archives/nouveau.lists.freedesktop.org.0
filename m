Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E970743071
	for <lists+nouveau@lfdr.de>; Fri, 30 Jun 2023 00:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98FD10E409;
	Thu, 29 Jun 2023 22:27:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD1110E3EC
 for <nouveau@lists.freedesktop.org>; Thu, 29 Jun 2023 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688077650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
 b=E0WkWTuiE5HSsL0RfCgclfpoDyW03gnv8vUdwi06AZwocF/6FuFx8snbA4g4O8ABcnE+qA
 t//GbqCdKsNBkNwHM10dWLl8y4TQSKyyZkJHt6ajkCRPWTlBCxg8CvoP0FNv4mafHSjYDs
 MmRdq0eHZ80wmSsb0Ez7g9SCQa4WTqs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-gD2GILmqNfKVFJ4ehpDCLw-1; Thu, 29 Jun 2023 18:27:29 -0400
X-MC-Unique: gD2GILmqNfKVFJ4ehpDCLw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fa8d203eccso5402305e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 29 Jun 2023 15:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688077648; x=1690669648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
 b=c0ksJTN7eGphCphVBs5NUX2DeG07/4ig7VPjU9hL3RVLT/UJ+AsQPkPanHGLv65kYI
 wnhkv3/a56meNUslovEgMcn0c29pe9Cat72dBYkVMeMmA85G/pJLwMyPHt0HnelJTWlN
 Z0FJI2T6X+9rdWYdzmPdIln1Ndq5Fbbo8H0uMNLkSIEvfEX3mBEJyHuEukwVwwSrce7Z
 2vsUk4QrgpeCX51fi+3K6u0qddknPAuHxUgX4wkl1TrFspxjUmQddP68upqMabCMp+Sj
 eOImFd1kZRKYaFS71lHmWCHISABrUKVya9JfNjnJSoysDMkZL7SE01eJxLSZOfJ0XbVS
 WEWA==
X-Gm-Message-State: AC+VfDyeXmtfoJ3ovWmbIdQGGQhe1beD79m7mGUkuNtuDJvwH2BwDqC4
 yptr0VEypIYVMZRv3h4AW8IWGROfBNDriYSfZ0ZGKQXll//MOtr/DeT0yQgQG1So9iMwnC7ftig
 kGLUwwPd+y3CK4wERcJjnt2U2LQ==
X-Received: by 2002:a05:600c:4f8a:b0:3fa:821e:1fb5 with SMTP id
 n10-20020a05600c4f8a00b003fa821e1fb5mr6128638wmq.5.1688077647917; 
 Thu, 29 Jun 2023 15:27:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wpnqgs/z7hJJmbtz3VdpkoRY4cAoYdS0461hyKBm1gdSunV5Xsq2eBMdCyeRdOWG5WL3RWw==
X-Received: by 2002:a05:600c:4f8a:b0:3fa:821e:1fb5 with SMTP id
 n10-20020a05600c4f8a00b003fa821e1fb5mr6128628wmq.5.1688077647669; 
 Thu, 29 Jun 2023 15:27:27 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adfdec3000000b0031411e46af3sm3704409wrn.97.2023.06.29.15.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 15:27:27 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 30 Jun 2023 00:25:23 +0200
Message-ID: <20230629222651.3196-8-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v6 07/13] drm/nouveau: move usercopy
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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
2.41.0


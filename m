Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664A27707CD
	for <lists+nouveau@lfdr.de>; Fri,  4 Aug 2023 20:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AC810E74A;
	Fri,  4 Aug 2023 18:24:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B191D10E748
 for <nouveau@lists.freedesktop.org>; Fri,  4 Aug 2023 18:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sILSYR0gnJ8A9dpqcei0GUdx0191p3j7ECPYiYKPGLY=;
 b=RVG07k3SPOWyj8Nk7OMahvV6MQuKbIm3LE+IX5ga/JEKTkAM/MWydjfcy4rfuaACePUZod
 br/rKlZ+bNBPc7jlMM6wFSrdkWn44kjjc5hg6mK+gZhWAIfoRZu4uUzp4XB9UdiTBN4BuV
 Gnh0pUJbpZqzyi4gkiftpHLf+8vwalw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-lj2AQxmPM1iyLrupvF2dTg-1; Fri, 04 Aug 2023 14:24:39 -0400
X-MC-Unique: lj2AQxmPM1iyLrupvF2dTg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5218b9647a8so1580057a12.1
 for <nouveau@lists.freedesktop.org>; Fri, 04 Aug 2023 11:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173478; x=1691778278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sILSYR0gnJ8A9dpqcei0GUdx0191p3j7ECPYiYKPGLY=;
 b=Lgqwbb4yB4kaiSqKk4ZTCp+xyTTrTpCOgMn6A5zOAPplOBcV1kmxzwfXduTqNQvWYr
 dnSsfqzWyXHbBoEOSsYOioDx5V51NqmfxFsGddArKtfv0vP9dbY00emkMJEtjGjRoqZ3
 YR/zUg97CS0ZRB2tyNOyF0V9sOqDa6NITf+s6Ru+kbni8MjhRFlaNX+VftxEXHMCpM8o
 iefI8E9eg28rV/F2Lc8QTZPo+jM75I9aqCO1/Fe+yN/y+iCrDpu1yWuoioRykFho9X0v
 AytDBJ86+x6eunMrhZvndUwK/eLTvATTVRgKnaPqDHcwzENwlN0zbsSye6xDsPmgJF6a
 xGoQ==
X-Gm-Message-State: AOJu0YymBzSla6c6oMj3yStOeDxlN/wP+GfOFI8IaT4aYvcp812xzK4T
 caplJkVnhEvFkOzzsK5DqeFENUr6gffN4CNSaJ13/IxLmi7QfTdYZLU22H2mYKYGRhoI8dwDaFV
 CaZqu3dcXkyYlT0czIJ62znj9aQ==
X-Received: by 2002:a05:6402:448:b0:51d:d390:143f with SMTP id
 p8-20020a056402044800b0051dd390143fmr2168724edw.5.1691173478710; 
 Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAdtc3GjLhkVTBVp4UpZhrnZWEfIc0NqlSy8j8ZyVB3ZFGvxmr6W4of3EQqVmArV7n8nDbEA==
X-Received: by 2002:a05:6402:448:b0:51d:d390:143f with SMTP id
 p8-20020a056402044800b0051dd390143fmr2168702edw.5.1691173478516; 
 Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 r6-20020aa7c146000000b0051e2670d599sm1570383edp.4.2023.08.04.11.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Fri,  4 Aug 2023 20:23:46 +0200
Message-ID: <20230804182406.5222-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v10 06/12] drm/nouveau: move
 usercopy helpers to nouveau_drv.h
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
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Move the usercopy helpers to a common driver header file to make it
usable for the new API added in subsequent commits.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 81350e685b50..d28236021971 100644
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
+u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
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


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F86713A3
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 07:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA7310E696;
	Wed, 18 Jan 2023 06:14:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0AE10E697
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuIA/967bi8fJ2s/oMp21AWFew5v50JdzBzuNFK8Osw=;
 b=eQFONCsQNmIf39t+2fLq5M1nMbNSsgn0zux+egY1kWyRUx49bl/8Sgnu73y1df7OMq9Iqv
 dCWAWfjSLayASoQfMktOrkNFy5fNfymTUDAGQbLeUkGjp4h0duJbrm0gjzWDOLZIy7BH0R
 q6JX8nw/VuWDdKpURNXtdNqQ6FjJAM8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-92Gjtwc_P2GpqLmZXgcAUw-1; Wed, 18 Jan 2023 01:13:58 -0500
X-MC-Unique: 92Gjtwc_P2GpqLmZXgcAUw-1
Received: by mail-ej1-f72.google.com with SMTP id
 nd38-20020a17090762a600b00871ff52c6b5so3695657ejc.0
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jan 2023 22:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuIA/967bi8fJ2s/oMp21AWFew5v50JdzBzuNFK8Osw=;
 b=BwPHZoQyweeIUiHstlLGbjza/q1xd1m+Xv02ldqo3EN322zi3dwLgSyeS15rdfsY3q
 bCAHbfo+knshl5u2bA/Olsf1G4ZQeSQrw+gNceSksb9c2Q1S5Ld0C+G/j2g3GEamKTLm
 iN3hwPOiBmhjUEiCfqKpxGVyzivzMOB/k1ZGN7Dh9wA7OTMSiZgB90JMdBMZ/OCgeDoY
 a7z5qSgxEPu4DMYIFhg8tw3qgH/zKJw8S+wtYHA+nqrAci8yI2CGfFqBFkcKicjNx/y2
 Iwl9QAFwch/+AHKWsQcParlYbBXXzIHOgiQz9tMgFQ6u+L0pzJPuAA+VldDXeOvVRFFZ
 DjLQ==
X-Gm-Message-State: AFqh2kqQT6zik2cgrcbzr0vcEl7JyoYh+wVIjhmk+daGr9Abp0numo9T
 7J5+S/7uoSjEd9FiX/4I5J9Uyfx0bYOZIo5S5dyNhVhF3PFCiiiYhMGuEJCz4rkfv42ELjf3+89
 h1pTmsxSMyhwSwUCWD5l/jgD7zg==
X-Received: by 2002:a17:906:549:b0:84d:3822:a14e with SMTP id
 k9-20020a170906054900b0084d3822a14emr5532744eja.64.1674022437317; 
 Tue, 17 Jan 2023 22:13:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv86GpSfYd+wwTGTqkBFiIhaFIdaUkZl6RvjU2Bnz8b7FM4BmyUqqqu3yOGXwZAwyOl/axmZQ==
X-Received: by 2002:a17:906:549:b0:84d:3822:a14e with SMTP id
 k9-20020a170906054900b0084d3822a14emr5532728eja.64.1674022437107; 
 Tue, 17 Jan 2023 22:13:57 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906300b00b008675df83251sm7184811ejz.34.2023.01.17.22.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:13:56 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Date: Wed, 18 Jan 2023 07:12:50 +0100
Message-Id: <20230118061256.2689-9-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next 08/14] drm/nouveau: move usercopy helpers
 to nouveau_drv.h
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
index 48e6ba00ec27..5dad2d0dd5cb 100644
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
2.39.0


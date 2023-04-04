Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ACF6D55ED
	for <lists+nouveau@lfdr.de>; Tue,  4 Apr 2023 03:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65F10E277;
	Tue,  4 Apr 2023 01:28:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E1E10E277
 for <nouveau@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKPAKixRboWIVKksjdDd3XWLOGimpIv4cn51ku79o4E=;
 b=BqW3YjYIXIwjI8MllXJGuCcjjABSN7VfcxFuL51ylZhCsm/7+d6cth3rH1Zou3ja2lMO0M
 aN82sx3O7e0O3rdbh+IFKEcTrR17wt3lBQVKM/qvtwuqY2AId1dyz+oPj4VNADEti3+ipr
 XD2U2iNaNBPd2D2q4Oe1sozAgZKKx9s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-Uquni7BsPSepumQNEp6Rtg-1; Mon, 03 Apr 2023 21:28:22 -0400
X-MC-Unique: Uquni7BsPSepumQNEp6Rtg-1
Received: by mail-ed1-f69.google.com with SMTP id
 t14-20020a056402240e00b004fb36e6d670so43351891eda.5
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKPAKixRboWIVKksjdDd3XWLOGimpIv4cn51ku79o4E=;
 b=MXJ2ZRNA4pUJmA6Bq7f51WSihgaXb9Yfx/+DK/BWLU0bn9PmrutMNPlztATDI3i7nO
 7FbM8bO55Gdth+duxk4y6vvA99RxDlLpJPxCH0FiNXZPBlXUwsBQXMfpT6Fib8/Bt8BU
 XzEelbcpX5Zva5oW9kfF51+kuxnx8CG3Bupb3Pv3J3T/WzF2INjgMOrTJLQcggGmPByi
 4A0DmP+fFpR671Gtw4rmpjsAsHllxL8ZC4JHsGt2A5pHtYVVcf4VMjgGD664l98SJIhx
 OXMb37wEFftoGRf2OTY5EmxW+jn7Ar/tSY1m5Jxk/Aq2fiEoK6s/5Ke2NC7uQtlh6XIp
 iFtQ==
X-Gm-Message-State: AAQBX9fFAEBav7Pp9L+LFlsno/0p7wRsaDn2ZW/dF2Ia/PCBMAR1E5gu
 qPa4UCB0mbo55Merr+66jbqn7qdoWFrYgbmyJgpn3PS+zPo8zBvWh0jP6W1CFSCHxCxbKS5Th6v
 y+Q1QUxDBAtof+sR2c+aMzOO2MQ==
X-Received: by 2002:a17:906:7c53:b0:8b1:7de3:cfaa with SMTP id
 g19-20020a1709067c5300b008b17de3cfaamr521664ejp.3.1680571701402; 
 Mon, 03 Apr 2023 18:28:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bKXBvsLQ358FMlkWLT8DWUxHFmzB6npPtP7ouGx4sEp9lwAApjiFx7erZVjm6I+QFHrVymVw==
X-Received: by 2002:a17:906:7c53:b0:8b1:7de3:cfaa with SMTP id
 g19-20020a1709067c5300b008b17de3cfaamr521648ejp.3.1680571701165; 
 Mon, 03 Apr 2023 18:28:21 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090643ca00b0092f38a6d082sm5159990ejn.209.2023.04.03.18.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:20 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue,  4 Apr 2023 03:27:35 +0200
Message-Id: <20230404012741.116502-10-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v3 09/15] drm/nouveau: move usercopy
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
2.39.2


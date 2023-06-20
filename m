Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD837360B0
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 02:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE7F10E240;
	Tue, 20 Jun 2023 00:43:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A9C10E245
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jun 2023 00:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687221787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15bsZMHgn8HdtpEj/sQfVUEhkE1KgujwGvKHw17TRpw=;
 b=S1/E1WbAQdRsfp+Q8us5mhVBssRKuBfwatahL38SFOh0vSBxM8FDjW+aoL70mkzlyk4Ud0
 nk8IxEnALLZXvkPlZApaW78MP8upNyaslid69+pA1BmEN4ket3LIuKmRWoHpQd6gN2n4lC
 m/W4p7DRmSUzn5hmjZDTuO6/izz0/Jc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-8Uq4UC2mMAiMYlo58EJrtg-1; Mon, 19 Jun 2023 20:43:05 -0400
X-MC-Unique: 8Uq4UC2mMAiMYlo58EJrtg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-51a4a83d597so1753173a12.2
 for <nouveau@lists.freedesktop.org>; Mon, 19 Jun 2023 17:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687221784; x=1689813784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15bsZMHgn8HdtpEj/sQfVUEhkE1KgujwGvKHw17TRpw=;
 b=h4n7N5mrTNXaj1LFpvBTrlkFmCpl0+8Wn9Hcr+EpEHUTmqN0lJw/SiXzRXVZvlrUgC
 hsYtGrcOAq/0M00hw6F9UTjbTsIVxEdD51AtOK25pzF9tj847TW5v+ezgxtSLwe61xgs
 56Ng/Ycokv+ri1qK08W+nWAOsbK/Z3UuZAemGm6opFeDcjGYiJtGcYNBE79DLtHYWLOa
 HsJ8Z23b6ZUVObiS/bVHt2+R8wPfSytRj7xL7k/YNVhKrijYx50Joht2thGI+iZFMu/7
 ttpfMEklw9h7zH1uk1t+NsZjEj/maZKCxClZF+zWRSS96k4SSVsRK2JXxxFpP08Ia2tE
 2/lA==
X-Gm-Message-State: AC+VfDziBicuUXhw1tTw/FbuypMBWrwqsIG3v8IgFYKEPXQO70/erXpu
 8W01phTOVT0myJayFxHwxHfsDa+I/khoesFfigtb9UJMjIj90HIqKi+vPyJlJdPHHedBWLACA68
 azg6lv/5TtZ2Jx/5X8we9THVCbQ==
X-Received: by 2002:a17:907:94c6:b0:97a:588f:766 with SMTP id
 dn6-20020a17090794c600b0097a588f0766mr10489573ejc.42.1687221784468; 
 Mon, 19 Jun 2023 17:43:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7c9FPA9PfjnZ4NBX+L5X8JmjHfzdjLxD7tdsztb6oh+Z4IO34dObfIqPL2WWN4l2JkXpNgzg==
X-Received: by 2002:a17:907:94c6:b0:97a:588f:766 with SMTP id
 dn6-20020a17090794c600b0097a588f0766mr10489556ejc.42.1687221784330; 
 Mon, 19 Jun 2023 17:43:04 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 me16-20020a170906aed000b0098669cc16b2sm389552ejb.83.2023.06.19.17.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:43:03 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue, 20 Jun 2023 02:42:11 +0200
Message-Id: <20230620004217.4700-9-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v5 08/14] drm/nouveau: move usercopy
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


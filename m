Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE378A4C03
	for <lists+nouveau@lfdr.de>; Mon, 15 Apr 2024 11:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF2411241B;
	Mon, 15 Apr 2024 09:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UR5aWAAT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BADC11241B
 for <nouveau@lists.freedesktop.org>; Mon, 15 Apr 2024 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713174879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mTxuoeIhHTx2QQNfpc8pvir1olgvTkja6Q/oXHH7tBY=;
 b=UR5aWAATZhZy5P4kVuUy91yySaFjhtdaHZHMeJ4DMqPh2LfGFgQrCXMKFu0VzrOVzo6N2l
 yb1RvWLs6jzzyXtclGq09C5fyEV7eXk32qi5xe0p/Nbyy5ZVoBQ/s6juwM8aM1N43761lj
 qb2nPY1Lt+uvO9CXeEwKL7xvjwzWfaY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-GqdyNh5eN_-kShB1sdKITg-1; Mon, 15 Apr 2024 05:54:38 -0400
X-MC-Unique: GqdyNh5eN_-kShB1sdKITg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-417cf901ab4so11798855e9.1
 for <nouveau@lists.freedesktop.org>; Mon, 15 Apr 2024 02:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713174876; x=1713779676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mTxuoeIhHTx2QQNfpc8pvir1olgvTkja6Q/oXHH7tBY=;
 b=IXqRDVHVcGnOZHhQTjgdbNkWuUVigH1kQcCDjC/ezOBlkjfnVsmYV2qkIiZ0lWoCjO
 ZKGg++N1zLrqzKg/gSdt2DZOMY+wKRr2OCOIE9Kur9u8ro1UBvZIDefkxHxdz5gV5tGI
 Gauw3wvRwOS+0h8qy+d5q1yoyPCkRPQGtLacRJNYtjIGCYi8p44Md24++O1vESjqV9Dn
 Cgdb9G46qT2v0tdxM3rSNM+lFIibC5hZJvRUY1f8ra5LW9IqrSH9ZU1rmXp0ZBCcqQ6g
 x4lfcZUeFbquXEmZuXW4xxJ6/dIQDFjyUKnidrbsBRU3fH7vEaXSw/2qp8n6HWGyKeuJ
 JE1w==
X-Gm-Message-State: AOJu0Yw89gHJoXk6XM95NqZzwoHTtlzwEt0gjschoyQBlald2GhoWbFw
 p+IVwrCHtKEGtjPo0MTvO9uuALau2Qv90bX8DgoUzm3VWD4HqBS/DmHJv16ZQguoydvJhAjnokg
 esYxbmUC+/BLtUsSFk0JEOvxhEn6gsohWMobyQbD4B28ohSbCNOoFHMVEirz5Bhdf2w08LCjLrD
 yKOzS25whTufSWuAgqRMqAAEjgm5Va8hMQRUhmzVOiAA==
X-Received: by 2002:a05:600c:470f:b0:418:41a7:d032 with SMTP id
 v15-20020a05600c470f00b0041841a7d032mr2258406wmo.13.1713174876384; 
 Mon, 15 Apr 2024 02:54:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAAxJVV7Ft7s08BNgaBvjuZ9SxAETqhJ/ICh3d9nFWtVy7rpmTVhzTNsyKEVAnTGtuoAH6kA==
X-Received: by 2002:a05:600c:470f:b0:418:41a7:d032 with SMTP id
 v15-20020a05600c470f00b0041841a7d032mr2258390wmo.13.1713174876000; 
 Mon, 15 Apr 2024 02:54:36 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 k37-20020a05600c1ca500b004187450e4cesm1379392wms.29.2024.04.15.02.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 02:54:35 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/nouveau: use vmemdup_array_user() in u_memcpya()
Date: Mon, 15 Apr 2024 11:54:09 +0200
Message-ID: <20240415095433.119163-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Now that we have vmemdup_array_user(), make use of it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e239c6bf4afa..2038d60958e3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -190,11 +190,8 @@ static inline void *
 u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 {
 	void __user *userptr = u64_to_user_ptr(user);
-	size_t bytes;
 
-	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
-		return ERR_PTR(-EOVERFLOW);
-	return vmemdup_user(userptr, bytes);
+	return vmemdup_array_user(userptr, nmemb, size);
 }
 
 #include <nvif/object.h>

base-commit: a57e191ebbaa0363dbf352cc37447c2230573e29
prerequisite-patch-id: d18b2d6615c58084a7027f4f1d9b51bd3f9dd83f
-- 
2.44.0


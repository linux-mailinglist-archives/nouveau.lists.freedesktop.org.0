Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEDF37AC0F
	for <lists+nouveau@lfdr.de>; Tue, 11 May 2021 18:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D724C6E5B2;
	Tue, 11 May 2021 16:36:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0556E5B2
 for <nouveau@lists.freedesktop.org>; Tue, 11 May 2021 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620750959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=97DZTbnMB7JhbF5GRtnL6nwi+qxo43t3jJzfVOcjguQ=;
 b=NkEXn5imhEJ4QAOsPXn43sdNT6ofCZk4EXgv5KAi57IrHP7qKdtnYkjBVPRsFEmA3L0T8e
 IFlbmZOIH+u8ncfyvH5ivcl2C6Sop+GmLLUR5b30+lww0rK+hjxUZxeso1U3bUTscmGoFr
 jo84iMvtPoTOCHiHaZ2hSNh5oSpd9g4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-V8bMZ_IkNpucKS1AKL7Uhg-1; Tue, 11 May 2021 12:35:57 -0400
X-MC-Unique: V8bMZ_IkNpucKS1AKL7Uhg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o126-20020a1c28840000b0290149b8f27c99so2532081wmo.2
 for <nouveau@lists.freedesktop.org>; Tue, 11 May 2021 09:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=97DZTbnMB7JhbF5GRtnL6nwi+qxo43t3jJzfVOcjguQ=;
 b=dQNd20HU07nsRCbOr5Wga5s4KrBhvzY0CyXAeRHVJeR7VmJN7GHAIGUjuqdDeKOh7I
 OIm2W9wCyvUeXJfq30p6YtACbNAch5LER7qQBuBSU+h70iba9IsMxtIYdGP+fkoJf7lq
 MYVYrXlXBddluRBPwkZUPEyRWs8hFgeUxepMJORVrZ2Tjr7G17XqgYsdfck5i4E1LCin
 AH4izQzAsQ5hM4W2EzrgpB9EhWtojT5ylNJEd/bqPzixBiFBsh+qiLmVFjS/lWtTEfMH
 q47sGkarR9m0HHTQNVDNYbQK4tQgbZRra4Xw9u1JkvgjW1c5Zg68uf6VMyxCKwDauX8I
 gCsg==
X-Gm-Message-State: AOAM533SA0MkiR7NeYtrx70qkJq18VixiloUVNQV0cH4M6cYSfs6mhqe
 HdE0O8N3XuAn/B9kM7C86ijR4gNj6G1L8Unv5rZj3oaV6lgRvkJp4rFb6ylHXhdqWHtQBKg1tGs
 YqRFuIE1tFJZEk2YX5R2ifAvejxtavizDOUiqE1Emhjmgu27P5+d3guaYls0RGHD05NkaPGhw6A
 uV
X-Received: by 2002:adf:ffc4:: with SMTP id x4mr37983671wrs.415.1620750955123; 
 Tue, 11 May 2021 09:35:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyED4ci0LdgS2Gz8mzWDdnpWKB4P+VVDIjYTU2Cbwzy7tr6hTdIs8U0qRCI1CHoN3ouApGTvQ==
X-Received: by 2002:adf:ffc4:: with SMTP id x4mr37983650wrs.415.1620750954917; 
 Tue, 11 May 2021 09:35:54 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id c14sm28377803wrt.77.2021.05.11.09.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:35:54 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 11 May 2021 18:35:53 +0200
Message-Id: <20210511163553.2344244-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH] nouveau/gem: fix user-after-free in
 nouveau_gem_new
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
Cc: Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

If ttm_bo_init fails it will already call ttm_bo_put, so we don't have to
do it through nouveau_bo_ref.

==================================================================
BUG: KFENCE: use-after-free write in ttm_bo_put+0x11/0x40 [ttm]

Use-after-free write at 0x000000004dc4663c (in kfence-#44):
 ttm_bo_put+0x11/0x40 [ttm]
 nouveau_gem_new+0xc1/0xf0 [nouveau]
 nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
 drm_ioctl_kernel+0xb2/0x100 [drm]
 drm_ioctl+0x215/0x390 [drm]
 nouveau_drm_ioctl+0x55/0xa0 [nouveau]
 __x64_sys_ioctl+0x83/0xb0
 do_syscall_64+0x33/0x40
 entry_SYSCALL_64_after_hwframe+0x44/0xae

kfence-#44 [0x00000000c0593b31-0x000000002e74122b, size=792, cache=kmalloc-1k] allocated by task 2657:
 nouveau_bo_alloc+0x63/0x4c0 [nouveau]
 nouveau_gem_new+0x38/0xf0 [nouveau]
 nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
 drm_ioctl_kernel+0xb2/0x100 [drm]
 drm_ioctl+0x215/0x390 [drm]
 nouveau_drm_ioctl+0x55/0xa0 [nouveau]
 __x64_sys_ioctl+0x83/0xb0
 do_syscall_64+0x33/0x40
 entry_SYSCALL_64_after_hwframe+0x44/0xae

freed by task 2657:
 ttm_bo_release+0x1cc/0x300 [ttm]
 ttm_bo_init_reserved+0x2ec/0x300 [ttm]
 ttm_bo_init+0x5e/0xd0 [ttm]
 nouveau_bo_init+0xaf/0xc0 [nouveau]
 nouveau_gem_new+0x7f/0xf0 [nouveau]
 nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
 drm_ioctl_kernel+0xb2/0x100 [drm]
 drm_ioctl+0x215/0x390 [drm]
 nouveau_drm_ioctl+0x55/0xa0 [nouveau]
 __x64_sys_ioctl+0x83/0xb0
 do_syscall_64+0x33/0x40
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Fixes: 019cbd4a4feb3 "drm/nouveau: Initialize GEM object before TTM object"
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c88cbb85f101..1165ff990fb5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -212,7 +212,6 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 
 	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
 	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
 		return ret;
 	}
 
-- 
2.31.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

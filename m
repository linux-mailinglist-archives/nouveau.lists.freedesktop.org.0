Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAA96D55EC
	for <lists+nouveau@lfdr.de>; Tue,  4 Apr 2023 03:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAE910E2A5;
	Tue,  4 Apr 2023 01:28:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEC310E292
 for <nouveau@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzrmMp6+aqWo/TvsnNZiIixlQKMUKus548lCDw5p9Z4=;
 b=S4NVLsttjoqb+WYVESdKcUB4uGbuHkcjfDuIs4y4Uxz1kB5dWs7t4YRbNMjesiIZ/jY5K2
 6Z8kLaV6ESSmzrH6hTXh7+3DrXL9wPoUpbs5YyYLYbppJfoi/eYh5FARa0ogj+7dCw+MXM
 TtqOceNgM9YxEzbLarf2l6LZtP4CGmA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-fWzk355IM7ykjdwh1q2PtQ-1; Mon, 03 Apr 2023 21:28:18 -0400
X-MC-Unique: fWzk355IM7ykjdwh1q2PtQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso43524728edb.4
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzrmMp6+aqWo/TvsnNZiIixlQKMUKus548lCDw5p9Z4=;
 b=Ty7DOaU3uXCpR/ILRAx/96BP/uhOkAtGkNgYZpK/7KBBaDnXn2YSKCZXzUq4OLYA9g
 V3AF9NdRaoUiY19KDV2Se7bkXOKeAJi15zoRzelrV/3pxhjL0j0RcCnHFSQnWG+UPXgG
 YPm/c/4P8SvTGSTDDj6JBmfoQWycoqTPRzbnJjvhJgenL/bBDWmJGvTxd7Qe5KcdYoXM
 1nHwiK7nn4FvkSZWFlub9cIh3KKv/vRcd9UIrexvoNYe/v1eqDo688j8FswkjSbTfCYj
 gImtQxfjuNNWr1XYj5VHVMopFF/+FNtOkrs153vIm8/AuMeSAZNzZljOfkwZqc5lE1c0
 wC7g==
X-Gm-Message-State: AAQBX9dncRcb0ZQhu6E4NAEgkp0enNy6I9aF8HOyp0VlpwoJ5asqvOWb
 Ox4NFEp2EMbghW6b+ug5NGi/RbYBKJOQJtbicGIQ+lFTiKKbnBCpuGPTilAxpLSmez7OrP0PKWu
 Q4ih/am6orM9sqbS+f51uXAt0Jg==
X-Received: by 2002:a17:907:b12:b0:8c3:3439:24d9 with SMTP id
 h18-20020a1709070b1200b008c3343924d9mr549196ejl.24.1680571697341; 
 Mon, 03 Apr 2023 18:28:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bOuZVfqTuVyFepzGmLZe0Dusjy763ib39Sg1Hu3aDle0xx1it+4Dx6IGT3ClEiv+jGPdjVUA==
X-Received: by 2002:a17:907:b12:b0:8c3:3439:24d9 with SMTP id
 h18-20020a1709070b1200b008c3343924d9mr549180ejl.24.1680571697206; 
 Mon, 03 Apr 2023 18:28:17 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a170906384e00b00932fa67b48fsm5210797ejc.183.2023.04.03.18.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:16 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue,  4 Apr 2023 03:27:34 +0200
Message-Id: <20230404012741.116502-9-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v3 08/15] drm/nouveau: bo: initialize GEM
 GPU VA interface
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

Initialize the GEM's DRM GPU VA manager interface in preparation for the
(u)vmm implementation, provided by subsequent commits, to make use of it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7724fe63067d..057bc995f19b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -215,11 +215,14 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
 		return ERR_PTR(-ENOMEM);
+
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
 	nvbo->bo.bdev = &drm->ttm.bdev;
 
+	drm_gem_gpuva_init(&nvbo->bo.base);
+
 	/* This is confusing, and doesn't actually mean we want an uncached
 	 * mapping, but is what NOUVEAU_GEM_DOMAIN_COHERENT gets translated
 	 * into in nouveau_gem_new().
-- 
2.39.2


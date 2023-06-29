Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302874306F
	for <lists+nouveau@lfdr.de>; Fri, 30 Jun 2023 00:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6119310E403;
	Thu, 29 Jun 2023 22:27:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D64A10E407
 for <nouveau@lists.freedesktop.org>; Thu, 29 Jun 2023 22:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688077648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=SVQFHe7oLSE1DfUKO9pJBUbKp+YEdKM5JI32E5LHQ5PjdZgitEHtIgQYMcJSOzXvVvq3O3
 iFM9tJ6oJ0u+MMbJ7eZsnlkVsIGpqJ9+mUoFDYd8eUVFi/oGgJWb1bUyhEqUcm0oFFRJ8D
 MzDv5KYoUvmx3WtpWyJ5gtWXHvifedI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-tP5BKfhpNYu4Jkyb3nKSUQ-1; Thu, 29 Jun 2023 18:27:25 -0400
X-MC-Unique: tP5BKfhpNYu4Jkyb3nKSUQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30e6153f0eeso614507f8f.0
 for <nouveau@lists.freedesktop.org>; Thu, 29 Jun 2023 15:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688077644; x=1690669644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=Z2Ef+DUAbaaJyTx/F7W8FE1BH4u4NUVegTJAj9rsC3/vnoLC/RMqaWiLfra67ePUH9
 rElkzgFwvJ0LW9SayIwY4/Lgh6yNejIB8groHW4FJfwmPgXA9t2IBaiejVNXvWhd6ZNh
 /t8M+p9mOiAQZuGVYRb2gDFra0UA/seZPv51LMzNbFwz5M4kjA9ZlqbRtrvGmbGxTro2
 ADAvglXyMSbtUJ3nDDHancGbH7pz34VPUHHQCGZ8Eqa4l8pHF2qIMP1LfKd/bUWDRP4r
 GWeLogLyo/lge8P0D58OT8Sl+DghQMyzBhkruTzzbTt0SiOYn4X+2btwSEiVsrxe1xZk
 HjmQ==
X-Gm-Message-State: ABy/qLYrfPVfSH75tSsT8OhhxzB3oeqii5+BAIHYXE2xdOyLTIfU3a+d
 RiOH4+AZlZPVTrq95eZB58LUodzEkxbnj4cO+gaWR0v2Aq2gN/zU9/biyxgzuGV3rrZxDhCVF+R
 0ss+rHQU4Lmq40qgFuvUhbtK/Iw==
X-Received: by 2002:adf:df04:0:b0:313:eeb3:c57a with SMTP id
 y4-20020adfdf04000000b00313eeb3c57amr712049wrl.15.1688077643957; 
 Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG7GyWmtfFzWGI2T6+X0GNR2UPFhGUrcAEJPnjYpUD/fKQGW/GRkOsPdyF5/34TvCU73KOwJQ==
X-Received: by 2002:adf:df04:0:b0:313:eeb3:c57a with SMTP id
 y4-20020adfdf04000000b00313eeb3c57amr712036wrl.15.1688077643775; 
 Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d514d000000b0030e56a9ff25sm16660739wrt.31.2023.06.29.15.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 30 Jun 2023 00:25:22 +0200
Message-ID: <20230629222651.3196-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v6 06/13] drm/nouveau: bo: initialize GEM
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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
2.41.0


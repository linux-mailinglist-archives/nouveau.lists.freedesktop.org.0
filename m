Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FBA75295B
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 19:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB78889316;
	Thu, 13 Jul 2023 17:05:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A2B10E735
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=T3lIAwAN4y3sfRwiURnBEPa2PrpREbu1T426AtwJ2hnN/yInK0LR0IgJKsWeqFKSWLj7JN
 ga11HNKBdc1wyXeXsTjbpwD8vKUgqetYEsFb7kaEC/X4y76ecpZISr2ZKEXaz9ROhP7iSe
 xtrD0JtPvdp9L8hXl+S2SZuE5LnYZSY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-4eiY6VoGN0q7D7ZFAjuh_w-1; Thu, 13 Jul 2023 13:05:01 -0400
X-MC-Unique: 4eiY6VoGN0q7D7ZFAjuh_w-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-993e73a4c4fso57807566b.0
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267900; x=1691859900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=HPr+Bp+v76PvJEcfx6KlOpJiLy0bxunQ7bef40gmkFStqfAtuTkto+dGNuaOAXh2Rx
 nRRZpw2sGxWuzOpsupF8hTouOp23C05ZuRBOzn6b9olv2QTwUAHgWDVX9o4E5u2r2/IC
 pG98pAajI1T1HiCIBKPqgx7TpexczRNsJMk9eTvXZCu4n4dNwPP68vYT9yNyx9uZYOAS
 4X2R5j8/cNCorNFzs/9gkq2P5zCysrJGKiNCKdwyOqYfSG2U2pFKLWKAzqyqpupMKYk9
 3049uwVEP3ESVijaFfKa27AL3HhvI4RZppUhrVIMJQM67mqcHRf7Oy7DGndP8j9nFBJ0
 h+RQ==
X-Gm-Message-State: ABy/qLaWBWX86UA3bcjkP1tCf4CYCBZJRTBEfpUcHj+3vnr4Oxb2qfOx
 jPXUaRGMhKAg1RBjsabprQFSG6x9n6urWhGPEE31yL+0WaUtcE5BLFZT0nqxCM8I7HGY9bqT7hQ
 IpkIbJl6QbLDeFsG/yU4aJ1Srxw==
X-Received: by 2002:a17:906:113:b0:987:fe18:1c56 with SMTP id
 19-20020a170906011300b00987fe181c56mr2115236eje.47.1689267899909; 
 Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEGCyQeuogsjgxDVJKFBZEg08N1OVXBkYa73JHbS/zCbYQKSeo62Zql1FBRS0FoBHej2bCLIA==
X-Received: by 2002:a17:906:113:b0:987:fe18:1c56 with SMTP id
 19-20020a170906011300b00987fe181c56mr2115221eje.47.1689267899743; 
 Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a1709064f0900b00992a8a54f32sm4244576eju.139.2023.07.13.10.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu, 13 Jul 2023 19:04:01 +0200
Message-ID: <20230713170429.2964-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v7 06/13] drm/nouveau: bo: initialize GEM
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


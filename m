Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3F7707CF
	for <lists+nouveau@lfdr.de>; Fri,  4 Aug 2023 20:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686D810E74E;
	Fri,  4 Aug 2023 18:24:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEA410E743
 for <nouveau@lists.freedesktop.org>; Fri,  4 Aug 2023 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwdeGZqElHaeNok5koZwxqm81zQwPAs60eGGyV3zg50=;
 b=QbVcPKKBqxxahHmMq9UYiyZZ1e8Yx6xNNZjGG2ph/sqfiHjvUuPG0vAuxcIBGAeQAzrgXT
 h+mNDrkWBDDTORaa1SIEGy51cgDmvox4fwFESK1iqy2YG93V8j0upRoLi07639zlFOtV4S
 frucJCYS7XO3UWE1gi5jiTWjhMn4rkU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-75irNPjvNhKQPADPwDhatA-1; Fri, 04 Aug 2023 14:24:35 -0400
X-MC-Unique: 75irNPjvNhKQPADPwDhatA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-978a991c3f5so162506266b.0
 for <nouveau@lists.freedesktop.org>; Fri, 04 Aug 2023 11:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173474; x=1691778274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwdeGZqElHaeNok5koZwxqm81zQwPAs60eGGyV3zg50=;
 b=IXEq40pcbv2z7HP5Uj/yi/ax4Vb/W5qn+56Z/pBG/GVXhJgk8L/Usl5RBhKJdE2T3j
 GYE4KHjp6CPp2qqXPs52J+AcwG6FNczuwff4mFCtiGlFmgl926itShToXJ/3LOdu28TD
 eWyNQqoyzBOZW8q7E2Ng8CBVDEXzOaRFPAOCI8BNQcOFfMoB7yAs449J5Nvuvv3QD1ZY
 9ifHQXuT+1wD0QrCfaDVtnOUyD8tqSQqU9FoWbw+/8Kl4Tpd9ry1WjrK6C77oXLqoszF
 3urZUQcjQ2u+xdnYJ1vkJmEoQem1zfEHkBzU3tvOhHuA3ryb/TtXAW1eziGIBjREk73V
 egKw==
X-Gm-Message-State: AOJu0YzrpUNZ0miYugRryZ12hECP1uRzof8pJSqHSQMSz/hl4VzjDAm1
 6PqmGGM+FHDaX2dmhN3ll/Pr0p6p8cHM6FRmFdo5ikteqRC9GQM+LnfkkTxpeu2rrLSYgKELgox
 m998yTQkSUtrhSZAnvKKpm+DBQg==
X-Received: by 2002:a17:906:5a5c:b0:99b:65fa:e30f with SMTP id
 my28-20020a1709065a5c00b0099b65fae30fmr2089708ejc.1.1691173474211; 
 Fri, 04 Aug 2023 11:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEryZP9aoJVNn8MC19nvMnlJKcLY3kuJDlB/w4c0Aec7ZI6lMZWBxZ3bUEK2krqN5p5MUOQw==
X-Received: by 2002:a17:906:5a5c:b0:99b:65fa:e30f with SMTP id
 my28-20020a1709065a5c00b0099b65fae30fmr2089692ejc.1.1691173474066; 
 Fri, 04 Aug 2023 11:24:34 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 gs2-20020a170906f18200b00992b71d8f19sm1643966ejb.133.2023.08.04.11.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:24:33 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Fri,  4 Aug 2023 20:23:45 +0200
Message-ID: <20230804182406.5222-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v10 05/12] drm/nouveau: bo:
 initialize GEM GPU VA interface
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

Initialize the GEM's DRM GPU VA manager interface in preparation for the
(u)vmm implementation, provided by subsequent commits, to make use of it.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7724fe63067d..6130c99b6b2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -215,6 +215,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
 		return ERR_PTR(-ENOMEM);
+
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
@@ -339,6 +340,11 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	dma_resv_init(&nvbo->bo.base._resv);
 	drm_vma_node_reset(&nvbo->bo.base.vma_node);
 
+	/* This must be called before ttm_bo_init_reserved(). Subsequent
+	 * bo_move() callbacks might already iterate the GEMs GPUVA list.
+	 */
+	drm_gem_gpuva_init(&nvbo->bo.base);
+
 	ret = nouveau_bo_init(nvbo, size, align, domain, sg, robj);
 	if (ret)
 		return ret;
-- 
2.41.0


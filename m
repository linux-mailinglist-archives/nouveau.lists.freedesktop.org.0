Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF1969ACF3
	for <lists+nouveau@lfdr.de>; Fri, 17 Feb 2023 14:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7510EFEF;
	Fri, 17 Feb 2023 13:48:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1476610EFF4
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s63r6ewLpHy8dX6pfqzPL7Kskgx+EPYod2Ty9Ts4erk=;
 b=XSbaPwo12LAB4EfolymFY1np9bhNKEikg7WY5CkRhhFruIcugO1F1cH+Z3XWTrs48q1PHa
 gHofN2dX0duKcqxbS9ABwOPBRBDv/ZNAzLJp8ClVy6kG+93QD42I513bKT++GbzGNV9peZ
 Mgxw4BVQJjyYlYmubuuHv2PUgrbqovo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-ziadLNQ7OKaItOfGIOdrTg-1; Fri, 17 Feb 2023 08:48:38 -0500
X-MC-Unique: ziadLNQ7OKaItOfGIOdrTg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g15-20020a056402428f00b004aab4319cedso1341562edc.2
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 05:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s63r6ewLpHy8dX6pfqzPL7Kskgx+EPYod2Ty9Ts4erk=;
 b=KRn8oCiC4GB2FIyCJjsq77YO7VdVo4yvmXTEwiqEl9yNeUdJk6tIIJIo6TUZfjK0nQ
 6GSE6YZw1fQHZ/MIqsoI/AUtBV2g8FDlXicqvlGGbiHzCUepYq1EEN58FrOcW+ua3NBT
 o9dkMz2N4xRFQzNTFumcVyNIRXnRcWz8i0KL5APWPiqH60PwN0TkNEPLspad1+tukW8F
 kDDVVs0WhVF0QrCrqJncM/IxdE0sp4z7ZFYKLMcWELMWhiorXLo1CwBKWCJ4meLGN41m
 5/vp8BqpDEdgGbUoJjucJSmFoOKOl7oO59Ibx7kU3QHfmsa96jV4iT0W9dxAR27BCQ1X
 rgfA==
X-Gm-Message-State: AO0yUKVmwJ36AHBPqfrdpHDyApATBEwAKYtKcW6NpA/BWhgdxi1Cf6u5
 L22QgaxA/vHt0MMmHvRhwW0QDoS2zaUIH87rJzi3/JI3mdSia3R+/h4g5EAsNKOCg42C2NfVaUb
 HFV7yfz9WAqWt+kZngoj+CSB+4Q==
X-Received: by 2002:a17:906:9750:b0:8b3:946d:51c8 with SMTP id
 o16-20020a170906975000b008b3946d51c8mr1973094ejy.29.1676641717140; 
 Fri, 17 Feb 2023 05:48:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8Vb+Eh70SMrWH0gbi9pDuylvuAxYJRJaM1j4o+Rm2VHpNfcVf+Ka0ZZS+k/kpmT6aZ0ke53A==
X-Received: by 2002:a17:906:9750:b0:8b3:946d:51c8 with SMTP id
 o16-20020a170906975000b008b3946d51c8mr1973082ejy.29.1676641717002; 
 Fri, 17 Feb 2023 05:48:37 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a509b4f000000b004acc7202074sm2288777edj.16.2023.02.17.05.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:36 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 17 Feb 2023 14:48:13 +0100
Message-Id: <20230217134820.14672-4-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v2 09/16] drm/nouveau: bo: initialize GEM
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
index f3039c1f87c9..bf6984c8754c 100644
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
2.39.1


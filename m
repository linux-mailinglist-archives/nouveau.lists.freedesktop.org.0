Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09076EFFD
	for <lists+nouveau@lfdr.de>; Thu,  3 Aug 2023 18:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF4B10E635;
	Thu,  3 Aug 2023 16:53:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6954F10E636
 for <nouveau@lists.freedesktop.org>; Thu,  3 Aug 2023 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691081589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=ThYGFHYHe8gTigJ8WSeuDANo4wokbkWR7aQL/qR1stLnsKPifayqVKIY+P6eMWinrwaly0
 1n3WHqJ1rPhnrAmcgXiOzWljFxO/l2a1G4iIxsuZkzq8YkNOJye3LRtltYjaw+Qo/7lSUY
 Ar0aGVZLalFcbL0bROQQKJLhrT+cGnc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-omUxUfQ4P5e4OFJPC-Pazw-1; Thu, 03 Aug 2023 12:53:08 -0400
X-MC-Unique: omUxUfQ4P5e4OFJPC-Pazw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9da035848so12461111fa.3
 for <nouveau@lists.freedesktop.org>; Thu, 03 Aug 2023 09:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691081587; x=1691686387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=Ay5zM7FSeesiIiSwg38T7Z6K202qIRY6XNvUSAteqvsvgeztxh4zVV05c3osmsyucd
 b6G/wTwq9N4wNQJvllk7n4vU/sAK6hi95jK3UtgUY+Gp4vCOiIa6RlTVAiGqUhxP2PCR
 /LgcQ33LtyEIhuPNnLj7ebD/XQooPaq21MgAVU9WNRG+0OHxFB0twm8vDEDZhP1FQjc+
 U/imRwxJdw2sfN/qox9q+vPJUnXA2cCVPbZm482jnCl47i4o5ftr6CIxSZcfMIzrUYsD
 p31s73ap63vvgXWE3U2hqrwU2g2pAfQO8rvP/cMtDfFOvVpB01q1bafIAB5aqWFQvgOl
 qUqQ==
X-Gm-Message-State: ABy/qLat1baq3UR7g3yQHe2pN003Qi0Ecd+9Go9jMl0GBZaqQaXJuWLj
 UsaJHv073g1dqT1cCluKzun2XXqpQfFmwBMMtakOkjzBFIuxqBAPVQkeB2Ke0GdaHnhGaFU8SCm
 y0L77U05qLc9f1iq8sr67u67UUdb/1eI9vQ==
X-Received: by 2002:a19:711a:0:b0:4fd:fad6:5495 with SMTP id
 m26-20020a19711a000000b004fdfad65495mr7236004lfc.18.1691081586838; 
 Thu, 03 Aug 2023 09:53:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFXIQ5nuEebS6pFgxdZ4ILhQ7gtJ6jmUdOaptyWQGI79utid5mNk79IJm44KXkVJNzRHhSXKg==
X-Received: by 2002:a19:711a:0:b0:4fd:fad6:5495 with SMTP id
 m26-20020a19711a000000b004fdfad65495mr7235974lfc.18.1691081586341; 
 Thu, 03 Aug 2023 09:53:06 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 z22-20020aa7c656000000b0052302c27de2sm36537edr.10.2023.08.03.09.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 09:53:06 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu,  3 Aug 2023 18:52:23 +0200
Message-ID: <20230803165238.8798-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v9 04/11] drm/nouveau: bo:
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


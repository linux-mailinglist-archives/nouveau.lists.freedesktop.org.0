Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5E7707C3
	for <lists+nouveau@lfdr.de>; Fri,  4 Aug 2023 20:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AAA10E746;
	Fri,  4 Aug 2023 18:24:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD56510E744
 for <nouveau@lists.freedesktop.org>; Fri,  4 Aug 2023 18:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfuUlvOtQCcgIWDDGRTDaO97w4Wpv+IQfrkVs47IV0U=;
 b=NRwea3wxgUbNrSrVikmgi3ywRVYAciBPLCKcjftrNzwg4F4KLmZSm7juxjpXkaSuwP09ub
 GLOHYdfR3GoxVQ0uTte3hj9pXAuMnSxPBtHu+yzgK9JkJZYLlmxPKMqopL1DFl/ML9lod6
 4r+CeOV1rSor5Hv9a3jzhE2x5l2MjXs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-HoUmAkqNMr6bUsruZdypBw-1; Fri, 04 Aug 2023 14:24:17 -0400
X-MC-Unique: HoUmAkqNMr6bUsruZdypBw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-52258599da2so1569089a12.3
 for <nouveau@lists.freedesktop.org>; Fri, 04 Aug 2023 11:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173456; x=1691778256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfuUlvOtQCcgIWDDGRTDaO97w4Wpv+IQfrkVs47IV0U=;
 b=AibANHDET5hKGZw6osE2VsSyjmRsyEAO1xAURjZmBR3+DcTTyKcvS34MsP1Qs2YGPv
 h5UstZK9ajMln0XUy8JwQ2mr+Jj0g1gjxqDyERpQ4cyRUso/DWWCR+0AXn0Gl7F5BnYO
 YSZWlaXzSgwHJgZ/YIDd4KNm7SdmxoH4j8dZBzoPZP6aFGh+YfcSRCeNCnO/tWRZFca8
 iq/PpS4johKZW7TWrpxwJ8an6V58ZO8J+fCGkJ5fJEdpjQrgpxxD0RBPKBukTI7Lhh2F
 7s9cDy4sAtlBCFRSYHIQqOgGxBY+2q9y3zzzOKJZUsAm46MyLpC2sJWBVpsIrfeH6qiH
 hMyQ==
X-Gm-Message-State: AOJu0YwgNBXGFLwwLS12PN0aXcQsbhiFPSgTC/NH7GiUol2VX5RFVpFP
 B6lQXuz2JKKu9erYY2jlpvIfFzlPO+3JntcPkRILEJIv0TFPu9ZOm4+nAmjYOBNVCYaFIWWYLUD
 LvwwdgfltGH2awF1Knspjzp5SRA==
X-Received: by 2002:aa7:db44:0:b0:522:3c32:fd2e with SMTP id
 n4-20020aa7db44000000b005223c32fd2emr2223766edt.24.1691173456653; 
 Fri, 04 Aug 2023 11:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErEoSmaKF2uBw7h8HGFFtQ5MjUTz4y59jFR/tNHUs5hU8wStuPrUAj1j93cdqJV0DWvKhGwg==
X-Received: by 2002:aa7:db44:0:b0:522:3c32:fd2e with SMTP id
 n4-20020aa7db44000000b005223c32fd2emr2223746edt.24.1691173456342; 
 Fri, 04 Aug 2023 11:24:16 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 d12-20020aa7ce0c000000b005230724b2b1sm1581545edv.45.2023.08.04.11.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:24:15 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Fri,  4 Aug 2023 20:23:41 +0200
Message-ID: <20230804182406.5222-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v10 01/12] drm/gem: fix lockdep
 check for dma-resv lock
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

When no custom lock is set to protect a GEMs GPUVA list, lockdep checks
should fall back to the GEM objects dma-resv lock. With the current
implementation we're setting the lock_dep_map of the GEM objects 'resv'
pointer (in case no custom lock_dep_map is set yet) on
drm_gem_private_object_init().

However, the GEM objects 'resv' pointer might still change after
drm_gem_private_object_init() is called, e.g. through
ttm_bo_init_reserved(). This can result in the wrong lock being tracked.

To fix this, call dma_resv_held() directly from
drm_gem_gpuva_assert_lock_held() and fall back to the GEMs lock_dep_map
pointer only if an actual custom lock is set.

Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/drm/drm_gem.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index c0b13c43b459..bc9f6aa2f3fe 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -551,15 +551,17 @@ int drm_gem_evict(struct drm_gem_object *obj);
  * @lock: the lock used to protect the gpuva list. The locking primitive
  * must contain a dep_map field.
  *
- * Call this if you're not proctecting access to the gpuva list
- * with the dma-resv lock, otherwise, drm_gem_gpuva_init() takes care
- * of initializing lock_dep_map for you.
+ * Call this if you're not proctecting access to the gpuva list with the
+ * dma-resv lock, but with a custom lock.
  */
 #define drm_gem_gpuva_set_lock(obj, lock) \
-	if (!(obj)->gpuva.lock_dep_map) \
+	if (!WARN((obj)->gpuva.lock_dep_map, \
+		  "GEM GPUVA lock should be set only once.")) \
 		(obj)->gpuva.lock_dep_map = &(lock)->dep_map
 #define drm_gem_gpuva_assert_lock_held(obj) \
-	lockdep_assert(lock_is_held((obj)->gpuva.lock_dep_map))
+	lockdep_assert((obj)->gpuva.lock_dep_map ? \
+		       lock_is_held((obj)->gpuva.lock_dep_map) : \
+		       dma_resv_held((obj)->resv))
 #else
 #define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
 #define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
@@ -573,11 +575,12 @@ int drm_gem_evict(struct drm_gem_object *obj);
  *
  * Calling this function is only necessary for drivers intending to support the
  * &drm_driver_feature DRIVER_GEM_GPUVA.
+ *
+ * See also drm_gem_gpuva_set_lock().
  */
 static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
 {
 	INIT_LIST_HEAD(&obj->gpuva.list);
-	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
 }
 
 /**
-- 
2.41.0


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85D76EFF8
	for <lists+nouveau@lfdr.de>; Thu,  3 Aug 2023 18:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837D710E63D;
	Thu,  3 Aug 2023 16:52:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D963510E645
 for <nouveau@lists.freedesktop.org>; Thu,  3 Aug 2023 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691081576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WgiHBqQzhU+chwvVYY3OBnXGB70Uj4QupullLdrp3I8=;
 b=Yetg5L/DggdciwboMUxeHxgtpBv1xPJD90Xl9OZZBHS1eI6N7yuoR6bvLPoVlGSrKMmtov
 V5e8b12UZoN8UxjS8xa2TpGkgzphfNYnr7q1RKngIcWFcqtaFgQRricgx4d0ev7BwISiWX
 AxGwq7LWwV4BOX+NQpO3ajF1cE0gQvE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-hbB7sLL5MwuDSsQtB2Xc0A-1; Thu, 03 Aug 2023 12:52:54 -0400
X-MC-Unique: hbB7sLL5MwuDSsQtB2Xc0A-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-521f84b8c42so715838a12.2
 for <nouveau@lists.freedesktop.org>; Thu, 03 Aug 2023 09:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691081573; x=1691686373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgiHBqQzhU+chwvVYY3OBnXGB70Uj4QupullLdrp3I8=;
 b=PSjT4fjLEbzwKP6oHyK664q/ResgBhClfF/NnUNIjTBU6owMh3zyclFrOXzP0ErTa2
 pQlTu1/AJBSL+IgZ8UZ2xUGg64SDMnanE0BrCT9ER3onTXxWNcvPYdqnNzXQB0bt3TB3
 Vo/8Q4e5MCVCtB0EwbMGFrD3gomPKYN48CnesK+u3CnQunuD2aC8msvq/uV5/Qu9qpRA
 SDGadg9wU2PGPBFDIF01E38T5tccRkZowOQWihV8ffQPMH43b2VmjNt0ZCF3Lma6ljWQ
 dPOQjA1ZXu9VehAD6ywF17di19kyTsDAL+SEwkw92Sal9FLJ+i8qDVmAQ2AOVaGRNXji
 PSJw==
X-Gm-Message-State: ABy/qLYhuZoO8Ady7FpJBJLnJrpItW7LvLuFjuuvzIVGij3HL71/TvVh
 tCuUaXc3u5jl1rIKMYlCFQTWjWZ33MoEaLmhz/RQakAls4IrY/4g/7nWqlt2/mUqOfxzfrDyHqN
 v/1lYhPgFCJm6tPdZ4cL3HkO2KA==
X-Received: by 2002:a05:6402:31fa:b0:51e:2305:931 with SMTP id
 dy26-20020a05640231fa00b0051e23050931mr7760019edb.22.1691081573579; 
 Thu, 03 Aug 2023 09:52:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHWOYsnn1oCn5gkeMLn4uDdQ4XDa+mZDkwB5BDZpkQE0Vx3/c9Z+CvMCA47o36BoMnEPa5E0g==
X-Received: by 2002:a05:6402:31fa:b0:51e:2305:931 with SMTP id
 dy26-20020a05640231fa00b0051e23050931mr7760014edb.22.1691081573325; 
 Thu, 03 Aug 2023 09:52:53 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v24-20020aa7d818000000b005227f4530fdsm35668edq.37.2023.08.03.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 09:52:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu,  3 Aug 2023 18:52:20 +0200
Message-ID: <20230803165238.8798-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v9 01/11] drm/gem: fix lockdep check
 for dma-resv lock
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


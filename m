Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294EE6D55F0
	for <lists+nouveau@lfdr.de>; Tue,  4 Apr 2023 03:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE1C10E292;
	Tue,  4 Apr 2023 01:28:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6653510E292
 for <nouveau@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJjo+FH94rqm+YFtx8z0gG8uW3UTDYEscdTvstDnOSI=;
 b=WNVBCLfgV35XSSNqmR4iW9fDukEtf4uBi4mUDKLorx+Wl5XaD9z6H08fOIjNlgYHHOdJz5
 PA62HL3MHYYQfDGtiW6ckxHxMvGYcOVs75jQD/8GAHRQ6ijo1XnyWJlEeGLkD64xITWtbd
 5NhXR3+P+/IwgmspKFSlQK1eK2ncgrQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-9MGC-dF6Ouerbj979JsdEg-1; Mon, 03 Apr 2023 21:28:26 -0400
X-MC-Unique: 9MGC-dF6Ouerbj979JsdEg-1
Received: by mail-ed1-f69.google.com with SMTP id
 b6-20020a509f06000000b005029d95390aso7116799edf.2
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJjo+FH94rqm+YFtx8z0gG8uW3UTDYEscdTvstDnOSI=;
 b=eIAvhzlS6w0Z4cvqJNPRFdh322uw0tX1f4lTP8/oAaxwkC3KSBV1YfZwUe0YgF3H9b
 xe6g4/gYSsZyFxRy1SmqbctCZBQQPD2vuXvTVMi1/UnZP/Ytctc2SP2mpnoaFrMymqKg
 0OxF1SR7gkswV4ydQtnsu5IVif0/hO0BE+y+qNBNWRU+icX+WX40o5nd0UbY4kTyvRty
 6KL8D8hdeHvcxo0L4R+E7whlwxOPeoPz2f/tznhC8uweG1eJTJYcVlvEHlWQyRSkA4YY
 tijgZd3XjNcR6D1s7PrMUYBoEsI5GA+9wvrpTBin0NN8JyglY6Bn0IRUYf8BtC4PFK7S
 mzFg==
X-Gm-Message-State: AAQBX9dufQc5rJrKl9v9m5vcs0WoWkPICT94Bt92xyHkz+uObpyE159a
 YD9q3hWlJ6UkNrO0Vnh+R+Wd9FLonb8tQavgH6vzg9zbGEjICGSvax/ujpj8Aid+qXWXi8vVgU6
 xwxlReA9fk4QBR14eGTl25TmDHw==
X-Received: by 2002:a17:906:3555:b0:92b:e330:a79e with SMTP id
 s21-20020a170906355500b0092be330a79emr803367eja.29.1680571705137; 
 Mon, 03 Apr 2023 18:28:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350awacH0JtA6NM4rVbvy8vkXHbOyO8vv6M4JDMvDfwFDmcfXulMIDAEwRPSaVwJ0AQMcc1jkzw==
X-Received: by 2002:a17:906:3555:b0:92b:e330:a79e with SMTP id
 s21-20020a170906355500b0092be330a79emr803358eja.29.1680571704920; 
 Mon, 03 Apr 2023 18:28:24 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a1709060c5100b00927341bf69dsm5212418ejf.88.2023.04.03.18.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue,  4 Apr 2023 03:27:36 +0200
Message-Id: <20230404012741.116502-11-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v3 10/15] drm/nouveau: fence: separate
 fence alloc and emit
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

The new (VM_BIND) UAPI exports DMA fences through DRM syncobjs. Hence,
in order to emit fences within DMA fence signalling critical sections
(e.g. as typically done in the DRM GPU schedulers run_job() callback) we
need to separate fence allocation and fence emitting.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |  9 ++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 52 +++++++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  6 ++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  9 +++--
 drivers/gpu/drm/nouveau/nouveau_fence.c | 16 +++-----
 drivers/gpu/drm/nouveau/nouveau_fence.h |  3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   |  5 ++-
 7 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index a6f2e681bde9..a34924523133 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1122,11 +1122,18 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
 	PUSH_NVSQ(push, NV_SW, NV_SW_PAGE_FLIP, 0x00000000);
 	PUSH_KICK(push);
 
-	ret = nouveau_fence_new(chan, false, pfence);
+	ret = nouveau_fence_new(pfence);
 	if (ret)
 		goto fail;
 
+	ret = nouveau_fence_emit(*pfence, chan);
+	if (ret)
+		goto fail_fence_unref;
+
 	return 0;
+
+fail_fence_unref:
+	nouveau_fence_unref(pfence);
 fail:
 	spin_lock_irqsave(&dev->event_lock, flags);
 	list_del(&s->head);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 057bc995f19b..e9cbbf594e6f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -820,29 +820,39 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 		mutex_lock(&cli->mutex);
 	else
 		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
+
 	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, ctx->interruptible);
-	if (ret == 0) {
-		ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
-		if (ret == 0) {
-			ret = nouveau_fence_new(chan, false, &fence);
-			if (ret == 0) {
-				/* TODO: figure out a better solution here
-				 *
-				 * wait on the fence here explicitly as going through
-				 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
-				 *
-				 * Without this the operation can timeout and we'll fallback to a
-				 * software copy, which might take several minutes to finish.
-				 */
-				nouveau_fence_wait(fence, false, false);
-				ret = ttm_bo_move_accel_cleanup(bo,
-								&fence->base,
-								evict, false,
-								new_reg);
-				nouveau_fence_unref(&fence);
-			}
-		}
+	if (ret)
+		goto out_unlock;
+
+	ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
+	if (ret)
+		goto out_unlock;
+
+	ret = nouveau_fence_new(&fence);
+	if (ret)
+		goto out_unlock;
+
+	ret = nouveau_fence_emit(fence, chan);
+	if (ret) {
+		nouveau_fence_unref(&fence);
+		goto out_unlock;
 	}
+
+	/* TODO: figure out a better solution here
+	 *
+	 * wait on the fence here explicitly as going through
+	 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
+	 *
+	 * Without this the operation can timeout and we'll fallback to a
+	 * software copy, which might take several minutes to finish.
+	 */
+	nouveau_fence_wait(fence, false, false);
+	ret = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
+					new_reg);
+	nouveau_fence_unref(&fence);
+
+out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 1068abe41024..f47c0363683c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -62,9 +62,11 @@ nouveau_channel_idle(struct nouveau_channel *chan)
 		struct nouveau_fence *fence = NULL;
 		int ret;
 
-		ret = nouveau_fence_new(chan, false, &fence);
+		ret = nouveau_fence_new(&fence);
 		if (!ret) {
-			ret = nouveau_fence_wait(fence, false, false);
+			ret = nouveau_fence_emit(fence, chan);
+			if (!ret)
+				ret = nouveau_fence_wait(fence, false, false);
 			nouveau_fence_unref(&fence);
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 789857faa048..4ad40e42cae1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -209,7 +209,8 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	nouveau_fence_new(dmem->migrate.chan, false, &fence);
+	if (!nouveau_fence_new(&fence))
+		nouveau_fence_emit(fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
 	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
@@ -402,7 +403,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 		}
 	}
 
-	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
+	if (!nouveau_fence_new(&fence))
+		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	nouveau_dmem_fence_done(&fence);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -675,7 +677,8 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		addr += PAGE_SIZE;
 	}
 
-	nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
+	if (!nouveau_fence_new(&fence))
+		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ee5e9d40c166..e946408f945b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -210,6 +210,9 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
 	int ret;
 
+	if (unlikely(!chan->fence))
+		return -ENODEV;
+
 	fence->channel  = chan;
 	fence->timeout  = jiffies + (15 * HZ);
 
@@ -396,25 +399,16 @@ nouveau_fence_unref(struct nouveau_fence **pfence)
 }
 
 int
-nouveau_fence_new(struct nouveau_channel *chan, bool sysmem,
-		  struct nouveau_fence **pfence)
+nouveau_fence_new(struct nouveau_fence **pfence)
 {
 	struct nouveau_fence *fence;
-	int ret = 0;
-
-	if (unlikely(!chan->fence))
-		return -ENODEV;
 
 	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
 	if (!fence)
 		return -ENOMEM;
 
-	ret = nouveau_fence_emit(fence, chan);
-	if (ret)
-		nouveau_fence_unref(&fence);
-
 	*pfence = fence;
-	return ret;
+	return 0;
 }
 
 static const char *nouveau_fence_get_get_driver_name(struct dma_fence *fence)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 0ca2bc85adf6..7c73c7c9834a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -17,8 +17,7 @@ struct nouveau_fence {
 	unsigned long timeout;
 };
 
-int  nouveau_fence_new(struct nouveau_channel *, bool sysmem,
-		       struct nouveau_fence **);
+int  nouveau_fence_new(struct nouveau_fence **);
 void nouveau_fence_unref(struct nouveau_fence **);
 
 int  nouveau_fence_emit(struct nouveau_fence *, struct nouveau_channel *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 4369c8dc8b5b..061cfd55217a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -867,8 +867,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		}
 	}
 
-	ret = nouveau_fence_new(chan, false, &fence);
+	ret = nouveau_fence_new(&fence);
+	if (!ret)
+		ret = nouveau_fence_emit(fence, chan);
 	if (ret) {
+		nouveau_fence_unref(&fence);
 		NV_PRINTK(err, cli, "error fencing pushbuf: %d\n", ret);
 		WIND_RING(chan);
 		goto out;
-- 
2.39.2


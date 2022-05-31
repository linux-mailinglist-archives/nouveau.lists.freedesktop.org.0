Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD70538E28
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401411125CC;
	Tue, 31 May 2022 10:00:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8C91125C5;
 Tue, 31 May 2022 10:00:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id y13so25606758eje.2;
 Tue, 31 May 2022 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TNC+q1HYAjRPp62MTH/zi2loKTLmxRGj7rz2onfHvYc=;
 b=GBXq9vHHCJxrvvL36ccyiGaBUxAA4gOuuAE6JJqw7rKR68K9hwr5XNyqXOEIIT7vcs
 b+n0Pi155O7ZJ3hNSKyRz9mXIkUEKm2lcFNblLxTflNcxgkeUjq/QrKdI4HYMHPMzWAq
 SVmk2ARrocIRZTeQ2RslzCLdsKehpXg+Kq0kTeKoNXvG6sD16XOQ01MvqTpq1vkjhPtq
 +sWJbuWYYHK+e5WSj+SIwpEX66Y+xGwye9J3sHcOAM1TU5DbXJA7e3WOh4GWP04ovYuJ
 BVp7Cx+40rXPVhuLagJwI31hssTpBLyHz/XRKyjdzt8EQGLbOfMOhG6RJdTATBNFmuK2
 0Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TNC+q1HYAjRPp62MTH/zi2loKTLmxRGj7rz2onfHvYc=;
 b=Q4WMxqwRFvNpRgiBJ+UcAiGx+qSBPnV5ocfZX+Hk5te6z316APLj1E+bGEvYLIlsq+
 10omascfPp0eW5nkjUEV6kchblgOuyGoYLyZG5wJdjbagy5ntzl5CHZjgJNpjUmwj9L+
 KC1Xj1tP/hkNXRXT59wI74w6uSF9Ife4KKI2XxxwQUN2M7wMel18w0APit4L0iWBt9VV
 MC8UBE8dmKA6LI3AT2QLAlnCsVPQ5Kv2pwBkrMhbD/diWVyO2HWbd+XOS0PnsosU9iJ4
 lPNUwAUCRD0zLX1AKLciwAK3jBEsDeDKhREolA+I30wwB6zdPXoAHN1CnHced/rurqRS
 utjg==
X-Gm-Message-State: AOAM531T2gohLIO8K98UP5loIRKPX3qGHcKELOzauNRy65m3kU/48wRZ
 8TcxfwCYx+h+JcotNqpreQI=
X-Google-Smtp-Source: ABdhPJw0gyeFnw57oxp0sq6bqgANIsrzObxRClwQk6Sv+DHCrMObVZ1M7XOYXmXPr5CJvAsoBP5qig==
X-Received: by 2002:a17:907:1b03:b0:6ff:78d4:c140 with SMTP id
 mp3-20020a1709071b0300b006ff78d4c140mr8861505ejc.554.1653991217575; 
 Tue, 31 May 2022 03:00:17 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 11:59:59 +0200
Message-Id: <20220531100007.174649-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 05/13] drm/gem: adjust per file OOM badness on
 handling buffers
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
Cc: andrey.grodzovsky@amd.com, hughd@google.com, viro@zeniv.linux.org.uk,
 daniel@ffwll.ch, alexander.deucher@amd.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Large amounts of VRAM are usually not CPU accessible, so they are not mapped
into the processes address space. But since the device drivers usually support
swapping buffers from VRAM to system memory we can still run into an out of
memory situation when userspace starts to allocate to much.

This patch gives the OOM killer another hint which process is
holding references to memory resources.

A GEM helper is provided and automatically used for all drivers using the
DEFINE_DRM_GEM_FOPS() and DEFINE_DRM_GEM_CMA_FOPS() macros.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/drm_file.c       | 19 +++++++++++++++++++
 drivers/gpu/drm/drm_gem.c        |  5 +++++
 include/drm/drm_file.h           |  9 +++++++++
 include/drm/drm_gem.h            |  1 +
 include/drm/drm_gem_cma_helper.h |  1 +
 5 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..1959a5b7029e 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -1049,3 +1049,22 @@ unsigned long drm_get_unmapped_area(struct file *file,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 EXPORT_SYMBOL_GPL(drm_get_unmapped_area);
 #endif /* CONFIG_MMU */
+
+
+/**
+ * drm_oom_badness() - get oom badness for struct drm_file
+ * @f: struct drm_file to get the badness from
+ *
+ * Return how many pages are allocated for this client.
+ */
+long drm_oom_badness(struct file *f)
+{
+
+	struct drm_file *file_priv = f->private_data;
+
+	if (file_priv)
+		return atomic_long_read(&file_priv->f_oom_badness);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_oom_badness);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index eb0c2d041f13..768b28b198cd 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -256,6 +256,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	drm_gem_remove_prime_handles(obj, file_priv);
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
+	atomic_long_sub(obj->size >> PAGE_SHIFT, &file_priv->f_oom_badness);
 	drm_gem_object_handle_put_unlocked(obj);
 
 	return 0;
@@ -291,6 +292,8 @@ drm_gem_handle_delete(struct drm_file *filp, u32 handle)
 	idr_remove(&filp->object_idr, handle);
 	spin_unlock(&filp->table_lock);
 
+	atomic_long_sub(obj->size >> PAGE_SHIFT, &filp->f_oom_badness);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_gem_handle_delete);
@@ -399,6 +402,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 	}
 
 	*handlep = handle;
+
+	atomic_long_add(obj->size >> PAGE_SHIFT, &file_priv->f_oom_badness);
 	return 0;
 
 err_revoke:
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index e0a73a1e2df7..5926766d79f0 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -366,6 +366,13 @@ struct drm_file {
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 	unsigned long lock_count; /* DRI1 legacy lock count */
 #endif
+
+	/**
+	 * @f_oom_badness:
+	 *
+	 * How many pages are allocated through this driver connection.
+	 */
+	atomic_long_t		f_oom_badness;
 };
 
 /**
@@ -430,4 +437,6 @@ unsigned long drm_get_unmapped_area(struct file *file,
 #endif /* CONFIG_MMU */
 
 
+long drm_oom_badness(struct file *f);
+
 #endif /* _DRM_FILE_H_ */
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9d7c61a122dc..0adf8c2f62e8 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -338,6 +338,7 @@ struct drm_gem_object {
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		.oom_badness	= drm_oom_badness,\
 	}
 
 void drm_gem_object_release(struct drm_gem_object *obj);
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index fbda4ce5d5fb..455ce1aa6d2c 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -273,6 +273,7 @@ unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		.oom_badness	= drm_oom_badness,\
 		DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
 	}
 
-- 
2.25.1


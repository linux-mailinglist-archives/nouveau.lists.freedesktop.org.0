Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B72A8C99
	for <lists+nouveau@lfdr.de>; Fri,  6 Nov 2020 03:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A92B6EDF7;
	Fri,  6 Nov 2020 02:17:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B856EDF7
 for <nouveau@lists.freedesktop.org>; Fri,  6 Nov 2020 02:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604629068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTTP77Binb8q6Myv+TECrFOkx25pYy2wpQfJisWb5cQ=;
 b=JTp9sAKWaDVIiWx4mYY6N6Q0rKdm161eLq+etOMysu6sxBJvLGzjnbpMo1pSH2KNY0oD9v
 DdM8JTRa3TS0DsZzSGYRRTqsHGp8sq3SfvfyHjnuIGzizZkDb1bT9zfJAKTS1+Xz4tdBQj
 Eu0yqf2NOUwqVqmucRhWwNtB3sY+Sb0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-YGHyO1naMfOEpRbRPVKcTw-1; Thu, 05 Nov 2020 21:17:45 -0500
X-MC-Unique: YGHyO1naMfOEpRbRPVKcTw-1
Received: by mail-qv1-f72.google.com with SMTP id x10so2184272qvo.22
 for <nouveau@lists.freedesktop.org>; Thu, 05 Nov 2020 18:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTTP77Binb8q6Myv+TECrFOkx25pYy2wpQfJisWb5cQ=;
 b=l7ybSt43jNzHfNX27G+Np6llyyzZe7SjTuP8EfS1yDd3UAtjVCSW2tS361gG8PBhJL
 c0KmoB/b2xtKiC0aDsChdukN/hlwxZpbfiz/QjMlaC1E9ANgLOpTnZY0YmK8OnYazCVK
 W5D8yKczjbw3YW05dSzCDbXmy3P6YW/M7/xQ7yTTsaz/TuOB5U2XuoOXg9Dck/cz7O+/
 ajvv/qYsrOxv1wkHUgnp9AiljOQ5NjeM3NWZI1C1j7sSy/O6rXPtcfB9swx2UGVvbKO0
 X7zmtu22oBUfzRq4LDqZyVK7o2KwBH8xeLiC+NC8PxaYkQEEnlV/QFYGCRxxDCzxZD8J
 S9qw==
X-Gm-Message-State: AOAM531NgmAJGa8nc8ghfQnKFs2k0lMFhcvWIAkKrOfOGRjlBnZaC1/d
 GeCk+ERhTDh6iHS3dHklRrhnyUNYr21NL8Br3OxPnBw57LQ+chS1ErMFu5F4iFzEd9qGITcwEsV
 7cv4FMkPpTGRTEhmfaF+s4e1ycQ==
X-Received: by 2002:a37:b342:: with SMTP id c63mr5354712qkf.146.1604629064605; 
 Thu, 05 Nov 2020 18:17:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywxxAwhVSFnT9J8jpLBEO4CY5W9W9Xz/Qxhz0ra1j3pitSYEK7KwYiLA2H5gQ5/94RyqMxyA==
X-Received: by 2002:a37:b342:: with SMTP id c63mr5354696qkf.146.1604629064392; 
 Thu, 05 Nov 2020 18:17:44 -0800 (PST)
Received: from xps13.jcline.org ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id q20sm2195301qtn.80.2020.11.05.18.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 18:17:43 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Thu,  5 Nov 2020 21:16:56 -0500
Message-Id: <20201106021656.40743-4-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106021656.40743-1-jcline@redhat.com>
References: <20201106021656.40743-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 3/3] drm/nouveau: begin documenting core nouveau
 structures
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Start on documentation for the Nouveau device structure and the NVIF
client structure it uses. This documentation is not complete as the
structures are non-trivial and I am not familiar with large portions of
them.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 67 +++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index cf6c33e52a5c..cf83d4bf3c6c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -90,8 +90,20 @@ enum nouveau_drm_handle {
 	NVDRM_NVSW    = 0x55550000,
 };
 
+/**
+ * struct nouveau_cli - A DRM-specific NVIF client.
+ *
+ * This encapsulates a NVIF client and is intended to be the sole interface
+ * between the DRM APIs and NVKM. An instance of this structure is allocated
+ * for each userspace client when they open the device file. Additionally,
+ * there are several allocated strictly for the kernel's use.
+ */
 struct nouveau_cli {
 	struct nvif_client base;
+
+	/**
+	 * @drm: A reference to the device that the client is associated with.
+	 */
 	struct nouveau_drm *drm;
 	struct mutex mutex;
 
@@ -101,6 +113,9 @@ struct nouveau_cli {
 	struct nouveau_vmm svm;
 	const struct nvif_mclass *mem;
 
+	/**
+	 * @head: The list entry for this client in the @drm device's list of clients.
+	 */
 	struct list_head head;
 	void *abi16;
 	struct list_head objects;
@@ -108,13 +123,36 @@ struct nouveau_cli {
 	char name[32];
 
 	struct work_struct work;
+
+	/**
+	 * @worker: List of pending &struct nouveau_cli_work associated with this client.
+	 */
 	struct list_head worker;
+
+	/**
+	 * @lock: Protects the @worker list. Additionally, this lock on the
+	 * @drm.master instance is used to serialize destruction of the @base
+	 * member in this structure, as well as the destruction of the &struct
+	 * nvif_mem embedded in &struct nouveau_mem instances.
+	 */
 	struct mutex lock;
 };
 
+/**
+ * struct nouveau_cli_work - A pending work item for an NVIF client.
+ */
 struct nouveau_cli_work {
 	void (*func)(struct nouveau_cli_work *);
+
+	/**
+	 * @cli: Reference to the NVIF client this work belongs to.
+	 */
 	struct nouveau_cli *cli;
+
+	/**
+	 * @head: The list entry for this work item in the &struct nouveau_cli
+	 * worker list.
+	 */
 	struct list_head head;
 
 	struct dma_fence *fence;
@@ -133,9 +171,32 @@ nouveau_cli(struct drm_file *fpriv)
 #include <nvif/object.h>
 #include <nvif/parent.h>
 
+/**
+ * struct nouveau_drm - The nouveau-specific device structure.
+ *
+ * This structure is allocated for a device when it is probed and keeps track
+ * of all the nouveau-specific device details. The lifetime of this structure
+ * is the same as the lifetime of a &struct drm_device and is managed by the
+ * DRM layer.
+ */
 struct nouveau_drm {
+	/**
+	 * @parent: Implementation of the interface required to use the NVIF_DEBUG
+	 * and NVIF_ERROR macros
+	 */
 	struct nvif_parent parent;
+
+	/**
+	 * @master: This NVIF client is used to initialize the NVIF driver and used
+	 * for TTM memory allocations. It is the root of the NVIF object tree.
+	 */
 	struct nouveau_cli master;
+
+	/**
+	 * @client: This NVIF client is used by the DRM layer to interact with
+	 * the NVKM layer for everything except TTM memory allocations. It, and
+	 * all other clients, are children of the primary (@master) client.
+	 */
 	struct nouveau_cli client;
 
 	/**
@@ -143,6 +204,12 @@ struct nouveau_drm {
 	 */
 	struct drm_device drm_dev;
 
+	/**
+	 * @clients: List of all &struct nouveau_cli allocated for userspace
+	 * associated with this DRM device. Clients are allocated when the DRM
+	 * file is opened and deallocated when the file is closed. This list is
+	 * protected by the mutex in @client.
+	 */
 	struct list_head clients;
 
 	u8 old_pm_cap;
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

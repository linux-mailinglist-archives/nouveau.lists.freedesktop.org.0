Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11975296F
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 19:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D95410E74F;
	Thu, 13 Jul 2023 17:05:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC0C10E746
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
 b=XEmPdclxkU5mOdQi0mm1Wi2MRvs0nmCiBa+asAaQeRzLK7bHlLWyATGhnzjO9HNupLMpyW
 Zce/mxO1E7rZoqtfDYEAKT9xi3Fe76tmHGkaVwByYTLpHmR4nvhYv4V64yVhT7ZlT19BK7
 XXm+xgou2KZsvnIpiz8BULdzEsO3WC0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-b9ugVMQMPweRLBW6fsAqdw-1; Thu, 13 Jul 2023 13:05:32 -0400
X-MC-Unique: b9ugVMQMPweRLBW6fsAqdw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-51e02395cf3so547340a12.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 10:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267930; x=1691859930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
 b=CDALFZAc7Mv/ewtgx8rqTKh3WvV0Ji6pBZYBvDB/ZAgArnbIwxqGSPdt/gwb3Bxhex
 fMLfPrRlCMIuaCMkXWe8X1uTOSQ7JrjQY6ZvDtfIpR7wdO/B2HB+tx+gz+p1d0h5zQ+c
 FDcgYSTfIcGaR8DzXWSYf1tsijwsSB4WiIHD/yZToDprkajQ5s1XCE8IJSAvHGiICryd
 TntCryoktl8Vdai9ybHQ2o0fUWl3dgCwfNF9Rocdbc0oW/83OSqWg/UhycJ7GcHW9IVw
 MhjwAtiQm1dtLb1ufmMEH8XKlU+bEDyu9bs76rUInILvu69JKnidJfmSnBbqshKq21XT
 24wA==
X-Gm-Message-State: ABy/qLblQieAVUEC72lgwqwZLnPn9bsgsWCJSB9w31/aztn4h8CyVKnD
 pIByueJzYmN4Tzxss+IEJCfuX1j47f7QZJN5eYuQbCDkp7rxc4u5tVERyQgX5f36rZr9loeq2ls
 wBzslbnOZPwMsq/WHd+9ZZ1iVDg==
X-Received: by 2002:aa7:c58c:0:b0:51e:f83:6de3 with SMTP id
 g12-20020aa7c58c000000b0051e0f836de3mr1913962edq.17.1689267930199; 
 Thu, 13 Jul 2023 10:05:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEODGUrLe1vVHHn6APTyXlr4bMpDbQMD9jG5zlz4/cZihCoEP2XZYalZE9CagIk64p3fS6wOA==
X-Received: by 2002:aa7:c58c:0:b0:51e:f83:6de3 with SMTP id
 g12-20020aa7c58c000000b0051e0f836de3mr1913942edq.17.1689267929984; 
 Thu, 13 Jul 2023 10:05:29 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 n7-20020aa7c447000000b0051e22660835sm4557121edr.46.2023.07.13.10.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:05:29 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu, 13 Jul 2023 19:04:08 +0200
Message-ID: <20230713170429.2964-14-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v7 13/13] drm/nouveau: debugfs: implement
 DRM GPU VA debugfs
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

Provide the driver indirection iterating over all DRM GPU VA spaces to
enable the common 'gpuvas' debugfs file for dumping DRM GPU VA spaces.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 99d022a91afc..053f703f2f68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -203,6 +203,44 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
 	return single_open(file, nouveau_debugfs_pstate_get, inode->i_private);
 }
 
+static void
+nouveau_debugfs_gpuva_regions(struct seq_file *m, struct nouveau_uvmm *uvmm)
+{
+	MA_STATE(mas, &uvmm->region_mt, 0, 0);
+	struct nouveau_uvma_region *reg;
+
+	seq_puts  (m, " VA regions  | start              | range              | end                \n");
+	seq_puts  (m, "----------------------------------------------------------------------------\n");
+	mas_for_each(&mas, reg, ULONG_MAX)
+		seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx\n",
+			   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range);
+}
+
+static int
+nouveau_debugfs_gpuva(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct nouveau_cli *cli;
+
+	mutex_lock(&drm->clients_lock);
+	list_for_each_entry(cli, &drm->clients, head) {
+		struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+
+		if (!uvmm)
+			continue;
+
+		nouveau_uvmm_lock(uvmm);
+		drm_debugfs_gpuva_info(m, &uvmm->umgr);
+		seq_puts(m, "\n");
+		nouveau_debugfs_gpuva_regions(m, uvmm);
+		nouveau_uvmm_unlock(uvmm);
+	}
+	mutex_unlock(&drm->clients_lock);
+
+	return 0;
+}
+
 static const struct file_operations nouveau_pstate_fops = {
 	.owner = THIS_MODULE,
 	.open = nouveau_debugfs_pstate_open,
@@ -214,6 +252,7 @@ static const struct file_operations nouveau_pstate_fops = {
 static struct drm_info_list nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
+	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.41.0


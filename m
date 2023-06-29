Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CE743081
	for <lists+nouveau@lfdr.de>; Fri, 30 Jun 2023 00:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8523910E3FD;
	Thu, 29 Jun 2023 22:28:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7613D10E3FD
 for <nouveau@lists.freedesktop.org>; Thu, 29 Jun 2023 22:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688077689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
 b=Wf+vNIJ25igAYmYBhkM1Rg3ZNO7KLXsqylP6/e8b4maKfmOOTIEV2aySC/aVzXjy8RZWfk
 S5S6jdx1JvSgDnIIc/V3DioaqjqBnJk4Z/jv7l3EjvAkgEsO2Bm0flK6Ro6TJ/z9KWjw7u
 luQIuequ08xq5i+4PZrPxTtJJCJ2uxI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-mlG9RV6PP4i5i4bK_Dczww-1; Thu, 29 Jun 2023 18:28:07 -0400
X-MC-Unique: mlG9RV6PP4i5i4bK_Dczww-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f9bef91aa4so7208775e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 29 Jun 2023 15:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688077671; x=1690669671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
 b=XFiAoMGvmI2MfA8HuikMvmM/PxL0WaYYarYadmZGgksfrqeadW0OJAkkLG0gGYsfCb
 nF+4EXVTJfG+LYHDInPI7UWPtITzZASLCWRwWH8Ojz+qptXDAYTNdjuFIy5sDrsAMf9P
 L4foP92smqUt/d7t1SjHsHOsI2wu1HCyPi/Sa1t6tXU+XAkjRzJ5gUFGcviaIdwWFM6B
 XEKRkwMdJeHoQm3IJbnS/TdR5xmS2v2HDoAVbFYGcL22wx7FFLJ9ZHZDZkZ731XTMs+i
 Lm3PXlly+y6BZgIWbjFT4L3f7N3KuV3RNl+FYijG0sAUEoIszzvQsvA7pMUgKaWoM53i
 Nm1w==
X-Gm-Message-State: AC+VfDzYQehpWwKxKlPzP1m4xgS9ELq0elCKJvEbBPv/3THDnhIRZC+e
 cxCfL8tyw+Uy+Lz9GNmECOf23Bl75sAbjnvHC4tGN6UsgAF0TmN335D/uJNfCO/gWPUI3rJMoiE
 DDhV0asRioasltiQ1A/KjSIEWFg==
X-Received: by 2002:a1c:7918:0:b0:3fa:abd8:fcc4 with SMTP id
 l24-20020a1c7918000000b003faabd8fcc4mr550322wme.35.1688077671222; 
 Thu, 29 Jun 2023 15:27:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Bxj2O4VX+ANE4bPO+hAqfIWGrOSWlNPHwSQm4+DaMqibvET6swHf0UksZ5J5oprSJ2UE6LQ==
X-Received: by 2002:a1c:7918:0:b0:3fa:abd8:fcc4 with SMTP id
 l24-20020a1c7918000000b003faabd8fcc4mr550301wme.35.1688077671037; 
 Thu, 29 Jun 2023 15:27:51 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003f9b0f640b1sm17419090wmc.22.2023.06.29.15.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 15:27:50 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 30 Jun 2023 00:25:29 +0200
Message-ID: <20230629222651.3196-14-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v6 13/13] drm/nouveau: debugfs: implement
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


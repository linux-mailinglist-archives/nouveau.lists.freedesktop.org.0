Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0137360C5
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 02:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5331F10E252;
	Tue, 20 Jun 2023 00:43:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6216910E165
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jun 2023 00:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687221817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7jCgjA/GeF+vfePBjhGpS1KJtr0QbtMbF11c3DSw0c=;
 b=SZ7y/s5YQio4V4CSV0NOJhEVJnIQ/7mTbqTlqlj5ZfnfXEAyysY2yO4ZrHP804GZM9Jxiw
 RPcX0UMjPdBIXGhl8DO1AMGhZZinOacJjHAoU9lBvnAXFECu2oWG3JjPhR3e5Jp52vR5iT
 jUuDLMTzbNbA4YTeD2omNGTAGqEYzHY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-pLvpY3PiN5OEyz4SUKjAnw-1; Mon, 19 Jun 2023 20:43:36 -0400
X-MC-Unique: pLvpY3PiN5OEyz4SUKjAnw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-977e6c94186so263914466b.1
 for <nouveau@lists.freedesktop.org>; Mon, 19 Jun 2023 17:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687221815; x=1689813815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7jCgjA/GeF+vfePBjhGpS1KJtr0QbtMbF11c3DSw0c=;
 b=Y1ksoHketPrr1Xr8i4CWaFqTW5mGBc6zfkIBIzfjiOVVnfS1wrqCFu30S0bYHBnTSE
 hpOwZe/EPHqJouAuIwJH4Z+BRzx6XDkk/87NAupW8n1FIykNPQERhsbewGsc1BA0ZZrA
 ZNb50wy4ggT/Qtnd+EPwkGMDojO+k+Bg6GHoUSxi8Cb8cAPXy1ka6n3KGQtWcq9iNagG
 IXZsASQsvNftTbG9nug7gStnwhuSF0kNI6cog3pedxPaLvPiyKLFd/7Wa5OJmbjFlRMZ
 AvphQ/IqeTmfDJ/lHlh8V80R6JjQoyuosCzB3zZ+kCPeSJPNpLqds8YjK25k0uk/CXGQ
 ebew==
X-Gm-Message-State: AC+VfDwixKZKn8KkGFkvPtzNH9wVwIBGDCZwK5P080zjg3Kx501hcM2n
 TCYVWvRRFvb3RQHP1GATVEsN0EBqlXPbLZ/QGuFyQJ/v0gUAX+JtsLY4HFTZR5v3+FhcHzrsGkD
 NIf7wlGwlMhyoK/C4M8gzAmR63w==
X-Received: by 2002:a17:907:16a2:b0:977:4b68:bf2 with SMTP id
 hc34-20020a17090716a200b009774b680bf2mr9258868ejc.54.1687221815366; 
 Mon, 19 Jun 2023 17:43:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5q+6yQrxXHN5sb4rpMGvKSpAc2GEIwMGMC//JzmRysYg1+0tvGxqivxz5K0CNgMJjmvWb+Bw==
X-Received: by 2002:a17:907:16a2:b0:977:4b68:bf2 with SMTP id
 hc34-20020a17090716a200b009774b680bf2mr9258842ejc.54.1687221815070; 
 Mon, 19 Jun 2023 17:43:35 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bk6-20020a170906b0c600b0098748422178sm393480ejb.56.2023.06.19.17.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:43:34 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue, 20 Jun 2023 02:42:17 +0200
Message-Id: <20230620004217.4700-15-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v5 14/14] drm/nouveau: debugfs: implement
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
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
2.40.1


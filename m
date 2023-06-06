Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A05724FC1
	for <lists+nouveau@lfdr.de>; Wed,  7 Jun 2023 00:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4679E10E407;
	Tue,  6 Jun 2023 22:32:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2235010E407
 for <nouveau@lists.freedesktop.org>; Tue,  6 Jun 2023 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686090763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7jCgjA/GeF+vfePBjhGpS1KJtr0QbtMbF11c3DSw0c=;
 b=Od+T0EZzetNLyVAvRwrJg3dU84L/GknpqJcH7tAbtdpKL4vPWZV3LhQaSeqVITg8xYToi+
 t9iSnuHooxKJyzT6e/Pb+oGTyx+YpWincSoVruLJ0cLV8WJnRTxkIY6Dg/FAtD8CVoKyYB
 HHP4ZqOr8llvHA19B0/tZ6jsK2pCFiA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-gRL1CXl9PJit-11xwYftdA-1; Tue, 06 Jun 2023 18:32:41 -0400
X-MC-Unique: gRL1CXl9PJit-11xwYftdA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-97467e06580so486659366b.1
 for <nouveau@lists.freedesktop.org>; Tue, 06 Jun 2023 15:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686090759; x=1688682759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7jCgjA/GeF+vfePBjhGpS1KJtr0QbtMbF11c3DSw0c=;
 b=N2w2SzQ9P+6xPgMA8rVdeeXp4wq1YObmlCKg4FVzlWExGAL9zP+yByEqUGJWPniU5d
 5dV+gtXmmL/xLg+zvb08ljz12X3/DBtjBvx+b2G+SEXYWrwl/Y4zBulObsreJb5yx9jU
 efNoehMXmQ69AUZSUVonl5rnwIxXn1V0bawmFpGOQ9W0g3Mqez9CN4dCOG9Z1bwT4pGL
 cSDpgDuOerEwun/VQhLR9HG2hScGraojyC7UsKZLWXk0pUSgAooKgx6ag5LzxvPZrB1P
 1jTccQ5BRmkjcFQ2xI4FNtxRf0czaoRtz5BPp3rOuSQ4JSI1KHuC1R0VxemlGORvSRE1
 vN0w==
X-Gm-Message-State: AC+VfDwcWeeL9OIjWvhWU6XKKfs5CKidXieG08US0IjLg4Lag7ZHhTN/
 64p0lomTSE4SqCBAmdYk4V9OoTSvbO9+SC+Yp9svl4caa1q3m5x2HXUbAwD5EW0F5gy0Tdx325l
 dXkok8Efg8cNyiUEyAdx4tj806w==
X-Received: by 2002:a17:907:961c:b0:96f:f046:9a92 with SMTP id
 gb28-20020a170907961c00b0096ff0469a92mr4529859ejc.37.1686090759329; 
 Tue, 06 Jun 2023 15:32:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qGlpc03YEG/CcUcMQBwrK3ZBv0I8EcaoURRio7MIi2slO/uki0F3KmJyflgj5wBFLEUnEiA==
X-Received: by 2002:a17:907:961c:b0:96f:f046:9a92 with SMTP id
 gb28-20020a170907961c00b0096ff0469a92mr4529834ejc.37.1686090759142; 
 Tue, 06 Jun 2023 15:32:39 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a1709063b0900b00969e9fef151sm6051554ejf.97.2023.06.06.15.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:32:38 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Wed,  7 Jun 2023 00:31:30 +0200
Message-Id: <20230606223130.6132-15-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v4 14/14] drm/nouveau: debugfs: implement
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


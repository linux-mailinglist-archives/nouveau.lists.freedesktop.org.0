Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6B57707E4
	for <lists+nouveau@lfdr.de>; Fri,  4 Aug 2023 20:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E06C10E0F1;
	Fri,  4 Aug 2023 18:26:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CD410E760
 for <nouveau@lists.freedesktop.org>; Fri,  4 Aug 2023 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fdvxi7T0QQZA7DILvp9xTFYkELtQTf+gq8ZCaeS7cjM=;
 b=cJ1tDxPray6QsdAqlzwmbjxUoDZRwuMam6cTRi0Xx2yqXHlFC3dMYZ0jzHXteHRUn0NlQn
 VdIBQT8L/ohDJOGOEYVwgoCP0a98RTiK6eKAT5TU8+vo1FerVb0olX1lGomODQ8QRXSECs
 SYcqRbI6FPcwyJuZHdU4zAdDS9QsdvQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-qJDp4vleOtC9SvHUgolXUg-1; Fri, 04 Aug 2023 14:25:08 -0400
X-MC-Unique: qJDp4vleOtC9SvHUgolXUg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe4aaa6dacso2368319e87.2
 for <nouveau@lists.freedesktop.org>; Fri, 04 Aug 2023 11:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173507; x=1691778307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fdvxi7T0QQZA7DILvp9xTFYkELtQTf+gq8ZCaeS7cjM=;
 b=dBUjJBBs0PnK1iQ+IvTKbwL0VoqNVsv59xexzz9qA/AKXtWtuGhe0nsyK61JuS8WL5
 3YvFIvuwPcJQg67aZuP+kcOY/ROJKlv4a/BjnlSkpbwsr6OHs0/YNQVOeUsU1+S+JjF5
 uGPP2nvmrAREAF2rUqXF8Bt5t9RLy3uMk/EzSnbsk6u0InDgG4nVOa/C6xcJ8Lxvyaoj
 ngAUF6IGDxiEN5ZHdeIZrdsxcJVRUxjQutcuJ+uxsU5RPbmtZN3ew8vPwwy8jAePd/Zn
 /ADeUU/2m8MugNpjKrmP4QnNNF1SihUnay+fb3B2UkmTS0cAfnB17kmd0AnuqSu8B1yF
 uuYw==
X-Gm-Message-State: AOJu0YzEfcaZUbCntPlypzT2eZjpQ6zlsPRc3Fyre1JJ5e/axYCVG6Bv
 KoFfUUOl4Yeq3ZIFrDBdN0g1iMen93uQMGJXBD9OGYb/VwrUWBmZCViVKr61+hzv+LzlEqEuE0d
 G+d+u6LQv6sIYNkxuUrt7wvSKJw==
X-Received: by 2002:ac2:4e8c:0:b0:4fb:7666:3bbf with SMTP id
 o12-20020ac24e8c000000b004fb76663bbfmr1856022lfr.26.1691173507139; 
 Fri, 04 Aug 2023 11:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRJJOgbOvJzg5RaLcCj6w1yIpUQozrGAJ91MHogx2h+oZXIcVyODrY21YmNH8oxYAKETecWA==
X-Received: by 2002:ac2:4e8c:0:b0:4fb:7666:3bbf with SMTP id
 o12-20020ac24e8c000000b004fb76663bbfmr1856008lfr.26.1691173506953; 
 Fri, 04 Aug 2023 11:25:06 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a056402064f00b00523228f615dsm486979edx.88.2023.08.04.11.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:25:06 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Fri,  4 Aug 2023 20:23:52 +0200
Message-ID: <20230804182406.5222-13-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v10 12/12] drm/nouveau: debugfs:
 implement DRM GPU VA debugfs
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

Provide the driver indirection iterating over all DRM GPU VA spaces to
enable the common 'gpuvas' debugfs file for dumping DRM GPU VA spaces.

Reviewed-by: Dave Airlie <airlied@redhat.com>
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


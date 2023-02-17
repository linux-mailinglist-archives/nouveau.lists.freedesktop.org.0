Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17C69AD06
	for <lists+nouveau@lfdr.de>; Fri, 17 Feb 2023 14:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A9510F000;
	Fri, 17 Feb 2023 13:49:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B2510EFF6
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kGtWB8otfeqdskrUgWVgT1wxpbtVBJjmwPhyWCdCJZU=;
 b=TbTGVs2fcTC3L77jAad5aHjgRNbeevzzA+n+Tl1OpgzeIW15dwtCoxD7d7pfDVDMc3sSWJ
 xTLMaBXUWCAxOmWnr+FhMu/TGxUVfpionUlKWbmrScT/sSrHJdQvp6u5rnRlFqd6NgBHvb
 x8biDxz4KXGA/bnWPFYUO5WOM8wM4Yk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-coWCKiF_OX2JX-2vvQ8edQ-1; Fri, 17 Feb 2023 08:49:07 -0500
X-MC-Unique: coWCKiF_OX2JX-2vvQ8edQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x14-20020a05640226ce00b004acc4f8aa3fso1828403edd.3
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 05:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kGtWB8otfeqdskrUgWVgT1wxpbtVBJjmwPhyWCdCJZU=;
 b=XSR6A6a6Lp05taQtXTr72WjjbnRV7+YYwrrjuLeZ9CgC9e4oCxU5qNGD8/eeKI+iAM
 amGxwSaUvqHPVdNcXZAm3DWzfFSZWuI73hPObAv0ei3kTrrRNH9ECSZWZ/xXpinTE5kc
 Zl3jkhc51jeiRWlBwkSFARdNa/DR3G/9yyOUhmPKQUVGSuaPr2urB3GXedHeZBwF0XyL
 uCUJjH8sKbU2Ub78in3wtWC5RyQlhk4Bd6xEiw8AXgCgXCEFSvFPU5WFZUuJp4GIK/34
 e1V/MU39jbt9SfnKkZUA9JqRgjtxLwQBkxQFxUKYJXWIrJMLUiyPWy9jRaAOAsWr9xdg
 2lwA==
X-Gm-Message-State: AO0yUKV3FfEL7LEkq181kdtm9tUSJLN+sgrshHE3IN+XVcL7/Wtmf9Ax
 Zo9DxVbulLu5zam+lv+HtsGfyArX2ezNKEZn/GCsa/fm5EcIsamPQ3moBuGJch9IJXsu9wUMBB3
 wAXF+uQwQN5LxpqQR3EcDwNijPQ==
X-Received: by 2002:a17:907:a508:b0:8af:54d0:181d with SMTP id
 vr8-20020a170907a50800b008af54d0181dmr10190323ejc.35.1676641746802; 
 Fri, 17 Feb 2023 05:49:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9vd30xGC9ziQLVSo9CH8dMbfP5K/22/ulKcpKmlY9Tzn88e5jN0KhVGuEzFC+li22riHt+gQ==
X-Received: by 2002:a17:907:a508:b0:8af:54d0:181d with SMTP id
 vr8-20020a170907a50800b008af54d0181dmr10190298ejc.35.1676641746605; 
 Fri, 17 Feb 2023 05:49:06 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a1709060b5a00b008b1787ce722sm1516323ejg.152.2023.02.17.05.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:49:06 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 17 Feb 2023 14:48:20 +0100
Message-Id: <20230217134820.14672-11-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v2 16/16] drm/nouveau: debugfs: implement
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
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 2a36d1ca8fda..7f6ccc5d1d86 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -202,6 +202,29 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
 	return single_open(file, nouveau_debugfs_pstate_get, inode->i_private);
 }
 
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
@@ -213,6 +236,7 @@ static const struct file_operations nouveau_pstate_fops = {
 static struct drm_info_list nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
+	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.39.1


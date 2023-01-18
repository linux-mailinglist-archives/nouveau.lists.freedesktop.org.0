Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1C46713B2
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 07:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C5510E6A7;
	Wed, 18 Jan 2023 06:14:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B03D10E69E
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHl/4diKtyJnEE11WWdgE7GtYAgDLsei1RwmYtZIKRg=;
 b=H0u23UQbGRpNRrttuq8XADBuYqACGVoMRuK4rNrD8o4G/uayo4pv9pn73VXR/DtqqFruWx
 vs066pqRkxxSb3MgPFdGbPARTcSrdl4CrYITl9LXKlZYi4MmsGM0Hud97kQwAfj3CM4O9n
 wl5ml+kBpNoIKOL6IKDq2M5JxP4M2gY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-Dwg72OtkMrKnEjfnswWqTQ-1; Wed, 18 Jan 2023 01:14:23 -0500
X-MC-Unique: Dwg72OtkMrKnEjfnswWqTQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 nd38-20020a17090762a600b00871ff52c6b5so3696424ejc.0
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jan 2023 22:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHl/4diKtyJnEE11WWdgE7GtYAgDLsei1RwmYtZIKRg=;
 b=BiIoJ2QhoyE7WtxDbJNARThaU3GqpnHxM60s7kJmUB8rQ0frCr7qt/bAsohc9yYjCE
 aEIZuMaBQRh9uIRx969ovERxnOpxgD+1ZMWDWVzMpQKDZLkHisba5zaDzwGQIUC7+0a7
 +7hfemvwSMH5aPbPKwNNNXZO0wJ86xUsEA4nsQJy+P6/W2trDvmLEu7dGxPnJj2XxGyN
 dsMe0b2BYcK89Jiwjx/4r2a1oyIDFkR5qbOu06zhtmsVzDgAwOPEr+vnu9qJvjxlFfj5
 j0EGEOF2W8adG7NlQsUZH/yHm13z5cr+waGkqoj/r5jvnwjGnM4ykAoMmUqfLJoiS/oV
 ccIQ==
X-Gm-Message-State: AFqh2krs/pgu7kkdZntVCQRTzMWuaNSXlzuLs0tmyp+0UeMvE49j4wrz
 XnfyNhgW1hRupHahEEsBYw17Vv1sIQrfQpT0DiuZD/QkbHZ9Iwz456hWeKiIVl6x30KugzHZecx
 wxFx2ZP5eMOif/g7bxMVYi85gPw==
X-Received: by 2002:aa7:c1ce:0:b0:49e:89e:3b36 with SMTP id
 d14-20020aa7c1ce000000b0049e089e3b36mr5877841edp.30.1674022462952; 
 Tue, 17 Jan 2023 22:14:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRQZOK3N/r5iyFAQ3K40aM3jSUaK6Mlg89vmZUZhLYBBDqIPzyzq48oNYdtZTi8SPf5PDyyg==
X-Received: by 2002:aa7:c1ce:0:b0:49e:89e:3b36 with SMTP id
 d14-20020aa7c1ce000000b0049e089e3b36mr5877825edp.30.1674022462771; 
 Tue, 17 Jan 2023 22:14:22 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709061da200b0083f91a32131sm14105071ejh.0.2023.01.17.22.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:22 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Date: Wed, 18 Jan 2023 07:12:56 +0100
Message-Id: <20230118061256.2689-15-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next 14/14] drm/nouveau: debugfs: implement
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
2.39.0


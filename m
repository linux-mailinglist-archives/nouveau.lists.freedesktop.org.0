Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003CCBAB0F
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FD610EA33;
	Sat, 13 Dec 2025 12:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=listout.xyz header.i=@listout.xyz header.b="VRmykVuq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Sat, 16 Aug 2025 13:22:01 UTC
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C1F10E070
 for <nouveau@lists.freedesktop.org>; Sat, 16 Aug 2025 13:22:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c3zy25bbMz9sRc;
 Sat, 16 Aug 2025 15:16:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
 t=1755350170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8c1b4qS5pxB1q6IZoaYNIJrFhGiy7HPpd/rk/q0+7Cs=;
 b=VRmykVuqCn+QV1XigzyQizNVyd5inkbvOF7YDzz5Zv9YCRFWdHf9EvMBgvkYUgmAiLGl8G
 sC6pJpJjubpnm58LMADUmN1e6rpK77BviEK3VZawQ20h5uAIZxSuR8+L2zupANwSbtENZN
 +iVNVyKTESrLqW6lpKc09PABQjczFmGhshlB/ryGO3xQqBARNwClQqj51rgLMpiwsPYSkH
 ENr0R0ZR/qsu/q/ByD/PbEDqDyhcCraj94b6RYjo9734a7wDsR2iyObJK6Nt3PEvyHtPLd
 U3R50K35L/yZ/Q0fMBPv2EV1V4gHIQwZfG/dlzoPIzcl6tZUFnpf+QGHlh8Ymg==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=listout@listout.xyz
From: Brahmajit Das <listout@listout.xyz>
To: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: use new debugfs device-centered functions
Date: Sat, 16 Aug 2025 18:45:57 +0530
Message-ID: <20250816131557.4728-1-listout@listout.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4c3zy25bbMz9sRc
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:44 +0000
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index c7869a639bef..e14b19d4a000 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -249,7 +249,7 @@ static const struct file_operations nouveau_pstate_fops = {
 	.release = single_release,
 };
 
-static struct drm_info_list nouveau_debugfs_list[] = {
+static struct drm_debugfs_info nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
 	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
@@ -277,9 +277,8 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 				    nouveau_debugfs_files[i].fops);
 	}
 
-	drm_debugfs_create_files(nouveau_debugfs_list,
-				 NOUVEAU_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, nouveau_debugfs_list,
+			      NOUVEAU_DEBUGFS_ENTRIES);
 
 	/* Set the size of the vbios since we know it, and it's confusing to
 	 * userspace if it wants to seek() but the file has a length of 0
-- 
2.50.1


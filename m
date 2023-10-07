Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B997BD4DB
	for <lists+nouveau@lfdr.de>; Mon,  9 Oct 2023 10:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0FC10E222;
	Mon,  9 Oct 2023 08:05:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 933 seconds by postgrey-1.36 at gabe;
 Sat, 07 Oct 2023 03:39:52 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6384E10E562
 for <nouveau@lists.freedesktop.org>; Sat,  7 Oct 2023 03:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7aZx2
 QKxrK4aACi0XwiI3PbFPdSP9h54OxsoE6ZvLhw=; b=I3nu3INgoTCiVl0F60AUk
 qx0F2E6Iy+qkt6b+b3oBnq/6petdfTX+AxsOC0Hu9GVeisSrCke64IBtARnVNQxU
 kL2pXVtMaNQKjPmS7XFKA3EU56Ud0BMDxYlVElZ+VkDi1L5r461qLJ5BCsdejvaQ
 epwUD1N/SwehPkz5pmhLpg=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wCnnYRGzyBlPFAgEA--.50459S4;
 Sat, 07 Oct 2023 11:24:00 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org, tzimmermann@suse.de,
 mripard@kernel.org, jani.nikula@intel.com, make_ruc2021@163.com
Date: Sat,  7 Oct 2023 11:23:49 +0800
Message-Id: <20231007032349.3997387-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnnYRGzyBlPFAgEA--.50459S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1rZr4fAF45tF47AF4Dtwb_yoWfArcEkr
 y8Zr97Gr17ua1vyr4DAw1xAr9Ikw4Uua1Iy3Z2gFy0yF9rJrn0qry7K34rXFyUuFy8WFyD
 JanrZw15KrnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRK6wZ7UUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbivhACC1ZcjAJZEgAAso
X-Mailman-Approved-At: Mon, 09 Oct 2023 08:05:46 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/dispnv04: fix a possible null pointer
 dereference
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In nv17_tv_get_ld_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference
on failure of drm_mode_duplicate(). Add a check to avoid npd.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 670c9739e5e1..4a08e61f3336 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -209,6 +209,8 @@ static int nv17_tv_get_ld_modes(struct drm_encoder *encoder,
 		struct drm_display_mode *mode;
 
 		mode = drm_mode_duplicate(encoder->dev, tv_mode);
+		if (!mode)
+			continue;
 
 		mode->clock = tv_norm->tv_enc_mode.vrefresh *
 			mode->htotal / 1000 *
-- 
2.37.2


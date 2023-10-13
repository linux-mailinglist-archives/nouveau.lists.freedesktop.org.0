Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001817C7B35
	for <lists+nouveau@lfdr.de>; Fri, 13 Oct 2023 03:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BEE10E580;
	Fri, 13 Oct 2023 01:35:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 929 seconds by postgrey-1.36 at gabe;
 Fri, 13 Oct 2023 01:35:53 UTC
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 70B8610E580
 for <nouveau@lists.freedesktop.org>; Fri, 13 Oct 2023 01:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aLj4B
 qY2YBYcmIcxL988YnyhrGGYNyKmp6Yo5wsu3R0=; b=k02fwX3vSjsWETELM6crX
 ZMmYLuGEkbZoN087Yix4cq1B3lVzOf6oKzAwgmnFEMRyMDfYZGkXf4Lkhac1HCg6
 sx9Yu7j6d1TbC1MGVYpwIGXgHA0Iq3CUKQuVEt79MjG4fdj6AZkwCy7oO5rg7Wpo
 tpOWdUA70P26mGaC5Od4ZM=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wD3_1P7mihlaruYAQ--.37582S4;
 Fri, 13 Oct 2023 09:18:59 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, noralf@tronnes.org,
 mripard@kernel.org, jani.nikula@intel.com, make_ruc2021@163.com
Date: Fri, 13 Oct 2023 09:18:50 +0800
Message-Id: <20231013011850.103967-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_1P7mihlaruYAQ--.37582S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7JrykAryftw43ur1ruF17Jrb_yoW8JF1fpF
 4xGFyYvr1DJFykKa40y3WDWFWY9a1kKFWvkw1ak39I93Z0yr1qqryDAr98Wry7JFW5GFy3
 trn3Ja4qgr18Zr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziTGQkUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFQIHC2B9oe1JLgAGsr
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

In nv17_tv_get_hd_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference on
failure of drm_mode_duplicate(). The same applies to drm_cvt_mode().
Add a check to avoid null pointer dereference.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 670c9739e5e1..9c3dc9a5bb46 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -258,6 +258,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
 		if (modes[i].hdisplay == output_mode->hdisplay &&
 		    modes[i].vdisplay == output_mode->vdisplay) {
 			mode = drm_mode_duplicate(encoder->dev, output_mode);
+			if (!mode)
+				continue;
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		} else {
@@ -265,6 +267,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
 					    modes[i].vdisplay, 60, false,
 					    (output_mode->flags &
 					     DRM_MODE_FLAG_INTERLACE), false);
+			if (!mode)
+				continue;
 		}
 
 		/* CVT modes are sometimes unsuitable... */
-- 
2.37.2


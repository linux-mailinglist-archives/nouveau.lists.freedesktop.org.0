Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40589D2C0
	for <lists+nouveau@lfdr.de>; Tue,  9 Apr 2024 08:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91E61127CD;
	Tue,  9 Apr 2024 06:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=kernel-space.org header.i=@kernel-space.org header.b="NbcnfOTE";
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="qtk77lFA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Tue, 09 Apr 2024 06:56:13 UTC
Received: from mail.kernel-space.org (mail.kernel-space.org [195.201.34.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879211127CD
 for <nouveau@lists.freedesktop.org>; Tue,  9 Apr 2024 06:56:12 +0000 (UTC)
Received: from kernel-space.org (localhost [127.0.0.1])
 by kernel-space.org (OpenSMTPD) with ESMTP id 871f8dbb;
 Tue, 9 Apr 2024 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=s1; bh=oAGS8rcuwRlL/nTk+kByirAne3s
 =; b=NbcnfOTEwNDEtx1HHsCKcRdt9VXrQR87A3oSDi5vyh8BBRrZR/byxLJ6e54
 KX4Sr9dpH/zOKgm+hpC3aGjyvn7KabAjr3u3d2tJSDN21DQ6PyXA0w7h6kviQ8Ml
 T8O7TZfld1XNkzYedTNQDZOP40w2A27/SYQwdUrUI/BFtdFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=from:to
 :cc:subject:date:message-id:mime-version
 :content-transfer-encoding; q=dns; s=s1; b=uqn5CqoLXSGzdsoMHBxiA
 UV2ah19emr5mFJgAQU03CesMRMpJ75Dj9q7XpEv4lv6NYPU7ZDTkGXuQFfLx3LSE
 eiWdmcsjJhO/JHcMUl2ywLm1aRNrsZ1g/9d9q/fIm+PPX8B2i/XiHrY5+Ma3Cv7Z
 5iK/Fmif93B5DnD+o5H7V0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1712645373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=V4OPancPGXm0rmhobjyoKx5ofm8GtP00Jheia9SNrnQ=;
 b=qtk77lFAC2wwxVC6tp86hsz4wseAuOmisdvv2EzmjWSMr/6shbXYBPwEG75Kwj/UTL7h9z
 gCU6rSTnUnA7bCv4qI26+TG9tqX5Reb8qkvjFoWYkxwsa3jRv65Zqt8F5YnseD/GH4ecab
 LS7OSsRAPjZ0Jnnt29SzAQHn5Tmpe7A=
Received: from localhost.localdomain
 (host-87-8-237-241.retail.telecomitalia.it [87.8.237.241])
 by kernel-space.org (OpenSMTPD) with ESMTPSA id 4a4a364a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 9 Apr 2024 06:49:33 +0000 (UTC)
From: Angelo Dureghello <angelo@kernel-space.org>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 nouveau@lists.freedesktop.org
Cc: drm-devel@lists.freedesktop.org,
 Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH] drm/nouveau/disp: add backlight for ada lovelace
Date: Tue,  9 Apr 2024 08:48:28 +0200
Message-ID: <20240409064828.2862053-1-angelo@kernel-space.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add working backlight for "ada lovelace" missing case.

The nvif method is actually not working for this chipset so
used the drm apis. Also, by dpcd, drm layer is calculating a
max brightness of 255, but to get a real correct max brightnes
the maximum must be multiplied by a factor of 16.

Tested to work properly in Legion Lenovo Pro 5

Lenovo Legion 5 Pro 16ARX8
Bios ver LPCN49WW
	 LPEC49WW
SN PF4T63AZ
Nvidia RTX4060 MaxQ/Mobile rev a1 (ADA LOVELACE AD107M)
AMD Ryzen 9 7945HX + Radeon

and wayland.

Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c     |  2 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 51 +++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 266826eac4a7..50a41af6550c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3767,6 +3767,8 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 		return -ENODEV;
 	}
 
+	printk("%s() pn %d\n", __func__, pn);
+
 	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
 	bl->max = (1 << pn) - 1;
 	if (!driver_pwm_freq_hz)
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d47442125fa1..1e080f6fa902 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -286,6 +286,53 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 	return 0;
 }
 
+static int
+nv19x_backlight_init(struct nouveau_backlight *bl,
+		     struct nouveau_connector *nv_conn,
+		     struct nouveau_encoder *nv_encoder,
+		     struct backlight_properties *props,
+		     const struct backlight_ops **ops)
+{
+	int ret;
+	u16 current_level;
+	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
+	u8 current_mode;
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+
+	/* nvif path seems not working on ADA, using drm */
+	if (nv_conn->type == DCB_CONNECTOR_eDP) {
+
+		ret = drm_dp_dpcd_read(&nv_conn->aux, DP_EDP_DPCD_REV, edp_dpcd,
+				       EDP_DISPLAY_CTL_CAP_SIZE);
+		if (ret < 0)
+			return ret;
+		if (!drm_edp_backlight_supported(edp_dpcd))
+			return -ENODEV;
+
+		ret = drm_edp_backlight_init(&nv_conn->aux, &bl->edp_info, 0, edp_dpcd,
+					 &current_level, &current_mode);
+		if (ret < 0)
+			return ret;
+
+		ret = drm_edp_backlight_enable(&nv_conn->aux, &bl->edp_info, current_level);
+		if (ret < 0) {
+			NV_ERROR(drm, "Failed to enable backlight on %s: %d\n",
+				 nv_conn->base.name, ret);
+			return ret;
+		}
+
+		*ops = &nv50_edp_bl_ops;
+		/* drm max factor must be multiplied by 16 */
+		props->max_brightness = bl->edp_info.max << 4;
+		props->brightness = current_level;
+		bl->uses_dpcd = true;
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 int
 nouveau_backlight_init(struct drm_connector *connector)
 {
@@ -332,6 +379,10 @@ nouveau_backlight_init(struct drm_connector *connector)
 		ret = nv50_backlight_init(bl, nouveau_connector(connector),
 					  nv_encoder, &props, &ops);
 		break;
+	case NV_DEVICE_INFO_V0_ADA:
+		ret = nv19x_backlight_init(bl, nouveau_connector(connector),
+					   nv_encoder, &props, &ops);
+		break;
 	default:
 		ret = 0;
 		goto fail_alloc;
-- 
2.44.0


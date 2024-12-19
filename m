Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965CECBAB5F
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B2410EA57;
	Sat, 13 Dec 2025 12:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="rDxFUkxH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Thu, 19 Dec 2024 10:17:06 UTC
Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net
 [178.154.239.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCD110E2BB;
 Thu, 19 Dec 2024 10:17:06 +0000 (UTC)
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:f69e:0:640:3ef4:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTPS id 7486F60D06;
 Thu, 19 Dec 2024 13:09:49 +0300 (MSK)
Received: from den-plotnikov-n.yandex-team.ru (unknown
 [2a02:6b8:b081:7212::1:2c])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id I9PfXV2IWqM0-0N5GsV7w; Thu, 19 Dec 2024 13:09:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; t=1734602988;
 bh=ojRgRGfGUelNSzgVIIdRAMRUxsuHE64KB7s7CQpbzvk=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=rDxFUkxHM5OltffdtKDowhDeo8LBDuBze9EgvscV5fSfjkSo1adVUQc2Zlxa8B8mn
 Kw276vejj9LyetFSsELINKTxUb5IR5DOb5XuAzjSpS/EfQ4gh6kRmsc3SIsGj07/mB
 bKnHnmtBP6Hsn6Q1ocuG10+ij3eYDkmzE+PoZywU=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: linux-kernel@vger.kernel.org
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dakr@redhat.com, lyude@redhat.com, kherbst@redhat.com
Subject: [PATCH v1] drivers/nouveau: change signature
 nv50_wndw_atomic_check_lut()
Date: Thu, 19 Dec 2024 13:09:18 +0300
Message-Id: <20241219100918.904082-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

It always returned 0 so make it void instead of returning int.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index f6be426dd5253..3ced5ebc3a897 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -370,7 +370,7 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 	return wndw->func->acquire(wndw, asyw, asyh);
 }
 
-static int
+static void
 nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw,
 			   struct nv50_wndw_atom *armw,
 			   struct nv50_wndw_atom *asyw,
@@ -392,7 +392,6 @@ nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw,
 		 */
 		if (!(ilut = asyh->state.gamma_lut)) {
 			asyw->visible = false;
-			return 0;
 		}
 
 		if (wndw->func->ilut)
@@ -436,7 +435,6 @@ nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw,
 
 	/* Can't do an immediate flip while changing the LUT. */
 	asyh->state.async_flip = false;
-	return 0;
 }
 
 static int
@@ -481,9 +479,7 @@ nv50_wndw_atomic_check(struct drm_plane *plane,
 	     asyh->state.color_mgmt_changed ||
 	     asyw->state.fb->format->format !=
 	     armw->state.fb->format->format)) {
-		ret = nv50_wndw_atomic_check_lut(wndw, armw, asyw, asyh);
-		if (ret)
-			return ret;
+		nv50_wndw_atomic_check_lut(wndw, armw, asyw, asyh);
 	}
 
 	/* Calculate new window state. */
-- 
2.34.1


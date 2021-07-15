Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B5C3C9EDB
	for <lists+nouveau@lfdr.de>; Thu, 15 Jul 2021 14:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF816E83A;
	Thu, 15 Jul 2021 12:43:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23F96E83A
 for <nouveau@lists.freedesktop.org>; Thu, 15 Jul 2021 12:43:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A5B4613C9;
 Thu, 15 Jul 2021 12:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626352985;
 bh=rXW02wB9BWaN+JXpclCoj26l9brnaUgCkEEY+OrVYYc=;
 h=Subject:To:Cc:From:Date:From;
 b=KFPIyQt6qJ1op/MZAqe51yi5J6YrkP+SGCeZFg5BRz0P3u4HxwqyICdfxCTLYQMph
 1dok//lqal4FG8VErNcOrL4bowj3Zkjjxe3qZP0A14fvwzrro3L1FBDiamvA6qYws8
 +71kjZUX4KXOJz8qlPBstXrsCBpxV0TVXAELqol4=
To: bskeggs@redhat.com, daniel.vetter@ffwll.ch, daniel.vetter@intel.com,
 gregkh@linuxfoundation.org, lyude@redhat.com, nouveau@lists.freedesktop.org,
 paul.kocialkowski@bootlin.com, pekka.paalanen@collabora.com
From: <gregkh@linuxfoundation.org>
Date: Thu, 15 Jul 2021 14:40:34 +0200
Message-ID: <1626352834184100@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
Subject: [Nouveau] Patch "drm/nouveau: Don't set allow_fb_modifiers
 explicitly" has been added to the 5.12-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/nouveau: Don't set allow_fb_modifiers explicitly

to the 5.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-nouveau-don-t-set-allow_fb_modifiers-explicitly.patch
and it can be found in the queue-5.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cee93c028288b9af02919f3bd8593ba61d1e610d Mon Sep 17 00:00:00 2001
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 27 Apr 2021 11:20:16 +0200
Subject: drm/nouveau: Don't set allow_fb_modifiers explicitly

From: Daniel Vetter <daniel.vetter@ffwll.ch>

commit cee93c028288b9af02919f3bd8593ba61d1e610d upstream.

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

Note that this fixes an inconsistency: We've set the cap everywhere,
but only nv50+ supports modifiers. Hence cc stable, but not further
back then the patch from Paul.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org # v5.1 +
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Link: https://patchwork.freedesktop.org/patch/msgid/20210427092018.832258-6-daniel.vetter@ffwll.ch
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/nouveau/nouveau_display.c |    1 -
 1 file changed, 1 deletion(-)

--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -700,7 +700,6 @@ nouveau_display_create(struct drm_device
 
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
-	dev->mode_config.allow_fb_modifiers = true;
 
 	if (drm->client.device.info.chipset < 0x11)
 		dev->mode_config.async_page_flip = false;


Patches currently in stable-queue which might be from daniel.vetter@ffwll.ch are

queue-5.12/drm-tegra-don-t-set-allow_fb_modifiers-explicitly.patch
queue-5.12/drm-msm-mdp4-fix-modifier-support-enabling.patch
queue-5.12/drm-mxsfb-don-t-select-drm_kms_fb_helper.patch
queue-5.12/drm-arm-malidp-always-list-modifiers.patch
queue-5.12/drm-amdgpu-change-the-default-timeout-for-kernel-com.patch
queue-5.12/drm-zte-don-t-select-drm_kms_fb_helper.patch
queue-5.12/drm-nouveau-don-t-set-allow_fb_modifiers-explicitly.patch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

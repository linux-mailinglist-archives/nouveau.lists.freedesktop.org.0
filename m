Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF043BCEC
	for <lists+nouveau@lfdr.de>; Wed, 27 Oct 2021 00:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F666E4AD;
	Tue, 26 Oct 2021 22:09:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B24C6E4AD
 for <nouveau@lists.freedesktop.org>; Tue, 26 Oct 2021 22:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635286150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZtFLXY97w+J9PEU0tZF/vkGFY9SUm5IyUTtS0ukcn0s=;
 b=VQ7iyEx3wdFpBZyf5QEe8RqzB39aiphjR+Ru76eYjCdsGZ46eJGePvJRV61H8uGyCyRjuM
 dcN/p4JGfWW7jZNalIyeATMqZLYQvvAwAXTG3cHa/sfPA6pEp2DNeYOwnF1urE8JdTe+k/
 utyyxjtQsT0Ii2cPzAYV41yw+a57zo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-sB0OPoU-PpybvgEnYnlM6g-1; Tue, 26 Oct 2021 18:09:09 -0400
X-MC-Unique: sB0OPoU-PpybvgEnYnlM6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 537AA10247A8;
 Tue, 26 Oct 2021 22:09:08 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0DC76A904;
 Tue, 26 Oct 2021 22:09:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Satadru Pramanik <satadru@gmail.com>
Date: Tue, 26 Oct 2021 18:08:43 -0400
Message-Id: <20211026220848.439530-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v4 0/5] drm/dp,
 drm/i915: Finish basic PWM support for VESA backlight helpers
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

When I originally moved all of the VESA backlight code in i915 into DRM
helpers, one of the things I didn't have the hardware or time for
testing was machines that used a combination of PWM and DPCD in order to
control their backlights. This has since then caused some breakages and
resulted in us disabling DPCD backlight support on such machines. This
works fine, unless you have a machine that actually needs this
functionality for backlight controls to work at all. Additionally, we
will need to support PWM for when we start adding support for VESA's
product (as in the product of multiplication) control mode for better
brightness ranges.

So - let's finally finish up implementing basic support for these types
of backlights to solve these problems in our DP helpers, along with
implementing support for this in i915. And since digging into this issue
solved the last questions we really had about probing backlights in i915
for the most part, let's update some of the comments around that as
well!

Changes (v3):
* Add likely fix for weird backlight scaling issues on samus-fi-bdw in intel's
  CI, which pointed out we've been leaving some (currently) unsupported
  backlight features on by mistake which certainly have the potential to cause
  problems.
  UPDATE: this didn't fix the problem, but this changed the symptoms was
  definitely still a bug either way.
Changes (v2):
* Fixup docs
* Add patch to stop us from breaking nouveau

Lyude Paul (5):
  drm/i915: Add support for panels with VESA backlights with PWM
    enable/disable
  drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
    enable/brightness
  drm/dp: Disable unsupported features in
    DP_EDP_BACKLIGHT_MODE_SET_REGISTER
  drm/dp, drm/i915: Add support for VESA backlights using PWM for
    brightness control
  drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()

 drivers/gpu/drm/drm_dp_helper.c               | 82 +++++++++++++------
 .../drm/i915/display/intel_dp_aux_backlight.c | 81 ++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  5 +-
 include/drm/drm_dp_helper.h                   |  7 +-
 4 files changed, 129 insertions(+), 46 deletions(-)

-- 
2.31.1


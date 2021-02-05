Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B774311744
	for <lists+nouveau@lfdr.de>; Sat,  6 Feb 2021 00:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823526F404;
	Fri,  5 Feb 2021 23:45:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FFA6F404
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 23:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612568726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iY3IjhQPYa+p63OMFoqW4AwhQgkWYCOrFg/cQCxrZBA=;
 b=PDsYYJDPp8nK/PVl5cln++eQE416pEUBpuum7BwZ5OcU8h6pfWNCJHX/jtjAytgfdLPvZL
 Xu/9RBTEBSIOZMxiFJe2SUjo1fWyhy2sDMGWgZXBB2pJI+yjAk2tz4Y7WIyY46qiInwo+T
 YjTL5Pq5cKeV60s67mgGhrq41UJ7oKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-uvYRsLNKMH6Vjmtqog3o9A-1; Fri, 05 Feb 2021 18:45:22 -0500
X-MC-Unique: uvYRsLNKMH6Vjmtqog3o9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D1E210051A2;
 Fri,  5 Feb 2021 23:45:21 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-116-79.rdu2.redhat.com
 [10.10.116.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97C0219727;
 Fri,  5 Feb 2021 23:45:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Date: Fri,  5 Feb 2021 18:45:04 -0500
Message-Id: <20210205234515.1216538-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC v3 00/10] drm: Extract DPCD backlight helpers from
 i915, add support in nouveau
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
Cc: Jani Nikula <jani.nikula@intel.com>, greg.depoire@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This series:
* Cleans up i915's DPCD backlight code a little bit
* Extracts i915's DPCD backlight code into a set of shared DRM helpers
* Starts using those helpers in nouveau to add support to nouveau for
  DPCD backlight control

v2 series-wide changes:
* Rebase
v3 series-wide changes:
* Split up the changes to intel's backlight code into separate patches

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: greg.depoire@gmail.com

Lyude Paul (10):
  drm/nouveau/kms/nv40-/backlight: Assign prop type once
  drm/nouveau/kms: Don't probe eDP connectors more then once
  drm/i915/dpcd_bl: Remove redundant AUX backlight frequency
    calculations
  drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return values correctly
  drm/i915/dpcd_bl: Cleanup intel_dp_aux_vesa_enable_backlight() a bit
  drm/i915/dpcd_bl: Cache some backlight capabilities in
    intel_panel.backlight
  drm/i915/dpcd_bl: Move VESA backlight enabling code closer together
  drm/i915/dpcd_bl: Return early in vesa_calc_max_backlight if we can't
    read PWMGEN_BIT_COUNT
  drm/i915/dpcd_bl: Print return codes for VESA backlight failures
  drm/dp: Extract i915's eDP backlight code into DRM helpers

 drivers/gpu/drm/drm_dp_helper.c               | 332 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   2 +-
 .../drm/i915/display/intel_dp_aux_backlight.c | 329 +++--------------
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |   4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   6 +
 include/drm/drm_dp_helper.h                   |  48 +++
 6 files changed, 428 insertions(+), 293 deletions(-)

-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

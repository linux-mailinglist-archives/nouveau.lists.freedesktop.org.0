Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B45376D4D
	for <lists+nouveau@lfdr.de>; Sat,  8 May 2021 01:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B8E6E5A5;
	Fri,  7 May 2021 23:40:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C776E5A5
 for <nouveau@lists.freedesktop.org>; Fri,  7 May 2021 23:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620430801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ieKXSzDqhVgqc642wx/XUfXN10nXFMC0TsmetlrzGqY=;
 b=PHCQh39yPZpRGGx3IT8RXGaM1h/IHjl/jIIK8+NWFhY+bdnxeqo2GQpAciHWCmeaXY+TG+
 /Slbjt0YS8hlispUKazGv1hAfEOzC2mmtSPsWA69Mwm6fh6BXTaRnF4+Q6dHZczW5zjbkq
 nXPRqYFL+VsWDQIIMf4XhFDJqieqbo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-ZGLgH3G6Oa6mJOIC1fS8lA-1; Fri, 07 May 2021 19:39:58 -0400
X-MC-Unique: ZGLgH3G6Oa6mJOIC1fS8lA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C830A800D62;
 Fri,  7 May 2021 23:39:55 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6074100164C;
 Fri,  7 May 2021 23:39:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Fri,  7 May 2021 19:39:38 -0400
Message-Id: <20210507233947.751846-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC v5 0/9] drm: Extract DPCD backlight helpers from
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
Cc: Jani Nikula <jani.nikula@intel.com>, greg.depoire@gmail.com,
 Rajeev Nandan <rajeevny@codeaurora.org>
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
v4 series-wide changes:
* Don't forget to actually include the patch that starts using these
  helpers in nouveau
v5 series-wide changes:
* Rebase
* Use new drm_dbg_*() logging helpers

Lyude Paul (9):
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
  drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau

 drivers/gpu/drm/drm_dp_helper.c               | 347 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   2 +-
 .../drm/i915/display/intel_dp_aux_backlight.c | 329 ++---------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  28 ++
 drivers/gpu/drm/nouveau/nouveau_backlight.c   | 166 ++++++++-
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |   1 +
 include/drm/drm_dp_helper.h                   |  48 +++
 8 files changed, 622 insertions(+), 308 deletions(-)

-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

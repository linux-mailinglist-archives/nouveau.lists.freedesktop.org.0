Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE5D15FA16
	for <lists+nouveau@lfdr.de>; Fri, 14 Feb 2020 23:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96BD6FBC9;
	Fri, 14 Feb 2020 22:59:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C376FBC7
 for <nouveau@lists.freedesktop.org>; Fri, 14 Feb 2020 22:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581721164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=R2rSJTcicY5nIJxYJ/nirD09yTB53muiLkWxosFVQPk=;
 b=C7DGJzNcVIFAiaVg0qNHCPgYcHOvMKzb1lzAaRFqJye/eyGFW+Lpi31dxGqIBKxxYCKYzG
 Is8bhqg+12PQyauqD42ueFQQJEIOoq7g3SqH3IV1LZ/PsxIS5tR7JNVNmMaGq7bfd2I+eS
 IE6bTLp7f6+iA1Rl8keX89IJYz/PVP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-93xA8R9WO5CoyZ0rX9oztg-1; Fri, 14 Feb 2020 17:59:19 -0500
X-MC-Unique: 93xA8R9WO5CoyZ0rX9oztg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E69018C35A0;
 Fri, 14 Feb 2020 22:59:17 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76DFC60499;
 Fri, 14 Feb 2020 22:59:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 14 Feb 2020 17:58:51 -0500
Message-Id: <20200214225910.695210-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: [Nouveau] [PATCH v2 0/5] drm/nouveau: DP interlace fixes
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
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Manasi Navare <manasi.d.navare@intel.com>, Takashi Iwai <tiwai@suse.de>,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Currently, nouveau doesn't actually bother to try probing whether or not
it can actually handle interlaced modes over DisplayPort. As a result,
on volta and later we'll end up trying to set an interlaced mode even
when it's not supported and cause the front end for the display engine
to hang.

So, let's teach nouveau to reject interlaced modes on hardware that
can't actually handle it. Additionally for MST, since we accomplish this
by simply reusing more of the SST mode validation we also get (some)
basic bw validation for modes we detect on MST connectors completely for
free.

Lyude Paul (5):
  drm/nouveau/kms/nv50-: Initialize core channel in
    nouveau_display_create()
  drm/nouveau/kms/nv50-: Probe SOR caps for DP interlacing support
  drm/nouveau/kms/gv100-: Add support for interlaced modes
  drm/nouveau/kms/nv50-: Move 8BPC limit for MST into
    nv50_mstc_get_modes()
  drm/nouveau/kms/nv50-: Share DP SST mode_valid() handling with MST

 drivers/gpu/drm/nouveau/dispnv50/core.h     |  3 ++
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 15 ++++++
 drivers/gpu/drm/nouveau/dispnv50/core827d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core907d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core917d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c | 26 +++++++++
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 60 ++++++++++++++++-----
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  5 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 43 +++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.h |  5 ++
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 31 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  8 +++
 15 files changed, 172 insertions(+), 34 deletions(-)

-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

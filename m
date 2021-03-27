Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08134B339
	for <lists+nouveau@lfdr.de>; Sat, 27 Mar 2021 01:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEB56F502;
	Sat, 27 Mar 2021 00:10:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F86F502
 for <nouveau@lists.freedesktop.org>; Sat, 27 Mar 2021 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616803813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UzOfXuForNxRCd56jvCtpAf71VkQSVPbu3+nSN5bh8I=;
 b=XCmEVrT/mm97OJJZFg0awtdaiyqDNqwICdW+KOwu3TaT7w3aL1s0jLUe6m+o7yGNmMs/YU
 qoZfsJQymq1n5FgGjYBbg1ZZhDbJ/5j2CMZDVwVdU0ExCaVDrfbirzfemvDugm1hOeiyz8
 v4517zECuw9kDcHeK/PHDRwdbdnYIFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-N6UtDt_mN-SGNxxDr3UmSg-1; Fri, 26 Mar 2021 20:10:11 -0400
X-MC-Unique: N6UtDt_mN-SGNxxDr3UmSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EECD107ACCD
 for <nouveau@lists.freedesktop.org>; Sat, 27 Mar 2021 00:10:10 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E51751972B;
 Sat, 27 Mar 2021 00:10:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 26 Mar 2021 20:09:58 -0400
Message-Id: <20210327001001.229093-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v2 0/3] drm/nouveau: extend the lifetime of
 nouveau_drm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

			       !!!Note!!!

This isn't my patch series and I've only reviewed 2/3 of the patches so
far, but I'm going to review the docs patch here the next chance I get.
I'm just rebasing this until then, so hopefully we can get the first two
patches of this into nouveau

------------------------------------------------------------------------

Hi folks,

Currently, when the device is removed (or the driver is unbound) the
nouveau_drm structure de-allocated. However, it's still accessible from
and used by some DRM layer callbacks. For example, file handles can be
closed after the device has been removed (physically or otherwise). This
series converts the Nouveau device structure to be allocated and
de-allocated with the devm_drm_dev_alloc() API.

In the future, additional resources that should be bound to the lifetime
of the drm_device can be added, and the drmm_add_action() APIs offer a
nice hook for arbitrary cleanup actions before the drm_device is
destroyed, so I suspect much of the current cleanup code in Nouveau
would benefit from some refactoring to use this.

Finally, although not *strictly* necessary for this series, I included
some documentation for structures I investigated for this work.

Jeremy Cline (3):
  drm/nouveau: Use helper to convert nouveau_drm to drm_device
  drm/nouveau: manage nouveau_drm lifetime with devres
  drm/nouveau: begin documenting core nouveau structures

 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/base.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/core.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  16 +--
 drivers/gpu/drm/nouveau/dispnv50/oimm.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/wimm.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |   5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  14 +--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   |  16 +--
 drivers/gpu/drm/nouveau/nouveau_dmem.c      |  17 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  46 ++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h       | 111 +++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  19 ++--
 drivers/gpu/drm/nouveau/nouveau_gem.c       |   8 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c       |  10 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c       |   8 +-
 27 files changed, 220 insertions(+), 110 deletions(-)

-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

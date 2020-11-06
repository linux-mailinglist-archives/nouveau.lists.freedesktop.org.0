Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62A2A8C92
	for <lists+nouveau@lfdr.de>; Fri,  6 Nov 2020 03:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAB86E97E;
	Fri,  6 Nov 2020 02:17:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA6D6E97E
 for <nouveau@lists.freedesktop.org>; Fri,  6 Nov 2020 02:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604629037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=foOZy0tCz1jxCbpETG5UIW0qij0a04UpX6miBXh7+Dc=;
 b=eV5JbT0brLmm6a6PF+27vB+mO3PDKHJ0b8VmgX31t5cVgOzs3Ckf3j9//wRZRIqp+1C2tP
 +btXcExPtVzwAeYzwghNgqr67c/3peC8pvwL0ABofigRTYmB1b+NPSK3BTKQ/Ay2IzlN7L
 sboopm2eGzp0HDoPE/6QVgAP2WMJ9gA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-RD-bxKsMNAuTftsYwFrp4g-1; Thu, 05 Nov 2020 21:17:16 -0500
X-MC-Unique: RD-bxKsMNAuTftsYwFrp4g-1
Received: by mail-qv1-f71.google.com with SMTP id es11so2191717qvb.10
 for <nouveau@lists.freedesktop.org>; Thu, 05 Nov 2020 18:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=foOZy0tCz1jxCbpETG5UIW0qij0a04UpX6miBXh7+Dc=;
 b=h2KzPfscOki4zk43ckOHB5j4J70ppffMPld1RxSTtKHZnp1wuJGbELCpyt5HCsFaPR
 zXYE02HIIKm4xsa/Eoz16nA8MYkWsAtoLCdKjwRF9PsFB43q8Hz9M0zaLOo8sGl3Z110
 HpzJHUyBmqJqOG2dfhTe7b/5xEpyay57dYuvQtfhpJAHzR78Km0962K3AyfxwpopyTI7
 Zq/ylo6mw5c/daleP1CG8JlDsoPkGIj8tVT/hb/o6P2XiGsy2MWgn2jQvcbnR9JGQQhO
 hNvWwn+s/mXWSX4RITN+v02pIbJT5yug5TBbigNtt7EiYPzxrLNHa9PnWxyMLa8Kqm7e
 iaqg==
X-Gm-Message-State: AOAM530Ko3INvXPHQCkZ1gDwsvGQ+QrTnQjPXpnOAqLZz+PcnyKbwb7f
 e9PSW+t8ZkqqexgzBGVieRi5cPn81pwbnmV3SNRAgfIlv1vaFxqvvTMjIKDnyuR7Vh0oNqt9/ZY
 Kpc/Ndv/ezMPC8GGvONwjoyIRpA==
X-Received: by 2002:ae9:e41a:: with SMTP id q26mr5377502qkc.246.1604629035531; 
 Thu, 05 Nov 2020 18:17:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCTjSjLVyCDBJFvGLtaXnVkIu5zI2SCdofvNmrjaLm638Fyz54c5K9EVsapniDZXfPi9W0kQ==
X-Received: by 2002:ae9:e41a:: with SMTP id q26mr5377490qkc.246.1604629035317; 
 Thu, 05 Nov 2020 18:17:15 -0800 (PST)
Received: from xps13.jcline.org ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id q20sm2195301qtn.80.2020.11.05.18.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 18:17:14 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Thu,  5 Nov 2020 21:16:53 -0500
Message-Id: <20201106021656.40743-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 0/3] drm/nouveau: extend the lifetime of
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

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
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  17 +--
 drivers/gpu/drm/nouveau/dispnv50/oimm.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/wimm.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |   5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  16 ++-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   |  16 +--
 drivers/gpu/drm/nouveau/nouveau_dmem.c      |  17 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  41 ++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h       | 111 +++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  19 ++--
 drivers/gpu/drm/nouveau/nouveau_gem.c       |   8 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c       |   8 +-
 27 files changed, 216 insertions(+), 106 deletions(-)

-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

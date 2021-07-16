Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684143CB24F
	for <lists+nouveau@lfdr.de>; Fri, 16 Jul 2021 08:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D596E911;
	Fri, 16 Jul 2021 06:17:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194846E90E;
 Fri, 16 Jul 2021 06:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=hXKXpHy9bGS1uK5ljrzn6TAqp0ZG8VouCBfEiDPy5WA=; b=GJEd673PlZ7AR7tV1dxC6wtjsA
 UVpNI30sgXvL/Ry0x/2wOpyL+R4hVH7b+FVk44+PcY2U23pbL9UsP7EVpXGN28XR9ttgeZiV2z7Am
 M3G9wLjcCf2+hUP7WWVUU5LYENQtqKW1m5VSe50ac7qmR7lIuZzI70dS71V7szcjFa9XCDPjltDGt
 MA7CqwCSw51SF4wN865Znt0Hi4BzkaXSHseL8hTa+yAMz/tGzmHdNxoZKtZrtEEB090i6RWKUZrWU
 hDhdPWeWoFSbSQo5ZxZ8BT+70Qh/GL4QAscek3l89/HjCwtXLGYQ5m+z4m+sqS4y3VTKswXFV3PZa
 OtpHoarg==;
Received: from [2001:4bb8:184:8b7c:6b57:320d:f068:19c6] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4H9G-004CpP-Od; Fri, 16 Jul 2021 06:16:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Jul 2021 08:16:27 +0200
Message-Id: <20210716061634.2446357-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] misc vgaarb cleanups
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi all,

this series cleans up a bunch of lose ends in the vgaarb code.

Diffstat:
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   11 +-
 drivers/gpu/drm/drm_irq.c                  |    4 
 drivers/gpu/drm/i915/display/intel_vga.c   |    9 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c      |    8 -
 drivers/gpu/drm/radeon/radeon_device.c     |   11 +-
 drivers/gpu/vga/vgaarb.c                   |   67 +++++-----------
 drivers/vfio/pci/vfio_pci.c                |   11 +-
 include/linux/vgaarb.h                     |  118 ++++++++++-------------------
 8 files changed, 93 insertions(+), 146 deletions(-)
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

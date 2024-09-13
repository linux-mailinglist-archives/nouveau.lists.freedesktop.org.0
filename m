Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA3977924
	for <lists+nouveau@lfdr.de>; Fri, 13 Sep 2024 09:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C81510EC99;
	Fri, 13 Sep 2024 07:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LqimtSHk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA57910EC99
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2024 07:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726211457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9dtWUnoOillz9qAbKTL8fXJ43JqZ3KYo8Vm6+EgABJo=;
 b=LqimtSHkQyQNl0KeTzsgeHFBet1Cka7fIslZauCR2LIEn3tTwyER+EHPIGrzSjo83dxylg
 /O+oA31dKghld2PFI3bDX61xuGmsi8CbIH9obSO67aHyOiud2q/3KAIKH7juVpyC0zApfq
 U9ZGaV463NuDN4QsF9S9lU8QfLuvleQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-Zl2-2N9TP1WeaNzEHHzJWQ-1; Fri,
 13 Sep 2024 03:10:53 -0400
X-MC-Unique: Zl2-2N9TP1WeaNzEHHzJWQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AF6461955F41; Fri, 13 Sep 2024 07:10:51 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.27])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6274419560AA; Fri, 13 Sep 2024 07:10:46 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, James Jones <jajones@nvidia.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v3 0/2] drm/nouveau: Add drm_panic support for nv50+
Date: Fri, 13 Sep 2024 09:03:09 +0200
Message-ID: <20240913071036.574782-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

This series adds basic drm_panic support for nouveau.
Patches 1 Add ABGR2101010 support in drm_panic.
Patch 2 registers nouveau to drm_panic, and handle tiling.
I've tested on a GTX1650 (Turing) and GF 8800 GT (Tesla), while
running Gnome/Wayland desktop, and in VT.

It should work on other nv50+ cards, but I didn't test them.

To test it, you need to build your kernel with CONFIG_DRM_PANIC=y, and run:

echo c > /proc/sysrq-trigger

or you can enable CONFIG_DRM_PANIC_DEBUG and run:

echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

v2:
 * Rebase and drop already merged patches.
 * Rework the tiling algorithm, using "swizzle" to compute the offset
   inside the block.
   
v3:
 * Fix support for Tesla GPU, which have simpler tiling.
 * Drop "add a private pointer to struct drm_scanout_buffer".
 * Use nouveau_framebuffer_get_layout() to get the tiling parameters.
 * Have 2 set_pixel() functions, depending on GPU family.
 
Jocelyn Falempe (2):
  drm/panic: Add ABGR2101010 support
  drm/nouveau: Add drm_panic support for nv50+

 drivers/gpu/drm/drm_panic.c             |  10 ++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 139 +++++++++++++++++++++++-
 2 files changed, 147 insertions(+), 2 deletions(-)


base-commit: 9d443deb0441b9dbb22a9aac3b471da05220df1b
-- 
2.46.0


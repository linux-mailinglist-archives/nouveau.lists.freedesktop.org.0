Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73BE12B295
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0E789A44;
	Fri, 27 Dec 2019 08:13:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BDF6E316
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 02:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571711960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YhY8RBO4XfCrBkxlH8rgZzaLB/4Dib/JgMGT4HhW/x0=;
 b=bczc2eBItpX5y0jXtjlA4xBSOSzAg+OYPK25N5ONX86ZaUgE6kaXHnh/5x6MsWPYMu5wXl
 OaRnLjgeVTEaDDFLJsR7pRhq5oTi0jT/UelQ+NS4HXNnkGZ4uEbjy92SxDC7/9V2u1IG0h
 Es3gkU0GTcbaZuYKWehhJh6CX9lVb8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-TILZfxBFOEqeACPmDj-UiQ-1; Mon, 21 Oct 2019 22:39:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6C60800D41;
 Tue, 22 Oct 2019 02:39:12 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB3BC60126;
 Tue, 22 Oct 2019 02:37:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Mon, 21 Oct 2019 22:35:55 -0400
Message-Id: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: TILZfxBFOEqeACPmDj-UiQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH v5 00/14] DP MST Refactors + debugging tools +
 suspend/resume reprobing
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Imre Deak <imre.deak@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <david1.zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, Yu Zhao <yuzhao@google.com>,
 David Francis <david.francis@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 "Jerry \(Fangzhi\) Zuo" <jerry.zuo@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Emily Deng <emily.deng@amd.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Monk Liu <monk.liu@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Thomas Lim <thomas.lim@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 xinhui pan <xinhui.pan@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Mathias=20Fr=C3=B6hlich?= <mathias.froehlich@web.de>,
 Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is the final portion of the large series for adding MST
suspend/resume reprobing that I've been working on for quite a while
now. In addition, I:

* Refactored and cleaned up any code I ended up digging through in the
  process of understanding how some parts of these helpers worked.
* Added some debugging tools along the way that I ended up needing to
  figure out some issues in my own code

Note that there's still one important part of this process missing
that's not included in this patch series: EDID reprobing, which I
believe Stanislav Lisovskiy from Intel is currently working on. The main
purpose of this series is to fix the issue of the in-memory topology
state (e.g. connectors connected to an MST hub, branch devices, etc.)
going out of sync if a topology connected to a connector is swapped out
with a different topology while the system is resumed, or while the
device housing said connector is in runtime suspend.

As well, the debugging tools that are added in this include:
* A limited debugging utility for dumping the list of topology
  references on an MST port or branch connector whose topology reference
  count has reached 0
<sideband message dumping has been merged :)>

Lyude Paul (14):
  drm/dp_mst: Destroy MSTBs asynchronously
  drm/dp_mst: Remove PDT teardown in drm_dp_destroy_port() and refactor
  drm/dp_mst: Refactor pdt setup/teardown, add more locking
  drm/dp_mst: Handle UP requests asynchronously
  drm/dp_mst: Add probe_lock
  drm/dp_mst: Protect drm_dp_mst_port members with locking
  drm/dp_mst: Don't forget to update port->input in
    drm_dp_mst_handle_conn_stat()
  drm/dp_mst: Lessen indenting in drm_dp_mst_topology_mgr_resume()
  drm/nouveau: Don't grab runtime PM refs for HPD IRQs
  drm/nouveau: Resume hotplug interrupts earlier
  drm/amdgpu: Iterate through DRM connectors correctly
  drm/amdgpu/dm: Resume short HPD IRQs before resuming MST topology
  drm/dp_mst: Add basic topology reprobing when resuming
  drm/dp_mst: Add topology ref history tracking for debugging

 drivers/gpu/drm/Kconfig                       |   14 +
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c  |   40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |    5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |   34 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |   34 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |   40 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |   34 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   41 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c |   10 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   28 +-
 drivers/gpu/drm/drm_dp_mst_topology.c         | 1185 +++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   28 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   38 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   33 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   19 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |   24 +-
 include/drm/drm_dp_mst_helper.h               |  160 ++-
 21 files changed, 1329 insertions(+), 479 deletions(-)

-- 
2.21.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2BE7A9D0D
	for <lists+nouveau@lfdr.de>; Thu, 21 Sep 2023 21:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9337610E5EC;
	Thu, 21 Sep 2023 19:28:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FDE10E5EE
 for <nouveau@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:15 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-690bfd4f3ebso1139840b3a.3
 for <nouveau@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324495; x=1695929295;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TaaYKX/WzN2yAJiXuwCzXo10Y+Z2eYCI0rB7JbtaKbk=;
 b=YFxhyTZHuJzCYbtJKMhKmI43jPtDWfqrmT/BKKfX2SUmtdi7RuYkvTm3DJmMt0u46c
 XRDf5vMv66daoCh5wMWKhu7KW7rItja6WRPrTRh5UDxxj+7qTWjPO6od+HIUn04l2wyR
 NiuQxlFUCnDvOqVN5+kxSYQJ6QYEV1l/HZQBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324495; x=1695929295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TaaYKX/WzN2yAJiXuwCzXo10Y+Z2eYCI0rB7JbtaKbk=;
 b=ExoMFax2tr7TyRPOCpgoZrbEKgkGdTPI2FiToagbCp7kD9S0XZG3H5o41wrrANQ5DW
 m2Otc9s9mWrfSv1f8gItCqXcGgu6mmufhmWjsX62L09iKQzTvFOam9EyZAbd/etqFUqH
 RoLakXHX8YkfE10pEbWlNQ1y934Lq5YDhZESH6zKZe94o11KBVd0P1XgFXE7k8LGnFwL
 PFcfVnmlyPOotiR6vAeCCe6hkF1jF8mfyrYP11Yn7NdDlseXs3HNQhW1Ev6I08l2+8Yi
 bQKukwwf15h6V4RVBCYUqvUQvlgDspRJXT7bnvWh+ItnxQRO+Enxo5+kx3A6QDZHhdCo
 T/CA==
X-Gm-Message-State: AOJu0YxTj9OxClbH7cO6aNDTQiI44glNYmujauo7ruO4ySadFRRXv1Jn
 XaBorUpTqAjpLBP7DXbZCfbn+w==
X-Google-Smtp-Source: AGHT+IEMW+st7pK1ERCOwxwoalcSvIpW84hrr+4hW9zDszK+PkTuQiJ5+HlDQX/MBJ7tT52BBQ4d4g==
X-Received: by 2002:a05:6a21:4985:b0:151:991c:84b6 with SMTP id
 ax5-20020a056a21498500b00151991c84b6mr6676548pzc.59.1695324494675; 
 Thu, 21 Sep 2023 12:28:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Date: Thu, 21 Sep 2023 12:26:43 -0700
Message-ID: <20230921192749.1542462-1-dianders@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [RFT PATCH v2 00/12] drm: call
 drm_atomic_helper_shutdown() at the right times
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
Cc: geert+renesas@glider.be, nouveau@lists.freedesktop.org, Victor.Zhao@amd.com,
 edmund.j.dea@intel.com, linux-kernel@vger.kernel.org, paul@crapouillou.net,
 linux-tegra@vger.kernel.org, mdaenzer@redhat.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, alim.akhtar@samsung.com,
 anitha.chrisanthus@intel.com, srinivasan.shanmugam@amd.com,
 steven.price@arm.com, mario.limonciello@amd.com, robh@kernel.org,
 linux-samsung-soc@vger.kernel.org, festevam@gmail.com, abrodkin@synopsys.com,
 kyungmin.park@samsung.com, amd-gfx@lists.freedesktop.org,
 matthias.bgg@gmail.com, bskeggs@redhat.com, sam@ravnborg.org,
 orsonzhai@gmail.com, linux-imx@nxp.com, p.zabel@pengutronix.de,
 chunkuang.hu@kernel.org, lijo.lazar@amd.com, kernel@pengutronix.de,
 mperttunen@nvidia.com, Bokun.Zhang@amd.com,
 Sascha Hauer <s.hauer@pengutronix.de>, maarten.lankhorst@linux.intel.com,
 shiwu.zhang@amd.com, inki.dae@samsung.com, le.ma@amd.com,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, laurentiu.palcu@oss.nxp.com,
 biju.das.jz@bp.renesas.com, James.Zhu@amd.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 jim.cromie@gmail.com, felix.kuehling@amd.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, Douglas Anderson <dianders@chromium.org>,
 patrik.r.jakobsson@gmail.com, linux-renesas-soc@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, kieran.bingham+renesas@ideasonboard.com,
 daniel@ffwll.ch, zhang.lyra@gmail.com, alexander.deucher@amd.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


This patch series came about after a _long_ discussion between me and
Maxime Ripard in response to a different patch I sent out [1]. As part
of that discussion, we realized that it would be good if DRM drivers
consistently called drm_atomic_helper_shutdown() properly at shutdown
and driver remove time as it's documented that they should do. The
eventual goal of this would be to enable removing some hacky code from
panel drivers where they had to hook into shutdown themselves because
the DRM driver wasn't calling them.

It turns out that quite a lot of drivers seemed to be missing
drm_atomic_helper_shutdown() in one or both places that it was
supposed to be. This patch series attempts to fix all the drivers that
I was able to identify.

NOTE: fixing this wasn't exactly cookie cutter. Each driver has its
own unique way of setting itself up and tearing itself down. Some
drivers also use the component model, which adds extra fun. I've made
my best guess at solving this and I've run a bunch of compile tests
(specifically, allmodconfig for amd64, arm64, and powerpc). That being
said, these code changes are not totally trivial and I've done zero
real testing on them. Making these patches was also a little mind
numbing and I'm certain my eyes glazed over at several points when
writing them. What I'm trying to say is to please double-check that I
didn't do anything too silly, like cast your driver's drvdata to the
wrong type. Even better, test these patches!

I've labeled this patch series as RFT (request for testing) to help
call attention to the fact that I didn't personally test any of these
patches.

I'd like to call out a few drivers that I _didn't_ fix in this series
and why. If any of these drivers should be fixed then please yell.
- DRM drivers backed by usb_driver (like gud, gm12u320, udl): I didn't
  add the call to drm_atomic_helper_shutdown() at shutdown time
  because there's no ".shutdown" callback for them USB drivers. Given
  that USB is hotpluggable, I'm assuming that they are robust against
  this and the special shutdown callback isn't needed.
- ofdrm and simpledrm: These didn't have drm_atomic_helper_shutdown()
  in either shutdown or remove, but I didn't add it. I think that's OK
  since they're sorta special and not really directly controlling
  hardware power sequencing.
- virtio, vkms, vmwgfx, xen: I believe these are all virtual (thus
  they wouldn't directly drive a panel) and adding the shutdown
  didn't look straightforward, so I skipped them.

I've let each patch in the series get CCed straight from
get_maintainer. That means not everyone will have received every patch
but everyone should be on the cover letter. I know some people dislike
this but when touching this many drivers there's not much
choice. dri-devel and lkml have been CCed and lore/lei exist, so
hopefully that's enough for folks. I'm happy to add people to the
whole series for future posts.

NOTE: I landed everything I could from v1 of the patch series [2] [3]
to drm-misc. This v2 is everyone that is still left. If you'd like me
to land one of the patches here to drm-misc for you, please say
so. Otherwise I will assume maintainers will pick patches for their
particular driver and land them. There are no dependencies.

[1] https://lore.kernel.org/lkml/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid
[2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org

Changes in v2:
- Rebased and resolved conflicts.

Douglas Anderson (12):
  drm/imx/dcss: Call drm_atomic_helper_shutdown() at shutdown time
  drm/kmb: Call drm_atomic_helper_shutdown() at shutdown time
  drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
  drm/nouveau: Call drm_atomic_helper_shutdown() or equiv at shutdown
    time
  drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
  drm/arcpgu: Call drm_atomic_helper_shutdown() at shutdown time
  drm/amdgpu: Call drm_atomic_helper_shutdown() at shutdown time
  drm/sprd: Call drm_atomic_helper_shutdown() at remove time
  drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
  drm/gma500: Call drm_helper_force_disable_all() at shutdown/remove
    time
  drm/radeon: Call drm_helper_force_disable_all() at shutdown/remove
    time
  drm/renesas/shmobile: Call drm_helper_force_disable_all() at
    shutdown/remove time

 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_drv.c          | 11 +++++++++++
 drivers/gpu/drm/gma500/psb_drv.c                 |  8 ++++++++
 drivers/gpu/drm/imx/dcss/dcss-drv.c              |  8 ++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c              |  7 +++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.h              |  1 +
 drivers/gpu/drm/kmb/kmb_drv.c                    |  6 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c           |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_display.c        |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h        |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c            | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h            |  1 +
 drivers/gpu/drm/nouveau/nouveau_platform.c       |  6 ++++++
 drivers/gpu/drm/radeon/radeon_drv.c              |  7 ++++++-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 10 ++++++++++
 drivers/gpu/drm/sprd/sprd_drm.c                  |  4 +++-
 drivers/gpu/drm/tegra/drm.c                      |  6 ++++++
 drivers/gpu/drm/tiny/arcpgu.c                    |  6 ++++++
 20 files changed, 124 insertions(+), 2 deletions(-)

-- 
2.42.0.515.g380fc7ccd1-goog


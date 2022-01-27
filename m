Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96BF49E65F
	for <lists+nouveau@lfdr.de>; Thu, 27 Jan 2022 16:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B86B10E2D7;
	Thu, 27 Jan 2022 15:42:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B251310EB71
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jan 2022 03:25:52 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id i1so1331070pla.9
 for <nouveau@lists.freedesktop.org>; Wed, 26 Jan 2022 19:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kijqoOwlh2nBinX5T4jaToM6MBMxe8W6w3/1AdS3Yq4=;
 b=UZ/5sgr03EHCHuKWtyXr3V6fpDy0NQnn2m8IOrHrEIpwrXMhmlcleuv3c66PXbvwGm
 eTEfreUdGDHQHMzxgMMhHmYHYdPbdbyG/R3F0b0lGmHkAMWK6erVFMHU2NEGI4MU2X3h
 E3DD4PLRhTR7xYsYhpS8/K8UOKyLizlmg9d8btyW4pYji/92OuvsZNaef8qwIsu5R0ir
 qR94W7u2/of6FedsP1qR0u+uhm+NtIRMi0xul1S7dqty0VRimsPLf2HtFITMtzqrHeJL
 +gsRsF6L1O0jt1sWX8AvhnvLa09oQ+VsNLoRkI3A33w6dACWp5uaErUPSPWCgAU+eLGI
 MNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kijqoOwlh2nBinX5T4jaToM6MBMxe8W6w3/1AdS3Yq4=;
 b=OXeG9enf5Dy3nRC4ldlgnhsKJPhzE/n1oanZua3Acn7IfDQEtomvExbLqDujDRxPRr
 nCJn64/sJpJMNXbFpHq2OHvljTL3UQ5Sd2zmLcg+GeV1ENTGHchz0QnYl70ZPG0Dm/5D
 lvmxD05t334k+sUtsQoRAdxTKn3i+CKugfdU4JEfWeK4k3nTM41QV1YY7ZuIwJndZTdO
 uY/GzLdJ66rgKJ4HWfR2piDlJFYiMXaBkURdWaIJK9dRg9LfLmxQ8xzilzIPEBGIcdW2
 G27ybFHm9/999XwYzhhKy6m5b7AMgEyPQn68rH6BXlFYkd8TLD7Hu3r9lSmKD+yxhODm
 OPMw==
X-Gm-Message-State: AOAM533GU0h7aE5b6jJLHCvJc9MJiDZY0HzQ3Ewb2mm43DU8XCu4WGZ0
 KHm1xCbZ+lQSBgd2vcyIsaNodw==
X-Google-Smtp-Source: ABdhPJyNPV3msBn+KKKict8VHo/xq7GgpwlrbMX/o5U/v/DVxAdiwwKL3Q8bOpUtoZ9o+KbrRIZWIQ==
X-Received: by 2002:a17:902:be14:: with SMTP id
 r20mr1677757pls.97.1643253952215; 
 Wed, 26 Jan 2022 19:25:52 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id t15sm4203111pjy.17.2022.01.26.19.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 19:25:51 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Thu, 27 Jan 2022 12:25:36 +0900
Message-Id: <20220127032539.9929-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jan 2022 15:42:16 +0000
Subject: [Nouveau] [RFC PATCH v5 0/3] Add support modifiers for drivers
 whose planes only support linear layout
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
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>, Lee Jones <lee.jones@linaro.org>,
 Tomohito Esaki <etom@igel.co.jp>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Some drivers whose planes only support linear layout fb do not support format
modifiers.
These drivers should support modifiers, however the DRM core should handle this
rather than open-coding in every driver.

In this patch series, these drivers expose format modifiers based on the
following suggestion[1].

On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
> I think the best way forward here is:
>   - add a new mode_config.cannot_support_modifiers flag, and enable
> this in radeon (plus any other drivers in the same boat)
>   - change drm_universal_plane_init() to advertise the LINEAR modifier
> when NULL is passed as the modifier list (including installing a
> default .format_mod_supported hook)
>   - remove the mode_config.allow_fb_modifiers hook and always
> advertise modifier support, unless
> mode_config.cannot_support_modifiers is set


[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20190509054518.10781-1-etom@igel.co.jp/#24602575

v5:
* rebase to the latest master branch (5.17-rc1+)
	+ "drm/plane: Make format_mod_supported truly optional" patch [2]
  [2] https://patchwork.freedesktop.org/patch/467940/?series=98255&rev=3

* change default_modifiers array from non-static to static
* remove terminator in default_modifiers array
* use ARRAY_SIZE to get the format_modifier_count
* keep a sanity check in plane init func
* modify several kerneldocs

v4: https://www.spinics.net/lists/dri-devel/msg329508.html
* modify documentation for fb_modifiers_not_supported flag in kerneldoc

v3: https://www.spinics.net/lists/dri-devel/msg329102.html
* change the order as follows:
   1. add fb_modifiers_not_supported flag
   2. add default modifiers
   3. remove allow_fb_modifiers flag
* add a conditional disable in amdgpu_dm_plane_init()

v2: https://www.spinics.net/lists/dri-devel/msg328939.html
* rebase to the latest master branch (5.16.0+)
      + "drm/plane: Make format_mod_supported truly optional" patch [2]

v1: https://www.spinics.net/lists/dri-devel/msg327352.html
* The initial patch set

Tomohito Esaki (3):
  drm: introduce fb_modifiers_not_supported flag in mode_config
  drm: add support modifiers for drivers whose planes only support
    linear layout
  drm: remove allow_fb_modifiers

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +++
 drivers/gpu/drm/drm_framebuffer.c             |  6 ++---
 drivers/gpu/drm/drm_ioctl.c                   |  2 +-
 drivers/gpu/drm/drm_plane.c                   | 23 +++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_display.c     |  6 +++--
 drivers/gpu/drm/radeon/radeon_display.c       |  2 ++
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 -
 include/drm/drm_mode_config.h                 | 18 +++++----------
 include/drm/drm_plane.h                       |  3 +++
 14 files changed, 45 insertions(+), 32 deletions(-)

-- 
2.25.1


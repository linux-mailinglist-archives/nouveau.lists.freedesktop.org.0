Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C548F011
	for <lists+nouveau@lfdr.de>; Fri, 14 Jan 2022 19:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBDA10E246;
	Fri, 14 Jan 2022 18:43:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D9210E3BD
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jan 2022 10:18:11 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id x83so2386495pgx.4
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jan 2022 02:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s80qqgWnls4SrG+TKmlvMPm/YH00A/Q2Uj06AgHmW4k=;
 b=TlwujFyyU3nC4gqgaYuV5a82Oqjy9NLwUzK2f7/TaSit3LBMk9v8CRPJ//lREyOBMQ
 PxiealkkhPDG6xxJZDwReWdYtDNgBEq31Pc4gqkCRTxGSuL+NDTWGgiVgHDdAqsgfUDd
 i6lOq4l2rmexrAO4Cmgk/K5hRmRO8wmjIwxhsLJw55QMqE8984jit8ZU7oLZwi5quVCS
 QXiJ+Z8hYToC5dhEDtRRBXNUTaoGmtJSwETuVoy5eBkWXviOv/zPw0Qb0uxVBJkzv3II
 8kXtIlZAoDHRqVdCe7367QuiF+NaXhRuDjNtFKU4Ceky1IUYCUYaTI7IZPfnNBjMCa9v
 eI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s80qqgWnls4SrG+TKmlvMPm/YH00A/Q2Uj06AgHmW4k=;
 b=BdXUysa+MVEMOHsXv8BOgyH5KObgrb7sn9n/ueeioRzljSqh9k25jkO1z/4ZHdUXG5
 tnfztg4uYKIiFuIO1RxzcF3HDKt3hTwTd/BEz2x+jiFigVVcFA/sc5B0tabANMcWAGho
 4vDKRURnTGnm/H/EjHKbzs9f2wKvuLyUjQgOtpkRnRPbHHqZUZ/rK2KfwydU9hW2S833
 wFy0ekYVq1s7MSU/QTzcLrRHVpJV4BUW9eH6wFU2cRX3xxG9sV/l1ze11imIZ4LfP5Ww
 /PeyOVMx6aezCwImi6WEl4o5+1SVSU2LreyxQo4ox3r/+YzZz8xpuBsTFlaV/xsmV/8Y
 mWwg==
X-Gm-Message-State: AOAM530rtd5iZ4aPC1QnHI3dVRgioIpRcoYffNxdNEjKkASNf1Zga0Al
 iYnLe98cWNeumAI/BtN444VXcg==
X-Google-Smtp-Source: ABdhPJzGLsIEfSxaiePAbfa3cL6BLVqpknnxtCMMY0DAykp29Pvz+v+fOfJ8YFxJeVrpzSsf0c8pVQ==
X-Received: by 2002:a63:a011:: with SMTP id r17mr7510548pge.300.1642155490862; 
 Fri, 14 Jan 2022 02:18:10 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id 13sm5555970pfm.161.2022.01.14.02.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 02:18:09 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Fri, 14 Jan 2022 19:17:50 +0900
Message-Id: <20220114101753.24996-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jan 2022 18:43:39 +0000
Subject: [Nouveau] [RFC PATCH v3 0/3] Add support modifiers for drivers
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

v3:
* change the order as follows:
   1. add fb_modifiers_not_supported flag
   2. add default modifiers
   3. remove allow_fb_modifiers flag
* add a conditional disable in amdgpu_dm_plane_init()

v2: https://www.spinics.net/lists/dri-devel/msg328939.html
* rebase to the latest master branch (5.16.0+) + "drm/plane: Make format_mod_supported truly optional" patch [2]
  [2] https://patchwork.freedesktop.org/patch/467940/?series=98255&rev=3

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
 drivers/gpu/drm/drm_plane.c                   | 22 +++++++++----------
 drivers/gpu/drm/nouveau/nouveau_display.c     |  6 +++--
 drivers/gpu/drm/radeon/radeon_display.c       |  2 ++
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 -
 include/drm/drm_mode_config.h                 | 18 +++++----------
 include/drm/drm_plane.h                       |  3 +++
 14 files changed, 43 insertions(+), 33 deletions(-)

-- 
2.25.1


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34CC482917
	for <lists+nouveau@lfdr.de>; Sun,  2 Jan 2022 05:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984AA89F8E;
	Sun,  2 Jan 2022 04:17:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E19410E42D
 for <nouveau@lists.freedesktop.org>; Wed, 22 Dec 2021 05:27:38 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id t19so1314678pfg.9
 for <nouveau@lists.freedesktop.org>; Tue, 21 Dec 2021 21:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9q1trsl42X2XG3aKGHikEKkUb0EC574TM7EXShQRQcE=;
 b=4kR2BHFtUXwCL5DcgXSXuRhVxvqeUnA6q6mLf3s1u/IfZSeJ57CtUT8ElTNyrWDC5A
 O8xxlScCb7DYJ+cv79NjTfAj/5LTlzHFTTuqluyQo1oToCEg1JiBKOzEWO23jP1yyHVW
 O+ez1E8IjVlIFxARG5meWo3ehA9CUwpjAOp+J5MVEHUxvcOIjH6IvN50ePJ+xGIYeio6
 b4lIfKwYrkPzgOigc5K8VcxRpWZz+oMCzPDlG7B+apdS9VG/jEhfiskVn5xxsd1uyrzv
 aIiOdHJZE+CJ8sE41m+6G7dx9MTevFBb+9uyVe8dAJn1yuVR3TetvxyQObQhlxvdrb+A
 Szxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9q1trsl42X2XG3aKGHikEKkUb0EC574TM7EXShQRQcE=;
 b=Uh9Vm6GXQHl/DOrWsxzkaltLrpyLifA70i8rTQbfVBDXkKVqaupYZrixysQjJBBnYk
 bUQsVXGtyrsz4mqC/vVZRQkSaQEsyoV6IHIizsOvrreT3EV+WWFh47fazvojJAR2v81K
 g44GXTfeHM2cHpeHQ5xkJ2imFgM9MIAI9ZoO40wcsEeJzZ0+AR6/j+fGQ9r0PLcCczk8
 q4eep+fTqlYSTDJy0Q1BdVNADGY6ItjSUzvWtWBetayNI18jSB6IX5+vbgT4ZAbKbyil
 tD64wK2LQfnlRENKBV4QsbY2N9dioVI3WsP/Fhd+Y7KE9RSR1cI2Q2fkStcw5FvVO86G
 e//A==
X-Gm-Message-State: AOAM533jOTjvSRD0yZZRnswW0iVuAtWqMblIKVk1xBggHELQAN4zDB0f
 lySdXZ2a/pZBhfZ4iTDN9bF5TA==
X-Google-Smtp-Source: ABdhPJzR9+Nt6GYIKekgjSsIg+Hr4zJi/uXp6MFOIzEbn+Y6xAXUkBAqSDmlpkyMz5zshJTmt75I1w==
X-Received: by 2002:a62:25c3:0:b0:4ba:7afa:3788 with SMTP id
 l186-20020a6225c3000000b004ba7afa3788mr1692806pfl.23.1640150857792; 
 Tue, 21 Dec 2021 21:27:37 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id v63sm737465pgv.71.2021.12.21.21.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 21:27:37 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Wed, 22 Dec 2021 14:27:24 +0900
Message-Id: <20211222052727.19725-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 02 Jan 2022 04:17:56 +0000
Subject: [Nouveau] [RFC PATCH 0/3] Add support modifiers for drivers whose
 planes only support linear layout
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
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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


Tomohito Esaki (3):
  drm: add support modifiers for drivers whose planes only support
    linear layout
  drm: set fb_modifiers_not_supported flag in legacy drivers
  drm: replace allow_fb_modifiers with fb_modifiers_not_supported

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +--
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  2 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 +
 drivers/gpu/drm/drm_framebuffer.c             |  6 +--
 drivers/gpu/drm/drm_ioctl.c                   |  2 +-
 drivers/gpu/drm/drm_plane.c                   | 41 +++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_display.c     |  6 ++-
 drivers/gpu/drm/radeon/radeon_display.c       |  2 +
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 -
 include/drm/drm_mode_config.h                 | 18 +++-----
 include/drm/drm_plane.h                       |  3 ++
 13 files changed, 54 insertions(+), 38 deletions(-)

-- 
2.17.1

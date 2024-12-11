Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809E9ECCBA
	for <lists+nouveau@lfdr.de>; Wed, 11 Dec 2024 14:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC1710EB38;
	Wed, 11 Dec 2024 13:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yQz6MjAe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5364810EB38
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 13:04:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so5043735e9.1
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 05:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733922269; x=1734527069; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YpUlzLd4DTvOwWsmuqzajXz424W9CnL0q6rjmHsBkGw=;
 b=yQz6MjAe6BESbgI3G8QPgNkVlRdW8zibCHN3VxB3gAujn3lJ25xUKYwipeN12KYdqo
 Nt8La/I4Xf8ocNjONP97puPbxlrc0XZ4a8u02kzMXRKaG9yPkiQVzXT1M9IlcgE0KJjE
 UHzBzLJjjVcB1fEgRYGiMCyKz3Fx9SkC2Z1X67JGStirdbamKOaKNMi2ElWqWzQIqGgb
 SvrYS6EvNEzO/OL2vZmpgN5drDiAioJbdHjP8VXxkGG+UkjPEzAynHwYQNrqcZoPhQ2d
 axdAmiZ4ACDVtbU337/p7kH9FU/5bGMeDJLDVhB9GF2FhYEArzP4eWPqnR7lgugciqHc
 BWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733922269; x=1734527069;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YpUlzLd4DTvOwWsmuqzajXz424W9CnL0q6rjmHsBkGw=;
 b=NBmWF0TaDHx+jmIyz/273TF0kCnDzD/X86g9BSGjQqfZQkGnNUGslEk5iGwdSxDZkc
 iyRKne60etv8aCqoMbT8lpP3M8lLulhMereuIG/qVpV/W4opTt0C0qmDfY+weLqXpNkJ
 DIRW+MtjAhmhJO9ozKUot6mbvZ9I5J5HZj2qSYtdoDAFFRCtV/6thrced3Bt9KylIYXm
 fLNHLcbDvRnKil5tahQ4FvELLvRTlvg6AyxvWk07V5QDNUABmSb4I97+kfRIDP68FIGT
 pnTVJ++MXe2qwcofyb9BBuTdKweZByLbfu6N7MytYZBdxHr8nPUtVyLYghmyWRZNPnNm
 SNpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwNUZl2IIM+MlcFazeKCymXivahaTMa2/RgZdy36EeJ+6Js64rxyS6HEUx3YK5fkjst24SukZY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz816p0muDVpjDnTwDT2xIg9JdOiiOqWrUrUfTj8A5dFqHjadqC
 Js3RX9l4AERZUBZk+8Xo98Itk/HHSJhhu/34ADsMNboCaKhAVfejH9LtvlBul3w=
X-Gm-Gg: ASbGncsOA4UNtg5DcMh06mOMZOYMmRK+/YDOzO+71yIW+vk8Kbh/vwf7XftDIRRWXon
 2hx6LDRJC9YscRPFlEBT7vURsDao4spbsJbeo2vXUU07NTnkyVSiFJAk7SHKX5YPVb3bvQjxxUX
 drlYE0K7acmqMevpriGQcpHuxIIZUHZvgmTABmJRoYXdyP+c6hSLzjN/rDBDG5suO9rXtJpEnds
 CJDxiJTNcLBwTqq+Tb01Vekci6LG5krp8co+GLk3hA2KdsFikdkSQ==
X-Google-Smtp-Source: AGHT+IGPWcM8yhYn2nQJ26y7MGhayOqx4M0waL4G4OgaFUlHH0NcR4gyX+40Z605D2RCeHuL57tWCQ==
X-Received: by 2002:a05:600c:5122:b0:436:1b96:7072 with SMTP id
 5b1f17b1804b1-4361c393b80mr20312535e9.5.1733922268551; 
 Wed, 11 Dec 2024 05:04:28 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878248e633sm1288081f8f.4.2024.12.11.05.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 05:04:27 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Wed, 11 Dec 2024 15:04:11 +0200
Message-Id: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMuNWWcC/53NOQ6DMBCF4asg15nIZslW5R4RhWHGYAkvGlsoE
 eLucThCyv8V79tEIraUxKPaBNNqkw2+RH2qxDhrPxFYLC1qWbdKNgqQHWAElxxoRFhyjgyZtU9
 RM/kMLiBBogyquYzYDQZJXkX5i0zGvg/r1ZeebcqBPwe9qt/6j7IqkDBqMwz3W9eZVj4X6zWHc
 +BJ9Pu+fwHZAlYD4wAAAA==
X-Change-ID: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2672; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=4SL3oSOYfNGgaeWhz9HDRuhRuGic1VpdSQb4rkQTyyA=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWY3PEZV7dIYTv5NvvJXM3bZDVMPWNYimil7AK
 wt2J3+5kbiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1mNzwAKCRAbX0TJAJUV
 Vo+dD/4p2AWAAkQ6OSPj6dUqNsHrnpSa3jbwEi3CcIbbOwg6w5LxgpXI1osFK7ghd4bn6Ig6n5S
 pkj3wHywKPBCxJWqi7jKnnXgs4PPIqNxpCHODl3GGC0ezCO/PxMQoWLEJk3U1iqzMAQ8s07ZYk8
 eKoLR0VebD1mor9uLs/eXYrB29VgU0MNkN5fs+BEGX6nsuBgwbdM3GmYtUPTLkEfEOi22PHwVS4
 gDPbedPBwC5WMRxSa8EdC7qa20EENKBjYe+FyaV6eeFmRvLeBfVTy9VPrkEHNz5LEsHtBwZHCPs
 RxzQCDlf68mEMVviyJdoDZAW89YbVdYIzast2OTufD+bjaHiIVMe9jnCrJ66jiISmBR/YbtkC37
 Xi3KfJgqkohhzIxprEkUZfWGQcz/OnGu5jWK1SvNA7gvBIFKoiLWEsBLqspRundFegj1qn9x1+u
 kflAoK89iwBD29SohLCrpT7nZjXFMnav0IzlAYtHm8nkrLhgQyBa4OmzGf2In0itA2XPtPLZJHT
 dLANf/svi+j8riF7VblBUUzP2+UWOrSR+NyFXKT+Doeo8vHdqHXYOpnh5u+ONAM2RYVy7fp+zEj
 H+q2xUnOn+t8VXv+cYKRkUi4CNeG251xYVZBGERrDrq19e/P5l3Og1mTiByzs6/33xy/qkECKYM
 ZLJitm6X2eAAmrA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Looking at both i915 and nouveau DP drivers, both are setting the first
LTTPR (if found) in transparent mode first and then in non-transparent
mode, just like the DP v2.0 specification mentions in section 3.6.6.1.

Being part of the standard, setting the LTTPR in a specific operation mode
can be easily moved in the generic framework. So do that by adding a new
helper.

Then, the msm DP driver is lacking any kind of support for LTTPR handling,
so add it by reading the LTTPR caps for figuring out the number of LTTPRs
found on plug detect and then do exactly what the i915 and nouveau drivers
do with respect to toggling through operating modes, just like the
up-mentioned section from DP spec describes.

At some point, link training per sub-segment will probably be needed, but
for now, toggling the operating modes seems to be enough at least for the
X Elite-based platforms that this patchset has been tested on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Added new wrapper over the set_transparent new helper in order to
  move the non-transparent disable and the its enable->disable sequence
  mentioned in the DP standard section 3.6.6.1 entirely in the generic
  implemetation.
- Switch all 3 drivers to use the new wrapper.
- Fixed the return value of the helper to return 0 on success and
  negative value on error.
- Added explanation about the transparent/non-transparent modes into the
  msm dp commit message.
- Dropped the condition for non-eDP in msm DP driver since it is allowed
  to try to get the number of LTTPRs even on eDP and it will be always
  0 anyway.
- Dropped the RFC prefix
- Link to v1: https://lore.kernel.org/r/20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org

---
Abel Vesa (4):
      drm/dp: Add helper to set LTTPRs in transparent mode
      drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      drm/msm/dp: Add support for LTTPR handling

 drivers/gpu/drm/display/drm_dp_helper.c            | 50 ++++++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++--------
 drivers/gpu/drm/msm/dp/dp_display.c                | 17 ++++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-------
 include/drm/display/drm_dp_helper.h                |  2 +
 5 files changed, 76 insertions(+), 34 deletions(-)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


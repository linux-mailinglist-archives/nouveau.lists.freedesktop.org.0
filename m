Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B34A00998
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2025 13:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDEB10E8A4;
	Fri,  3 Jan 2025 12:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m55lUdL5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98EA10E8A5
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2025 12:59:48 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso5615248f8f.3
 for <nouveau@lists.freedesktop.org>; Fri, 03 Jan 2025 04:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735909127; x=1736513927; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mj1C/gEdKkc2DLeyCME5RbzYecjWcWlcP/v8o/H1DYU=;
 b=m55lUdL5vFvlyTPVTI2MgnEbhO3FCjCVs6kYUTh/2VKCOxZR4mthh0rY1hfgyJdcsF
 GYDamy5nckkwe/EbNgedOT6Ci9VsX3DEFI4WoWquDA1vIh23mPYhE1MX/o7VH0Qzl3f/
 cL22ItZz22sV+fB+afe88Fi8DnunC5R+bkT/ZcS+gGGNiSY/cYfZ7R+lfYo1g5td/HrC
 DchMO7z9aBWLH+nItdSnLRtbHttJDj9xgEmj90Ym+DRLXWPME4RohZhujL7yVANlRCZb
 Q7qwCcr+PVCiijBHoMgzUveFg2DeNKVdIaV1P5KA3GMrLM6bbJcF9Utll4UfgNTXmjje
 OHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735909127; x=1736513927;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mj1C/gEdKkc2DLeyCME5RbzYecjWcWlcP/v8o/H1DYU=;
 b=WvAfONbLlvuywK5hx+kwPdj6HEcw3CjsHoCzBSqiOBxq4jD0W4lVaPa7LIZkiHPUv+
 hYRC0tpwLAtmArJ7upttOTCU2YvwHt2V2VZJC8vjxkX0EGf1ccevclCClt2YvxnqZRBq
 mCZ8jP7j8vLrDPRGna/qxr73C8uh2zmv3ibDZBuZ/m8hkDLX3qALr2O5kiQbanGZaU8m
 cBHkeCK4cccOlByIOHWnLisVRWZ5c2wtLkmP8Ym4NRBT4i98a5uB62aei0qpOrnBGj1m
 kjIbEbBmUrBcPdLL877FVhsQnjhB0f0iNDErX2S5JgHcHf9d2kMDhr2M9HDB9yQ9d5FE
 KhSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXsZdW0VEFT6y81shxEoGS+uoBJMdiu3YWnknSwtGfyY3v8R2d65gsIMqdhJUeIpyC/l7+UEmH@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6GvMyZ0IDEg9IJAwacKzTuN7d8tuz7NS0bwguqze02i1xnqkj
 0YRbhBIwIVi9O+as50TlpKYiQZEIh1p7cJOBs7TCZxWeRb6eZISpR6nA17YcQ+s=
X-Gm-Gg: ASbGnctQxU8rthtKTKQ1qgZlnZXJJJENBoKA63xbLSkOTRESRJ/VZdUcZw2PgNHn2Lz
 ggYDZJVoFksTveUQtUfrqsVp/3XNBqWm8607Exh3WgXBzEoh4xB/Y7klF4yHpZQ06zmyOydoRPe
 O4RXwSu7FVyjYEU8dS38+uApOnRMAYnIbWTixn72HOJm0JdWn4KAm/ILjUwxSAsD6MxICUGzXZj
 XVpiFQGnQ5vQ2kjulxaU1oo+9qLRqhlr1Az9Yi78OooKLmgqxoXHGYV
X-Google-Smtp-Source: AGHT+IEOj1biKK+ZR5Kvzu/bNmgXMB6bfwX33snuXM4/eB94OvmJ7i7TkywsbUI/f94EkhNCJvhs5Q==
X-Received: by 2002:a05:6000:2c2:b0:385:e30a:394b with SMTP id
 ffacd0b85a97d-38a221ea33cmr37961651f8f.16.1735909127054; 
 Fri, 03 Jan 2025 04:58:47 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Fri, 03 Jan 2025 14:58:14 +0200
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAObed2cC/53NQQ7CIBCF4asY1o4BWrR15T2MC9oZlKSFZiCNp
 undRTfGpS7fW3z/IhKxpySOm0UwzT75GMqothvR32y4EngsW2ipayUrBcgj4ARjGsEiwpDzxJD
 ZhjRZppBhjEiQKIOq9j2aziHJgyjexOT8/d06X8q++ZQjP97pWb3efyqzAgm9dV3XNsa4Wp4GH
 yzHXeSreGVm/aG1+onWhUbTyj1h1XS6+aLXdX0C9/b2Pz4BAAA=
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
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, Imre Deak <imre.deak@intel.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3566; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=7n3rMuTJ70Req/bYVP46W8kBnza87id/HcUwiW7e2DE=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd9788w0pa/geOfKLRgX6m2PWun+geT5T3rVwc
 jMKtsJWHX+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3fe/AAKCRAbX0TJAJUV
 ViWPEACWG4nM6qgKiDXA+xCVxpDZt5mhxx7MGILuTwIcxJ02pA0tflGE7Dy4OsfVGIhOFk2cf7K
 4xjT27auGoZkG/suv9djSXWv1neHZBENEF+jet4THElETRhHuoiATLlXiZOu9e6rHZBvTvUX3CW
 aLvxsG6G6OhMHxLlD24hy8kLqgNxZQxQlFne83p5kun6RakizLH5o51xgQ7AqG37t0/kHeRHPF5
 mcfjw4Ckv/aQoYDFLNTPZA/KCn/lYyk/GBrfSmco7tvZv/CprWFFFe9//NyeB1xLk3HF0NuVGA3
 jeQB4CAt19FD0SmQ+umNhjHkQmnezWgSlVxFlVC772KAgiBK3jjL7tRAK84yp0dK0V2Q28+T/5b
 /6b3GnHqclTSB4rUZwGZsBsUKxScqufyuPLxnMFca4xE5S5uapP5WnmIpxI8If2NvOG2KroFkCL
 AQo0uvpZ5LnYYGMDkbwNo/Ed6Ljcd5LGNrezVKtOCzlkRM7hVi2DU13jcduxJFlwXE/16MCO8Sa
 oRZI7mtVzsZJ8dmtwou+4y5rNG9jlMvU9CsmCVjKYcMqAXKx6OGxNHiDGvE8RTRZtvXUJ6fSIw7
 z8Khh8+uFnNyOWIkETFfreLSUJvbD+y6UxRvJZNDnljS0xBecn6ii2M63KKMWPCB7rhh6ZPH7nd
 8asiH73TzAbOiXw==
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
Changes in v3:
- Picked-up T-b tag from Johan for the drm/dp transparent mode set helper
  patch
- Re-worked the return value of the drm/dp transparet mode set helper
- Added some more details about what the values of the lttpr_count arg
  is expected to be for the drm_dp_lttpr_init(), like Johan suggested.
- Re-worked the non-transparent mode disable->enable so that the rollback
  doesn't happen unless enable failed.
- Picked-up Lyude's R-b tag for the nouveau patch.
- Dropped extra parantesis at the end of the drm_dp_lttpr_init() call in
  i915 patch.
- Picked-up Johan's T-b tag for the drm/msm/dp patch.
- Added some error handling and an error message in the
  msm_dp_display_lttpr_init(), while dropping the unnecessary lttpr_count
  local variable.
- Link to v2: https://lore.kernel.org/r/20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org

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

 drivers/gpu/drm/display/drm_dp_helper.c            | 61 ++++++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
 drivers/gpu/drm/msm/dp/dp_display.c                | 17 ++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
 include/drm/display/drm_dp_helper.h                |  2 +
 5 files changed, 87 insertions(+), 34 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B8A05F6F
	for <lists+nouveau@lfdr.de>; Wed,  8 Jan 2025 15:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DCB10EBD3;
	Wed,  8 Jan 2025 14:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NnT+xc0n";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784A10E2EA
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jan 2025 14:58:29 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so5010947a12.1
 for <nouveau@lists.freedesktop.org>; Wed, 08 Jan 2025 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736348247; x=1736953047; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nxLGQEDMPtD183tpaO1bgNB/TKXIgR1C+GAZs1bJ25k=;
 b=NnT+xc0nvtGKUAcNmL7W+8iiYxoXkkDxdDXoKa1LdBiUvHpX9BH7vQFgX0w29j8GbW
 rEZPy6S8pBqlauFGFSloDls4G2C4LOTE1xUKcNAkKrDnxsRiAc0emh/NfpODcxchYBth
 g5TyQR0oJ+jmMlosyIk2h+udJ6gKXS/tve6fEAota+B0zAH64QWjqEATGqjnt5mi4fdO
 IOUCTu5xlCrcO2MLcPhyf9hrA5kAYlUG3l+Xsa/Dq/KvZK1L7Z4OV1LaRX2Aa84jebKd
 AAjVTT2E2sk3M76cmmHHRkvbOubl7p4AQmIdvpShYC9gwkArZnrdBlhTroLYZY84rhxM
 8KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736348247; x=1736953047;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nxLGQEDMPtD183tpaO1bgNB/TKXIgR1C+GAZs1bJ25k=;
 b=Q9GLYsbfyqxbeiNWMBVUOyXrcuevLe63byLj0AwZh20einKjR9HlqRKRe7U/Za44jW
 R47qB9UP2/XSAPSrJtf5HTE4x7rRqpcoI61NImUbBLcnsgrJR96FlyKQr7jVAJXYqNdi
 RXFf2i1SEYUdb4dsgTDzv6XUITH0E0WnrdZdsA7mM/xkVqT9ZuUa2Ck/7aM+kJpB6QDE
 +PymduyDk5lr2vAdHVD0r/olOzBZZPWygU7BZco8Cu/oQK+eMO7515U6B8lYzWpeFlvF
 4pIxWZdrRrmNZY/WmSaUko90XqWPfRtYGzQFJHU0b54yvlcS4yrVfVmzGL79ZOQZswKL
 myfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0O5QLhQ3MQbciijaVVYP0o8IewNESq62dHEDoxgwmDfzE+Zbk74YXsJCaCYf1KPtXn5Fq9OCr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWKnGAD6kZ9IaBdGSj71i9Vnz4b/+guF4bhSXPbxZ/5H1ZTdPD
 kf2YKSvurmGE0cDAXvwlLJRnHJMlh8Nw80/1op4anN1T2LsEhdvGWAbpJNfEN1RmYPHMOAycneY
 s
X-Gm-Gg: ASbGnct+a0Il/eI/+pHRoFKysyzDwoWWqueZlKVfGxH++o9jRzg8FXM43hEilDP1OZy
 2dsJ9AP4UzEOoI/JysEf+M74ESi3X4qS04lgKGwZBuLO/p1N5OaS05jbE00akBTUGul5acgyHDQ
 8MdO2Gz9KG2fDBYFnt1fupXPjOfaCbnBoU8J8MlSyQ2+qY5YHUKG2P4VN8jgUAvo4Rf3eY+4BI3
 ZOAbWKaDfF/guMFK3+z1SUhNlwa8qY7vterSlWOLKxqS6UWWuJbQHJb
X-Google-Smtp-Source: AGHT+IF+4BJuelALL0kX/bpo95c7rpr7kjWjUMQ1Q3GKwXReRDAQAIpMxH3G6HI0ncvlTZMIBqUbSw==
X-Received: by 2002:a5d:5848:0:b0:385:f7a3:fea6 with SMTP id
 ffacd0b85a97d-38a872da433mr2578805f8f.13.1736346723190; 
 Wed, 08 Jan 2025 06:32:03 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:32:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v4 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Wed, 08 Jan 2025 16:31:42 +0200
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6MfmcC/53OTWrDMBCG4asErTNBP5btdNV7lC4kzygRxJIZC
 dMSfPcqgRJKV8nym8XzzlUU4khFvO2ugmmNJebURrffiens0okgYttCS90paRQgz4ALzGUGhwi
 XWheGyi6VxTGlCnNGgkIVlOkntD4gyUE0b2EK8eve+vhs+xxLzfx9T6/qdn2lsiqQMLng/XG0N
 nTy/RKT43zIfBK3zKoftFZP0brRaI+yJzSj1+M/2vzSVra3n6FNo+1k+iF0Xg69+UNv2/YDjrF
 tFZkBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4108; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=ZClYMHhO90yxP02Bf6DXqae6J3owpAkl8IL86ewSv3w=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxYh9oLMlCfm1yqHjBxsGL4ZQNZaXg+L2Pps
 PovE6qSScGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MWAAKCRAbX0TJAJUV
 Vs7MD/0XJvOEeHzxnCHJv8GLI6NnjGNoP7ACN9V2PtSecMfT9742OCDGdfAdYF6nvuky0jtSkwi
 30gSXj2NM24yBcuDhFO7Qc+b9ITjIII3YLiCFeTt1rOKnpkJBR7nceOKYDFmVp0BCjQYxQqCJok
 +Zh2jm7X68OIm4QrO0KVMRuNEUBbSv/aE6Y1+EEnEb+HvsBuXIgnqazVAzYsRUXfTnXNqttfN4+
 OVcq22LApVK5MkDXl6Yxn48WN8a7X7M8qU5KcZ5c4b59Yf+NJDf7uglkbf01egPbF07YgtvTKw3
 tjH40mOame7qtDsag1HdLPa2sT44V2bK5C6sDIPqXuM/wU9e+54nJx9SGoWNR0P3I09M32rvPVa
 hsrWgcTiXnxpNRJ3jNy9zIRyGuQ0YxFLtHZAp/+BXUug7ARUKhUmujgFhi9W6HXSM1XoWIGBoU/
 KIam6xNp3gjBC7STHBNwz6v+8wRv2HMIE8+h1RAgWI0ZQRlHRupdVOtkNX9Rz6uDXuFSfyqEWZC
 Xp0admjTecBy/FGDyPCgNWUTlqgYFBJM24Oa5C1i0cz4O10daXenYJqD89leNWo6bXqEt4aNBBV
 Jg8toO+d5I5oF6zHkTzyBN6dtisJSurg6v1QIey0ZJq0Bgzs2bqRSdGV+rrYzwT8zTDgC5LvIvt
 UjoQYLnkpKflVoQ==
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
Changes in v4:
- Picked up Dmitry's and Johan's R-b tags for the drm generic and drm
  msm patches.
- Moved the comment about the roll-back to transparent mode inside the
  if statement and fixed the typos, like Johan suggested.
- Added more details in the commit message for the i915 changes. Details
  about the update that the lttpr_common_caps need w.r.t. rollback to
  transparent mode in case of failure.
- Link to v3: https://lore.kernel.org/r/20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org

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

 drivers/gpu/drm/display/drm_dp_helper.c            | 62 ++++++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
 drivers/gpu/drm/msm/dp/dp_display.c                | 17 ++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
 include/drm/display/drm_dp_helper.h                |  2 +
 5 files changed, 88 insertions(+), 34 deletions(-)
---
base-commit: 7b4b9bf203da94fbeac75ed3116c84aa03e74578
change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


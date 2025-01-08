Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CFEA05F6C
	for <lists+nouveau@lfdr.de>; Wed,  8 Jan 2025 15:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D10F10E198;
	Wed,  8 Jan 2025 14:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QsjxyD6i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CBA10E198
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jan 2025 14:57:39 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ab2bb0822a4so87257366b.3
 for <nouveau@lists.freedesktop.org>; Wed, 08 Jan 2025 06:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736348198; x=1736952998; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
 b=QsjxyD6irafh50I4CJFihjJkUImnTWiFfPUmnD4KSVaKPJSigPTrMtgOn/GdnVTT1I
 ZE+Fttnga+NRd6xq+uUpgqk/ufBO2RHKvdEZjCP9qFR5iJ8Uun04kTYZjF0lc3BdvSbG
 Kaz4+XkgLPUm2w/2UTuc2QrougZjcqGUsQdQbq3og9EvWyagoppXvlBsqITmVDbWe04g
 QX5WsLd5i/xUr8TfJFjv+KpA/pB8ZqUb7Fa6jTg3ubuP7sgG1BOVRlck/pbn3uI8S8dc
 hsoufRTjrrQjQolSE8htuLBko8+Hgg0/3U+qY8S/IXMflVp0RtwLdGtutw4k8moxURL5
 FHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736348198; x=1736952998;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
 b=Am8AUgycwQLvLl5J+edF76ksMqJ4ta1S5ZEgWbDawcML8IPPNi4WCvD9gNhWD9R6KA
 xmYUhljlwmFKK1nMWxBpjEmee1iQdrrxcz4mityDP8sbhJH4In2lelBudN962QmCJCzF
 5n8R2TrAVrqVCpaWE/Qd94ULZbEtZRFnLmiHRNu1TB0z4XFaBbz/kgx1knn8zehVjY7E
 wXfCKtm88nbKag4BdnX1tsxxoiR9qawzz7NNj/HAdz37Z/K8OD3zOsLvkmTM2nlifpY5
 DFSP6sVn781w6y7oB9GJ6aIXUHS5Kmtwf3C3FuM036PP2vpvijurbz+bLzsVIYLisNna
 OZmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE+Ip4fgBsGRkbD4h/PVJeRx85VBY4aW670ukUfDvgU2yLlLa++Msg2XsXp6j6qXpqjJNqe8SK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfkEqOjs+qkEOYxOFgyvquk9D8FRK253khMqJrE8vmxlyEcziL
 SdkZYPUy3FJN++7bijnGxEbBdWbpA9qOe9h+/oKh/4D00IZ5QDenKFggLhkBaixlgja9OSj7nvx
 G
X-Gm-Gg: ASbGncuQezbeCYuctt91uiY2zmWUPLKivXFWUd3efK4r/XIMqtsPnjmvT6kp2C7UpoH
 0k+lg+KNBrS4OPDMKNZyRXUoyGWFM9pljVLohBg0ns0bvIdUIc1GyPAu+rpHKA2m985VjunXmVb
 ZW6lsC/u2SbsuWbU3PCHz9vZ/H4x4xVmdca7RXdKLeE8F7HG0C7hEwBQY9fbvk2NSpQUT1VmhIp
 CnFVa+RyrcQIHFZCYb/bVPFESHVni0VVpYnrpIjKQBEuwWP57AdfO5x
X-Google-Smtp-Source: AGHT+IHOFNgi43hh97zw23/scdO9rgdvzo4suhicC6urfK1gf1ViwOyw1YHkL1LYT0r9NFeFOfWQ9Q==
X-Received: by 2002:a05:600c:4f15:b0:436:51bb:7a43 with SMTP id
 5b1f17b1804b1-436e26776f7mr25763075e9.5.1736346729387; 
 Wed, 08 Jan 2025 06:32:09 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:32:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:45 +0200
Subject: [PATCH v4 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-3-918949bc2e3a@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
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
 Imre Deak <imre.deak@intel.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=i0gLL9cKFwnwAUFAvwIYOq+eSp8wWGGPgQgjnTN3PKE=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxeHNki79B0QYd4mTUlmaS4L+1SJlhYA9Z/v
 A4IDLvBSQeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MXgAKCRAbX0TJAJUV
 VvsXD/oC6cp0EXwMhmMRSeEBz9Zyx8ZcCFWQr/TnVk4AXiXuzPX9TJGnd77Zq+bPTvcfFEkGd9T
 2iCgdfAC12kiMTsTGPfSC4CJw5A6F8fKgAu3Gzm9mhGMIvSEGMUH9ObSxk8aLljgxHjWqJdBfsS
 PnX+z1pwhNwDf7dJMqmeyDCUtaTCAOX2/0aPtGYDaPV9+5xHAUDipJ8/6f+XAbgUKLmisnmVeO/
 x1JN8l4JHYndHJ0UVM5r86iEytn0+7Y/WDSv5faTe9lxmZXBL2vbr+IGwI25/dsCFbueTZxL1ot
 N4uZBzIFRqUMN2eTq2DHF2IKtKoSHsEdDUcrGkmolIL+4B2BIP1mrjrd1N5MbiFtEaHfmFdNkzj
 XNSijG0GamQoUl+OC+VC5AyL3QYvG7X80lZhthpK3Ad4wiXzqJG59so0TeEpx9OWAqs7BTGdF0T
 +wwS6vXDmzqygQrfXuQfY1zatwG0RZHuY4LDJz8U1rs3gb2HUqgxesCwaXK95u4Xcms5qGrr6Qf
 V7UFT8z0OFgZ6jzG++l1+Ud28R6i2GbJgISqMjRqEstLMKA/HPo8db1bIiY6lgiMTj3Qth8kcSA
 lY+oYAQaSCGcqdUVuE4D9b8V/3CL+h7FF4sSgISfB2xfD7eq2XAV43yQ4tc5uPB2BiqR0hqyuPc
 +ZR64oI0/smoEBA==
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

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner. Since the driver specific implementation holds the
lttrp_common_caps, if the call to the drm generic helper fails, the
lttrp_common_caps need to be updated as the helper has already rolled
back to transparent mode.

Acked-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
 	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
 			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
-		return false;
-
 	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
 				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
 
@@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
 static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	int lttpr_count;
+	int ret;
 
 	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
 		return 0;
@@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		return lttpr_count;
 	}
 
-	/*
-	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
-	 * non-transparent mode and the disable->enable non-transparent mode
-	 * sequence.
-	 */
-	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
-
-	/*
-	 * In case of unsupported number of LTTPRs or failing to switch to
-	 * non-transparent mode fall-back to transparent link training mode,
-	 * still taking into account any LTTPR common lane- rate/count limits.
-	 */
-	if (lttpr_count < 0)
-		goto out_reset_lttpr_count;
-
-	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
+	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
+	if (ret) {
 		lt_dbg(intel_dp, DP_PHY_DPRX,
 		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
 
@@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		goto out_reset_lttpr_count;
 	}
 
+	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
+
 	return lttpr_count;
 
 out_reset_lttpr_count:

-- 
2.34.1


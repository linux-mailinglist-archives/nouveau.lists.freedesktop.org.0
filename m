Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94296A009B8
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2025 14:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4927F10E8A5;
	Fri,  3 Jan 2025 13:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h7vp9M6D";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1534F10E8A5
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2025 13:06:51 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3862a921123so8304197f8f.3
 for <nouveau@lists.freedesktop.org>; Fri, 03 Jan 2025 05:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735909550; x=1736514350; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VITqw/dBrN6Eh2YzRoSLvwchdbQ5DNjyYt5nkHrQ30o=;
 b=h7vp9M6DuS5enSupHse7s4XaZ6ENDs6PmCrUh2OFTrdGQavOIe7xz4C4ZOty9SiFug
 dCSVggm3x+DrK3GlCGpSdF4JW4diyt4V4CyfxouoEBsn6ktlAjFJpxq44qWWhtVcQoWE
 WBD4GhfMeZBKKxr9j5XllK/XY+VhIRHgcOVqENpStcvNj91UakL+M1gaj4/dXW5Y8+5m
 7sE9yCzgtI7Tohb6oGxzqI+SXXMPKvOi1vDj8X3IYjDH3Nq4+0X6vmfKv0IhSsHE0QCU
 mrfkcX1G44u1ORd7DqTMItgUMB7oztQsLB83NZ5BGv1f5xW0XLIwxmc4CdWmCiiyrt4a
 DQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735909550; x=1736514350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VITqw/dBrN6Eh2YzRoSLvwchdbQ5DNjyYt5nkHrQ30o=;
 b=E6bMdgAuqIGn+wKeREJEuZCiYM0NW+yo2EEn0VOTxN9StuQ4w1rGzuanPSRJ81RDzS
 xd4Vg+vCBXlmzmWklD1nBZU6aNvcyizEIuMT8W8dIU9UANPwpJ/n15NDgv/QloC2oelP
 Bb9FbO69wvefKjaYyZ2UZTSgJfIR7D0pEpC2sxEXomezluNxZRv7yTNhMLM3f5xVy86r
 FU2s9Vj/QsweleUB7Z8Ni3ezh2qWkQmvxBns4ZPovYQjXKHL2T6V34sLla/jPw4qftPm
 wE1lubd5BviCIaZGO9GWy1954/yPeWpRZfYslR3D6Z1Fy7hCPamcxNo1QhumHkJMjaf8
 6kHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtw45AhnCq1481ckIJey1oczjOPfWKmzqdYwDH1u71tV4FED05IgHPL0MlBuZzSAa/KYUTZNCE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFcNe7sQMeThwQcIuMzMR18VYokyWnQ0w+Y5rzRT73oWzyuAhF
 iQIUKsEATY/Lfu+2ZBkDpofA2blEwPUrbik793DJy03aSLKLjqvPNESOcRQhmPkvO8sPVHYPGvt
 a
X-Gm-Gg: ASbGncvD5fJrp0LsPKW8RKHrtRmJV/addI6gK6WCKDUPA2rEg8ObvdmYiGrH1t0ZVeI
 QFYKE2zFXN0nhR5OhhxgcL/6F/exQyP/TFul3WLH6je+UiJWaGrcKLtpyzenF9iucjDZU/TAZQP
 4fMdkcURGq6IFFe/xBsKSXCFKC2DBTT23FWLKWtoHGxK1Y3DUPXWpxUkOoOGphQXbsYgKoeySoo
 JfadaZ+T7nsvOdRXfhuHaTi4AemrUTMmQwIPudXEr0RjDwTGRC56NmZ
X-Google-Smtp-Source: AGHT+IGUnpXjnchYmTBFtUQ71LNCqNAU5Q0SOmAgi8sEQyivFL6wDbTXzLedPgyb7rzrtBvhgs98IA==
X-Received: by 2002:a05:600c:468a:b0:436:1b96:7072 with SMTP id
 5b1f17b1804b1-4366854c062mr416478835e9.5.1735909135449; 
 Fri, 03 Jan 2025 04:58:55 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:55 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:18 +0200
Subject: [PATCH v3 4/4] drm/msm/dp: Add support for LTTPR handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
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
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zhRY8lT1G9JeELkZ54ealjEatpcKTP9np6vn+j2kA9w=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98D5vjbEpomMQ8dXV6RVZNIUGfQhGggxggBR
 Qdgu7UHk5eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAwAKCRAbX0TJAJUV
 Voh8D/9SfWx0sZ/dkeV5jYSYWRDoRArPfvo/DRVwDxLshqbRTU8todXxZViuaYxdh0+wz1yC/Tl
 QEgnwoaexcdVCEAq25zErdxGc4DeAW9RvqP/VVsiJug9NL1tl3wpnml4UY6A5JfU7ZB3/JOy9/F
 /ONMwxpcEqk7hKvuddzOaCg1m/haAPzk+i1foSK1pMOcFttgGGASktqORFxgTLVEfYY8cHB4yxM
 dvBYkfyMHeH4AHeDxpk08PfpDC7+kdjNESFHUjBbTQXdkT5tEu/AGxWOoyPQ/T84KwG/0izcapT
 mM2YxbX25qmTlAbYB7G6xo0nZs9IPz1lhpDnv49OF6A0Cji+YOfhvDdQizk4uDXrcS1rwEqNJja
 O82hu9RoIPEiXDGv3rYeLjA/4mkctvac/eWZv3CKxxxadOQfbX46cqUP5ax+8tvgzsY4GDpQ97M
 o0ZNmdt1dc09tsGlamOHx4vapCTX3qSXt9Oj8w0HWezaWJW0MHuDfoH+tZpHYbYZ5+J4i2DExJK
 6igXX5ziVN/sJVwhFYPYRdVp0T3ZkUkCpBTJRBAG/+6uS4hffPzIh+wWpkfNmHMhAatBd10ifQo
 SovAsasDDp0M8XgZ6QSM4qpqr2Z6a0qO6NY0DuXvyC5loIDA2uFCsYWFvBQe8y3+YQAOqdaq5ma
 Xl+1+4xOfJyy7zw==
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

Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
1.4a specification. As the name suggests, these PHY repeaters are
capable of adjusting their output for link training purposes.

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

The msm DP driver is currently lacking any handling of LTTPRs.
This means that if at least one LTTPR is found between DPTX and DPRX,
the link training would fail if that LTTPR was not already configured
in transparent mode.

The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
that before link training with the LTTPR is started, the DPTX may place
the LTTPR in non-transparent mode by first switching to transparent mode
and then to non-transparent mode. This operation seems to be needed only
on first link training and doesn't need to be done again until device is
unplugged.

It has been observed on a few X Elite-based platforms which have
such LTTPRs in their board design that the DPTX needs to follow the
procedure described above in order for the link training to be successful.

So add support for reading the LTTPR DPCD caps to figure out the number
of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
at least one such an LTTPR, set its operation mode to transparent mode
first and then to non-transparent, just like the mentioned section of
the specification mandates.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973ebe0835c96420d16547ebae0c6c0f2..6ea8245284ab5b6068bfba64f01a960838f577b2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -107,6 +107,8 @@ struct msm_dp_display_private {
 	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -367,12 +369,27 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+{
+	int rc;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->lttpr_caps));
+	if (rc)
+		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
+	msm_dp_display_lttpr_init(dp);
+
 	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;

-- 
2.34.1


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F2A03DC6
	for <lists+nouveau@lfdr.de>; Tue,  7 Jan 2025 12:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E1F10E403;
	Tue,  7 Jan 2025 11:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R5HlCX9P";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D110E408
 for <nouveau@lists.freedesktop.org>; Tue,  7 Jan 2025 11:32:34 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-540218726d5so15902438e87.2
 for <nouveau@lists.freedesktop.org>; Tue, 07 Jan 2025 03:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736249493; x=1736854293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G3N5s5fdL2YNf7soMuvHTeYgJ8vy52pHoEfk/tcGSD8=;
 b=R5HlCX9P2+IGbW3aQGV6h+SpZEdmyeGZPruuB5C0nX7QtXnh5uBl4Cf9cg9TqezUuS
 GbEdiF1M3qxqdSk8JPJCqv86EJjI14TnJEmjNy0GBpxgis4h1cHbsdvkTr5D3hdoNbw3
 R5GCqh+/uXz4eOb6qRmUPH/aVfqYRnd337qs1sqqEeVdUfwrgfxShOtTCqKq5wFKimgI
 ZGnQfja2tN95ZydphVDeEvKgBggkkbvPjql5BoXSo/4r9iLkHJZmpS5RUaFrgLgzhdwi
 KnX9hKWQQDnqySmG9tEOxWN3b3BW0yVJi+Yu/unG+jcqDqxq5euOtAL2FZ+GaHBFwsLe
 FYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736249493; x=1736854293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G3N5s5fdL2YNf7soMuvHTeYgJ8vy52pHoEfk/tcGSD8=;
 b=NtShew2RNjs5/uuHAUXKiIwT4HMMUfXYrcEWyC8d+aCls5tPcYzJq8i5BrI4xXwTmN
 byUDCvE+9nG7AmEHg6aolRD7R8qruYgrN19StQk5pdxoqMpNgM9wejD/JJSx9vGrSaDN
 +rv9KcvR1B75JrylhxHPwU2x3HJ+9JUP4EGc1T7CZIK8dzNUWZrHMbWi7ByLsg7BS+vL
 5VkdrWXGD6XaBMSxSvCod3UbPrLr1Dp4W9EbICE95Iv2nUjqJiHVvXfjQjrI5alnOrdU
 uuBm9C78rvEB5WF4YVY6VVKzhdJ/bvSHHs578CKhjCLTrvsB48ud0bLhW0iZG/gaJJuv
 assA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn0tE7GNs3HgdwWavz9DZA+Xh8qEwFUEqDD1iSaSAZOdu+eJP0Y7X1IQw+8pZ2+VLq9K0y6PSW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztugomlBjDq0Y78yCz4oDLb8TwqsZfk0X+2QjZIZWQVojYkbRo
 KQuh3+m+k9udwd04d37OJpGeod+I3WlPs4LldO4OyQGo8j/qpxpAyXeTHJR1npE=
X-Gm-Gg: ASbGncsXz3n662BGvR30dJ37V6q6PsVg/De2wEbylSMa1fMeKXFA6rkzbphcbmWneHq
 00jbvnkSqMH4KNrtxsLg5R3ZuQSx2dZoURDY1ksGt3D9ygJd4sIk9SgODj5H0C+Ke1cqiI+u6xQ
 ghtwf7KUaFpTKJ4He1VbZYRvPQt/HI+yKKILDgZ6mnZzXxGzD7UrdGM45BgIwLQjMMYZPo1roWX
 9nbGpLtf249LG4NVFQwtP4tb8cHQ4CnGmsY8k/wsYXbrbd1M+Fnp/SaoZSmvNZy9533vWSNa1Oo
 F7DDRL/yjF8L7OoVlLHwjlXA
X-Google-Smtp-Source: AGHT+IENf5iIM0eyUUKKI+rIQnGA5rELVSy2jGiVzJtZlwGnyitqzrPGGRO+n/bqFHmHqnjQEDg7ZA==
X-Received: by 2002:ac2:4c4c:0:b0:542:7217:361a with SMTP id
 2adb3069b0e04-54272173890mr3514721e87.10.1736249493006; 
 Tue, 07 Jan 2025 03:31:33 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f658csm5169219e87.44.2025.01.07.03.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 03:31:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
Date: Tue,  7 Jan 2025 13:31:28 +0200
Message-ID: <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> While working on the generic mode_valid() implementation for the HDMI
> Connector framework I noticed that unlike other DRM objects
> drm_connector accepts non-const pointer to struct drm_display_mode,
> while obviously mode_valid() isn't expected to modify the argument.
> 
> Mass-change the DRM framework code to pass const argument to that
> callback.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/encoder_slave: make mode_valid accept const struct drm_display_mode
      commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
[2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
      commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
[3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
      commit: 5f011b442006ccb29044263df10843de80fc0b14
[4/5] drm/connector: make mode_valid_ctx take a const struct drm_display_mode
      commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
[5/5] drm/connector: make mode_valid take a const struct drm_display_mode
      commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a

Best regards,
-- 
With best wishes
Dmitry


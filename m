Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC35A446CA
	for <lists+nouveau@lfdr.de>; Tue, 25 Feb 2025 17:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98C510E756;
	Tue, 25 Feb 2025 16:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eoRX8dAK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A3210E75D
 for <nouveau@lists.freedesktop.org>; Tue, 25 Feb 2025 16:49:39 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso51344651fa.3
 for <nouveau@lists.freedesktop.org>; Tue, 25 Feb 2025 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740502178; x=1741106978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0mgWZibQMuHj44S/S8PoDTRgBr00ghmQvGRAk6+vKs4=;
 b=eoRX8dAKzZZXlynfyIAwCHv7NDiGxATa1HbDJ0Cf7qm7qDe1AdRjOEt3+PT6xz8ROX
 tVEPpXq7AK7diZFRjebygpSLc59tLee0smwdRtKYMqEiS6sW//RjPtgvRpOOkvEhY3mW
 +EGKy4cDvAxASbAnrM4SpjV31YlH/USmnS+yPJbqvwaW6Ki6TwmxsFv3+NMGY54nlKCd
 zbGBL6B674Y7WwgL1v7miwocs3aP3n4p/892tg/p2G2C01Di8Ghzf0+Ifq3mjA9ScDGI
 g/LQU5T1rijBQan5nfnMWj9agdAjuTpgsrDsd8OtS7/h8RK0xhbAH6AvvLy0/igjXaz1
 qBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740502178; x=1741106978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0mgWZibQMuHj44S/S8PoDTRgBr00ghmQvGRAk6+vKs4=;
 b=ToUitFIsoEyPRXhMMNtZKYjZaGk/iRgLG/Zy/tlG7QNK7v/MPhwi81J4CEV2sJtkx3
 pMEFIqBUyP8OidvMQlgatIcKyndp3Hg0x2PLrujZZ/mICxtotcbb8UAcpm5lLee2td8K
 ar9xy3Xj9aCfdmO2U6S/OrK8ARx6FtOFB52rO4a3Eao+/nFze/XpaxcBktb7YN7KSAuv
 6/3x2jB0Ue6pHKvw/VHdlC97EcwfBgawGNmbWuDeUuAlWYXJU6NKLPJEyPP9xJINyeXL
 w7Z99ys/ce2t8V/kZoX/NWJWTae+3OnMCc3KIxOzOo2GGmd+QUKeGhII+F1CzXWdTlF+
 2RlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHOKWNMw/x65jmM5+7PCS6VXn7cP6BBZwoYTrz4owQlBjS0xn9H2weCCLVJM8cPb6MqZLw15SG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjuDiwQ2YdTQ9jxNYMp3G9vljXg7wdHI13m33nryrs4Df2i95Z
 BO/c1ndXK0BGirSR6yVZo4nYzVAElrZ84Jmw4KnLJlCZjet51bfZSmi8Y6Bls9w=
X-Gm-Gg: ASbGncv5A+depwG31CAEmpOW2GrAuZgXxwJyb78mTQG4kz/mGBqKXE2l5daaJqSEfha
 SqORbhkScRyGmx0ee2Abef3YFdseQdBI9cBCPlUTKXzaf1cThDDTEoAQYwk7KLOt5VvPub6W9eq
 a7SIh2DhSJbd5I2hgtVAhjB1KyDMsjZ2iz0z9uC/Xg3j5NqvXxIOQYssBLh1jYTr3PBk6q00bZO
 7Se4KVcZAmnqYYPt9+C89k5WoNTPwr1LVSWydYqwwDrXZDJNFUd064MqR07Mom1mgDNXpi1Dklu
 gO+mfK3V+9GDFiuhALdJ6kfwRtruQWfvG+6rKO1UcYYnddEKVcTwxJNexpUe8LaUuCfO4g==
X-Google-Smtp-Source: AGHT+IFORbfzYSemq6WfOCUglMYdhzTg71XD6K2L6XeaH8kQIvUGNHFObPzSD2MUJfic2yxCajAruA==
X-Received: by 2002:a05:6512:b0a:b0:545:1d96:d701 with SMTP id
 2adb3069b0e04-548392598eamr7478215e87.36.1740502177754; 
 Tue, 25 Feb 2025 08:49:37 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b25e6sm220407e87.7.2025.02.25.08.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 08:49:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Tue, 25 Feb 2025 18:49:35 +0200
Message-ID: <174050217098.2377948.2211237197268827323.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
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

On Mon, 03 Feb 2025 12:57:55 +0200, Abel Vesa wrote:
> Looking at both i915 and nouveau DP drivers, both are setting the first
> LTTPR (if found) in transparent mode first and then in non-transparent
> mode, just like the DP v2.0 specification mentions in section 3.6.6.1.
> 
> Being part of the standard, setting the LTTPR in a specific operation mode
> can be easily moved in the generic framework. So do that by adding a new
> helper.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] drm/dp: Add helper to set LTTPRs in transparent mode
      commit: 5e7715478c273e5b17b08942182bc0350b7ef3a6
[2/4] drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      commit: 226a0baf9098841ceb92ab7804a07426540663c7
[3/4] drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      commit: 6dcc3c5121b72c3633592db761e76083cf7623a3
[4/4] drm/msm/dp: Add support for LTTPR handling
      commit: 72d0af4accd965dc32f504440d74d0a4d18bf781

Best regards,
-- 
With best wishes
Dmitry


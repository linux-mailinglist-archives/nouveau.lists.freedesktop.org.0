Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5DEA009A1
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2025 13:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E50110E8B1;
	Fri,  3 Jan 2025 12:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j2vWPV95";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D126010E8AE
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2025 12:59:52 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso88954935e9.0
 for <nouveau@lists.freedesktop.org>; Fri, 03 Jan 2025 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735909131; x=1736513931; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=j2vWPV95WWCU00IyxNzOWoWD5Pf58RTK6TtxPlL3VnWxNwD2sQMQfotdtVX7Pcbrkz
 2bSq9JEGV66xsL5uHOakfUAr6fwpFD+DIr3+GTWI2if7LapFBv/1R9btZSJBAnLYC/4j
 RbY8yYHVCL2D57CtMR1dX97rGd/FdtVb+bFwrs0TcC/pBxBkhiuQcp8JqpU/qAc2Tw+Y
 B5yz4KfcxoLa3BwLryxH4PaZI5C7AqFcDLiOhZCZ52bWS1mliTyLpb/cAYvmIefM7uDh
 6/7Wmw7peuBGt5A2/7gVXdQpyNy9KGhxNq/4O0FQbfu9L6MLW3W8GRareIbg8ovmyhGX
 cWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735909131; x=1736513931;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=HKwNsNHEFX++NsXChCTNSsxLXK9iM8tvp1NhoGtwKmeF9CeXwAOdeX4vee8UpheZ1Q
 mIHq91M0iXAq3ad+6jUyejOKPTmTEZcsny76p72EP8t5lmUAX4RQrc/AGj+lZ7VnM1Yq
 1O/qbrr5a1sJFK9bJY6wZ63ZaVQ3AxWpsHWnlLogkUQzsFm2PnmnG7qroaltO3Mpdewe
 B54d0dkRbBN1Lp3F0QG+0ytLf87s+qJBagZl6SiNvhyDgV4w+aEQXtEIxDtwrkxYtjfS
 8jaC71YUQsMAFje9wspiUUMtXpoFKQ+gkxJFUXLy/xhexGkEk6oaBXhBT8QxKz7ENsso
 pZ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOsujKfTCFIgVWZpNbf29xVpVPaU9Sj2STYKp+hNJ03y8DvxUjYC4O3xtmJqUQ7kRcVzgKZWA4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjfSEJBZaC6p/EDx1xeAZvq1C7SPNWv6EoLK26AN5FwpS9gcw8
 3JShg3l6V0tZ9ozaU/SpnNWfd+gBiEzwd1cASw3SdzC8cBYC2atZioewJCdYILQ=
X-Gm-Gg: ASbGncttKqCIpfff2pXJNA16Eq7IIjD0eSUqFRCSC3uljStLoonwdVQD1D8lnl/Po17
 ESx+zOyeYmpumOwZVgS+37f80Sss4Jn0180mXqnb5ZlpQYIfiI34rIeuvGl/YsmR1bMIMD6eEqw
 TbxvYEbq3ljiYqRCSwShz6xV8hRfryxbhNNmmtgqBdqbkTLOgS5O7pmiMF/Sr9u99BTAWpXkz0Y
 7mPFncfdCtUf/8k0nwdYFDphRGbvvF6QTG5DADSLpiXIlm+uCHJ4yB2
X-Google-Smtp-Source: AGHT+IHuqDHnHcd3WF9fZflWdy+Epup29qUDvzgDke+6NvPjnNnt0l09UcQvUzjj7ALc15cgq9nQ7g==
X-Received: by 2002:a05:6000:186e:b0:386:378c:b7ec with SMTP id
 ffacd0b85a97d-38a22405d3emr42892574f8f.58.1735909131268; 
 Fri, 03 Jan 2025 04:58:51 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:16 +0200
Subject: [PATCH v3 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-2-5c367f4b0763@linaro.org>
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
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98By7+7V5W8HMUxlKldGyiQrYwuq4jO5Of1X
 B3VQSkyoXKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAQAKCRAbX0TJAJUV
 VuApD/4qJrXPMuVFlu1Y3C0w2QBGNOwC8Kd1/O1an/dVPfDmHFzp1BN4X5XeV54FXsFUPl7z/Yv
 CLx7tlv9WL2kvIqM/n93QJkE67uOATYU1pcOPkmnQc8HZ+x5JN2QZgyD3saXpcv2UUEzEMlcxY/
 KeZHgN4TKA7G4LZHG79/0tYd26xSR0HgOOpjD+ltQ8LCD9rF6zY4TAgCy3HgzrbQvBG8c++rQRA
 He8crsrdI25Xh1uXL+YuieNyNP6OwxpYfxbUcJNEbmfK66CDf7vHcbM8uyzR6+dq4DHof8D/VRv
 LL7F5L7VHvN5ysvlCRTuEBRaZ+k41TLkkCW2C2QABpXk/NE1Nc6honOz8l0kOnfxuKK6xqg+tgk
 5h39FDZEaMvbkcz2JD/Cu6KfhgNiqMeY/UzReYHNDVoK71OdB2ogBcdujH8tCQAhHoE1t06Civ+
 /x4fsT3oyE6IKfInlIDQq0rpK+4F6eDNwHFBJCCp0lIY6XWmTk1ehHrySv6zH3z2MbUJBNZsKQ2
 GKQO9QF7w9OgfciGKtoKNptEilU9MO/yIyih95mVXG97xYdGt1QwZqD+MjLVoihfhl9SiavHziH
 VbIalr2poTpXTXVQZ67PSqmogwtYx5ba2nwdNhrOm9hu8tu2/sXkpgUb5g86pQo3WI98DUoS2ak
 dzODu9EtTIz9otA==
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
cleaner.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22EA05EBE
	for <lists+nouveau@lfdr.de>; Wed,  8 Jan 2025 15:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE6210E8CF;
	Wed,  8 Jan 2025 14:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="guoUXtOI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BD610E8D2
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jan 2025 14:33:08 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-436341f575fso172848715e9.1
 for <nouveau@lists.freedesktop.org>; Wed, 08 Jan 2025 06:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736346727; x=1736951527; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=guoUXtOI/t/6DS0GFmMFpZ0/Y/219D+ZHVxHr1UrtP+mpSLtr9qe1PZnHSTpnF2put
 EJVflloEXlTjCIClmaRn3h6sWzNy16ZNnKkKzBEx+kCas6HI0jxOcLG2CNb2uR1tITqj
 VaCr+AcV8Yi6D3b5/Rl4otdUDY4f9XDLs5fQyNFAKxcAa1FoLLwOMjWRKJ/3wQvqE0Tt
 f89uvhHeI68qcQnVJ3OHZw+K5nI3OviTeHSZfgW+KcPt+nqTYyjEj3PmFtfioNgGaEsv
 eq+/36VvS7exjCDEJYopDpe23Bx97glsbgzVO8YZ17xRuKqBw2kan5wNFjEfufpoaIgO
 UWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736346727; x=1736951527;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=ZRr0Rkcq2w2QLI62l+P2n10AyP3JHA7VToF+jpnreZUXJo+wrdQIaLaOsE8PnGRqlB
 6DBRGEcP4fYiov7qdfiXM8zO1IL6+C2SzS2mmeHCr2IuhnMAN46KCVV1k26ehS5MZ1Ng
 9dFm19nvEB7u71ZsJlyrIo96bK+OAPwXe0RfZFTcO2+5iVJSt2RWebLRvqiwu9nKXcGK
 AXoTZJOpSZLfR2cWNNk5ykJzw9lyH4F3AMZ2IVFYC4zbcWsTcAAHaLRIVAcG6kbH8+Za
 JxYbMSGUsP4RfehzLLQRcr0xygKzPm/rPO93G1sw0NInc2+VXEcqBEatXOmSJZl1l1+O
 EX4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsmDS4U3nER9K6lXNxM/+OAvv6H+EOFIEi1BizmI/PaW/2eldxBWGUyYTkS7zPTIfy56cYcbfi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUu5vwlxfdRwpl7BL9vh+Am7Cn09Xi9qTwIDeiXDI3NWBlDxHs
 qVgMcJp5x2mCgKrv9dmeVtol+HIRt4Yti/q0k/puaRX0qo9A0bL8/MxVDdxGmxE=
X-Gm-Gg: ASbGncs3bFn7aWBv2ZcnNvrtudRwujltUQWOMxoG8YEcjsGmWh7lmQ1oPR69Bwr+3eM
 1nffSLaaPLXHNZKVAekw+A9FQ8FiqhqUtVJDo7BZhQK57Kg4ma6aErc/itwJ+Ffujolofub6Fdz
 40BcJS1O9IxZmrBIauOINfiAHUOFshiooIjUi+MgX9EvX7sd9z51VJ71K0Ko1f1KUKTA9A/XFqB
 +nx8rZGRtNUBZ2ijDe5tVZDhIE4jkDGd4gEpiv8XuQCx1ReNqKqoLCp
X-Google-Smtp-Source: AGHT+IEeHzOxvdMOGmcpEKHTmCQ1xR9X2mBdhrRAs090fw105gW9jWt3zL5YMm4BKVnJtfcnbPIJ6g==
X-Received: by 2002:a05:600c:1c1d:b0:431:4f29:9539 with SMTP id
 5b1f17b1804b1-436e26fbaa6mr23365835e9.32.1736346727258; 
 Wed, 08 Jan 2025 06:32:07 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:32:06 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:44 +0200
Subject: [PATCH v4 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-2-918949bc2e3a@linaro.org>
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
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxd1zaADCiqyAG6sqqGiZaCSMDvAko7Z/RAB
 qnzYaAuP/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MXQAKCRAbX0TJAJUV
 VsotEACKVYOAT4FX0Zl5/UtLfxszK6yqfSpvZBETDmfriJH3iARfEmyFCwzxT5krleGndSDwyWo
 muThvi9bmeveOffXwjS8yLtngaQQXm823SZWXLksm4rnDrgYtt8neXuYFKlkIwT7bLnydJ0DaJN
 JHTd3qWl1JqaA2voGitbWcjHGm+pQsyLr2qPugi3oVy0SbKleIX4uOHpcF/bie7veTJF4NIZIwn
 78+SUdHeJnvW0KMTl+Lx3YB+0kuMf0lzwSSFNiMZh8gAngpJQRE83FncDSI9g3RDXdaIX1VHmZ5
 cx/PkZKSloNzdooFCZWaHCeEShwsSeLD2xPGWA9JRf49cKwyEso50jtquK264rKvDzrAAvWV2QT
 6XXoLhrTkffqBoOqgbrc2WQbCpi2K6lIsWiqcKWPqfpr3XSUYpRNbvq+b0xwy42+D+LgpfbhUXJ
 dpM7NrjpU5qwl3BcPEHj+6IrytmW2bX4R5o9NArIQIi1rxnExJtr5XP9GGI7U3rHuW1wnciXJJx
 ogtweTyXXFCBIQXSAf4Uxwu+GkVziAZ1KkCB0OX5wDzOScajLIhPmr0Pt05vMOZbglN4KM2y+Rl
 esuSrBYIrshvVYjjyJ5H+uB0nipBl+fsNU0e9efycXuEOiA/7n2y7TeXx2vsg422BzYLPp0aHam
 l+vjJUlVNxarFVw==
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


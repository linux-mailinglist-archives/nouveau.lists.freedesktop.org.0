Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52100B3F5A1
	for <lists+nouveau@lfdr.de>; Tue,  2 Sep 2025 08:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5B310E5A8;
	Tue,  2 Sep 2025 06:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cp/bSDJV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523C610E5AD
 for <nouveau@lists.freedesktop.org>; Tue,  2 Sep 2025 06:35:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b7d87b90fso32891505e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 01 Sep 2025 23:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756794944; x=1757399744; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o6dRSOg31Mko9p5tril5Cb2sG6ftwSr6FMGcLX9f2c8=;
 b=Cp/bSDJVCJUhgIksyai688LzX9AMyTbwF6k2BIWnK5XxVz/MHG6xhJu12kbQLPi5tE
 KW2XqOABDTHxHJF023fQJVyRruLywJSgDlD7TtkXhohBulWxv5lybyHoTVx7e1eq3gu/
 Dnwsj0gfTQipVc+LEmWGgTunyNT/P3lXDPkhI/2NJxM76NWKauw3xciz7F0csrx10xmg
 U/a3mYUxBV03f/AjvnUQcEy/sT1zzW6m5qaqor0L7B2ZkdpJTNX2NMudH7XgTUbDVnKU
 sW9xJ1dwc+bqsNc5NC0wF77ko5vP0rrk7rmbFMsRYZk+D2NjkS3GtHwIlMpmEWs6uaeN
 mIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756794944; x=1757399744;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o6dRSOg31Mko9p5tril5Cb2sG6ftwSr6FMGcLX9f2c8=;
 b=bJmiHdQ6vwa0iFEdagY6E9aRz7uQOaq/xRMwc714UQNiYkbwLCqSBfGjZXcGzkT3uM
 iKi3v2gZa9x20VQYkmHTre9QzNOxFuzLMOaGqamKo4Q6Gdvl2T5fwwkRz4YdEewAOD9k
 Tv+9L6Io0ZKPpdJHVhIt1uwp/+5gJO0TlDPXEtfcYq4Pb1UgKsNp03FMqC754QQvqo5V
 /G6UAY3FQhdYIu9d3vqLiSYXWkU1MD2HGUJfgo3LWMbTVeZbHkiIJKSlU6w8nvkWZye8
 Zgy8F9wsNnPhYMYeeIAvzCM/lvsFj12b+QCVCt6ByoOqUB91R0dU8hZDySsIdAdhHA2S
 AgkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhdtmdZ9jPA2/cjWhuOkRgZcoetfbOWpYan/UG+dAg2DUIwXFBOnDcxeJske9POu3tLzYRhmPX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydIWbIprGgwGcEQVprQNEuqBrgDaamssy6qW37nU4NyZCAolBn
 wIrTmtv4nLxI6gDJrwEui/K8ZkmT1gftNU/jFxd55Dst/ZYyd1pgPoYBDmbM+aLs/Ko=
X-Gm-Gg: ASbGnctnoeGUiW9XJzhb+H14+k5alEoEO8gP3OKl5iy71CXcWjbyG9HL12O83Ueem4N
 uHHdOx2H5iyGS6N9NGN8mn4YHXqDBsGSGQQBpQvne5x2mjz5FzIWdv7HJvWddvjvy4IvNrWP3J5
 f7sWLNKSPj4jhxAFkYUsRB4JL0ntCgqJVFy+PZkg836xisvA0r5IHeNLH0ZT1mHVDLaTUoN1YyF
 pcZKHtJRM0lZMPcAoUwCRLXkNSf853kBXeBt2oqfWTTx80RpDKqkRX8yq4PnWc1j/KyuJ9tO/wp
 OGavi7WOh5G7oFQyVjRTaKbzkOfbM+hTbzJWNT+K4pgqo2ZXy1gSE62FDwztoQ7X7954DahBPzu
 lSthqFku1m5aPhc77hwxMa9Zg5+k=
X-Google-Smtp-Source: AGHT+IEnfjMtfmIxXQ+PI1ax+u6+bozcWFK3bQPZnYJtBudvpfl6k6o2nsV602G8vQ758YC6q09N3Q==
X-Received: by 2002:a05:600c:a30c:b0:459:e002:8b1e with SMTP id
 5b1f17b1804b1-45b8c05a036mr43636325e9.13.1756794943784; 
 Mon, 01 Sep 2025 23:35:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b87abc740sm117736355e9.7.2025.09.01.23.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 23:35:43 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:35:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gourav Samaiya <gsamaiya@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/acr/ga102: fix NULL vs IS_ERR() check in
 ga102_acr_wpr_parse()
Message-ID: <aLaQO-dpTsHJ-oH9@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The nvkm_acr_lsfw_add() function never returns NULL, it returns error
pointers.  Update the check to match.

Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
index c7d38609bb7e..aae96a94acee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
@@ -218,11 +218,13 @@ static int
 ga102_acr_wpr_parse(struct nvkm_acr *acr)
 {
 	const struct wpr_header_v2 *hdr = (void *)acr->wpr_fw->data;
+	struct nvkm_acr_lsfw *lsfw;
 
 	while (hdr->wpr.falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
 		wpr_header_v2_dump(&acr->subdev, hdr);
-		if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->wpr.falcon_id))
-			return -ENOMEM;
+		lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->wpr.falcon_id);
+		if (IS_ERR(lsfw))
+			return PTR_ERR(lsfw);
 	}
 
 	return 0;
-- 
2.47.2


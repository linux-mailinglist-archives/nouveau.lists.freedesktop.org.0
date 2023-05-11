Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78DA6FF8E6
	for <lists+nouveau@lfdr.de>; Thu, 11 May 2023 19:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10F010E5B6;
	Thu, 11 May 2023 17:54:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C51A10E5BD
 for <nouveau@lists.freedesktop.org>; Thu, 11 May 2023 17:54:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc4b88998so15824233a12.3
 for <nouveau@lists.freedesktop.org>; Thu, 11 May 2023 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683827686; x=1686419686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EQScT8GkY2Eioro0tIS01FKpHQljEwNBJwJbRAB5I3k=;
 b=Svo6UN8Pbv71gJ70I0Gni20C5gG4GAiJs+Yp5rSmL84xqbB/yGpOnUV3QuigP/Yx2a
 Z0BIrLoew9ihGNebx0gT4Kjo/5i/wz3K3tBkhvWEzjfHE9T+GL2Lr2sQbfAO/m8ceHIv
 x6aDj8AkwcVnxSrEkBWDOR7EuRqwNeCZgqohFV9eYiYqkdfE+cr/3snjE6Xh0n2iBfl+
 27yLRtCP1iLjS6gF6leqjJtPGxwS0KUX2Y2f7tB01rSvfvcpf+G6nW81uAX8AQkSjzoP
 MbGe1nrCqmJajYxxGRGsEtpGAIUYif2tYz1d/goCrpjeiIVJ6xhLcm0YyjAYVXu+WUmO
 Lp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683827686; x=1686419686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EQScT8GkY2Eioro0tIS01FKpHQljEwNBJwJbRAB5I3k=;
 b=JSBTwcrHGDGwJTq7iszDFBy+S67U5Pa6TtnmidVlt5/xd8w0vFyJBTkT7U5aMRrXqf
 dK/+QcUiwCQixMEMMM+NobhvB6PE4Lwmq8FgTZy2/vQNtZhA1rusSEpOKxR5XWmVyKXo
 FUYjXAAzqy7G1q5I3wX9p6CYyVB/LlYq9lnxPXr2nOOEO1Rmh8YaPAa1bRqVMUqybC7F
 eBKunE3RAgzsoWZYQs8qN4ybQ/CNLWc4/Lsm0/aR5WEzryQLsiGPdX/7T3LDtr/dYyLy
 kYIZaNFFei9wJn+/ZVJoUDQs25uv/A5H39urDmldr9t/i1EJdH+sQaWEHndJi62ecagf
 lHlg==
X-Gm-Message-State: AC+VfDyv0n7hS7jhbi0/BkcW7rbltrhPMUw0JF+UwqRSrjB7/GuqLfRt
 MKow0MuaMSOfusmc5E8IJz1qRQ==
X-Google-Smtp-Source: ACHHUZ6NPjqJnNGavsOCoRiaBb5w3G6IZ9ZGBFpmTNX8AUxhnLlj5X0g+1X2Ou+pSyzZuPTIG2891A==
X-Received: by 2002:aa7:c99a:0:b0:50b:c3f0:fb9d with SMTP id
 c26-20020aa7c99a000000b0050bc3f0fb9dmr17451185edt.41.1683827686036; 
 Thu, 11 May 2023 10:54:46 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aa7de85000000b0050bc4600d38sm3085610edv.79.2023.05.11.10.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:54:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 11 May 2023 19:54:43 +0200
Message-Id: <20230511175443.281970-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [RESEND PATCH] drm/nouveau: constify pointers to
 hwmon_channel_info
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Statically allocated array of pointers to hwmon_channel_info can be made
const for safety.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index e844be49e11e..db30a4c2cd4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -211,7 +211,7 @@ static const struct attribute_group temp1_auto_point_sensor_group = {
 
 #define N_ATTR_GROUPS   3
 
-static const struct hwmon_channel_info *nouveau_info[] = {
+static const struct hwmon_channel_info * const nouveau_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1


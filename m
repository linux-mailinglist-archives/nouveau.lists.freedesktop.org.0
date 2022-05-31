Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37631538E38
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4168112630;
	Tue, 31 May 2022 10:00:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4731B1125E5;
 Tue, 31 May 2022 10:00:26 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v19so9456819edd.4;
 Tue, 31 May 2022 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CBtdyMzsAJ1/aOexJ9rl7ZeO2ErFHAD5HxTQN3Dqn3Q=;
 b=clhRBft+k4X+UmpE7If794qBfOtGFA7pbEByZ2pinyy2YRsA2O6lLDOynJMSIVJoFM
 Wvro65LH9mtebwNBzBwhrtxkvox46+r6wwZH4eYd+mYlM8gfp2s7dxCrtouRZ2HvQ9rb
 5qqKVWSj4jEdYbd8S6LPV6K7PJCG4fHMCcDZkvLBlGNukalvsGNQKBVKwFWP7x+ZUNc0
 mZXiAkmse4krF81HSAGDete8t78Ll4SG7G5gaBi9gesUSTbQOYIe2O3LdV31q8XNetNL
 YzKH8enFbBx54aGHmjR5bRjrnOqioVrO6oNE62MwqlFCmvCaYYCBPM8DqoQ36EIiOpxJ
 EWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CBtdyMzsAJ1/aOexJ9rl7ZeO2ErFHAD5HxTQN3Dqn3Q=;
 b=S8DRI9NZVRjAOoLYXCty90+06GLEbaLBYY8TRotfovmRk4A1rv+TSSHtr/xbfF9khB
 q1XjzgzjgnF138UUx39y63Vll9GGTxI+tNiIF8d7besSlWxqu1IGAFfk9xfuM6aA5XCR
 F86OaNnOqZj4mPkGvq/P/YRhu/KjFvFwEOHo3/EYYsfvdNweG5Tsq0lfO+8zgb99b+Ce
 fCV1hxNnNfFQYaHFy0lEBa0yXK7RWqH7ZFAbfKjbPpeukv9QAFQmrsncz+xo9rUBSQCp
 iP1jFM4kXwayWsqX5zEpv4Ib9XGaUPjzCGR6d7M8h11MhmwsgacP9We3UblK4XoA0P3n
 +xSg==
X-Gm-Message-State: AOAM533240JZ6Wr1ML5OcHBjKAY1UsBihuo7G42Y/MJZTSFxtyZ2etrM
 jzoiJ1iYyxFCGl1uIPwcdHI=
X-Google-Smtp-Source: ABdhPJw42FrkjYM4LnR278q9mfBravYOk4Zj2lNKJYJUZ/HCUi9Q4cA6PZiVhbQJK68MTRAAzi0sdA==
X-Received: by 2002:aa7:d285:0:b0:42d:ca4f:a046 with SMTP id
 w5-20020aa7d285000000b0042dca4fa046mr13232089edq.354.1653991224557; 
 Tue, 31 May 2022 03:00:24 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:24 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 12:00:04 +0200
Message-Id: <20220531100007.174649-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 10/13] drm/nouveau: use drm_oom_badness
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
Cc: andrey.grodzovsky@amd.com, hughd@google.com, viro@zeniv.linux.org.uk,
 daniel@ffwll.ch, alexander.deucher@amd.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 561309d447e0..5439b6938455 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1218,6 +1218,7 @@ nouveau_driver_fops = {
 	.compat_ioctl = nouveau_compat_ioctl,
 #endif
 	.llseek = noop_llseek,
+	.oom_badness = drm_oom_badness,
 };
 
 static struct drm_driver
-- 
2.25.1


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB8538E29
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B761125CF;
	Tue, 31 May 2022 10:00:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FDD1125D1;
 Tue, 31 May 2022 10:00:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c2so7260328edf.5;
 Tue, 31 May 2022 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7tQVrAvhtwsiyqp5g4EfVxGXeEppLEfrV1ntrEYWJE=;
 b=Xh9vdv7Md1Jc0nNaz/QEZs5wsG3AfJ2/jRFF8rTAcPZ6QG7f0rxiqBLYOf13+3PUe5
 DS/CL5kAFDHB7/bv8EYLoIYIYA3Cx4+ppq4UyjhqSGPcSsG+p4nVI7VGhcdno4MC08p8
 XVfyNLF1mWExyyS8ZBwIS6tDDHVn9frsIcma0mUCQvKpUlAle8k82hD4G+7Sd4WdVmlz
 3Cwt+4X8TIMztGZf/ISlFleQ6/rglSf1VgibZ0Ewo75ycww+oCt0RuyECJkUJZ9D3opK
 u/Qh77+csPwSloqfrGgfn1EfcZpOm7AfMN65GulQjeG/U1vHukfs/GzY6+Kbrf4gD0d7
 2ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z7tQVrAvhtwsiyqp5g4EfVxGXeEppLEfrV1ntrEYWJE=;
 b=Zrpa3PTRYd5XkBX0ZOXsoNDzEtMJJDbFEdLsiZr/SYqj4ZX6LHN2ImatATY5wgPhPx
 ZH+eE0wbAJYtIHXTg2HXNoHSsjBynrSrubKtuJB+RwqNWWQ2npy/CASVjc61DC7/c3bB
 4vTkgNHdlGr83am528xLahumuuRofVFNNfn2OpQKGUbqcX/DQVQ5xC58MHnVTRtbMMaR
 gSHJWfuAIM6J0Vq1yUpKQuHUeCGl0a2J6AgxGG3Uv61qUf4Z7FfysLZqzHxNX9s6+NbU
 G3oXJG0cHXoa6xAVAJaDS2W6U5A262BLMfAOhtZMhUgd7uGQloO6U6VuvGMREguXoHcm
 OlOg==
X-Gm-Message-State: AOAM533KzERrKG9laMoNX/pSxtwCpLqgiduCM2v9Kiz/CfJZHn+X7wVt
 UuxbZU8VPBitpMaVsWQX3QYBmxaorOHClQ==
X-Google-Smtp-Source: ABdhPJwU+/41hzABOSPHIeWy2MYGjljgCs1L+eRQW55IH1wpboag3ARspMl2JoO5SvKoTgZp0xZVQw==
X-Received: by 2002:aa7:cdd2:0:b0:42b:aeb2:bc99 with SMTP id
 h18-20020aa7cdd2000000b0042baeb2bc99mr34074044edw.382.1653991218991; 
 Tue, 31 May 2022 03:00:18 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 12:00:00 +0200
Message-Id: <20220531100007.174649-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 06/13] drm/gma500: use drm_oom_badness
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
 drivers/gpu/drm/gma500/psb_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 1d8744f3e702..d5ab4e081b53 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -513,6 +513,7 @@ static const struct file_operations psb_gem_fops = {
 	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
+	.oom_badness = drm_oom_badness,
 };
 
 static const struct drm_driver driver = {
-- 
2.25.1


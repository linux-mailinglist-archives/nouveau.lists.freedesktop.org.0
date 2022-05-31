Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56F538E2A
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDD61125D1;
	Tue, 31 May 2022 10:00:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6A31125C7;
 Tue, 31 May 2022 10:00:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gi33so25608887ejc.3;
 Tue, 31 May 2022 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RT3RFL0VBSkluM1f3vm/WSgrGA2Qjw/08Ja0Fnc8nAM=;
 b=pn14iMQ9n0FDWwmArA4Jf35k//oaml9s3mxFl2ky/DMcmh2eS5QQUAfVDrFOHrWe0F
 KMtAdL2ItYXoMBH38/cM7Y5adUTzh6hcJoR+bDw3M9kaX7/WIFSLDyC89uegMORBvy8a
 BHKTy4vuZTReGoejbiTSY6UKILNxobjAL1xvmGcoXh1D/U10MyxWoiEN1o6YdrZUfevt
 sj80RQonfCLZAawaQ34qBTRrlatRa3mUKNi0wDk1pC3/0cWVa8FNjNAuvChUXdFusk2T
 xG3+L8wayhRfjE/jFGd2K1s01WQzFRlhAG5nSv/aQI6SJBaKFuP7a15DEZJ3u2J3fVab
 1s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RT3RFL0VBSkluM1f3vm/WSgrGA2Qjw/08Ja0Fnc8nAM=;
 b=Xr5QmFEnit0tmfV9dfkBC970exKfmplgGBpkcCZvx8R/5gvR9x0EMs4G5i2in5nvRE
 TWUIYhZYB8BwsVTykOIhbPFsLICJcdHWP+GPUblRZJs+gcMpB9tzHEsXyd9/MulVgvkE
 MzFaYTNpYIUcjCFuLn2HFIrnKr8Ek+SRsES2A7gMryFW82gR0yHIKoava4EWLlCRIATc
 mJeH/AOQBfvAt3wTprRq6fEzqqR7qSwhozUASiGHmw9I0hKxtA6pqhHY2c3UT/bldDNt
 ecZA19XUtJJ1COyjOvi5NqoF3EuP0VJJnZVwghcP4jCx61M0SbMTgrpHFNaIoBM5ldd+
 kJhA==
X-Gm-Message-State: AOAM533AoPbZGB7PL7BTdSJlyd+aok2EPg0kdmN6Z5Wnou3YyQw47/gB
 ieoZmHm0AOENG2mwHttBcUw=
X-Google-Smtp-Source: ABdhPJw2HPaoRajF+IeqkgNAoVDs/MgxP3po1idYa4R4fWsq47S5BbJXHf6FD6GIdoI/D1SZlKNRiA==
X-Received: by 2002:a17:907:2cc4:b0:6fe:2100:de21 with SMTP id
 hg4-20020a1709072cc400b006fe2100de21mr52095547ejc.462.1653991220342; 
 Tue, 31 May 2022 03:00:20 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 12:00:01 +0200
Message-Id: <20220531100007.174649-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 07/13] drm/amdgpu: Use drm_oom_badness for amdgpu
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

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ebd37fb19cdb..9d6e57c93d3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2651,8 +2651,9 @@ static const struct file_operations amdgpu_driver_kms_fops = {
 	.compat_ioctl = amdgpu_kms_compat_ioctl,
 #endif
 #ifdef CONFIG_PROC_FS
-	.show_fdinfo = amdgpu_show_fdinfo
+	.show_fdinfo = amdgpu_show_fdinfo,
 #endif
+	.oom_badness = drm_oom_badness,
 };
 
 int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
-- 
2.25.1


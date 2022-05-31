Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047D7538E33
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012561125DC;
	Tue, 31 May 2022 10:00:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4626911260A;
 Tue, 31 May 2022 10:00:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w27so10102988edl.7;
 Tue, 31 May 2022 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dox2mMkLl/5c9D2gga469zGN9zQ+j614KEWkuEZ4MV4=;
 b=TtHtny7NdbtnaKMNgHxxZ1P6YiZMqlmrfAD504KQpkpUdOed8kz6s4qe73Oso8t6aL
 GH45XnJdlS9fPbcsu06cjzlIDPfSLe4vdmLZk7L0colYmkysDdcFQUfaXrpgfhWM8Uu9
 mwNsso9fA2grp70nK3W+gfRLzK4em/GxgeHMyOxZAQwF2uHJZHUlKeoWDTsO9Pf3mIoR
 +MU2pw1Hj93sIubQtkBk95FwjgyvioAIuxLDOXetbKFAI5WclUufvdU4gR+xUVC90tO0
 kjPZ8sljqOzsGufGGBR2iVo/n5ohkrTAeCPS+lQRYxTn5nYYxcG4Bmjfy2K5n7PsifJS
 ohDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dox2mMkLl/5c9D2gga469zGN9zQ+j614KEWkuEZ4MV4=;
 b=imi0Qj16FYhVJi/p2+Y27RNEDBIoZXL98b7moPah3qHDOEARHWu8SrCcekL2pE/YUX
 wC2CMoMu3LZ+6mJXRXq3kXkCrEKmr6ZPw1z14tkIm7fYkaDPChxqvVfJdGNbRalI1KkB
 YFwrmqFRXC4+q7K8uwa0rzgaW/QPT2oByl71hhi/aj/5i/6NwjhkR0JzfTP5E8Du7Oqr
 Qwrwnn2W+m5wwTTaBpLirr1eHm6RL22JaalHXAC0sZqzotcZ1iBxCStm0NvPFYa57AJD
 e/+Am4DATMogfcl29t9Vihf7sldz2XdT2rJdS3UJn0DtZzgi9Is8RWgwwLjvEVpBhxbM
 A3mg==
X-Gm-Message-State: AOAM530/Go3CYMo+7VCENaPFeVJmUgM8cwvPCnuDQjIfN2FTomMaIld+
 bxEevIWmpA+sRpROZpfnofE=
X-Google-Smtp-Source: ABdhPJwaDMI96aKfbI0lqqtNolmvi5yHB6A4EjRXIsAbd+0AZ25rrn/qiMxaKibl1aGvqzYNEfcjIQ==
X-Received: by 2002:aa7:db02:0:b0:42d:c3ba:9c86 with SMTP id
 t2-20020aa7db02000000b0042dc3ba9c86mr14927377eds.337.1653991228918; 
 Tue, 31 May 2022 03:00:28 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 12:00:07 +0200
Message-Id: <20220531100007.174649-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 13/13] drm/tegra: use drm_oom_badness
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
 drivers/gpu/drm/tegra/drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 9464f522e257..89ea4f658815 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -803,6 +803,7 @@ static const struct file_operations tegra_drm_fops = {
 	.read = drm_read,
 	.compat_ioctl = drm_compat_ioctl,
 	.llseek = noop_llseek,
+	.oom_badness = drm_oom_badness,
 };
 
 static int tegra_drm_context_cleanup(int id, void *p, void *data)
-- 
2.25.1


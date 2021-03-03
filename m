Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688332B87E
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E444B6E9AC;
	Wed,  3 Mar 2021 14:09:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04A76E8FA
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a18so15531841wrc.13
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=Ng8hdaWRiiyvyJ7rnmG9yRryrouH4pj2frjYm54JU0V/Kij/mLkEoTUEP+yMJyN858
 43bEo3V8esgmfbqdFHDVhOX+SYmO5tr9O/V0Mceqz5W1Xcgm7WGS+5ivEqcwlqOs8Ds7
 gUsslo0geHrYU/ZKFsr3zq/YneNyJndoy2Em75uprLvmdbJe7KRxkSvIsl559Ym/lM8a
 V4HEidvwkXJY7TwiMQqabQmXvPddzJPgihMF4HHRUsKPHxZdQKO0HpYJ2lh1WlJB06N5
 cC4fLLZcxrlhDnzlMsFU70uqIMOuAxIpB4tT9G1IKwKiYZzRepB8asZvagjaujELaLUf
 SRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=k4z84oNX5AwSojSrNoSU6ztHPnkVnpgmM4b41R9mcQa7vDORNYRliNBkwtRaw3mYxC
 aZJ+na+nDOIQTeHoUB8lbyL3AFKh34X5nSqUgb5hCwouK6c1XpHVUkmZgbDyynaRJp7E
 nVB7PCm7Rw5epA8/TMIh6Y8PaQaOw/ZFSS4YZPNJ0XmCdH1WWRlwO/7sxBFjJRLQG0+d
 vgu6EBC3GrRn3Pd9LBPfbOEq/WaBvJYNGoBGs9PoheM+vxDxhlPfabDHc3mdyWj9Df15
 lY7ttZyzB1EppcteZHu8DIW/5vMtSwxYzNCVMYdqRG9RCE8Ued83ibfh/bjc5Mux6t9X
 nZMQ==
X-Gm-Message-State: AOAM5301Tjkbofk5YHUuK/pRufcK80CBWO4FJRh09desofUmlgaavm+6
 Qg9IbQ6icP9UiU5xQo28Fhmckw==
X-Google-Smtp-Source: ABdhPJycA6TC1eg5KWRI2oQfh3Gk2eiMaVqoQpFQ2CQX+w8wHkausDg6d3nojKl6dS4quQKwNJFznw==
X-Received: by 2002:a5d:6042:: with SMTP id j2mr28094272wrt.336.1614779034339; 
 Wed, 03 Mar 2021 05:43:54 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:48 +0000
Message-Id: <20210303134319.3160762-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 22/53] drm/nouveau/nouveau_ioc32: Demote
 kernel-doc abuse to standard comment block
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index 8ddf9b2325a42..2af3615c5205c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -38,7 +38,7 @@
 
 #include "nouveau_ioctl.h"
 
-/**
+/*
  * Called whenever a 32-bit process running under a 64-bit kernel
  * performs an ioctl on /dev/dri/card<n>.
  *
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FD6B655A
	for <lists+nouveau@lfdr.de>; Sun, 12 Mar 2023 12:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573A210E0FD;
	Sun, 12 Mar 2023 11:23:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6AE10E0FD
 for <nouveau@lists.freedesktop.org>; Sun, 12 Mar 2023 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678620193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MHyu4+8kPd35BCnU7In3CFdj9IYOtFD0P1pEdmm81PU=;
 b=DY+qVkkFlv98GH1mTcdvtAQFX6hgv0dP2SWLbc2wc/EwQ1mPaK4HyXPR08uHAQBaG/39qG
 wwxBUBpyTrZnh3IcWLuZayTMtn8nHD/UIghaUe+bZ+WqHrDh/tglK5zLsdMgqbWxpo3q/7
 A8D6NwFIvp5evWoN7wAftL87zd9J93s=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-UmzBzK7OPW2PproOvDgxJQ-1; Sun, 12 Mar 2023 07:23:11 -0400
X-MC-Unique: UmzBzK7OPW2PproOvDgxJQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 l13-20020ad44d0d000000b004c74bbb0affso5519304qvl.21
 for <nouveau@lists.freedesktop.org>; Sun, 12 Mar 2023 04:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678620191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MHyu4+8kPd35BCnU7In3CFdj9IYOtFD0P1pEdmm81PU=;
 b=wQam67p7XDth+ff/K5xGOzBvBfKMICTNwj6Gdhojgos6HJVeic8o0BJYELjRfiUOyv
 1Nh6U2LODeIzDnhrCR0cbT0PZlAD8hbRV9lYdlKVQnRX8AioQ0DVIBV+pC7+8/GR8gF4
 Po4nh8NJS+ucw1hBVo9x9pmMdx93xyFeMK6di+vJavN0GocprpmiHEnvliC29ybvNetD
 uC/PpKogf2CFemoeVn2RcBOKJ7o5GdjvIabEb7IB/83EWIFckoDLQPfaWaHbCeklkbpI
 LdISzxBpSwT0p5eVMBNaUxLQEw6c6cohwcyVeO8jvt/ClgVDttHR9qBEOUMn/fT4Ln5x
 nYqA==
X-Gm-Message-State: AO0yUKUcPzASh0yA1cNTUaVaTY7p6LO43ZJsTlN/yNfLVTLacavdRLrY
 0t7vbavTotXFKeiAdm9lRqkckb/ZRc9Qhu6DD/cTAzNRVLqScGeqimdBxU3Lmk8mYxbw/ee4rEi
 HPiKmK35u/u0+rpglIIYGAsVa0w==
X-Received: by 2002:a05:622a:170b:b0:3b8:58d0:b4e4 with SMTP id
 h11-20020a05622a170b00b003b858d0b4e4mr21299715qtk.33.1678620191073; 
 Sun, 12 Mar 2023 04:23:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set8rU61IoSMnz2NMxT0D++jddUTjwTZvD4aI/Ne3rhoCM5YcURCxzOjOJup/d6HqF9HM1D0JKg==
X-Received: by 2002:a05:622a:170b:b0:3b8:58d0:b4e4 with SMTP id
 h11-20020a05622a170b00b003b858d0b4e4mr21299693qtk.33.1678620190755; 
 Sun, 12 Mar 2023 04:23:10 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 o10-20020ac8428a000000b003b82a07c4d6sm3507928qtl.84.2023.03.12.04.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 04:23:10 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Date: Sun, 12 Mar 2023 07:23:02 -0400
Message-Id: <20230312112302.466886-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/mc: set ga100_mc_device
 storage-class-specifier to static
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c:51:1:
  warning: symbol 'ga100_mc_device' was not declared. Should it be static?

ga100_mc_device is only used in ga100.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
index 1e2eabec1a76..5d28d30d09d5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
@@ -47,7 +47,7 @@ ga100_mc_device_enabled(struct nvkm_mc *mc, u32 mask)
 	return (nvkm_rd32(mc->subdev.device, 0x000600) & mask) == mask;
 }
 
-const struct nvkm_mc_device_func
+static const struct nvkm_mc_device_func
 ga100_mc_device = {
 	.enabled = ga100_mc_device_enabled,
 	.enable = ga100_mc_device_enable,
-- 
2.27.0


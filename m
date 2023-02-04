Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89268ABF1
	for <lists+nouveau@lfdr.de>; Sat,  4 Feb 2023 19:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB1E10E02A;
	Sat,  4 Feb 2023 18:43:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2E510E012
 for <nouveau@lists.freedesktop.org>; Sat,  4 Feb 2023 18:43:13 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e19so441215plc.9
 for <nouveau@lists.freedesktop.org>; Sat, 04 Feb 2023 10:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CT15Fe61vUwD/64ihUgrFOhkpaVZChv2mOqArgfnFSQ=;
 b=eiUGuCZKLWFxuppxmcdErFuPw8kcrN/X8cjUk51Z648sroXdAKG70azp2RuDKpA0tr
 owJdN7xND0edLW/hDmPSnuACRJaTbPVKLhDc0bkT/iyVqZ03ZoUx50x2aTDq2dq6TLeZ
 hCD5QZPCwKgl7/02clYhGoK44AY7ETTyJEro4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CT15Fe61vUwD/64ihUgrFOhkpaVZChv2mOqArgfnFSQ=;
 b=38eoRNc8R9UhN73EqnuIhye920xxWKcmUCGUY+Ha4Nx1TBW3L3F6ZDZQjB5Wre0nBv
 Q3GjAbHJKqHRkzz8PqK7wFFViNKSwA4VEfrwpBHjP/hij+G+pGfqWsnxzIn9v3CbL+Bd
 w9hVKVKBSNkwUF8p1hzOw3kwwuoW03jo9ES9qLAIxEgwJHoX2vss2KI6NSwUSqrUdsPf
 rO1qfLv4i3WQnC9pxdD5RqMHqAts9jrlJmkdB8P0tJdRCLxgcCJVtmGWGIU1KPyoxlN7
 BTyZjVot5s0rYWHhbRyFjq0MHTZW9dW0dr7vGUCastXRxg7wPFN15mZyNi7WD8lHBUNy
 r+gw==
X-Gm-Message-State: AO0yUKXqIql3FG6HttBGal42si1gGhk9ch5j4yYLoWnvkMF83FyBJyqJ
 1jTf5o5uEWTeES6islez9hFE2A==
X-Google-Smtp-Source: AK7set+OguHXnuMCx+I05bOons29AOR1gkKDUHi5+D3+iJkzGMl2esrw9ya8s/70OhzQEmx1OmRFBA==
X-Received: by 2002:a17:902:db0a:b0:196:11b1:101d with SMTP id
 m10-20020a170902db0a00b0019611b1101dmr18542296plx.28.1675536192807; 
 Sat, 04 Feb 2023 10:43:12 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 z186-20020a6265c3000000b005821c109cebsm3972516pfb.199.2023.02.04.10.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 10:43:12 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Sat,  4 Feb 2023 10:43:10 -0800
Message-Id: <20230204184307.never.825-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3584; h=from:subject:message-id;
 bh=JnNn3dbIsEbROnm5CX1us0HBmuYFZMw4sf5w/ChnGaI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBj3qc+LjfoVWdTNdXfxPThu4M6rYEGbuQ6QEbCEUC5
 cD8hWZuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY96nPgAKCRCJcvTf3G3AJptOD/
 90/A8AiNwMUB9x4NzX2U0+FydJLuIGG723usu0NnXHFRPkvUvqF5kzdECqOBBZAB/3d1FLxadzMXa2
 D4QhTC8FWY4x8rGPivaoZkpIN24evj2IQlYEVkhIbOEfAJWKtkc6y84qPl2807PgmOHwJLHJiebxBp
 7kg6pjgm2und/RVLa/y60TPb3hpcGdYJegeSGoa4fO9wbm2UAmRMSblKhziMyvEnIOFi8YSWDTkZfu
 K5pTB4INVMHrX5On4ndNrOBJtWsmZ+r69oNskE8fsydngQ51aajg2zqUF+a7NTwluBbkQHUIJsiIsY
 NY6YYOaeLk+1LS2mmkBrQzP5HbrKnAknBDdkFSh58rWY0whhmj7beDY0S2R8Kg4aoH/HQxjz+VKLUd
 j3828GA0zej+YWDaQR2WAoBqGVSnxFhg/yzaNrEYqrDollOcStYLxkI0hmTu9AjFLAiEiz7hvOcqGE
 B1uQEjLG6tA+LirEtq0Vso9yCnagjkpWTi1QG7O0aUttKPOfMlolrQlclxplbvqptfhOG5oNO335wB
 xAivfrmu555iDwhbwD8aiGhSugwvJQsQKdy2s2bQCrm9Vv4KRHuuyZzuepBt72BgFrH6hArMWYW+cb
 xCZuBm3OR4TmswZWOerLBjGJkN37xcaASAC+VxrG1Z4SFmZssHzc2svFQ7dw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau/disp: More DP_RECEIVER_CAP_SIZE array
 fixes
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
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

More arrays (and arguments) for dcpd were set to 16, when it looks like
DP_RECEIVER_CAP_SIZE (15) should be used. Fix the remaining cases, seen
with GCC 13:

../drivers/gpu/drm/nouveau/nvif/outp.c: In function 'nvif_outp_acquire_dp':
../include/linux/fortify-string.h:57:33: warning: array subscript 'unsigned char[16][0]' is partly outside array bounds of 'u8[15]' {aka 'unsigned char[15]'} [-Warray-bounds=]
   57 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^
...
../drivers/gpu/drm/nouveau/nvif/outp.c:140:9: note: in expansion of macro 'memcpy'
  140 |         memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
      |         ^~~~~~
../drivers/gpu/drm/nouveau/nvif/outp.c:130:49: note: object 'dpcd' of size [0, 15]
  130 | nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
      |                                              ~~~^~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquire")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h    | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  | 3 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index eb99d84eb844..16d4ad5023a3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -2,6 +2,8 @@
 #ifndef __NVIF_IF0012_H__
 #define __NVIF_IF0012_H__
 
+#include <drm/display/drm_dp.h>
+
 union nvif_outp_args {
 	struct nvif_outp_v0 {
 		__u8 version;
@@ -63,7 +65,7 @@ union nvif_outp_acquire_args {
 				__u8 hda;
 				__u8 mst;
 				__u8 pad04[4];
-				__u8 dpcd[16];
+				__u8 dpcd[DP_RECEIVER_CAP_SIZE];
 			} dp;
 		};
 	} v0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index b7631c1ab242..4e7f873f66e2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -3,6 +3,7 @@
 #define __NVKM_DISP_OUTP_H__
 #include "priv.h"
 
+#include <drm/display/drm_dp.h>
 #include <subdev/bios.h>
 #include <subdev/bios/dcb.h>
 #include <subdev/bios/dp.h>
@@ -42,7 +43,7 @@ struct nvkm_outp {
 			bool aux_pwr_pu;
 			u8 lttpr[6];
 			u8 lttprs;
-			u8 dpcd[16];
+			u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
 			struct {
 				int dpcd; /* -1, or index into SUPPORTED_LINK_RATES table */
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 4f0ca709c85a..fc283a4a1522 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -146,7 +146,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[16],
+nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			   u8 link_nr, u8 link_bw, bool hda, bool mst)
 {
 	int ret;
-- 
2.34.1


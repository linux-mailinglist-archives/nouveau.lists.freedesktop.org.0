Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EB7F3ADB
	for <lists+nouveau@lfdr.de>; Wed, 22 Nov 2023 01:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D1110E5C2;
	Wed, 22 Nov 2023 00:54:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Wed, 22 Nov 2023 00:54:40 UTC
Received: from out199-1.us.a.mail.aliyun.com (out199-1.us.a.mail.aliyun.com
 [47.90.199.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9860C10E5C2
 for <nouveau@lists.freedesktop.org>; Wed, 22 Nov 2023 00:54:40 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VwtwnS9_1700614167; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VwtwnS9_1700614167) by smtp.aliyun-inc.com;
 Wed, 22 Nov 2023 08:49:28 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com, daniel@ffwll.ch, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com
Date: Wed, 22 Nov 2023 08:49:26 +0800
Message-Id: <20231122004926.84933-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH -next] drm/nouveau/fifo: Remove duplicated include
 in chan.c
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
Cc: nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 Yang Li <yang.lee@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

./drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7603
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 87a62d4ff4bd..7d4716dcd512 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -24,7 +24,6 @@
 #include "chan.h"
 #include "chid.h"
 #include "cgrp.h"
-#include "chid.h"
 #include "runl.h"
 #include "priv.h"
 
-- 
2.20.1.7.g153144c


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40617241237
	for <lists+nouveau@lfdr.de>; Mon, 10 Aug 2020 23:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C43289E98;
	Mon, 10 Aug 2020 21:18:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790389E98
 for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2020 21:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597094328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2lrokUfoGQAhbbN5B0q4Eo9DnItokSH8gIcb/T1Xy8=;
 b=Q7NvJSKtrzht3ue4p/CybZnz5ntTs+P9xUZfVSlILpJHMKepGJC+7U/DoxX6jvAHoVSm/7
 7U0FTJrJg9hlNJwVoKwb6bVAb+TOdL3T79sVCiNVJ3WoLC0lZwxMa2+Qk4owD02OW74+C5
 hlS0vpqaTQL+IOJQrIZ8AN2Gr2jRDdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-OUZDo_1aPkmYw61eUWUvDw-1; Mon, 10 Aug 2020 17:18:47 -0400
X-MC-Unique: OUZDo_1aPkmYw61eUWUvDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7D351005510;
 Mon, 10 Aug 2020 21:18:45 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5645779CF3;
 Mon, 10 Aug 2020 21:18:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 10 Aug 2020 17:18:37 -0400
Message-Id: <20200810211838.37862-2-lyude@redhat.com>
In-Reply-To: <20200810211838.37862-1-lyude@redhat.com>
References: <20200810211838.37862-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv140-: Include correct push
 header in crcc37d.c
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Looks like when we converted everything over to Nvidia's class headers,
we mistakenly included the nvif/push507b.h instead of nvif/pushc37b.h,
which resulted in breaking CRC reporting for volta+:

nouveau 0000:1f:00.0: disp: chid 0 stat 10003361 reason 3
[RESERVED_METHOD] mthd 0d84 data 00000000 code 00000000
nouveau 0000:1f:00.0: disp: chid 0 stat 10003360 reason 3
[RESERVED_METHOD] mthd 0d80 data 00000000 code 00000000
nouveau 0000:1f:00.0: DRM: CRC notifier ctx for head 3 not finished
after 50ms

So, fix that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: c4b27bc8682c ("drm/nouveau/kms/nv50-: convert core crc_set_src() to new push macros")
---
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index 9afe9a87bde0c..814e5bd974460 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -6,7 +6,7 @@
 #include "disp.h"
 #include "head.h"
 
-#include <nvif/push507c.h>
+#include <nvif/pushc37b.h>
 
 #include <nvhw/class/clc37d.h>
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

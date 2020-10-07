Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD872861EA
	for <lists+nouveau@lfdr.de>; Wed,  7 Oct 2020 17:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD0E6E8FC;
	Wed,  7 Oct 2020 15:14:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8778D6E8FC
 for <nouveau@lists.freedesktop.org>; Wed,  7 Oct 2020 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602083646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=06wfDQ5xgVzrsA2abZxcv9XXxUeqUy8Cs4EoY7FPeOQ=;
 b=TqNtYXoj7j9wxKooTueB1XjQMQgAhQ1ELn8AGN3AIdF/uNtka/8QX61wNDKzCPNm91NTyv
 BdfXaPx24mQgRfD4Co0xKr6HhyBEyJz1dSxw4T1NeKYNcBbf0woStdozw7Z4ktdGdcrtRx
 z8+aTjUq2Jqw0KyApz2asC9J0yW8+Mo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-ILWo4rXRNy-ILo6Kq5YL0g-1; Wed, 07 Oct 2020 11:14:00 -0400
X-MC-Unique: ILWo4rXRNy-ILo6Kq5YL0g-1
Received: by mail-wm1-f71.google.com with SMTP id 13so847286wmf.0
 for <nouveau@lists.freedesktop.org>; Wed, 07 Oct 2020 08:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06wfDQ5xgVzrsA2abZxcv9XXxUeqUy8Cs4EoY7FPeOQ=;
 b=mAK+P/CYYuxUOaXFVAwCs9BEATRy0V7tz4AHGJrMDbPVnVLUROugmHG1yq2zq8ZJQi
 VmZGvIX/l8ig13meyibqFgS/2IMVqn9r11FcVUC01Wixg+ECtk4uk9ZiE3Qzvjxm9ZFK
 S5XETXqCIfdObqVCl8Eo3C+9NNxXukLiIxG1QDCSet8OyWmZPKHoE0TdMEC3245MfHC9
 5/3/GeFBi4t7RCV9Q2GjoVhY1n/pGaTGsHo1On5lLl5Pyas+xepiFpXSN1fCgILDAbg8
 gUX63LbNqNxqBpPPP4yTI2roG7w274OKaYbJdw9SGPQnLOHPNvC3li++qYxAQMKGxD1C
 yiTA==
X-Gm-Message-State: AOAM530Pv1HtwwfRusOkN7WDn28WsgyuTiVm2wSn0atY/tuj6fWe18+E
 3BQ2RYX/ujPBjwGnz27P92R3gnT1+yLNm7eCQywO7XWEqU9h3GefqFjI9YUHrqs9JARra3FGDJL
 /zcYfe7oSgCA0LCiSj0AwjqqNJw==
X-Received: by 2002:adf:df07:: with SMTP id y7mr4457949wrl.347.1602083639431; 
 Wed, 07 Oct 2020 08:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR+H1LwX5oqkGOaOUBn6/Edi/c5XBJnOAOnw1YuIfMNr//vXvgx6gEoVJzHFKL2CrqiJ5L4A==
X-Received: by 2002:adf:df07:: with SMTP id y7mr4457924wrl.347.1602083639169; 
 Wed, 07 Oct 2020 08:13:59 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b088:c000:2bdf:b7aa:eede:d65f])
 by smtp.gmail.com with ESMTPSA id 4sm3474048wrn.48.2020.10.07.08.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 08:13:58 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed,  7 Oct 2020 17:13:56 +0200
Message-Id: <20201007151356.51917-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC] fifo: only reboot engines if they have a ref
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

this prevents double fini/init on engines and also fixes the
"gr: fecs falcon already acquired by gr!" error I was seeing.

RFC comment: not sure if this is the right solution, but it does fix the issue
for me. And I guess if this is a valid approach older/newer chipset might need
similiar fixes?

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nvkm/engine/fifo/gk104.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/fifo/gk104.c b/drm/nouveau/nvkm/engine/fifo/gk104.c
index 441483325..669153fba 100644
--- a/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -292,8 +292,12 @@ gk104_fifo_recover_work(struct work_struct *w)
 
 	for (todo = engm; engn = __ffs(todo), todo; todo &= ~BIT(engn)) {
 		if ((engine = fifo->engine[engn].engine)) {
-			nvkm_subdev_fini(&engine->subdev, false);
-			WARN_ON(nvkm_subdev_init(&engine->subdev));
+			mutex_lock(&engine->subdev.mutex);
+			if (engine->usecount) {
+				nvkm_subdev_fini(&engine->subdev, false);
+				WARN_ON(nvkm_subdev_init(&engine->subdev));
+			}
+			mutex_unlock(&engine->subdev.mutex);
 		}
 	}
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

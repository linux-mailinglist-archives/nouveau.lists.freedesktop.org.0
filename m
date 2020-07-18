Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7211F224E36
	for <lists+nouveau@lfdr.de>; Sun, 19 Jul 2020 00:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3057E6E40A;
	Sat, 18 Jul 2020 22:53:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9CB6E14D
 for <nouveau@lists.freedesktop.org>; Sat, 18 Jul 2020 22:53:25 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id 80so12050478qko.7
 for <nouveau@lists.freedesktop.org>; Sat, 18 Jul 2020 15:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=adcT9XbdbrqOINmH+i9HSefd3saPChgN/RDxRz2zDEE=;
 b=fHpSEoASueQ2ypG0RcE77641LjsFw86OUm5tFPbYb5s5jBYOlc4Mc0Ke8wBpbIeq8D
 puL9QkBtD6VCKVZoFw+sYZ2km0mB5yg08g0R9OiqtJscBxXw7utWbO1y6E+Q93ZRThoa
 qIyxFM5yFxJKQJU/+Swu4gjxRFMH3SnfU/UiMAW/4ofWqvt+kZk8h8Yh/wh3O71TOBx5
 jz9QgJV60DYLXDz3Eq8tbDKYjUqNPZc0A0Wj2KIOVfxyajVj7gcDyvV1Om4ov6YfNdjI
 6zyfv87aT8UvFhRmC/TX5/TEH9+7blCg+QOYBeuC0LRLLwpT0AujhQQhp9sjWd/4cIhI
 ErXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=adcT9XbdbrqOINmH+i9HSefd3saPChgN/RDxRz2zDEE=;
 b=RzJAwl0FA0cTjAR3aeuCDwqPW1PQxOydxp2sjvWQLuM+avmfSrjkmv3G1/SwbiDJW6
 s1lqBk2IaeAqPn/vzhkSCYXvy1gGtpE5t8090OvhnnHbyoBYNi0TxRJhPE321pGsv5TZ
 FD6x5cLvtMPc7h3GFjmqocmglXEuPFZTshgicp2fxD4qqrWE8kgVC4rSZ4uuht81oaKg
 ZQSegFMaCco+9/bCbT3wz0m3uXMvB8wU+CBKugRXAso+2sX3VAqiPSTqFEXafKtJZORb
 FwT6QfZFP+MREjeHaZI2kw4gH5B7bnv5/EU8mdp3ILPobb2MH9skpP13euVZW78ea19f
 x+vQ==
X-Gm-Message-State: AOAM532mOHsNJ3ES/KOKVVsSSsqkfG+H5mq2S9K9AG96MQRe83zTE3MI
 1u80WXy/RQ93humROiN35XvEjq0/Ep4=
X-Google-Smtp-Source: ABdhPJyODYwarFqfBXiSqgGxv0LR9hDzIFvUbxBHVSUOmQqTrGxLq1s6Egu+3LEiJWEJm64dri/htQ==
X-Received: by 2002:a37:a889:: with SMTP id r131mr8967552qke.182.1595112804220; 
 Sat, 18 Jul 2020 15:53:24 -0700 (PDT)
Received: from athos.hellosponsor.com ([70.19.70.200])
 by smtp.gmail.com with ESMTPSA id p25sm13859978qki.107.2020.07.18.15.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 15:53:23 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org
Date: Sat, 18 Jul 2020 18:53:18 -0400
Message-Id: <20200718225319.27884-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 1/2] drmmode: fix screen resize without
 acceleration
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

This got broken with commit 86024cee back in 2014!
drmmode_pixmap/nouveau_pixmap expect there to be EXA wrapping around the
pixmap now, which is not there without accel.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/drmmode_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 89927a4..69421e1 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -1561,7 +1561,7 @@ drmmode_xf86crtc_resize(ScrnInfoPtr scrn, int width, int height)
 	}
 
 	ppix = screen->GetScreenPixmap(screen);
-	if (pNv->AccelMethod >= NONE)
+	if (pNv->AccelMethod > NONE)
 		nouveau_bo_ref(pNv->scanout, &drmmode_pixmap(ppix)->bo);
 	screen->ModifyPixmapHeader(ppix, width, height, -1, -1, pitch,
 				   (pNv->AccelMethod > NONE || pNv->ShadowPtr) ?
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

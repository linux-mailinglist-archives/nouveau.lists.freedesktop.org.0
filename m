Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDFD24558C
	for <lists+nouveau@lfdr.de>; Sun, 16 Aug 2020 05:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC75A6E060;
	Sun, 16 Aug 2020 03:23:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A126E060
 for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2020 03:23:41 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d14so12065826qke.13
 for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2020 20:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVTX20BMwz0r8hrhn7nFJNjI92zcdCYNa7ZiunI9yZ0=;
 b=MEg1IXPUPzhjeyrYCfNrGanXmiKvaauNSgoUoJePPEbP/oAW5Cbsi915Be1t27x/pZ
 wJsjgTiIh1ahqdl9fxnnw1d0pb08c9YrPLOSx3uFMsN5zfih4yiBmSfXhNz1J1oFDimU
 RsQZAuQ+BfGlyaOidBJf9Jp7345dQR3fqKHLsKnuPEhs+pTtTZlruWQtggwUErh3cUoJ
 yoe74YbVRoDpRcMJY8Fcod9QV8bvy4H4IPK3v4jpr3yVzaUgO31UxVfcv1su4naH0jdG
 hqir5S93Ym20ILK41ha9Nl7anTDlt3QT3MqsQ59LQh781M36awZOS3evijQEgsKaYVL4
 vl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pVTX20BMwz0r8hrhn7nFJNjI92zcdCYNa7ZiunI9yZ0=;
 b=K4LScufavNaDExyPCTpjHhRnag62VTl1TQP5bmjsGnZs4V2V0xMzzW+F8zSz8EsP6P
 9XjhR8OgZ+n86uzV3iBcboYfKP0nkjgeXEygWqdX6Sqo7iuvmHd7fsvyVayxtVosyH5A
 VOYPpk8NZ3XPP7R5Fr0LO6Tj5tTa5KtH5ET5M+uYyydWyHQO9SlTFY/j2eQhGmRwMJvg
 clHjjiTBiBVELkglo0xtVuFojxluCzGdoK66gtYSjZA5/zBsgB945hVm5Oq+EVv9agix
 L6Y8h51h69wDpdT4uoQ+2QoYHQbcwh0y9KLmphldCJL21ipL3+lOxLd6zAV8ny0q9Qmn
 crrQ==
X-Gm-Message-State: AOAM532GaLuYmVUoa/tYHbiuIwxHSttFX0YkT0TPSm+TdKBSgpBYO/BE
 6GTkV/aqHi1D4Dgi/6RCtlwhg45/fBxQdw==
X-Google-Smtp-Source: ABdhPJybTBNNszj4vAXDY74XQWAfwsk/j/Eb/Q4rFjPEe+0OeV3zj4dFAPP4lTEcd0TvYsIvu9r19w==
X-Received: by 2002:a37:6644:: with SMTP id a65mr8055244qkc.4.1597548220186;
 Sat, 15 Aug 2020 20:23:40 -0700 (PDT)
Received: from athos.hellosponsor.com ([70.19.70.200])
 by smtp.gmail.com with ESMTPSA id 205sm12975136qkj.19.2020.08.15.20.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 20:23:39 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org
Date: Sat, 15 Aug 2020 23:23:36 -0400
Message-Id: <20200816032336.18964-2-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200816032336.18964-1-imirkin@alum.mit.edu>
References: <20200816032336.18964-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/2] present: fix handling of drmWaitVBlank
 failures
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

When drmWaitVBlank fails, make sure to remove the event from the queue.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Note this needs a bit more testing, and also double-checking what the
"correct" way of dealing with these errors is. I was able to trigger
errors with "xset dpms force off", but perhaps there are also other
conditions.

 src/nouveau_present.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/src/nouveau_present.c b/src/nouveau_present.c
index 8167fd8..15516d6 100644
--- a/src/nouveau_present.c
+++ b/src/nouveau_present.c
@@ -113,8 +113,19 @@ nouveau_present_vblank_queue(RRCrtcPtr rrcrtc, uint64_t event_id, uint64_t msc)
 	args.request.signal = (unsigned long)token;
 
 	while ((ret = drmWaitVBlank(pNv->dev->fd, &args)) != 0) {
-		if (errno != EBUSY || drmmode_event_flush(crtc->scrn) < 0)
+		if (errno != EBUSY) {
+			xf86DrvMsg(crtc->scrn->scrnIndex, X_DEBUG,
+				   "PRESENT: Wait for VBlank failed: %s\n", strerror(errno));
+			drmmode_event_abort(crtc->scrn, event_id, false);
 			return BadAlloc;
+		}
+		ret = drmmode_event_flush(crtc->scrn);
+		if (ret < 0) {
+			xf86DrvMsg(crtc->scrn->scrnIndex, X_DEBUG,
+				   "PRESENT: Event flush failed\n");
+			drmmode_event_abort(crtc->scrn, event_id, false);
+			return BadAlloc;
+		}
 	}
 
 	return Success;
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

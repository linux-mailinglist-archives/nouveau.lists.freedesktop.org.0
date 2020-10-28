Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E649629D0ED
	for <lists+nouveau@lfdr.de>; Wed, 28 Oct 2020 17:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621E36E488;
	Wed, 28 Oct 2020 16:06:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651C56E093
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 16:06:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c16so88361wmd.2
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 09:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IhiD+Z5xBeMGf9Bh2U256scYYo/7y3s8V46DrDbHA6g=;
 b=WLsAfpiTMF88HpWe+4QLGtKsSwbqwrBwgvT9WkhyfzB14QZAfYYwlyuWvItupop/P7
 Es7EzvjAHwAJpoWKt/7fifqAYtSQ+WRYSE0drORjFqb4DiWXC4xyEUJO9cFFLCmponRL
 P38X7h5/pA8li9q4vYndpczjuBdXb9pEdYlu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IhiD+Z5xBeMGf9Bh2U256scYYo/7y3s8V46DrDbHA6g=;
 b=WT5pDBzn9tZBHupGV+y2AEj8vHgOUj5L/XaSocqZhfy7vRZK0vtlg7076D/zjKk1g8
 RnJUh5mwWjKHH1Y3ZQDfN0LyDjBZgBgjWnc/Rp6Eowpx4Z7iIuY0G7HZNyoXKewvZPeT
 SPTT8d70M1iteNheOfW2WU/lIv4FiflXztfs94V8Kuk0YFylAvKkz4nbi/HmDaf9bxl3
 hOx7SU+z6vLx7Ai8/cH29Yt1EIK7YE8/LTXXgp8kS/REmLNcZVgLPOHdUqEEcZ0/E5n2
 wu3X57urfLNwmRrpGZ0Jyf9DeaiBnzKlSHp4BfsTLUvp9yy8ZhnXzW6EE5rTUGQhiZ3q
 BrXw==
X-Gm-Message-State: AOAM530+ONvuA650UEndaidU+DirRbzjK6UUBP1kWL1i7TRbttSc79fB
 ugkZmjSmmjMU3c0h+Myvrf1tjw==
X-Google-Smtp-Source: ABdhPJxi0fABSYZl1ixyCp9b/aHJhF5eyYUqeuvVLE/U1gUwX3N27IFkK/NK9sb0TKjTmo59FROOjQ==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr129454wmh.94.1603901169019;
 Wed, 28 Oct 2020 09:06:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v189sm81938wmg.14.2020.10.28.09.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 09:06:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Wed, 28 Oct 2020 17:06:00 +0100
Message-Id: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] fbcon: Disable accelerated scrolling
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
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 nouveau@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

So ever since syzbot discovered fbcon, we have solid proof that it's
full of bugs. And often the solution is to just delete code and remove
features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").

Now the problem is that most modern-ish drivers really only treat
fbcon as an dumb kernel console until userspace takes over, and Oops
printer for some emergencies. Looking at drm drivers and the basic
vesa/efi fbdev drivers shows that only 3 drivers support any kind of
acceleration:

- nouveau, seems to be enabled by default
- omapdrm, when a DMM remapper exists using remapper rewriting for
  y/xpanning
- gma500, but that is getting deleted now for the GTT remapper trick,
  and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
  flag, so unused (and could be deleted already I think).

No other driver supportes accelerated fbcon. And fbcon is the only
user of this accel code (it's not exposed as uapi through ioctls),
which means we could garbage collect fairly enormous amounts of code
if we kill this.

Plus because syzbot only runs on virtual hardware, and none of the
drivers for that have acceleration, we'd remove a huge gap in testing.
And there's no other even remotely comprehensive testing aside from
syzbot.

This patch here just disables the acceleration code by always
redrawing when scrolling. The plan is that once this has been merged
for well over a year in released kernels, we can start to go around
and delete a lot of code.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Peilin Ye <yepeilin.cs@gmail.com>
Cc: George Kennedy <george.kennedy@oracle.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Peter Rosin <peda@axentia.se>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 38 ++++++--------------------------
 1 file changed, 7 insertions(+), 31 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cef437817b0d..d74ccbbb29bb 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1147,11 +1147,13 @@ static void fbcon_init(struct vc_data *vc, int init)
 
 	ops->graphics = 0;
 
-	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
-	    !(cap & FBINFO_HWACCEL_DISABLED))
-		p->scrollmode = SCROLL_MOVE;
-	else /* default to something safe */
-		p->scrollmode = SCROLL_REDRAW;
+	/*
+	 * No more hw acceleration for fbcon.
+	 *
+	 * FIXME: Garabge collect all the now dead code after sufficient time
+	 * has passed.
+	 */
+	p->scrollmode = SCROLL_REDRAW;
 
 	/*
 	 *  ++guenther: console.c:vc_allocate() relies on initializing
@@ -1961,7 +1963,6 @@ static void updatescrollmode(struct fbcon_display *p,
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	int fh = vc->vc_font.height;
-	int cap = info->flags;
 	u16 t = 0;
 	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
 				  info->fix.xpanstep);
@@ -1969,37 +1970,12 @@ static void updatescrollmode(struct fbcon_display *p,
 	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
 				   info->var.xres_virtual);
-	int good_pan = (cap & FBINFO_HWACCEL_YPAN) &&
-		divides(ypan, vc->vc_font.height) && vyres > yres;
-	int good_wrap = (cap & FBINFO_HWACCEL_YWRAP) &&
-		divides(ywrap, vc->vc_font.height) &&
-		divides(vc->vc_font.height, vyres) &&
-		divides(vc->vc_font.height, yres);
-	int reading_fast = cap & FBINFO_READS_FAST;
-	int fast_copyarea = (cap & FBINFO_HWACCEL_COPYAREA) &&
-		!(cap & FBINFO_HWACCEL_DISABLED);
-	int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
-		!(cap & FBINFO_HWACCEL_DISABLED);
 
 	p->vrows = vyres/fh;
 	if (yres > (fh * (vc->vc_rows + 1)))
 		p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
 	if ((yres % fh) && (vyres % fh < yres % fh))
 		p->vrows--;
-
-	if (good_wrap || good_pan) {
-		if (reading_fast || fast_copyarea)
-			p->scrollmode = good_wrap ?
-				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
-		else
-			p->scrollmode = good_wrap ? SCROLL_REDRAW :
-				SCROLL_PAN_REDRAW;
-	} else {
-		if (reading_fast || (fast_copyarea && !fast_imageblit))
-			p->scrollmode = SCROLL_MOVE;
-		else
-			p->scrollmode = SCROLL_REDRAW;
-	}
 }
 
 #define PITCH(w) (((w) + 7) >> 3)
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

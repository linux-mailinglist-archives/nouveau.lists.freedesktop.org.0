Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558DD2E997E
	for <lists+nouveau@lfdr.de>; Mon,  4 Jan 2021 17:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCB089E1B;
	Mon,  4 Jan 2021 16:01:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4D489E1B
 for <nouveau@lists.freedesktop.org>; Mon,  4 Jan 2021 16:01:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A9B9224D2;
 Mon,  4 Jan 2021 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609776116;
 bh=kbXVDURpVO4n7IDAFIoO6qDrcqygc9gNZYFaaVWklug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lFtL3uPmD4C3SQbnOdYUnfyX0j9Uj1mCQG2kUVx52i1fLst7NvanZ6bTaYaP5s6lI
 Y72UB7CFt3DQVf+ZsDe5tWeqZaM349hJoahlxd70rax7HC9yIZdx6lIz+2Rg3MuXkH
 84vwWmI4FdIK9feDlx/C38m2dyrRdbgbGnyzIEHc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:57:21 +0100
Message-Id: <20210104155710.187945647@linuxfoundation.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104155708.800470590@linuxfoundation.org>
References: <20210104155708.800470590@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 5.10 28/63] fbcon: Disable accelerated scrolling
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
Cc: George Kennedy <george.kennedy@oracle.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, stable@vger.kernel.org,
 Peter Rosin <peda@axentia.se>, Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

commit 39aead8373b3c20bb5965c024dfb51a94e526151 upstream.

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

v2:
- Drop a few more unused local variables, somehow I missed the
compiler warnings (Sam)
- Fix typo in comment (Jiri)
- add a todo entry for the cleanup (Thomas)

v3: Remove more unused variables (0day)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
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
Link: https://patchwork.freedesktop.org/patch/msgid/20201029132229.4068359-1-daniel.vetter@ffwll.ch
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 Documentation/gpu/todo.rst       |   18 +++++++++++++++
 drivers/video/fbdev/core/fbcon.c |   45 ++++++---------------------------------
 2 files changed, 26 insertions(+), 37 deletions(-)

--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -273,6 +273,24 @@ Contact: Daniel Vetter, Noralf Tronnes
 
 Level: Advanced
 
+Garbage collect fbdev scrolling acceleration
+--------------------------------------------
+
+Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
+SCROLL_REDRAW. There's a ton of code this will allow us to remove:
+- lots of code in fbcon.c
+- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be called
+  directly instead of the function table (with a switch on p->rotate)
+- fb_copyarea is unused after this, and can be deleted from all drivers
+
+Note that not all acceleration code can be deleted, since clearing and cursor
+support is still accelerated, which might be good candidates for further
+deletion projects.
+
+Contact: Daniel Vetter
+
+Level: Intermediate
+
 idr_init_base()
 ---------------
 
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1033,7 +1033,7 @@ static void fbcon_init(struct vc_data *v
 	struct vc_data *svc = *default_mode;
 	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
 	int logo = 1, new_rows, new_cols, rows, cols, charcnt = 256;
-	int cap, ret;
+	int ret;
 
 	if (WARN_ON(info_idx == -1))
 	    return;
@@ -1042,7 +1042,6 @@ static void fbcon_init(struct vc_data *v
 		con2fb_map[vc->vc_num] = info_idx;
 
 	info = registered_fb[con2fb_map[vc->vc_num]];
-	cap = info->flags;
 
 	if (logo_shown < 0 && console_loglevel <= CONSOLE_LOGLEVEL_QUIET)
 		logo_shown = FBCON_LOGO_DONTSHOW;
@@ -1147,11 +1146,13 @@ static void fbcon_init(struct vc_data *v
 
 	ops->graphics = 0;
 
-	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
-	    !(cap & FBINFO_HWACCEL_DISABLED))
-		p->scrollmode = SCROLL_MOVE;
-	else /* default to something safe */
-		p->scrollmode = SCROLL_REDRAW;
+	/*
+	 * No more hw acceleration for fbcon.
+	 *
+	 * FIXME: Garbage collect all the now dead code after sufficient time
+	 * has passed.
+	 */
+	p->scrollmode = SCROLL_REDRAW;
 
 	/*
 	 *  ++guenther: console.c:vc_allocate() relies on initializing
@@ -1961,45 +1962,15 @@ static void updatescrollmode(struct fbco
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	int fh = vc->vc_font.height;
-	int cap = info->flags;
-	u16 t = 0;
-	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
-				  info->fix.xpanstep);
-	int ywrap = FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
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


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

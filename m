Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF0858EA9E
	for <lists+nouveau@lfdr.de>; Wed, 10 Aug 2022 12:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A6AACCE0;
	Wed, 10 Aug 2022 10:42:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9087E10F9DD
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 10:42:02 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-116c7286aaaso1413099fac.11
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lroEQWQFqiZOjtZ/DWu4Aw9TlRu9JrhuowId9N/x070=;
 b=QVjn8NViv4jx+pasx67fnIuwxZPxKn6VvHzVVe0xvLVblYK7+6GhF/a3OxyoY7uUOq
 K5Ma7I1IpP9c9mcUNUo8NxkSQk/Zeh16NEmcQ6B4DY7C5R6mismDcXhP2xYd/3AgIU50
 2FsnvwYA9WxNo4DKuaG41tdCSAm+M5yC7OdXBSMJLPxh7GHcihEmhWDBg7TuqstD0QWJ
 +uIrXZ6Ho61hwqCsG8QVY1iFvyg/dwPjBT0qqqDhn+ORYVfkxxg2O7hTDfAvjszM8R3S
 tJVgOsNgbpVY3pyUlO/iDKfGJ+0XY6EMQm2C6dzJcVoj2gymWXXmtMT3N4bo4KLxrFxN
 ztmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lroEQWQFqiZOjtZ/DWu4Aw9TlRu9JrhuowId9N/x070=;
 b=GnlZXqLuiyqzL1/fsnCkzUh/ISRI8x5ztR6xDYH+6xrOWFDAUhzPit8ewWr3r1auOx
 Y8aWvuHes9ErSlPJ/g7G1rImFJ7Ep6J5qtiFyeJ0blhA9fBykNkewmd8k8MjyNlpxfeV
 /Ic7kiRowEHdINmUfdxbnxiuW5vFTeNs+6rwdEUouvDuVu7m6SMrym5pZfXWXdiXEO5A
 IPLzLfHONquTyrYM5uunWTXBwams7XkxqiD4Q30mChOaml1wqnlmqlZRSD3PyKyY6iPs
 Vq4w0XphHeroUnSkgjEDTZ4xlysEjvLHjwc7yO4/ThTu2hhXE0eXs9gYZm+Xiehi7hgQ
 wwzw==
X-Gm-Message-State: ACgBeo1vrsq1pCVXAt/rvm4XzmFTITrLpCNlFtKye9dCP8JZBWa8zJC8
 eDjfREV668sUSyq39G0poe84rrQCXjBtIEKye74TuLd9lWkGShtG
X-Google-Smtp-Source: AA6agR7BhU2d5sjthA4neZzSGM/vSXHpRdcX/VXn4sQoN3Lxa6/DgUU7Chg/o4bPAS2M8jhBCEK+XwFHvxvwQULDbPs=
X-Received: by 2002:a05:6870:a11e:b0:10e:d665:2a21 with SMTP id
 m30-20020a056870a11e00b0010ed6652a21mr1168609oae.281.1660128121862; Wed, 10
 Aug 2022 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
 <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
 <2296778.YFyOdMMpyM@debian>
In-Reply-To: <2296778.YFyOdMMpyM@debian>
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Wed, 10 Aug 2022 12:41:44 +0200
Message-ID: <CAHSpYy1HJzY5kNoxk36yGRsKhmxQYP7FVM=Orn7RyKCtZc293w@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Advice about debugging nouveau driver suspend issue
 (init_on_alloc=1 and init_on_free=1)
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello,

The "supend to ram" issue (system freeze when resuming after suspend
to ram or disk hibernation) is still affecting the nouveau kernel
module from linux version 5 and above with nvidia GeForce 9600M GT and
other nvidia graphic card with the same chipset [1][2][3].

I've been successfully using the "work in progress" patch by Karol
Herbst [4] to solve the "supend to ram" issue since it was proposed
for an apparent different issue ("[GT216][Linux 5.16.4] Long stalls in
dma_fence_default_wait") [5] whose root cause is probably the same.

I send this message to bring to your attention the aforementioned
patch [4] (below in the message as text) to evaluate it for  the next
steps for possible inclusion  in the upstream kernel version.

Thanks.

[1] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#5
[3] https://bugzilla.kernel.org/show_bug.cgi?id=213617
[4] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156#note_1385770
[5] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156

----- %= ----- %= ----- %=

From 70271cb0aa30e4523d39c3942e84b16fe18338f5 Mon Sep 17 00:00:00 2001
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 16 May 2022 17:40:20 +0200
Subject: [PATCH] nouveau WIP

---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 05076e530e7d..b6343741eda6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -820,6 +820,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo,
int evict,
  if (ret == 0) {
  ret = nouveau_fence_new(chan, false, &fence);
  if (ret == 0) {
+ nouveau_fence_wait(fence, false, false);
  ret = ttm_bo_move_accel_cleanup(bo,
  &fence->base,
  evict, false,
-- 
2.35.3

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774772E8D9E
	for <lists+nouveau@lfdr.de>; Sun,  3 Jan 2021 18:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AAA897D0;
	Sun,  3 Jan 2021 17:20:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5935897D0
 for <nouveau@lists.freedesktop.org>; Sun,  3 Jan 2021 17:20:05 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id z16so13327813vsp.5
 for <nouveau@lists.freedesktop.org>; Sun, 03 Jan 2021 09:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wzOJ/2YSD3R8TsOuxe+3lx4AkxaspOUCJWN+6BLm1y0=;
 b=hswCzsTcSluD4YEz0zjNPB+pWDWaWXqq2SZjW4UN89QOD4qmTIcOtj/+LRi3ijweIJ
 B3Eo3lwYsYLpcf63cMStYoLbHZJlbEAjEuyfgCsOHt82FYWfndkaEUfelGNGy5349hvg
 K6/GngG1t6TRFgcwvkD/AjRHytK0RHaYToGu8GY4SA8Abdexrn4vXklFdjCjk3W9QXYh
 JsmY44aX3yvoyWSkj9lJQpX0e2Rc0qlpIwXddMVDYHvTpK47vWe/Xk2kTM2PP3l1TyiG
 PYN+xCr1dMm74yFV9ntcW4svcFRzYeWIsQhYibecuvRwkp+uKjkpr3FLNkTmIQR1YaEl
 lKuA==
X-Gm-Message-State: AOAM531ltk/octYh3ZjveHwvp7feGMsVsKthN8vqeMlkg0po4AAwNh+C
 O/AXolEBclXapxzBoowbbU4OT26Nnb56mu01wsc=
X-Google-Smtp-Source: ABdhPJyen2Khr5joNibvnj/QNM0GM0s35lQK8956JXqVyhqMMzLZ7IE5q2Qnct2LbJwL1X46yF4Q+LQfNSdxn0nRBec=
X-Received: by 2002:a05:6102:394:: with SMTP id
 m20mr38584799vsq.50.1609694403775; 
 Sun, 03 Jan 2021 09:20:03 -0800 (PST)
MIME-Version: 1.0
References: <CAJ1xhMWd88uPECyNk4EO5g0w9E3RJci-3-FcGOvdrZwN8Vzh5w@mail.gmail.com>
In-Reply-To: <CAJ1xhMWd88uPECyNk4EO5g0w9E3RJci-3-FcGOvdrZwN8Vzh5w@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 3 Jan 2021 12:19:52 -0500
Message-ID: <CAKb7Uvh3u-6UwP4RNCOqB6vk9R5XHJnQw_CJgn2V0EhEDp_GvQ@mail.gmail.com>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Subject: Re: [Nouveau] [mesa-20.3.2] NULL pointer dereference in
 vl_compositor_yuv_deint_full
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Jan 3, 2021 at 3:18 AM Alexander Kapshuk
<alexander.kapshuk@gmail.com> wrote:
>
> NVIDIA chip affected:
> 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> 210] (rev a1)
>
> The null pointer dereference occurs here:
> Thread 27 "vlc" received signal SIGSEGV, Segmentation fault.
> [Switching to Thread 0x7fff8f7c1640 (LWP 79292)]
> 0x00007fff8d59d1da in vl_compositor_yuv_deint_full (s=0x7fff980e8518,
> c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
> src_rect=0x7fff8f7c0470,
>     dst_rect=0x7fff8f7c0460, deinterlace=VL_COMPOSITOR_WEAVE) at
> ../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
> 689     dst_surfaces = dst->get_surfaces(dst); //dst==NULL
>
> => 0x00007fff8d5981da <+42>:    call   *0x38(%rcx) //rcx is dst
> (gdb) i r rcx
> rcx            0x0                 0
>
> (gdb) bt
> #0  0x00007fff8d59d1da in vl_compositor_yuv_deint_full
>     (s=0x7fff980e8518, c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
> src_rect=0x7fff8f7c0470, dst_rect=0x7fff8f7c0460,
> deinterlace=VL_COMPOSITOR_WEAVE) at
> ../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
> #1  0x00007fff8d58a29b in vlVaDeriveImage (ctx=0x7fff980c1590,
> surface=<optimized out>, image=0x7fff8f7c05e0)
>     at ../mesa-20.3.2/src/gallium/frontends/va/image.c:321
> #2  0x00007fff91485799 in vaDeriveImage () at /usr/lib/libva.so.2
> #3  0x00007fff8e2256d2 in  () at
> /usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
> #4  0x00007fff8e224189 in  () at
> /usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
> #5  0x00007fff8f6b1896 in  () at
> /usr/lib/vlc/plugins/video_output/libgl_plugin.so
> #6  0x00007fff8f6b86db in  () at
> /usr/lib/vlc/plugins/video_output/libgl_plugin.so
> #7  0x00007ffff7d07cee in  () at /usr/lib/libvlccore.so.9
> #8  0x00007ffff7cfa019 in  () at /usr/lib/libvlccore.so.9
> #9  0x00007ffff7cfbf9e in  () at /usr/lib/libvlccore.so.9
> #10 0x00007ffff7f623e9 in start_thread () at /usr/lib/libpthread.so.0
> #11 0x00007ffff7e8a293 in clone () at /usr/lib/libc.so.6
>
> mesa-20.3.2/src/gallium/frontends/va/image.c:312,313
> VAStatus
> vlVaDeriveImage(VADriverContextP ctx, VASurfaceID surface, VAImage *image)
> {
> ...
>          new_template.interlaced = false; //create_video_buffer
> returns NULL if new_template.interlaced is set to false See below.
>          new_buffer = drv->pipe->create_video_buffer(drv->pipe, &new_template);
> ...
>          vl_compositor_yuv_deint_full(&drv->cstate, &drv->compositor,
>                            surf->buffer, new_buffer,
>                            &src_rect, &dst_rect,
>                            VL_COMPOSITOR_WEAVE);
> ...
> }
>
> [Note]
> mesa-20.3.2/src/gallium/drivers/nouveau/nv50/nv84_video.c:618,621
> struct pipe_video_buffer *
> nv84_video_buffer_create(struct pipe_context *pipe,
>                          const struct pipe_video_buffer *template)
> {
> ...
>    if (!template->interlaced) { //setting this to true in
> vlVaDeriveImage returns valid buffer
>       debug_printf("Require interlaced video buffers\n");
>       return NULL;
>    }
> ...
> }
>
> Please advise on the further course of action.

Figure out what change in mesa broke it, send a revert (or fix, if
you're able). There has been a bunch of activity in st/vl lately, and
the developers never take NVIDIA into account, only AMD (well, they're
AMD developers, so not entirely surprising).

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

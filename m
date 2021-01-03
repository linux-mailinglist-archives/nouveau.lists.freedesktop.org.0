Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A762E8B57
	for <lists+nouveau@lfdr.de>; Sun,  3 Jan 2021 09:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C359898C2;
	Sun,  3 Jan 2021 08:18:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89E8898C2
 for <nouveau@lists.freedesktop.org>; Sun,  3 Jan 2021 08:18:47 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id et9so11625353qvb.10
 for <nouveau@lists.freedesktop.org>; Sun, 03 Jan 2021 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XCaPa7cDx3PGXqf6Y3qDuUACjFZfzdAHrT7PmFhOA/M=;
 b=eIHwosCxQzhNBaSUZDYuuuGvUt8gfY2Sk38x3h8/MxQwevzH/EaSCGdSOar8l8eg/Q
 mZHG0p/J1heA+IFI0uFXAS92WpHCqD3EKsC3V0QRqaQNC1OpNkotSlLk2BGWadfVgBB1
 D+U42TCPeJrHRC+gtIqpHSOKlFtJibepMPwdvVtjzlAyqgPoSaJLHytFxkCwewwXEgmA
 kXDjL49w6T6Ea+2X3RyLlaWONIOvzV3ycxuSTzm9uu9nN7OZVw4Dot4JXsCHckEcID9o
 H+GO8qBwR74PyTfgkQ0YeYgSQiLat+Q/2H/T61st0xqoK+pxV1LxTo7m6tWGF+Xgeso9
 3OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XCaPa7cDx3PGXqf6Y3qDuUACjFZfzdAHrT7PmFhOA/M=;
 b=CXkHxU82VhTjwki2wm+qhD7dyXgQAzSFVqq5BaCeFtoFaceb8nGf4Wpy/EVLDjE0Cx
 ahWvmN8agdor+n7c3rYeHRt0JUtLtftYXu/SIBzLFbMiBYDSgVD45cDFNHC/kVGXSkO/
 ydL5LH/CYXWDShQWFkv+9qYEMTUrvomEGwvdY8XF5Jt71cDgHgLA2fvx5X+gK1WPNiXv
 OR87drq2Z5Phc/z1lxHB4yzpyeYyimPn064GO7zhtAWTGLTh28Ajrkwy0wNZAgh7pcO9
 bkP1P+JHIUXN6ckEFHYMzf6T3XFWAfV3TDArVwuvaPOWKRdk8U2TFhTtljfHW/97qez2
 lQ9w==
X-Gm-Message-State: AOAM533cCcXjIeBr2sEbm4tH+lSmnP8qZ5TwnE+k7r0XPgzdDsLzq6R6
 Dm6HtOUJHBoBS6I/meMC7vdy7qqvY/5XwxNVGekpYDmyN6Y=
X-Google-Smtp-Source: ABdhPJzjpMtFYompKWlDiVCkiYSAEbVCMmkzLI9LKtBJDryPn1KmLgLWU2hQbd3fjInChHxCyeAMWaPJKVPlDTGfq6s=
X-Received: by 2002:a0c:f7c5:: with SMTP id f5mr72224936qvo.33.1609661926600; 
 Sun, 03 Jan 2021 00:18:46 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Sun, 3 Jan 2021 10:18:09 +0200
Message-ID: <CAJ1xhMWd88uPECyNk4EO5g0w9E3RJci-3-FcGOvdrZwN8Vzh5w@mail.gmail.com>
To: ML nouveau <nouveau@lists.freedesktop.org>
Subject: [Nouveau] [mesa-20.3.2] NULL pointer dereference in
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

NVIDIA chip affected:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
210] (rev a1)

The null pointer dereference occurs here:
Thread 27 "vlc" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fff8f7c1640 (LWP 79292)]
0x00007fff8d59d1da in vl_compositor_yuv_deint_full (s=0x7fff980e8518,
c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
src_rect=0x7fff8f7c0470,
    dst_rect=0x7fff8f7c0460, deinterlace=VL_COMPOSITOR_WEAVE) at
../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
689     dst_surfaces = dst->get_surfaces(dst); //dst==NULL

=> 0x00007fff8d5981da <+42>:    call   *0x38(%rcx) //rcx is dst
(gdb) i r rcx
rcx            0x0                 0

(gdb) bt
#0  0x00007fff8d59d1da in vl_compositor_yuv_deint_full
    (s=0x7fff980e8518, c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
src_rect=0x7fff8f7c0470, dst_rect=0x7fff8f7c0460,
deinterlace=VL_COMPOSITOR_WEAVE) at
../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
#1  0x00007fff8d58a29b in vlVaDeriveImage (ctx=0x7fff980c1590,
surface=<optimized out>, image=0x7fff8f7c05e0)
    at ../mesa-20.3.2/src/gallium/frontends/va/image.c:321
#2  0x00007fff91485799 in vaDeriveImage () at /usr/lib/libva.so.2
#3  0x00007fff8e2256d2 in  () at
/usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
#4  0x00007fff8e224189 in  () at
/usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
#5  0x00007fff8f6b1896 in  () at
/usr/lib/vlc/plugins/video_output/libgl_plugin.so
#6  0x00007fff8f6b86db in  () at
/usr/lib/vlc/plugins/video_output/libgl_plugin.so
#7  0x00007ffff7d07cee in  () at /usr/lib/libvlccore.so.9
#8  0x00007ffff7cfa019 in  () at /usr/lib/libvlccore.so.9
#9  0x00007ffff7cfbf9e in  () at /usr/lib/libvlccore.so.9
#10 0x00007ffff7f623e9 in start_thread () at /usr/lib/libpthread.so.0
#11 0x00007ffff7e8a293 in clone () at /usr/lib/libc.so.6

mesa-20.3.2/src/gallium/frontends/va/image.c:312,313
VAStatus
vlVaDeriveImage(VADriverContextP ctx, VASurfaceID surface, VAImage *image)
{
...
         new_template.interlaced = false; //create_video_buffer
returns NULL if new_template.interlaced is set to false See below.
         new_buffer = drv->pipe->create_video_buffer(drv->pipe, &new_template);
...
         vl_compositor_yuv_deint_full(&drv->cstate, &drv->compositor,
                           surf->buffer, new_buffer,
                           &src_rect, &dst_rect,
                           VL_COMPOSITOR_WEAVE);
...
}

[Note]
mesa-20.3.2/src/gallium/drivers/nouveau/nv50/nv84_video.c:618,621
struct pipe_video_buffer *
nv84_video_buffer_create(struct pipe_context *pipe,
                         const struct pipe_video_buffer *template)
{
...
   if (!template->interlaced) { //setting this to true in
vlVaDeriveImage returns valid buffer
      debug_printf("Require interlaced video buffers\n");
      return NULL;
   }
...
}

Please advise on the further course of action.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

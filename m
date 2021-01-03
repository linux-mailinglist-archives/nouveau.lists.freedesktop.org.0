Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69D2E8DC0
	for <lists+nouveau@lfdr.de>; Sun,  3 Jan 2021 19:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFB5897EF;
	Sun,  3 Jan 2021 18:25:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D2B897EF
 for <nouveau@lists.freedesktop.org>; Sun,  3 Jan 2021 18:25:36 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id l7so12034773qvt.4
 for <nouveau@lists.freedesktop.org>; Sun, 03 Jan 2021 10:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TNPZKjRU37MnqTPOrk2O4kBw7Hgtwak+0G56+4hnivg=;
 b=np2rf7+FpdMfXUk1XUV0J/97T/wzC4Plxi9QSGWOIF7TcdxnMz3O6PlJ99qXtwl9Bv
 RA32JYqGw3oFEYYhPdKFSI29R3GsWoRB2eOnn2Ei7oBq6AWd/7za8RdNO7o5Aujvw+X7
 WzGvVhc+v1UI0J4Qe5k6fzv6YBSMdsqwDhE9upJYsdzLidG0WE8zfzGhWwq/XKWMoHCu
 XQ93OpcmH4Uz7fLtEkZBWlxxJO6/FAit9eZnrn4AgOIR1zXWnz/o4jIjZ+eFSPafwUo0
 EmKrQ/VBfWGvQK3VVWvSa2FEI26k7XDFJOlxyxzycY8OhNitVpL4f0YUznojh02+doU4
 JiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TNPZKjRU37MnqTPOrk2O4kBw7Hgtwak+0G56+4hnivg=;
 b=OwulA8lWaMvOeiMjwF7+1xFptqng435MHugv/POl1OPgQ1xfasa9sGmJXk+8nd0PHj
 0IANW3v5pRz63oh+iIb88R7WHWY2IvQlGX47qme2IXdURQlZcw2gg3x66oZNafIBWIzG
 T7+9qtT9UAYnXZ5o7+kZNA7dcz78X6Uq+7jsUdXCdbWjM89pkD4G5Qsx0vr1sdW3DXRC
 H3xwmgFtsDCeI6kaEnpZ70wBM2/PfjwW5QkoA15QpZVjHwO4LtSN1Cs20GMXB2DZKQsv
 /xnVe9C/hYMikPGJoRKITEmtcEooHDCzBpn1IU7OU6K3qCFCcgqxoAzG0DHHNHceTlc5
 Rc/A==
X-Gm-Message-State: AOAM533ptA8hCiaG4TfOS5ouELzE9VOXbnGCGRcWOCgXYSBnD1NpYepK
 LdSkfzJlVwpeBSN5dIHVCRS6EmhOjuMT0wgFVyc=
X-Google-Smtp-Source: ABdhPJxLe9fwopHnwZWchKrwJl9SJAlK4H5pQFCA988BEAIVg5MvukuSuj/3JKo9msiK/sgpdV9jGfEETRt65FOsWR4=
X-Received: by 2002:ad4:584b:: with SMTP id de11mr65653624qvb.15.1609698335431; 
 Sun, 03 Jan 2021 10:25:35 -0800 (PST)
MIME-Version: 1.0
References: <CAJ1xhMWd88uPECyNk4EO5g0w9E3RJci-3-FcGOvdrZwN8Vzh5w@mail.gmail.com>
 <CAKb7Uvh3u-6UwP4RNCOqB6vk9R5XHJnQw_CJgn2V0EhEDp_GvQ@mail.gmail.com>
In-Reply-To: <CAKb7Uvh3u-6UwP4RNCOqB6vk9R5XHJnQw_CJgn2V0EhEDp_GvQ@mail.gmail.com>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Sun, 3 Jan 2021 20:24:59 +0200
Message-ID: <CAJ1xhMUMVXYLZv1Zc_th1tBi4w5TmrTTx4UWG-sKJ365cp7Z1w@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
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

On Sun, Jan 3, 2021 at 7:20 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Sun, Jan 3, 2021 at 3:18 AM Alexander Kapshuk
> <alexander.kapshuk@gmail.com> wrote:
> >
> > NVIDIA chip affected:
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> > 210] (rev a1)
> >
> > The null pointer dereference occurs here:
> > Thread 27 "vlc" received signal SIGSEGV, Segmentation fault.
> > [Switching to Thread 0x7fff8f7c1640 (LWP 79292)]
> > 0x00007fff8d59d1da in vl_compositor_yuv_deint_full (s=0x7fff980e8518,
> > c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
> > src_rect=0x7fff8f7c0470,
> >     dst_rect=0x7fff8f7c0460, deinterlace=VL_COMPOSITOR_WEAVE) at
> > ../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
> > 689     dst_surfaces = dst->get_surfaces(dst); //dst==NULL
> >
> > => 0x00007fff8d5981da <+42>:    call   *0x38(%rcx) //rcx is dst
> > (gdb) i r rcx
> > rcx            0x0                 0
> >
> > (gdb) bt
> > #0  0x00007fff8d59d1da in vl_compositor_yuv_deint_full
> >     (s=0x7fff980e8518, c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
> > src_rect=0x7fff8f7c0470, dst_rect=0x7fff8f7c0460,
> > deinterlace=VL_COMPOSITOR_WEAVE) at
> > ../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
> > #1  0x00007fff8d58a29b in vlVaDeriveImage (ctx=0x7fff980c1590,
> > surface=<optimized out>, image=0x7fff8f7c05e0)
> >     at ../mesa-20.3.2/src/gallium/frontends/va/image.c:321
> > #2  0x00007fff91485799 in vaDeriveImage () at /usr/lib/libva.so.2
> > #3  0x00007fff8e2256d2 in  () at
> > /usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
> > #4  0x00007fff8e224189 in  () at
> > /usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
> > #5  0x00007fff8f6b1896 in  () at
> > /usr/lib/vlc/plugins/video_output/libgl_plugin.so
> > #6  0x00007fff8f6b86db in  () at
> > /usr/lib/vlc/plugins/video_output/libgl_plugin.so
> > #7  0x00007ffff7d07cee in  () at /usr/lib/libvlccore.so.9
> > #8  0x00007ffff7cfa019 in  () at /usr/lib/libvlccore.so.9
> > #9  0x00007ffff7cfbf9e in  () at /usr/lib/libvlccore.so.9
> > #10 0x00007ffff7f623e9 in start_thread () at /usr/lib/libpthread.so.0
> > #11 0x00007ffff7e8a293 in clone () at /usr/lib/libc.so.6
> >
> > mesa-20.3.2/src/gallium/frontends/va/image.c:312,313
> > VAStatus
> > vlVaDeriveImage(VADriverContextP ctx, VASurfaceID surface, VAImage *image)
> > {
> > ...
> >          new_template.interlaced = false; //create_video_buffer
> > returns NULL if new_template.interlaced is set to false See below.
> >          new_buffer = drv->pipe->create_video_buffer(drv->pipe, &new_template);
> > ...
> >          vl_compositor_yuv_deint_full(&drv->cstate, &drv->compositor,
> >                            surf->buffer, new_buffer,
> >                            &src_rect, &dst_rect,
> >                            VL_COMPOSITOR_WEAVE);
> > ...
> > }
> >
> > [Note]
> > mesa-20.3.2/src/gallium/drivers/nouveau/nv50/nv84_video.c:618,621
> > struct pipe_video_buffer *
> > nv84_video_buffer_create(struct pipe_context *pipe,
> >                          const struct pipe_video_buffer *template)
> > {
> > ...
> >    if (!template->interlaced) { //setting this to true in
> > vlVaDeriveImage returns valid buffer
> >       debug_printf("Require interlaced video buffers\n");
> >       return NULL;
> >    }
> > ...
> > }
> >
> > Please advise on the further course of action.
>
> Figure out what change in mesa broke it, send a revert (or fix, if
> you're able). There has been a bunch of activity in st/vl lately, and
> the developers never take NVIDIA into account, only AMD (well, they're
> AMD developers, so not entirely surprising).
>
> Cheers,
>
>   -ilia

The following commit,
https://gitlab.freedesktop.org/mesa/mesa/-/commit/338745c6f4b7133d7b36f78562d46bc4e8d368f5,
introduced derive_interlaced_allowlist, which currently comprises the
'vlc' media player. Which, as far as I could tell, was to make an
exception for vlc, so a video buffer would be created when
surf->buffer->interlaced was set to true.
VA_STATUS_ERROR_OPERATION_FAILED is returned otherwise.

Whereas, this commit,
https://gitlab.freedesktop.org/mesa/mesa/-/commit/fcb558321e65b62244a11e0066bb8713b1854721,
is the one responsible for new_buffer being set to NULL, because it
explicitly sets new_template.interlaced to false. New_buffer ends up
being passed as a dst parameter and dereferenced.

As far as the patch goes, I've set new_template.interlaced to true in
my local build, which fixes the null pointer dereference for me:
mesa-20.3.2/src/gallium/frontends/va/image.c:311,313
         new_template = surf->templat;
-         new_template.interlaced = false;
+         new_template.interlaced = true;
         new_buffer = drv->pipe->create_video_buffer(drv->pipe, &new_template);

What is the convention for submitting patches on this mailing list?
Is it done via email, like LKML, which I'm more familiar with?
Or is gitlab, or github the preferred way of submitting patches?

Thanks.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

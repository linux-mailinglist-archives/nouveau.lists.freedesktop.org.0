Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0038C2E8DEF
	for <lists+nouveau@lfdr.de>; Sun,  3 Jan 2021 20:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81A78930B;
	Sun,  3 Jan 2021 19:44:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1A8930B
 for <nouveau@lists.freedesktop.org>; Sun,  3 Jan 2021 19:44:40 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id n142so21828353qkn.2
 for <nouveau@lists.freedesktop.org>; Sun, 03 Jan 2021 11:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gANJ+34NYgVvZ4RCBxvWP+MgCdk9PxzWIOIpeYBXB9w=;
 b=phoIveiMDzHYJnXcXySpEWKlIp4uP5x9dzK6I+ccF3AxeQaYudVj0a51RVCgFU8HKT
 KVpr9LJqb5QiAjwygwB9x/AtVdIXhMyYUR9VDSF9frsC4ekRio6e4bdHDLhoy54yEH23
 8nZ3BcAuUMs1qZXqwskcut1w84HRHgXZ4E3VCSBEq743iHY28n8RQTGlTJWotSmUIlsG
 +dlX4E4AOVvCAbbrqp2Se255tQ4+nrX5p2zqCve3wAQmAEw45LDHnP7x+Ko/a7kHd1D9
 rbPDjJsZCptjw5foJkMqrjBG450aGf4kHJVdHZ9lhK4OfoBdXA0FAFkUrwv4VHIVrYfl
 aZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gANJ+34NYgVvZ4RCBxvWP+MgCdk9PxzWIOIpeYBXB9w=;
 b=q18C757UgCHE/8F64gseWmBCjJHHQMbD0kC6P6que2gTABEezPI7igSu6pz3WjM6No
 ZckT8ERII2p6wzgYQoxgq/Gck5u0MXaWyAv3eOCALdQXrrURhEuLVMu7BOB0QQX4awNY
 S7C/f07XhF1EoXJ5L70Kx3b0Rm/r3EPgd/fxybFt4G1qKfkqrNgQYx9wURYq7BlJKmOO
 Z8ryM9lvH5tlqS1w0Y8ZIiiTC+VsAT970sTp2HZw3XoBy28q3AHbvqAkZ3xQNW1I5pm7
 Q2VjtDcMiRJ/B7Ut82Kml+X1BTVMOov2agNdN/BByEw21wM6k6D/nKo+eZgWcqi1emzw
 nYWw==
X-Gm-Message-State: AOAM5322ZtJAoqKq01SXxyuqU3eFH9gzYkLxHptQmJhYpPT0vJ8BXpqL
 fKdN0pxljy+Q2fvuOc4MfqkBH2MaFAiNaLMyqPw=
X-Google-Smtp-Source: ABdhPJzq/U5iSrbQapAKRK6IS3JoJBIvDDIy3Y+3xJ2f3gUA110XMC2BU23Hy6KNVhw3BSHY34iq59J+0mlnUqO642k=
X-Received: by 2002:a37:628b:: with SMTP id
 w133mr69054239qkb.247.1609703079065; 
 Sun, 03 Jan 2021 11:44:39 -0800 (PST)
MIME-Version: 1.0
References: <CAJ1xhMWd88uPECyNk4EO5g0w9E3RJci-3-FcGOvdrZwN8Vzh5w@mail.gmail.com>
 <CAKb7Uvh3u-6UwP4RNCOqB6vk9R5XHJnQw_CJgn2V0EhEDp_GvQ@mail.gmail.com>
 <CAJ1xhMUMVXYLZv1Zc_th1tBi4w5TmrTTx4UWG-sKJ365cp7Z1w@mail.gmail.com>
 <CAKb7UvjeM-nerb_MtvzjHtk1OHjOT0VifqUQ9TkZTGAUHZR6HA@mail.gmail.com>
In-Reply-To: <CAKb7UvjeM-nerb_MtvzjHtk1OHjOT0VifqUQ9TkZTGAUHZR6HA@mail.gmail.com>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Sun, 3 Jan 2021 21:44:02 +0200
Message-ID: <CAJ1xhMXyU=7X78bjj078yf4S-NfuCxjCb7MURjwnmWosDG+vAQ@mail.gmail.com>
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

On Sun, Jan 3, 2021 at 9:08 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Sun, Jan 3, 2021 at 1:25 PM Alexander Kapshuk
> <alexander.kapshuk@gmail.com> wrote:
> >
> > On Sun, Jan 3, 2021 at 7:20 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > >
> > > On Sun, Jan 3, 2021 at 3:18 AM Alexander Kapshuk
> > > <alexander.kapshuk@gmail.com> wrote:
> > > >
> > > > NVIDIA chip affected:
> > > > 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> > > > 210] (rev a1)
> > > >
> > > > The null pointer dereference occurs here:
> > > > Thread 27 "vlc" received signal SIGSEGV, Segmentation fault.
> > > > [Switching to Thread 0x7fff8f7c1640 (LWP 79292)]
> > > > 0x00007fff8d59d1da in vl_compositor_yuv_deint_full (s=0x7fff980e8518,
> > > > c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
> > > > src_rect=0x7fff8f7c0470,
> > > >     dst_rect=0x7fff8f7c0460, deinterlace=VL_COMPOSITOR_WEAVE) at
> > > > ../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
> > > > 689     dst_surfaces = dst->get_surfaces(dst); //dst==NULL
> > > >
> > > > => 0x00007fff8d5981da <+42>:    call   *0x38(%rcx) //rcx is dst
> > > > (gdb) i r rcx
> > > > rcx            0x0                 0
> > > >
> > > > (gdb) bt
> > > > #0  0x00007fff8d59d1da in vl_compositor_yuv_deint_full
> > > >     (s=0x7fff980e8518, c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
> > > > src_rect=0x7fff8f7c0470, dst_rect=0x7fff8f7c0460,
> > > > deinterlace=VL_COMPOSITOR_WEAVE) at
> > > > ../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
> > > > #1  0x00007fff8d58a29b in vlVaDeriveImage (ctx=0x7fff980c1590,
> > > > surface=<optimized out>, image=0x7fff8f7c05e0)
> > > >     at ../mesa-20.3.2/src/gallium/frontends/va/image.c:321
> > > > #2  0x00007fff91485799 in vaDeriveImage () at /usr/lib/libva.so.2
> > > > #3  0x00007fff8e2256d2 in  () at
> > > > /usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
> > > > #4  0x00007fff8e224189 in  () at
> > > > /usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
> > > > #5  0x00007fff8f6b1896 in  () at
> > > > /usr/lib/vlc/plugins/video_output/libgl_plugin.so
> > > > #6  0x00007fff8f6b86db in  () at
> > > > /usr/lib/vlc/plugins/video_output/libgl_plugin.so
> > > > #7  0x00007ffff7d07cee in  () at /usr/lib/libvlccore.so.9
> > > > #8  0x00007ffff7cfa019 in  () at /usr/lib/libvlccore.so.9
> > > > #9  0x00007ffff7cfbf9e in  () at /usr/lib/libvlccore.so.9
> > > > #10 0x00007ffff7f623e9 in start_thread () at /usr/lib/libpthread.so.0
> > > > #11 0x00007ffff7e8a293 in clone () at /usr/lib/libc.so.6
> > > >
> > > > mesa-20.3.2/src/gallium/frontends/va/image.c:312,313
> > > > VAStatus
> > > > vlVaDeriveImage(VADriverContextP ctx, VASurfaceID surface, VAImage *image)
> > > > {
> > > > ...
> > > >          new_template.interlaced = false; //create_video_buffer
> > > > returns NULL if new_template.interlaced is set to false See below.
> > > >          new_buffer = drv->pipe->create_video_buffer(drv->pipe, &new_template);
> > > > ...
> > > >          vl_compositor_yuv_deint_full(&drv->cstate, &drv->compositor,
> > > >                            surf->buffer, new_buffer,
> > > >                            &src_rect, &dst_rect,
> > > >                            VL_COMPOSITOR_WEAVE);
> > > > ...
> > > > }
> > > >
> > > > [Note]
> > > > mesa-20.3.2/src/gallium/drivers/nouveau/nv50/nv84_video.c:618,621
> > > > struct pipe_video_buffer *
> > > > nv84_video_buffer_create(struct pipe_context *pipe,
> > > >                          const struct pipe_video_buffer *template)
> > > > {
> > > > ...
> > > >    if (!template->interlaced) { //setting this to true in
> > > > vlVaDeriveImage returns valid buffer
> > > >       debug_printf("Require interlaced video buffers\n");
> > > >       return NULL;
> > > >    }
> > > > ...
> > > > }
> > > >
> > > > Please advise on the further course of action.
> > >
> > > Figure out what change in mesa broke it, send a revert (or fix, if
> > > you're able). There has been a bunch of activity in st/vl lately, and
> > > the developers never take NVIDIA into account, only AMD (well, they're
> > > AMD developers, so not entirely surprising).
> > >
> > > Cheers,
> > >
> > >   -ilia
> >
> > The following commit,
> > https://gitlab.freedesktop.org/mesa/mesa/-/commit/338745c6f4b7133d7b36f78562d46bc4e8d368f5,
> > introduced derive_interlaced_allowlist, which currently comprises the
> > 'vlc' media player. Which, as far as I could tell, was to make an
> > exception for vlc, so a video buffer would be created when
> > surf->buffer->interlaced was set to true.
> > VA_STATUS_ERROR_OPERATION_FAILED is returned otherwise.
> >
> > Whereas, this commit,
> > https://gitlab.freedesktop.org/mesa/mesa/-/commit/fcb558321e65b62244a11e0066bb8713b1854721,
> > is the one responsible for new_buffer being set to NULL, because it
> > explicitly sets new_template.interlaced to false. New_buffer ends up
> > being passed as a dst parameter and dereferenced.
> >
> > As far as the patch goes, I've set new_template.interlaced to true in
> > my local build, which fixes the null pointer dereference for me:
> > mesa-20.3.2/src/gallium/frontends/va/image.c:311,313
> >          new_template = surf->templat;
> > -         new_template.interlaced = false;
> > +         new_template.interlaced = true;
> >          new_buffer = drv->pipe->create_video_buffer(drv->pipe, &new_template);
> >
> > What is the convention for submitting patches on this mailing list?
> > Is it done via email, like LKML, which I'm more familiar with?
> > Or is gitlab, or github the preferred way of submitting patches?
>
> I believe gitlab, with the project over at
> https://gitlab.freedesktop.org/mesa/mesa. This will require you to
> create an account, create a clone, push a branch, open a merge
> request. IMO it's too much to ask of one-time contributors (I find it
> to be enough of a pain to have stopped contributing to mesa for the
> most part since the gitlab migration), so you can also send mail in
> the usual way to mesa-dev@lists.freedesktop.org (although I'd add a
> comment below the --- to pre-empt the "submit on gitlab" discussion).
>
> That said, your patch is unlikely to be accepted -- the whole point of
> the original commit was to auto-deinterlace (which seems like a horrid
> idea, but perhaps vaDeriveImage is meant to do that?). The problem is
> that nouveau only supports interlaced video buffers, hence the various
> issues. From the vaDeriveImage docs,
>
> """
> When the operation is not possible this interface will return
> VA_STATUS_ERROR_OPERATION_FAILED. Clients should then fall back to
> using vaCreateImage + vaPutImage to accomplish the same task in an
> indirect manner.
> """
>
> So I'd guess the proper solution is to detect whether the underlying
> implementation supports non-interlaced video buffers, and bail with
> the failed operation if it can't. Or to add support for non-interlaced
> buffers to nouveau. While the hardware has no support for outputting
> video to such buffers, one could imagine adding support for creating
> these with the proper amounts of memory/etc backing the surfaces.
>
> However I think the whole thing should just be reverted and
> libva-using software fixed -- returning the operation failed is
> totally acceptable behavior that they need to be able to deal with.
>
> Cheers,
>
>   -ilia

Thanks, Ilia, for your feedback and for taking your time to respond.
I'll report the segfault I got on the mesa-dev@lists.freedesktop.org
mailing list and take it from there.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

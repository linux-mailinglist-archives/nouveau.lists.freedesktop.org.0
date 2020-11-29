Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F812C7BE5
	for <lists+nouveau@lfdr.de>; Mon, 30 Nov 2020 00:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC31E6E303;
	Sun, 29 Nov 2020 23:05:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE71D6E303
 for <nouveau@lists.freedesktop.org>; Sun, 29 Nov 2020 23:05:18 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id r5so5379110vsp.7
 for <nouveau@lists.freedesktop.org>; Sun, 29 Nov 2020 15:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTVJaT1tbU3OUKpeiCsJr/J3xtjgScWrvtkr0+aeVzM=;
 b=tM2mG7ScIx3EZR9YTrbZa7hVNBKmkQ2lryaKa0773Ql1OeZ38XamxqrxPZzwPO46qB
 Vn7+0ifYLDPvcWg8bV6GfK0n4NgiKBy0F9+7a0Ixym99esbsA0AHKo5skY35q+jx+5hq
 pTBS4vcAEvlGgxL9RrLqEDX22m+eQjT6jkuPQaCahLHRig+wBN4H8/9VGur9GGMm3Zkl
 /ISZhJnKE7f+97AfKPFJ36nrYQGhX3V9OTlfffFYJCvJjhR9JtWY+X1M98H1jmxBGaG5
 v8ppZb9O+WosrgZYRsH1nPsDeGCiMnTdBU8CU2CGoMlXNLtgHOoq0gDDgmKIa3OCZueJ
 TknA==
X-Gm-Message-State: AOAM532h0ABOeaMJHptyaFvzPBAUzlrwUDr92nCKf7rM4WCsTBGvxFdz
 h3qa3+08eYp4lKUmHZ+DWJkYbYhR8SqN4UX5Phg=
X-Google-Smtp-Source: ABdhPJwwYJiVf7qZN6lct0xyvqjIXcgqYtePWB/nOGNQnp246gwiWUXMQLqL30z9o/wDqMC6uptYEzbJbaspfe6rNEo=
X-Received: by 2002:a67:2cd5:: with SMTP id s204mr3855781vss.52.1606691117827; 
 Sun, 29 Nov 2020 15:05:17 -0800 (PST)
MIME-Version: 1.0
References: <e2fffedf-c6d6-4597-8ee2-860933b4fb6e@compro.net>
In-Reply-To: <e2fffedf-c6d6-4597-8ee2-860933b4fb6e@compro.net>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 29 Nov 2020 18:05:06 -0500
Message-ID: <CAKb7UvirV0OW5AuC7Gz82au_y5-AxvAtY_apKKipGxQ6NDUApQ@mail.gmail.com>
To: markh@compro.net
Subject: Re: [Nouveau] Problem with kernel 5.10-rc5
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Mark,

Presumably this is the same thing as the other thread you started,
which seemed to conclude with a working patch, and this email was just
stuck in the moderation queue?

Cheers,

  -ilia

On Sun, Nov 29, 2020 at 6:02 PM Mark Hounschell <markh@compro.net> wrote:
>
> I am not subscribed to this mailing list so please CC me directly for
> any response.
>
> I'm running an older "NVIDIA Corporation G70 [GeForce 7800 GT] (rev a1)"
> card in a newer BIOSTAR B550GTA MB. Kernel 5.10-rc5 does not work. I get
> no virtual consoles or X screen.
>
> I have not tried any other RC versions. Only rc5. Kernel 5.9.10 works
> fine. I am running a SuSE Leap-15.2 system.
>
> I have another machine with an NVIDIA Corporation GT218 [GeForce 210]
> (rev a2) that works just fine with 5.10-rc5.
>
>
> On the broken machine the screen goes blank, the leds on the front turn
> orange as if the PC was turned off.
>
> My dmesg seems to show the cause:
>
> [    5.825702] fb0: switching to nouveaufb from VESA VGA
> [    6.242991] nouveau 0000:14:00.0: vgaarb: deactivate vga console
> [    6.243066] nouveau 0000:14:00.0: NVIDIA G70 (047200a1)
> [    6.443671] nouveau 0000:14:00.0: bios: version 05.70.02.13.7b
> [    6.443948] nouveau 0000:14:00.0: fb: 256 MiB GDDR3
> [    6.498039] nouveau 0000:14:00.0: DRM: VRAM: 250 MiB
> [    6.498041] nouveau 0000:14:00.0: DRM: GART: 512 MiB
> [    6.498044] nouveau 0000:14:00.0: DRM: TMDS table version 1.1
> [    6.498046] nouveau 0000:14:00.0: DRM: DCB version 3.0
> [    6.498049] nouveau 0000:14:00.0: DRM: DCB outp 00: 01000300 00000028
> [    6.498051] nouveau 0000:14:00.0: DRM: DCB outp 01: 03000302 00000000
> [    6.498053] nouveau 0000:14:00.0: DRM: DCB outp 02: 04011310 00000028
> [    6.498055] nouveau 0000:14:00.0: DRM: DCB outp 03: 04011312 00000000
> [    6.498057] nouveau 0000:14:00.0: DRM: DCB outp 04: 020223f1 0040c080
> [    6.498060] nouveau 0000:14:00.0: DRM: DCB conn 00: 1030
> [    6.498062] nouveau 0000:14:00.0: DRM: DCB conn 01: 2130
> [    6.498064] nouveau 0000:14:00.0: DRM: DCB conn 02: 0210
> [    6.498065] nouveau 0000:14:00.0: DRM: DCB conn 03: 0211
> [    6.498067] nouveau 0000:14:00.0: DRM: DCB conn 04: 0213
> [    6.502949] nouveau 0000:14:00.0: DRM: Setting dpms mode 3 on TV
> encoder (output 4)
> [    6.585845] nouveau 0000:14:00.0: DRM: failed to map fb: -28
> [    6.585949] [drm] Initialized nouveau 1.3.1 20120801 for 0000:14:00.0
> on minor 0
>
> If I can do anything else please let me know.
>
> Regards
> Mark
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA71BF833
	for <lists+nouveau@lfdr.de>; Thu, 30 Apr 2020 14:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709586E0D0;
	Thu, 30 Apr 2020 12:28:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458FB6E0D0
 for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2020 12:28:02 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id x136so3684483vsx.2
 for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2020 05:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=81zS4oAHqiY8vvWwXKbw/c7oE5WS+UtsvfRGD7CCPhY=;
 b=p04Gq6rY/vi8+N64CKa6j+sIPIfueVlGZtJ3iTSZrK4aQwHWkhxkgJ5EWw5dFDEzlQ
 oLGHhu6NrcIXKeN9uxb/vWH/cyugogAzjE9oW2gVLSTZfjqlCe7W4Al5GbXJJNZMpVWe
 VWeyNuE8Z8938XrxH2LLVE1S+w0etL+6/TLrT3erHNcwTk7CWQtcjEMI1Hm2ecSYwUtd
 nqq3TQH7cqAgsHbVBQW81m2sE1AR+zmslI2rpIKi1ioPitqUEMWfruMfnFOFqbS85V4X
 loGZ3P+/QdRQ/gUQoPPZ76uDw8Rq2cey2AqaOGLFr6lah1NK280Yy8XYJP2e/YNLG5oP
 eNxA==
X-Gm-Message-State: AGi0PuYrEwzl7Vat0AdpPJfl8BVk3IjZpAXQyPXxZfXp/VccfuypMevg
 A/kBoULENiZVU5aA2D6zdLWYOOqYh9yqPzs5BQs=
X-Google-Smtp-Source: APiQypLePTmmwU5IS4Fr37Yw+l8xIPII+EttuDwgOaAgcgLPif2xXhNipLVqQsgNz5t55VLO7j+TafNa226NaQvyKWo=
X-Received: by 2002:a05:6102:409:: with SMTP id
 d9mr2713684vsq.220.1588249681352; 
 Thu, 30 Apr 2020 05:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200401185621.GA24692@avx2>
 <CAKb7UvhLF7Qdx7W_0Ft4G8NujW6XbELcCP09DSkubj_duBXVkg@mail.gmail.com>
 <20200430073243.GA8620@avx2>
In-Reply-To: <20200430073243.GA8620@avx2>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 30 Apr 2020 08:27:50 -0400
Message-ID: <CAKb7UvjP5NfMjvBqydQ3Q53OsLT_eQX3F+s1E4Ornr1LrG6b=Q@mail.gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [Nouveau] gp104: regression on Linux 5.6
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

On Thu, Apr 30, 2020 at 3:32 AM Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> On Thu, Apr 30, 2020 at 12:15:28AM -0400, Ilia Mirkin wrote:
> > Hi Alexey,
> >
> > On Fri, Apr 24, 2020 at 10:52 PM Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > >
> > > gp104 refuses to switch to "graphic" mode and show anything past
> > > this line:
> > >
> > >         fb0: switching to nouveaufb from EFI VGA
> > >
> > > Machine is fine, as it I can press Ctrl+Alt+Delete and reboot it
> > > normally.
> > >
> > > 5.5 is OK. 5.6 is broken.
> >
> > I've heard some issues relating to missing firmware lately. It should
> > work fine without firmware, but perhaps that got broken. Can you log
> > into the machine and check dmesg to see what's there? My guess is that
> > nouveau takes over from efifb, and then fails to load at some point in
> > the middle.
>
> I've fixed the issue by including all firmware until "failed to load"
> messages disappeared. X works and fbconsole on VT1-VT6 works too.
>
> CONFIG_EXTRA_FIRMWARE="nvidia/gp104/gr/sw_nonctx.bin nvidia/gp104/gr/sw_ctx.bin nvidia/gp104/gr/sw_bundle_init.bin nvidia/gp104/gr/sw_method_init.bin nvidia/gp104/gr/fecs_bl.bin nvidia/gp104/gr/fecs_inst.bin nvidia/gp104/gr/fecs_data.bin nvidia/gp104/gr/fecs_sig.bin nvidia/gp104/gr/gpccs_bl.bin nvidia/gp104/gr/gpccs_inst.bin nvidia/gp104/gr/gpccs_data.bin nvidia/gp104/gr/gpccs_sig.bin nvidia/gp104/sec2/image.bin nvidia/gp104/sec2/desc.bin nvidia/gp104/sec2/sig.bin nvidia/gp104/acr/ucode_load.bin nvidia/gp104/acr/ucode_unload.bin nvidia/gp104/acr/bl.bin nvidia/gp104/acr/unload_bl.bin nvidia/gp104/nvdec/scrubber.bin"

Ben -- another report of firmware-less load being broken on v5.6.

Alexey -- If you compile nouveau as a module, then these can live on
your filesystem or initrd, depending on your boot process.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

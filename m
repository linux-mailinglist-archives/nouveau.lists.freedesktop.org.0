Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA7D14C879
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2020 11:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C106F4DB;
	Wed, 29 Jan 2020 10:03:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F7A6F4DB
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2020 10:03:45 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id r18so10035914vso.5
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2020 02:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=TRxgcAbPTsSSbmHhdnkIQoS7JPcguKmsplZOOA0qAzM=;
 b=B92hgYMzgMj24Erjnen2alXPXcW9LxYFCKKNwvYH+sIAh72SRn9mkZtqr9zk+j2GGP
 O6VQ+uhgZnKlBcIuZh/q1dCcoKB49t6mKGvLHC1/G23hXMgj0QUcYCTLAruR+7MD2t5V
 nmDOjCbGCKnUMyI1OGzDapqldzh5JX+yiEvnCVOzVSbMGQAp4L/wik8McWa0PqWI29Ld
 0Dsk7avDCS8BLwHdkitO0uGSBrVx+28MPKVk83aV1rJeIa7RP/nSNIpPLn2K4gFMyt3P
 Fl7Gqow+SgEiiFnQAnYfIkrOqzl5RgWkAGUEL2h6dgyQUqxgmjLBNP+Ex5+sr00vbCP7
 hL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=TRxgcAbPTsSSbmHhdnkIQoS7JPcguKmsplZOOA0qAzM=;
 b=uKk6NyiL017sj3HqWOAJtMk9ZtKwRIbog1gnUX1cg+v+t6TaoDWoOOSIJ2xPcb+zsv
 miHctbmTTcC5RP020db//0m1GSDAXy0nM2tBUR5l8OdRLVSUTSl5LoM2UrbPNSQCj3ze
 YGYogSHscOLTjmSN6wB+PuJwm8j8UdozIvuEQTg1cYdj8jLzsDfU/5mh+EcMwTAv2OSr
 LCS62000X+Xe7OOvxOMBSS/iEzN2CicZqtkuKpYwHHfkAX/TyOmLkJg+bGazqzkeAzUq
 Td0u/bnypH15Wh/E1oix2eYk1BIAddzlNsgLPchwbRGF5VAweHZTcyyOH2GPteTcHV39
 ay6w==
X-Gm-Message-State: APjAAAX+VLfYBCx/AndBSLfLnT/7FO7TSkRPyqsjCMl4XFydfgXyusy8
 gGKUBSSzSf8gRTMr7JkNh8TaPN9WBZRADDd2bwZbPw==
X-Google-Smtp-Source: APXvYqwVPZ3wzrkUoKd6E14/s05LU/nirn/C/NvUD758Adhqzaelx0wINc9K1jMUTmNlGNtT473oXeMUMhEaoeQx4wo=
X-Received: by 2002:a67:8c8a:: with SMTP id
 o132mr16476053vsd.111.1580292224320; 
 Wed, 29 Jan 2020 02:03:44 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a1f:4d87:0:0:0:0:0 with HTTP; Wed, 29 Jan 2020 02:03:43
 -0800 (PST)
In-Reply-To: <CAKb7UvgZV7zk_vpMf9bCWrV8MpvqEnkcG4h55BgE+WLV_e13=g@mail.gmail.com>
References: <CAD8U+g8AJD-Duxm4tkyiGSNCsnqU=xdpE1YAmd0_iU4uN7Ecqg@mail.gmail.com>
 <CAKb7Uviwt5O2b06iG0xC21dLmo+Qs0HUw40D6R1xFpvPowoLAg@mail.gmail.com>
 <CAD8U+g9CaGc=EN0UCgbCW0g6sgA_c=fBJXpiHgpyH8_Op33Fbg@mail.gmail.com>
 <CAD8U+g8gOabGeSKkGnQ0Ub0Zk8HaWdBB3Zwv4N=DXKDKh-eo1Q@mail.gmail.com>
 <CAKb7UvgZV7zk_vpMf9bCWrV8MpvqEnkcG4h55BgE+WLV_e13=g@mail.gmail.com>
From: riveravaldez <riveravaldezmail@gmail.com>
Date: Wed, 29 Jan 2020 07:03:43 -0300
Message-ID: <CAD8U+g8GPb8J+3YC-ALYqRUXPQHvQse6Ff9HGRDPk2kfzkUhfg@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
Subject: Re: [Nouveau] System freeze: Debian Testing with C61 [GeForce 7025
 / nForce 630a]
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

On 12/11/18, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Tue, Dec 11, 2018 at 11:16 AM riveravaldez
> <riveravaldezmail@gmail.com> wrote:
>
>> The freezes appears randomly, in every situation, and not when I
>> launch some 3D applications or anything similar.
>
> Try removing nouveau_dri.so -- that will ensure no 3d accel is used,
> while keeping your 2d accel provided by the nouveau ddx.

Sorry if it's wrong to continue this old thread, but after a good
amount of testing (+1 year) I can confirm that both the problem and
the solution where the mentioned ones.

The problem (random full-system freezes) persists without change,
identical. And removing nouveau_dri.so from
/usr/lib/x86_64-linux-gnu/dri/ effectively fixes it completely
(leaving aside any lost of performance and some warning messages in
system upgrades and programs launching[1]).

So, after a GREAT thank-you to Ilia, I consult:

1. Is this something that could be fixed? Can I do anything to help?

2. If the only possible/viable solution is the mentioned one (remove
nouveau_dri.so), which would be the proper way to make it permanent?

2'. In many dist-upgrades the nouveau_dri.so file is re-created in the
same folder, what would be a clean/neat way to handle this?

Thanks A LOT again.

[1] A lot of lines like these on some dist-upgrades:

W: Possible missing firmware
/lib/firmware/nvidia/gp100/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware
/lib/firmware/nvidia/gp100/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware
/lib/firmware/nvidia/gp100/gr/sw_nonctx.bin for module nouveau
(...)

And a lot of programs producing messages like these on start:

libGL error: unable to load driver: nouveau_dri.so
libGL error: driver pointer missing
libGL error: failed to load driver: nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

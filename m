Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74451196303
	for <lists+nouveau@lfdr.de>; Sat, 28 Mar 2020 03:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EF86EAA3;
	Sat, 28 Mar 2020 02:12:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7D66EAA3
 for <nouveau@lists.freedesktop.org>; Sat, 28 Mar 2020 02:12:07 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id k63so3230357vka.7
 for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2020 19:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=twA0/hZW3iBAEpm2YtbPLgp6iAS/KNAshV7lwDnVvHw=;
 b=jvcifdmAJOrgGMPYlBabFUGQg96HXbr1zzl9YhDEKYRyQbODNusugYW/XD66fyNX84
 If8afyaWeUmFva7jtv9WE7BLbZUqMOuYo9ba+AFTvYg6zpRcNVAnkhtXz5u2tumg0euJ
 LzD9TF9qEcmzJh5GneyuuaVZRnWOW58h20pEOzouKOSjOBX9AD2dh+ONcQav8qGW77Ya
 Ry2LnVsQ5FmEkUX/29uBpJYj9NaIl4nQ5ayNiWHWXsqhixHNQnpi/2ZC4N+R/jjNf3Xc
 QXQVcqHjONSz94V73C9GKSgUk31IiUOYMsKmUsi9N1tw+G3t33CvZKOTY7etc3Oe1Iv/
 RwJA==
X-Gm-Message-State: AGi0PubuWTwedMsUtslu5sntLRScjS2ITU451tpH6k7QWKwrRUFC8UdX
 rJqhCnEkoUU3FYBAUBDCzI8Ry1cxnQFfLWdYW9jZ8fnQ/70=
X-Google-Smtp-Source: APiQypL3h+g5gP5Bq822ofIRG3zTvQrI/Ee7Dh2my8zx1K/pzoW7N5tlvEKL2sPBGwCGsS1X57LET1e/XV3Ma1pfLZw=
X-Received: by 2002:a1f:60d5:: with SMTP id u204mr1205216vkb.55.1585361527062; 
 Fri, 27 Mar 2020 19:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MSTo-4LDtfB_mQCU8ECi0BXCAazrdTiHm1BPObyHp=pUV9jg@mail.gmail.com>
In-Reply-To: <CA+MSTo-4LDtfB_mQCU8ECi0BXCAazrdTiHm1BPObyHp=pUV9jg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 27 Mar 2020 22:11:55 -0400
Message-ID: <CAKb7UviFtJY4d8PFMowUaGEkbne3xke+zWJfYgauNt9v60KFgg@mail.gmail.com>
To: Fernando Sahmkow <fsahmkow27@gmail.com>
Subject: Re: [Nouveau] Question on MME and Compute Subchannel in Kepler+
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I believe that there's a single shared resource for MME in GRAPH, not
separate ones for separate classes. Ultimately, the classes just
provide frontends for the single internal GRAPH engine. (This is
probably also why setting some stuff on the compute class "unsets" it
on the 3d class, or sometimes is directly visible.)

For compute on Kepler+, you don't actually need to use macros for
indirect compute dispatch -- the launch descriptor which contains the
grid dimensions is in memory, and the technique used is to just use
UPLOAD_EXEC to overwrite the necessary bits. (Small aside - Pascal got
a new launch descriptor, I forget which gen switch is.) Check how
nouveau does it in nve4_compute_upload_input (look for the
info->indirect case).

But you can see an example of a compute macro for Fermi (where there
is no separate launch descriptor):

https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nvc0/mme/com90c0.mme

And it's installed the same way as all the "3d" macros are:

https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c#n1429

As an aside, you may find this MME emulator useful in demmt. It's
fully accurate, AFAIK:

https://github.com/envytools/envytools/blob/master/demmt/macro.c

Hope this helps!

  -ilia

On Fri, Mar 27, 2020 at 9:34 PM Fernando Sahmkow <fsahmkow27@gmail.com> wrote:
>
> Hello everyone,
>
> I've been trying to adapt a switch emulator to emulate nouveau's compute. We've been told some things like indirect dispatch use the MME in Nouveau, however, looking at NVIDIA's open gpu documentation there's no MME in compute engine since Kepler. https://github.com/NVIDIA/open-gpu-doc/blob/master/classes/compute/clb1c0.h MME for compute should still exist because of the presence of MME Shadow Memory Scratch registers.
>
> How does MME for Compute works on Kepler+ ? Does it use the 3D Subchannel? if so how do I know when its targeting the Compute Subchannel?
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

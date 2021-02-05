Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1251C3112F6
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 22:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7311A6F4D5;
	Fri,  5 Feb 2021 21:00:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8F66F4D4
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 21:00:52 +0000 (UTC)
Date: Fri, 05 Feb 2021 21:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612558850;
 bh=eb00I4eXg81iMHdwrVyh4pRLnVJKZaQzHcrO2DkbR8k=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=KdwtvxR/Chmr54i8wKAvEz5NEQPysY8HIsAJcp8tGfibucH/e0zDpYrIbD5qp+jwB
 O17QzrPDzl7eV+vzK+tNiFddT6GA/KGFNXomV2LI0HocMxB2xQa1e+Bv+kG5//Q3CW
 iFsIodD2d9Rl7kHeuzjSegnEKSFfTfPDyT4OUbkkJJXPMuFMg7rfX7qswHkebK3SPm
 5sT7WWeWraXtaiIx4ItI2HhFCv7Up2ZKm/WKibKya7DtUe0lTC2r7j0MSB+wFib36C
 GdJI4iCpQ+soTdLiHMnH5qNhEKoYzslT2QNbBXoHsm9NhmS1to3mYwYmWMDDVMVU2h
 c6nnf5JxKAwvQ==
To: Ilia Mirkin <imirkin@alum.mit.edu>
From: Simon Ser <contact@emersion.fr>
Message-ID: <0am_JysnhvIm7YsD6g25wgVXQybQLOvU_eMbqptnONhP5_Xsjd3cCrFVc8bvjOQA7a7rH_JUY9Q3nac_TmoKDGubJ9sS2rqVuT8WCX15ikc=@emersion.fr>
In-Reply-To: <CAKb7UvgpiHY3Z3BtCW3yP2YbfTvmpYS2uvErz1SjkR07pV6DSw@mail.gmail.com>
References: <20210205164515.4622-1-contact@emersion.fr>
 <CAKb7UvgpiHY3Z3BtCW3yP2YbfTvmpYS2uvErz1SjkR07pV6DSw@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Subject: Re: [Nouveau] [PATCH] nouveau/dispnv50: add cursor size/pitch checks
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Friday, February 5th, 2021 at 6:34 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> > +       if (asyw->image.pitch[0] != asyw->image.w * 4) {
>
> Rather than hard-coding to 4, make this look at the format (or cpp,
> which should be available somewhere too I think). (Yeah, currently we
> only expose RGBA8, but we should also be doing RGB5A1.)

Makes sense.

> > +               drm_dbg_atomic(dev,
> > +                              "Invalid cursor image pitch: image must be packed (pitch = %d, width = %d)",
> > +                              asyw->image.pitch[0], asyw->image.w);
> > +               return -EINVAL;
> > +       }
> >
> >         ret = head->func->curs_layout(head, asyw, asyh);
>
> And this will fail due to the width/height not being supported, right?

Oh right, this function will perform size checks, and is better than the one
I added above because it actually checks that the combination is supported.
Will remove the one above in v2.

Thanks for the comments!
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

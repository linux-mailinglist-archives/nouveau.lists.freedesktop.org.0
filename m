Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125EA12B30E
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E8D6E181;
	Fri, 27 Dec 2019 08:14:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0B6E442;
 Tue, 26 Nov 2019 17:50:56 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id g12so8973559ild.2;
 Tue, 26 Nov 2019 09:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t54fAVQIi9k5/AbZql5pbL2ivaJ6crm1GO25m9MjvJc=;
 b=ATWoCaDTK3L62Ae6m3HNV6BKsPyvxBQuhyHHaO3QgvSSWyqbykVd4bX5NAIBjRvMio
 kLER7x38kNXm/78aAQD5HSJb0mAsWFcSkOF6txn5eWOPWmNF6bEpn1Y+ijU2c0ixBD2d
 zXol2/FurfuSesv7zr5bTxT+Z+bf0idq3SSf1/ekhPTSqbd11/HiKSUgGHn550ywg3IP
 SVdneLDrtS97GYycmry5pvAFNM0NQqSzN3GnJ94X3zA/7tnmLffKOKe+zLFLzLIoo4+B
 muMPEUw4KrHEh20uX9lRjQTtLEU9oGaCdZWkcxvYbZqKYd08cMN4Ol8cd8+MSJWH8lEU
 Fp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t54fAVQIi9k5/AbZql5pbL2ivaJ6crm1GO25m9MjvJc=;
 b=XoulAZWiniLes/GNXvFksn7km5RyL8ymujVtY09e2UVJVQKEC97tk6WIcH89vfZEN8
 jhsjvYqluThB9DLlW2fAnwalBquJLC9R/U/ha/Jcmk2NP2B/Ka96tjwvdk5Dhc/333HL
 goGpyBqigqAGmlt6wg0/k8czS+YOpB2p4KWx6zYs3TFUpmr1FaCalGgcJ/EuLR4YWoh4
 qNBNXCQ4+eb4xWRMeuvOHVMalj6VFF8YF/99OuOAbUL92qpBAa0LgxH6ZmeQmC2X6DY/
 GdXuho5dG1LKnUc/dMfEK+DPRH98mo1yueWsrnglL1k1LDeq6YrzOPTg6VAs0WQOV+s5
 X8JQ==
X-Gm-Message-State: APjAAAVOhGpsj9tQfW5j9d3H5rlGPHJpyK5FuDmrRkRlkYeX7Qzu6j0R
 DdQKUdBlGI02sHT5tKvHEvxuX1t4WGE4/f2nyau6Eg==
X-Google-Smtp-Source: APXvYqzm+6ORS3XPlQiKQzGWc5cG6OGpwMxeH1DU1CV56GkeNnwJblQL5RnEH0Uzo1SDohsp1pKp20tjI2IdfLHxu5A=
X-Received: by 2002:a92:ca8b:: with SMTP id t11mr26640081ilo.227.1574790656094; 
 Tue, 26 Nov 2019 09:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20191021211449.9104-1-navid.emamdoost@gmail.com>
 <CAEkB2ERA6Rx9fZiwXH+m8_OV8to0TuLJRVRiUKfKtSoeoT0uJw@mail.gmail.com>
In-Reply-To: <CAEkB2ERA6Rx9fZiwXH+m8_OV8to0TuLJRVRiUKfKtSoeoT0uJw@mail.gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 26 Nov 2019 11:50:44 -0600
Message-ID: <CAEkB2ER4dof02PcH6BDQoFNhkkds=zrPf+5-rSygUh=XU8H0zQ@mail.gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix memory leak in
 nouveau_bo_alloc
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
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

ping...

On Thu, Nov 21, 2019 at 12:09 PM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> On Mon, Oct 21, 2019 at 4:14 PM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> >
> > In the implementation of nouveau_bo_alloc() if it fails to determine the
> > target page size via pi, then the allocated memory for nvbo should be
> > released.
> >
> > Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
>
> Would you please review this patch?
>
>
> Thanks,
> Navid.
>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index f8015e0318d7..18857cf44068 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
> >                         break;
> >         }
> >
> > -       if (WARN_ON(pi < 0))
> > +       if (WARN_ON(pi < 0)) {
> > +               kfree(nvbo);
> >                 return ERR_PTR(-EINVAL);
> > +       }
> >
> >         /* Disable compression if suitable settings couldn't be found. */
> >         if (nvbo->comp && !vmm->page[pi].comp) {
> > --
> > 2.17.1
> >
>
>
> --
> Navid.



-- 
Navid.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B65D48291A
	for <lists+nouveau@lfdr.de>; Sun,  2 Jan 2022 05:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D45989FA0;
	Sun,  2 Jan 2022 04:17:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E53210E342
 for <nouveau@lists.freedesktop.org>; Sat, 18 Dec 2021 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1639796297; x=1671332297;
 h=mime-version:references:in-reply-to:from:date:message-id:
 subject:to:cc; bh=KziBpYYiI76v0rTQKZkMxGcmjJMQJL/2X+fDliRgTY8=;
 b=tPc+aFdt7Gj+Jfikf7QGa+cWEPmNXbDz5ScutfhOao9EUebvZ1gV4CHs
 4VGRs/oGNsyS+Em4immhAkzMYKtUeWQAJqOuzbVE7SQu/N/IKds5HDQ2n
 3aVjwd/AhpGQcYA5G0bk0jn9z9pDiX0aQWc5fePk8q60aujZb5GXY4PEy
 sfhweaRnfmlsUQPIEO3s6p/1s27Q13c5ZIF2BIRJcQ3Z3LF4XD/9YHJSm
 J0KnUEfO6a5DGv8HXrBdJp59YQhVlcoDUKv/4BBRHHgkKhgms1KGsqn70
 9EfEeFPrr2jZVI+gre1knoPOuXuPCxgSl6ubl6+e/L7S/UlamO9Jkx6sx g==;
IronPort-SDR: DzftAW3mZXcAe5mu1Nk7nbFJMhSiLtkcRPof2k5YnxORRmHAl/B6bODiRNbTXDkzT7jDLhljOl
 gC++kJ96UXMiu3GWQr75nyCELWddYK8hWs6R6kkxTwVbIvQd8NTLTLIxF3nHoA9B9LphzvARW1
 Z2ZOABquQ8kxyByfj8K3uJbT55dhanE6tkViSZnVi3qtaWoF3tAmckt0RE1P3ityVnUUN0z/uT
 +vAFm5aVnamyQfwNgI7WFf/32Assq7Izeza4jDJGU32+BIFmaJ66rqNpRu9ClQG/McFXPnSWHx
 SWWEhDgjESuE4Dm0vMrDA9Q4
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="91926352"
Received: from mail-yb1-f197.google.com ([209.85.219.197])
 by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Dec 2021 18:58:16 -0800
Received: by mail-yb1-f197.google.com with SMTP id
 y125-20020a25dc83000000b005c2326bf744so8323557ybe.21
 for <nouveau@lists.freedesktop.org>; Fri, 17 Dec 2021 18:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vmmsxncbFQ/2xzccVTZIkFvvP7ArQ13zGZOkstUsL4=;
 b=sTD11NtvmH1Wv1kqJu2D8MlUjyJcoEmt2d7+XfYXMulaWxXKuc6ajV7X/2OwVhFI22
 5/uGolBmOKVtUn/vvXD3Et12z1EV98H3MUEL6OMaXJqq+IJaDfnYYa0vcB5dumi3YJGf
 y6SMwAQXEgrG9URbzO7R3PgY7j0vTkxDElUZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vmmsxncbFQ/2xzccVTZIkFvvP7ArQ13zGZOkstUsL4=;
 b=dDu5Vl4kuIrf+6+pzDzkhgTL83GoBiJcVaaaGnG4qOQuv8R6NPnslr0CHTDANOV6Vw
 W5kgW4eenlzg2wD7/RfdPnVWR605YXnliKfmZI3CivHFOnOryLwrgevsQ+Piy6npuvIt
 5eT9ZvaeQhVYM8JMyC9qLonmMJnJACKXf+RiVzPLnpJ6iiPhzGJ/Nh8+Tt0D1N0INEgP
 GpSq+4YthgAPWTRP1ZSsJY8d9KCFf5rtNFjorCmpxKAYZkgfopzaLvRMCvMxvho9ekkN
 hDwkXckybpytUuFUpZNu7aocwOY/vAAOoo37OqhDrNIlE5q+r1tascFD89C5tOrEEIpO
 qLeQ==
X-Gm-Message-State: AOAM530yqI/wC58AW7hsgUQFjUVvLOAAzOUhi0zrwNpK+DiPagFe/VkN
 i/VnxJDo8OUtw0oZJNrZRt28uC3SEv2hSekW26LnrJekGCOYmpP8sgQDm3OOd2CRR08X9Q/PGmR
 QJEw6xD5Ew2Z2BvmvdjrgNlqAmW1JtiCwPyeQfQL9kZI=
X-Received: by 2002:a25:a2c1:: with SMTP id c1mr8726871ybn.473.1639796295384; 
 Fri, 17 Dec 2021 18:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp6oA3pKkoWsKv1T0ej6zGhz3AR1ptfd0MFDEzORS1I7HWhSsr8wqxEJJfoR4dKLFSYf+Key6yqyGe/HuR3xk=
X-Received: by 2002:a25:a2c1:: with SMTP id c1mr8726855ybn.473.1639796295099; 
 Fri, 17 Dec 2021 18:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20211116070708.429432-1-yzhai003@ucr.edu>
 <6a79eef26121afa9190de5a021f4edef53fc9651.camel@redhat.com>
In-Reply-To: <6a79eef26121afa9190de5a021f4edef53fc9651.camel@redhat.com>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Fri, 17 Dec 2021 18:58:04 -0800
Message-ID: <CABvMjLQky6Xe80oJ9pPALjQ_SgMmp-Crp4z-Y08SiRo4TNTPSg@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 02 Jan 2022 04:17:56 +0000
Subject: Re: [Nouveau] [PATCH] In function nvkm_ioctl_map(),
 the variable "type" could be uninitialized if "nvkm_object_map()"
 returns error code, however,
 it does not check the return value and directly use the "type" in the if
 statement, which is potentially unsafe.
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Lyude:
I appreciate your feedback and I misplaced the commit message to the
title, I have modified it and resend the patch.
I made my linux development tree a mess, so I sent a brandly new one
and cc you. Thanks again for your help: )


On Tue, Nov 16, 2021 at 1:18 PM Lyude Paul <lyude@redhat.com> wrote:
>
> This is a very long patch name, it should probably be shorter and the
> details in the patch title moved into the actual commit description
> instead. Also a couple of things aren't formatted correctly:
>
> * Cc tag for stable is missing, see
>   https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> * Fixes tag isn't formatted properly
>
> I generally recommend using `dim fixes` from
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> in order to get the correct stable kernel CC tag and Fixes: tag (you can
> drop any of the Ccs it gives you beyond the one to stable at vger dot
> kernel dot org.
>
> Also, if you could try to Cc: me on the next version - will help me
> respond faster :).
>
> On Mon, 2021-11-15 at 23:07 -0800, Yizhuo Zhai wrote:
> > Fixes:01326050391ce("drm/nouveau/core/object: allow arguments to
> > be passed to map function")
> > Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > index 735cb6816f10..4264d9d79783 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
> >                 ret = nvkm_object_map(object, data, size, &type,
> >                                       &args->v0.handle,
> >                                       &args->v0.length);
> > +               if (ret)
> > +                       return ret;
> >                 if (type == NVKM_OBJECT_MAP_IO)
> >                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
> >                 else
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>


--
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside

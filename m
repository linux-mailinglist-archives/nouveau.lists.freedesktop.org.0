Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DC6F6BF3
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE7010E4DC;
	Thu,  4 May 2023 12:33:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD00710E357
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 04:25:10 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso15315673pjr.5
 for <nouveau@lists.freedesktop.org>; Mon, 06 Mar 2023 20:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678163110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3KTnrnv3dHcE3f0vIugluw/FAEArmhiZErhNRUYdOI=;
 b=JCWbMWcIe94/eoDecPbu1BSXlFXilW6amLFsklUPmQfAy/SwqTxb1QanUFqSIl2TAR
 EU0u5XyNa+1Hz0GdSMbJ0GVogKlTZFEpE57kMF8EwDLy8Zj/npvjsFvQ/x0PNvFojBwQ
 GwGFFSbBPJhVf/N0JGfDPrqxPKF5Nc/UmzhpSTaUXtD38mNfjZCS0GrNTvW9ir45VRT7
 9Ekdlhmq8TJT26P2w/ttNMjzQ36qQrVH5tnc8uwVhIlJlYwlxm8PNJ3FAUpQ3qpd2/yG
 Tgn19JQ/4g9wJbu1FlRumOn/U190Eb2sDneZq2y3moRHGAUunK+c9CnJDkZKtxhHJ4pt
 6kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678163110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3KTnrnv3dHcE3f0vIugluw/FAEArmhiZErhNRUYdOI=;
 b=YA0ZOuw9qCEurRXKVcA5CfWGFc5vLJns8/2B6t0/6QFgj77nBkiP+vzWvmElkAIrMT
 /Kufsf5/AwnVjTbxt9JCXhCS0bdMqUD2hAxcIEAH7MGVkKxeSndwkReJcvc5XhvtAS92
 qAdq7zewuluqf9rKl0HqNLOloZIwcFcowB/nC3bsB3ULhf2hzgJx9AEufooo4wO5SotL
 D5E9OoUSRlmMbvnqAjqZtb6fGGY/rCNjMyLm//Xk2eS+tY3hrgb+R01P6zTvoNVUH3oe
 hw4zG3+qhG33hcmyGR0k1dyt3b99KQbkauj0Rjk0j6SPF+r8heoqEf0mfkUwfGG09Vz2
 NyyA==
X-Gm-Message-State: AO0yUKWNwMEF4eM5N1+UBQARK51n8VugBkTFZ/aF1FTC6xFM4R31h1gc
 ZWElrr6eASQgrVtRj0Hpe6P2VN3hMMQeVgEOYXI=
X-Google-Smtp-Source: AK7set/16SayqVO0T/l1KqHu4xJ95/iM0Gu0PLByPiWI+Ia6I+98f3uYrMX2bHVwAw8aLBcT0g1wTIC1OH0pVtPqSCc=
X-Received: by 2002:a17:902:ef92:b0:19a:8259:c754 with SMTP id
 iz18-20020a170902ef9200b0019a8259c754mr5099471plb.0.1678163109892; Mon, 06
 Mar 2023 20:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20221029074654.203153-1-zyytlz.wz@163.com>
 <5882bd80983ac04a32676f07622cba7d0e245e55.camel@redhat.com>
In-Reply-To: <5882bd80983ac04a32676f07622cba7d0e245e55.camel@redhat.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 7 Mar 2023 12:24:58 +0800
Message-ID: <CAJedcCxmnnrVsq6TtyNPp1v7yv6hszbWnRub8V=ZNFA7OaFa=g@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:36 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: fix use-after-free bug in
 nvkm_vmm_pfn_map
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
Cc: alex000young@gmail.com, security@kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, bskeggs@redhat.com,
 daniel@ffwll.ch, Zheng Wang <zyytlz.wz@163.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

This bug has been proved to be a false positive. So there is no need
to make the patch.

Thanks,
Zheng

Lyude Paul <lyude@redhat.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=887=E6=97=A5=E5=
=91=A8=E4=BA=8C 08:11=E5=86=99=E9=81=93=EF=BC=9A
>
> Actually - could you resend this with dri-devel@lists.freedesktop.org add=
ed to
> the cc list just to make patchwork happy?
>
> On Sat, 2022-10-29 at 15:46 +0800, Zheng Wang wrote:
> > If it failed in kzalloc, vma will be freed in nvkm_vmm_node_merge.
> > The later use of vma will casue use after free.
> >
> > Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> > Reported-by: Zhuorao Yang <alex000young@gmail.com>
> >
> > Fix it by returning to upper caller as soon as error occurs.
> >
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > index ae793f400ba1..04befd28f80b 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > @@ -1272,8 +1272,7 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, =
u64 addr, u64 size, u64 *pfn)
> >                                                      page -
> >                                                      vmm->func->page, m=
ap);
> >                       if (WARN_ON(!tmp)) {
> > -                             ret =3D -ENOMEM;
> > -                             goto next;
> > +                             return -ENOMEM;
> >                       }
> >
> >                       if ((tmp->mapped =3D map))
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

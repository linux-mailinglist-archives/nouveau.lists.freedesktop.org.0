Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F98B60B2
	for <lists+nouveau@lfdr.de>; Mon, 29 Apr 2024 19:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BB910EB98;
	Mon, 29 Apr 2024 17:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gyglX9dJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E0A10F027
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 17:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714413269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ype1v6kiFfmsjABNIIcOV532jtXMQZ0jQQvVfGIFAzE=;
 b=gyglX9dJkzcK6zMo83l4PB4hWjI0oPyLy3UdsDgemywczWPn0/TuOBCbRdfCOOcLqIzTic
 LrbKOnS9MVfcY+N+wYVxrgY31NRCoIJcmp3iTWXDrXueFGPHqSeARXOob6QWvfk58hzsJw
 +Kk3fGHU4zqkLGXjXjVyQPZWTiNJKGo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-unWOx3RZNsiC-0yaqhur8A-1; Mon, 29 Apr 2024 13:54:28 -0400
X-MC-Unique: unWOx3RZNsiC-0yaqhur8A-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-790f55f69a7so177409285a.0
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 10:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714413268; x=1715018068;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ype1v6kiFfmsjABNIIcOV532jtXMQZ0jQQvVfGIFAzE=;
 b=bWi4FnOX+wiDcxfCEUFc4CQnfYNLT/o1yHmb7ipBhP2QDHC8aPGtkI/6oe6B0YszSz
 0MWeK6f3frjq8dGUrDpZ3ms8lHUVN978u/MfaQn/axmHxhH3pvUeWG762N50o6fnrkzg
 GqGUtuYxuaUV2VKAZMuV80ri9sylg7KYbNxlPfgxC3HevQKn1JB4IGjcNKpGjaJ7R2ut
 fUff8wF4pcgDsALMergpQtUukyQssSuDe+iJpnTEMF+1An2fN5KID6ZEyp40wVEfgHG2
 HgfvSOv0Y2oY7bJP/B0Sn5gzQwiFvHz2mRwu8JEmG3Ca7VOOjpuZ+mhORHFqw2Pve95J
 aWBQ==
X-Gm-Message-State: AOJu0YzdT/Q3hlWyB0xLNqmrX0djKYlUL1iPhQHP93+wzBRICTDW37E9
 21gQ/POdLvFCYoT9UP7kXhHt3K8HUGgmf9G7xfQBRnivtjQmurxQZZkVCBhjGpeHrsBAoBnesnZ
 JMcEBs1Kv6U1EHF30HQXeq5EALNmQuZRbDPmCe4g43EK8iiZot8pjgBgU7SPuhks=
X-Received: by 2002:a05:620a:4045:b0:790:c01a:2c20 with SMTP id
 i5-20020a05620a404500b00790c01a2c20mr288989qko.74.1714413267791; 
 Mon, 29 Apr 2024 10:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4ju2zz7vG7FCZK0OPUJOhir1BIvHKqGWTvYWM2+TupK/mAQcQx7+iEqSQG0BoImvyK7vcNA==
X-Received: by 2002:a05:620a:4045:b0:790:c01a:2c20 with SMTP id
 i5-20020a05620a404500b00790c01a2c20mr288962qko.74.1714413267417; 
 Mon, 29 Apr 2024 10:54:27 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c6c:a300::789])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05620a13e600b0078f044ff474sm10696246qkl.35.2024.04.29.10.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 10:54:26 -0700 (PDT)
Message-ID: <ba3e7914e816f893bdba9aebe045f9af04ed85a6.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau/gsp: Use the sg allocator for level 2
 of radix3
From: Lyude Paul <lyude@redhat.com>
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Karol
 Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Daniel
 Vetter <daniel@ffwll.ch>,  Dave Airlie <airlied@redhat.com>, Ben Skeggs
 <bskeggs@redhat.com>, Timur Tabi <ttabi@nvidia.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, open list <linux-kernel@vger.kernel.org>
Date: Mon, 29 Apr 2024 13:54:25 -0400
In-Reply-To: <CAPM=9txB5Zhyyno-GLD_JShV-GZd8hgYVh=Ok=Skmzs=eTi64A@mail.gmail.com>
References: <20240426154138.64643-1-lyude@redhat.com>
 <20240426154138.64643-2-lyude@redhat.com>
 <CAPM=9txB5Zhyyno-GLD_JShV-GZd8hgYVh=Ok=Skmzs=eTi64A@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 2024-04-29 at 16:03 +1000, Dave Airlie wrote:
> > Currently, this can result in runtime PM issues on systems where
> > memory
> > Luckily, we don't actually need to allocate coherent memory for the
> > page
> > table thanks to being able to pass the GPU a radix3 page table for
> > suspend/resume data. So, let's rewrite nvkm_gsp_radix3_sg() to use
> > the sg
> > allocator for level 2. We continue using coherent allocations for
> > lvl0 and
> > 1, since they only take a single page.
> >=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: stable@vger.kernel.org
> > ---
> > =C2=A0.../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |=C2=A0 4 +-
> > =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c=C2=A0=C2=A0=C2=A0 | 71=
 ++++++++++++---
> > ----
> > =C2=A02 files changed, 47 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > index 6f5d376d8fcc1..a11d16a16c3b2 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > @@ -15,7 +15,9 @@ struct nvkm_gsp_mem {
> > =C2=A0};
> >=20
> > =C2=A0struct nvkm_gsp_radix3 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvkm_gsp_mem mem[3];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvkm_gsp_mem lvl0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvkm_gsp_mem lvl1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table lvl2;
>=20
> This looks great, could we go a step further and combine lvl0 and
> lvl1
> into a 2 page allocation, I thought we could combine lvl0/lvl1 into a
> 2 page alloc, but that actually might be a bad idea under memory
> pressure.

I'm not sure I understand :P, do we want to go for that or not? TBH -
I'm not sure there's any hardware reason we wouldn't be able to do the
whole radix3 table as an sg allocation with two additional memory pages
added on for level 0 and 1 - since both of those can only be the size
of a single page anyway it probably doesn't make much of a difference.

The main reason I didn't end up doing that though is because it would
make the codepath in nvkm_radix3_sg() a lot uglier.=C2=A0We need the virtua=
l
addresses of level 0-2's first/only pages to populate them, and we also
need the DMA addresses of level 1-2. There isn't an iterator that lets
you go through both DMA/virtual addresses as far as I can tell - and
even if there was we'd start having to keep track of when we reach the
end of a page in the loop and make sure that we always set pte to the
address of the third sg page on the first iteration of the loop. IMO,
scatterlist could definitely benefit from having an iterator that does
both and can be stepped through both in and out of for loop macros
(like Iterator in rust).

So - it's definitely possible, but considering:

 * nvkm_gsp_mem isn't a very big struct
 * We're only allocating a single page for level 0 and 1, so at least
   according to the advice I got from Sima this should be a safe amount
   to allocate coherently under memory pressure.
 * It's just a lot easier code-wise having direct address to the
   DMA/virt addresses for the first two levels

I decided to stay with nvkm_gsp_mem_ctor() for the first two pages and
just use nvkm_gsp_sg() for the rest. I can definitely convert the whole
thing to using nvkm_gsp_sg() if we really want though - but I don't
think it'll give us much benefit.

I'll send out the new version of the patch without these changes and a
fix for one of the issues with this patch I already mentioned to Timur,
just let me know what you end up deciding and I can revise the patch if
you want.

>=20
> Dave.
>=20

--=20
Cheers, Lyude Paul (she/her) Software Engineer at Red Hat


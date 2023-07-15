Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A17547DD
	for <lists+nouveau@lfdr.de>; Sat, 15 Jul 2023 11:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF7410E0BD;
	Sat, 15 Jul 2023 09:23:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABC410E0B1
 for <nouveau@lists.freedesktop.org>; Sat, 15 Jul 2023 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689412996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T67vF7lK28TebQE5iDVY482spLCTkCO2SL9TUb1C5Xo=;
 b=IuSiPzbggsQiiuqk5XnwUtbbt9FnP1lOGV4oZaro8lVrcuuPwafEkOZGLxZgrEEnIzvzg1
 YBWNQY3cMs8rQGOUu3n++H2a3RiryB51AVWIwZxCd5eRxBe/0ca1t7ZeFNCbmiIx3TInaw
 D9PWGj2dOD8iiWnFrX52sK6+vp5bgLI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-YtdLkqIMPbi81lBxk-Weqw-1; Sat, 15 Jul 2023 05:23:14 -0400
X-MC-Unique: YtdLkqIMPbi81lBxk-Weqw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b72262fb80so4838721fa.0
 for <nouveau@lists.freedesktop.org>; Sat, 15 Jul 2023 02:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689412992; x=1690017792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T67vF7lK28TebQE5iDVY482spLCTkCO2SL9TUb1C5Xo=;
 b=PAtRV6vIa888v5lAOMYsQcbgRVC7kmw5GoCjcPdAK9Na54gUEauLaBLuPdgv9egVBV
 gWVzRNjUgSgwweqFfp7XNM4+2mWedDF5jjwzkn1mrGM/MHcaf8aztbw9YIb0z414dWgH
 d8Q/g7Oj5A94oiPXyTXRMsRo4XQnTHnvHBrmfDNzd+jDDrNa3ss3k6LnU5zhm3k+tMdz
 FdFmjHaeEF0tPhVXVBC4+huAH+ux25JwAkvfVpOs/UKe0oO4NdZE8COtxQxXachvqucH
 MqbG2LXmIVYSEXxc//h3WqmLW0xeRYwLp8pbCjktRFAUfSTXujQVGN6HOrPDb/ZG1Q6D
 jXdQ==
X-Gm-Message-State: ABy/qLZV2oiBeI4aTY6x6o8pl+qtHXvuOjjZyglIkhNyBrmw7Pa3ORak
 GQ2G2i59PmAXxLBxSDJYiW8pj1AkOBKTqZLn9FTH3j933WDeqNWMC0q19TQJ2HGP4AToMyDrOqQ
 HmgqIKSVVp3BdnZPHUtTWzESJQx8pzSKS2PSey/QpXg==
X-Received: by 2002:a05:651c:2123:b0:2b6:a662:b879 with SMTP id
 a35-20020a05651c212300b002b6a662b879mr964538ljq.3.1689412992754; 
 Sat, 15 Jul 2023 02:23:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFalwUBzCDIhgeQM4PgOEFdZlcRiXI5UE3UZbzH859X91WuS1+9/Njeg/b/sg7vTRMDlagQb8LNWaQla49OP5g=
X-Received: by 2002:a05:651c:2123:b0:2b6:a662:b879 with SMTP id
 a35-20020a05651c212300b002b6a662b879mr964525ljq.3.1689412992377; Sat, 15 Jul
 2023 02:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <5c894d0a8a178628ca200d054004be3c@208suo.com>
 <f25017a660f8a3a4e49258a1d96003dc@208suo.com>
 <2f4a7303e305d07fdd9c15a9dc95dc5f@208suo.com>
 <d0d767fb0dd3a9b7642559f379dbb0d6@208suo.com>
 <0ad4154429aaa41ca26da859c3f35784@208suo.com>
 <856d1130fad58062ea454da297fa64348382bda2.camel@redhat.com>
In-Reply-To: <856d1130fad58062ea454da297fa64348382bda2.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 15 Jul 2023 11:23:01 +0200
Message-ID: <CACO55tu08XTx=TZQK=RyCGRdFVDQN9m+X+y3F3V0H7nuwyycRw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fifo:Fix Nineteen occurrences of
 the gk104.c error: ERROR: : trailing statements should be on next line
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
Cc: huzhi001@208suo.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, daniel@ffwll.ch,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jul 15, 2023 at 1:07=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> NAK - checkpatch.pl is a (strongish) guideline, but not a rule. In the ca=
ses
> corrected in the patch series here, we format the switch cases on single =
lines
> as it dramatically improves the readability of what is otherwise just a /=
long/
> list of slightly different static mappings. I don't believe we're the onl=
y
> part of the kernel to do this either.
>

I wished there was a place to document something like "patches whose
only reason is 'checkpatch.pl' said so" will be rejected.

I think following some checkpatch rules are sane, but then the
argument should be "makes code more clear" or "converts risky coding
practises to less risky ones". Or do we have such a place? Maybe we
should patch checkpatch.pl instead to throw a warning

> On Fri, 2023-07-14 at 14:58 +0800, huzhi001@208suo.com wrote:
> > Signed-off-by: ZhiHu <huzhi001@208suo.com>
> > ---
> >   .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  | 40 ++++++++++++++----=
-
> >   1 file changed, 29 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > index d8a4d773a58c..b99e0a7c96bb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > @@ -137,15 +137,29 @@ gk104_ectx_bind(struct nvkm_engn *engn, struct
> > nvkm_cctx *cctx, struct nvkm_chan
> >       u64 addr =3D 0ULL;
> >
> >       switch (engn->engine->subdev.type) {
> > -    case NVKM_ENGINE_SW    : return;
> > -    case NVKM_ENGINE_GR    : ptr0 =3D 0x0210; break;
> > -    case NVKM_ENGINE_SEC   : ptr0 =3D 0x0220; break;
> > -    case NVKM_ENGINE_MSPDEC: ptr0 =3D 0x0250; break;
> > -    case NVKM_ENGINE_MSPPP : ptr0 =3D 0x0260; break;
> > -    case NVKM_ENGINE_MSVLD : ptr0 =3D 0x0270; break;
> > -    case NVKM_ENGINE_VIC   : ptr0 =3D 0x0280; break;
> > -    case NVKM_ENGINE_MSENC : ptr0 =3D 0x0290; break;
> > -    case NVKM_ENGINE_NVDEC :
> > +    case NVKM_ENGINE_SW:
> > +        return;
> > +    case NVKM_ENGINE_GR:
> > +        ptr0 =3D 0x0210;
> > +        break;
> > +    case NVKM_ENGINE_SEC:
> > +        ptr0 =3D 0x0220;
> > +        break;
> > +    case NVKM_ENGINE_MSPDEC:
> > +        ptr0 =3D 0x0250;
> > +        break;
> > +    case NVKM_ENGINE_MSPPP:
> > +        ptr0 =3D 0x0260;
> > +        break;
> > +    case NVKM_ENGINE_MSVLD:
> > +        ptr0 =3D 0x0270;
> > +        break;
> > +    case NVKM_ENGINE_VIC:
> > +        ptr0 =3D 0x0280; break;
> > +    case NVKM_ENGINE_MSENC:
> > +        ptr0 =3D 0x0290;
> > +        break;
> > +    case NVKM_ENGINE_NVDEC:
> >           ptr1 =3D 0x0270;
> >           ptr0 =3D 0x0210;
> >           break;
> > @@ -435,8 +449,12 @@ gk104_runl_commit(struct nvkm_runl *runl, struct
> > nvkm_memory *memory, u32 start,
> >       int target;
> >
> >       switch (nvkm_memory_target(memory)) {
> > -    case NVKM_MEM_TARGET_VRAM: target =3D 0; break;
> > -    case NVKM_MEM_TARGET_NCOH: target =3D 3; break;
> > +    case NVKM_MEM_TARGET_VRAM:
> > +        target =3D 0;
> > +        break;
> > +    case NVKM_MEM_TARGET_NCOH:
> > +        target =3D 3;
> > +        break;
>
> This one isn't very long, but I'd still say it's definitely a lot easier =
to
> read in the compact form. If anything, the only change I would make here =
is
> formatting the default: case to be on a single line as well
>
> >       default:
> >           WARN_ON(1);
> >           return;
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5BE6AF971
	for <lists+nouveau@lfdr.de>; Tue,  7 Mar 2023 23:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9A010E568;
	Tue,  7 Mar 2023 22:49:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3380710E564
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 22:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678229352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urgniuwIBWeoGMPS8boRrlzhMscnLqM508A9kIsStfo=;
 b=ONtoVQsIxfRDXaquJPT1q13s3M6kpQ7+HkR2dIXFvYHsqLNbB6AtzxhvHmqomZw1i4NUJX
 Dw2LYqZHrDOTpqLK2MqCJHSCVmrKoP/8/Scw2Yz1cJZnaHbEvKS8bv+UQMyxc1L5uinw8F
 Hiv4t/AbPmmRV93RTRX7YnhAebCbyuw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-tCWli48jOrysf7Ep3jXBDQ-1; Tue, 07 Mar 2023 17:49:11 -0500
X-MC-Unique: tCWli48jOrysf7Ep3jXBDQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 g11-20020ac8774b000000b003bfa92f56cbso7983161qtu.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 Mar 2023 14:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229350;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jpiPjWQVLrWJQByXN7/QqMdv5LfiV5aMULGXTdQqSWA=;
 b=c49eIYrXkOgWU/LUZ94TfQsmqSItjl/g2fPIuDg+nSE8NXQpoZSnaQzxP5vAJthvHV
 Cm3w1s+eG/vUBeG0hTXat88DdJk91rU1hO6Hm3pGDN0sujmhk3K+aYYSdJ2d5SaeRxRK
 SZbFDvDS/uUbdPMSnikYzMgtqrhGSPOzR7FCRYjWSz85fuSqH9UtonRaluia77pMwg3q
 Zvpga1H+FO/9cbg7Y96nbxQHyjQCGs8OiQjkRdSF3w0LjEByaTt3BUv+Gt7QVPxS+VC1
 g4uoRdy+WUA9nVMxuJOWt+eAsXsrcUL+Spn+4jE3vhKr2ttUMsqK+QItghIO9C4jYFux
 3jIg==
X-Gm-Message-State: AO0yUKUf/ZxGiZdr1Vhq3721QbwL5H8H2r/vi31TN6sBArhS7Ob8bEZ6
 IHHSUPeYOvqhSa0FInQg6fMazEkj0vMTAgLfx8KDoA8KBts8MmOLABSMRLAVWWvKCrJr48bzHSW
 eKxXYdyaH/IXf2RGlYNus15CsMQ==
X-Received: by 2002:a05:622a:15c6:b0:3bf:e39f:a9aa with SMTP id
 d6-20020a05622a15c600b003bfe39fa9aamr29975761qty.27.1678229350745; 
 Tue, 07 Mar 2023 14:49:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8D0kt0w8UWfWFSmc8IGR59KwpNAYdDZegDL5U+4w/82o/iSmt73NW03WYqKFasWTrX/rU/LA==
X-Received: by 2002:a05:622a:15c6:b0:3bf:e39f:a9aa with SMTP id
 d6-20020a05622a15c600b003bfe39fa9aamr29975745qty.27.1678229350506; 
 Tue, 07 Mar 2023 14:49:10 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 191-20020a370cc8000000b007416c11ea03sm10364394qkm.26.2023.03.07.14.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:49:09 -0800 (PST)
Message-ID: <361fb10adaa1cb3ff5360cbb0e36a3c1e99fe3e8.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jakob Koschel <jkl820.git@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 07 Mar 2023 17:49:08 -0500
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v1-1-0702ec23f970@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
 <20230301-drm-nouveau-avoid-iter-after-loop-v1-1-0702ec23f970@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/device: avoid usage of list
 iterator after loop
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2023-03-01 at 18:25 +0100, Jakob Koschel wrote:
> If potentially no valid element is found, 'pstate' would contain an
> invalid pointer past the iterator loop. To ensure 'pstate' is always
> valid, we only set it if the correct element was found. That allows
> adding a BUG_ON in case the code works incorrectly, exposing currently
> undetectable potential bugs.
>=20
> Additionally, Linus proposed to avoid any use of the list iterator
> variable after the loop, in the attempt to move the list iterator
> variable declaration into the marcro to avoid any potential misuse after
> the loop [1].
>=20
> Link: https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5SqXP=
wr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/=
gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> index ce774579c89d..7c9dd91e98ee 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> @@ -72,7 +72,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl=
, void *data, u32 size)
>  =09} *args =3D data;
>  =09struct nvkm_clk *clk =3D ctrl->device->clk;
>  =09const struct nvkm_domain *domain;
> -=09struct nvkm_pstate *pstate;
> +=09struct nvkm_pstate *pstate =3D NULL, *iter;
>  =09struct nvkm_cstate *cstate;
>  =09int i =3D 0, j =3D -1;
>  =09u32 lo, hi;
> @@ -103,11 +103,14 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *=
ctrl, void *data, u32 size)
>  =09=09return -EINVAL;
> =20
>  =09if (args->v0.state !=3D NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
> -=09=09list_for_each_entry(pstate, &clk->states, head) {
> -=09=09=09if (i++ =3D=3D args->v0.state)
> +=09=09list_for_each_entry(iter, &clk->states, head) {
> +=09=09=09if (i++ =3D=3D args->v0.state) {
> +=09=09=09=09pstate =3D iter;
>  =09=09=09=09break;
> +=09=09=09}
>  =09=09}
> =20
> +=09=09BUG_ON(!pstate);

Let's replace this with

=09=09if (WARN_ON_ONCE(!pstate))
=09=09=09return -EINVAL;

>  =09=09lo =3D pstate->base.domain[domain->name];
>  =09=09hi =3D lo;
>  =09=09list_for_each_entry(cstate, &pstate->list, head) {
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


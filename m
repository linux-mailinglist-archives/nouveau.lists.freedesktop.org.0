Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075147D4B79
	for <lists+nouveau@lfdr.de>; Tue, 24 Oct 2023 11:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DF010E08A;
	Tue, 24 Oct 2023 09:05:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CCB10E08A
 for <nouveau@lists.freedesktop.org>; Tue, 24 Oct 2023 09:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698138339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJFeVYGumiebwWsYYbIT5XS/Q295+ozwOkR6k8fX8Uw=;
 b=Mog9KumjP85PMkZTbD8jF7ebJ5p0rENFZnj2mgkmssEqG++6FrRXxg602XJgo7hdHpXIgL
 u04m5Z3MlqSZPRweWcCVLUUbzX15rGIfFI3gnTxUPh4SLQuuKVqzBAeKIKMyljh3HSpJf9
 DRLofoxx7ob8Dpr2sbpF6v20ygR9bZ8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-5K-uoHQjOT6V9PcXG3bIxQ-1; Tue, 24 Oct 2023 05:05:27 -0400
X-MC-Unique: 5K-uoHQjOT6V9PcXG3bIxQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-637948b24bdso13271216d6.1
 for <nouveau@lists.freedesktop.org>; Tue, 24 Oct 2023 02:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698138326; x=1698743126;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mJFeVYGumiebwWsYYbIT5XS/Q295+ozwOkR6k8fX8Uw=;
 b=nfyhd5nbCgZByXDJ/mrK83AIi5cBhosldVNRRy7p/uqcXzQgdtW9OWpXXA9PaLnW4L
 W7xsBtvrh82ZEegJKhHX2X/+NomOgIrHztpV55c/5vDs28FWXr5pNAcbtTjSySF7h0kx
 HZnGFaM1KRV4JBhhaHPzboR26B2P8+ur404/9vYdnjynawebM6kiXdA6kkUmmR2OVmx8
 zcC51RsG673TpazJSDSA5WkPR07VsoeVJpuw/bqkPGNTqrydTGs5uk3qTWLSD7SHV8UJ
 cAt58rSXefgo0T/jGdzFK4VR/IyPHAK+B6h4scRINBRlX0kYbEc4haHhEjcfIAoIyG2h
 96iA==
X-Gm-Message-State: AOJu0YyyDkG1zUd0sL1N0zkMiu4DbWj6XDuIypjLXVpuRZS4gK9ZVZ23
 BWjR+diQyzyeGt1kvr8KlrABpgT6/abjTsswvEa3VfOUuO5BEMsg09B5w0Ke7KYnk7q3OyP2/Fn
 MWQt1HqvcA2ONLfmFGWVX837NKs9en9EBQQ==
X-Received: by 2002:a05:6214:4404:b0:66d:4994:b79a with SMTP id
 oj4-20020a056214440400b0066d4994b79amr11770150qvb.5.1698138326357; 
 Tue, 24 Oct 2023 02:05:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQEBMn7bYpL2Wkq5l640xHcSYQ25UENPAUDY4FyyI8kUC3UylFahSn23D5WDt1QkElSg/cxg==
X-Received: by 2002:a05:6214:4404:b0:66d:4994:b79a with SMTP id
 oj4-20020a056214440400b0066d4994b79amr11770142qvb.5.1698138326104; 
 Tue, 24 Oct 2023 02:05:26 -0700 (PDT)
Received: from [10.32.64.210] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 l15-20020ad4452f000000b0066cf2423c79sm3505317qvu.139.2023.10.24.02.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 02:05:25 -0700 (PDT)
Message-ID: <80febd889ec89a42796d1df39146e838cc06ac0e.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
Date: Tue, 24 Oct 2023 11:05:24 +0200
In-Reply-To: <20230918202149.4343-18-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-18-skeggsb@gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 17/44] drm/nouveau/mmu/tu102-: prepare for
 GSP-RM
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 2023-09-19 at 06:21 +1000, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
>=20
> - (temporarily) disable if GSP-RM detected, will be added later

disable _what_?
The other commit messages at least briefly name the component. This one
should as well.

Furthermore, I'd say that the wording should be something like "will be
enabled again later, after XXX has been done".

P.

>=20
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
> index 8d060ce47f86..87979952df4b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
> @@ -24,6 +24,7 @@
> =C2=A0#include "vmm.h"
> =C2=A0
> =C2=A0#include <core/option.h>
> +#include <subdev/gsp.h>
> =C2=A0
> =C2=A0#include <nvif/class.h>
> =C2=A0
> @@ -54,5 +55,8 @@ int
> =C2=A0tu102_mmu_new(struct nvkm_device *device, enum nvkm_subdev_type
> type, int inst,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct nvkm_mmu **pmmu)
> =C2=A0{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (nvkm_gsp_rm(device->gsp))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -ENODEV;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return nvkm_mmu_new_(&tu1=
02_mmu, device, type, inst, pmmu);
> =C2=A0}


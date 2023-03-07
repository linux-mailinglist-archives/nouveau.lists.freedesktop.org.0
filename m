Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B678A6AD31D
	for <lists+nouveau@lfdr.de>; Tue,  7 Mar 2023 01:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC3C10E418;
	Tue,  7 Mar 2023 00:04:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D5610E418
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 00:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678147459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jd5G4/6b6WE50RPZelpBqXuEGDvqJqqxlNf2dC8xYaI=;
 b=JP21hZ/LxtK2EimYPCGZpsGykSW0CAeBKU+6N1BbLRGBF1cjzCBjvc660ZYGXSh18sut5v
 5Uwm90rnizFblNTHQse+wdasEUG0QDzVotHQ7fPtsHz7qn463w0/JpzfStogXNlAeSWD9J
 yt3eAuWaXREVttZjJ3O4Kqf1P6kWh88=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-AtSZsCfDOxiNoCbFyoGKnQ-1; Mon, 06 Mar 2023 19:04:16 -0500
X-MC-Unique: AtSZsCfDOxiNoCbFyoGKnQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 g13-20020ac8124d000000b003bfba5d76a3so6197317qtj.15
 for <nouveau@lists.freedesktop.org>; Mon, 06 Mar 2023 16:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147455;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hm7OyfDHZHod7VjHk1wTL2jptyUJSz+TF+BnRS3YH4M=;
 b=XNxtrV1F3nMl1hMHRjyqgYsGbUIQ+YMVPFCnstNezVDt8pz1Qo/+rWPj9D9x5Hr5DQ
 fU5+qJ10K3Ea74cprGm+UYPajKQWCl3vNV0ET6Q0zi0w8Fv5Y+WrjQ800SY+PhObQEg5
 3E3X8rm/HWm23foCaUG5m1QLG9eWp2YcZLBBZ0UAUawbkX5TvHByaY+KC5qAhzQocCHD
 IvvJJNWFydbMogrsV+62NeGA4oEVRxYhaXTet1Y4tkv7HxV2z+fWstxHruza7KeBuS9p
 mA1iGVQRGacI6TdGXHuLqrCZRucOCTG44d8coewVl/LvYdBd1cxCtSIdDQLX0vypPLfR
 lqjg==
X-Gm-Message-State: AO0yUKWgrrye+J9yy9C3gQvnH1OcrHE4aAIeAz3CcbvUmJ/Azjcyp6CQ
 VEUB40mUkN5ZHcGbVDsU3aBDD5+RnxAOnFY2V9kEJAVwvEKjASjyTAaEFlLMvPI/gZGEi9spHAm
 x1Wq72xlnp9K9OJdz7DUzTQ7kcg==
X-Received: by 2002:ac8:5c83:0:b0:3a8:e35:258f with SMTP id
 r3-20020ac85c83000000b003a80e35258fmr22529587qta.31.1678147455579; 
 Mon, 06 Mar 2023 16:04:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9JP7mAg5m3cVZualEUszyw1XG+IBEsB4vFC4l/lnJoUCNQJOWCfSLVzf+bdS0kt1V9nLDD8w==
X-Received: by 2002:ac8:5c83:0:b0:3a8:e35:258f with SMTP id
 r3-20020ac85c83000000b003a80e35258fmr22529561qta.31.1678147455349; 
 Mon, 06 Mar 2023 16:04:15 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 d64-20020a37b443000000b0073b587194d0sm8383852qkf.104.2023.03.06.16.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 16:04:14 -0800 (PST)
Message-ID: <c1dbdc4a41e67496eb8533e5a271eb2bbdc318d6.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Zheng Wang <zyytlz.wz@163.com>, nouveau@lists.freedesktop.org
Date: Mon, 06 Mar 2023 19:04:13 -0500
In-Reply-To: <20221029074654.203153-1-zyytlz.wz@163.com>
References: <20221029074654.203153-1-zyytlz.wz@163.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alex000young@gmail.com, security@kernel.org, hackerzheng666@gmail.com,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, bskeggs@redhat.com,
 daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Sat, 2022-10-29 at 15:46 +0800, Zheng Wang wrote:
> If it failed in kzalloc, vma will be freed in nvkm_vmm_node_merge.
> The later use of vma will casue use after free.
>=20
> Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> Reported-by: Zhuorao Yang <alex000young@gmail.com>
>=20
> Fix it by returning to upper caller as soon as error occurs.
>=20
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.c
> index ae793f400ba1..04befd28f80b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -1272,8 +1272,7 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u6=
4 addr, u64 size, u64 *pfn)
>  =09=09=09=09=09=09       page -
>  =09=09=09=09=09=09       vmm->func->page, map);
>  =09=09=09if (WARN_ON(!tmp)) {
> -=09=09=09=09ret =3D -ENOMEM;
> -=09=09=09=09goto next;
> +=09=09=09=09return -ENOMEM;
>  =09=09=09}
> =20
>  =09=09=09if ((tmp->mapped =3D map))

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


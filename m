Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2670898A
	for <lists+nouveau@lfdr.de>; Thu, 18 May 2023 22:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CCD10E0D9;
	Thu, 18 May 2023 20:30:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1519010E0D9
 for <nouveau@lists.freedesktop.org>; Thu, 18 May 2023 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684441852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ks6xt/wC6E+ECyHt7NO8D94Kf2RxqGGaF/pXlLsIP+4=;
 b=Xcu2aauVAMjYTh1Sz2prOawI1hQ8JIZgwA06LQALNrDF5czWJ/qRU14Ml2MijH439JGokE
 VKefuLLbt0z+tFCZ6tXJ2O7wCbnSnfq1AaAHOFGx2uDZcBYxf2wskQFPe4hPSAvdI6a5ns
 7/xOtkIWEV6MlIaNOiwP+EL8Za8rbt0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-RvnMEO_9NtiOK64HSUk6cg-1; Thu, 18 May 2023 16:30:51 -0400
X-MC-Unique: RvnMEO_9NtiOK64HSUk6cg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-62384132fe5so15864836d6.3
 for <nouveau@lists.freedesktop.org>; Thu, 18 May 2023 13:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684441851; x=1687033851;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UBHXSM6N4oYTfABvCGd3gPEAq2HM572bDIbMq8xh2Y4=;
 b=gRan9+GlQqfakzxOhYfH+NSe9WDBNI043T7FHxK4JmzDSyomAicabos2wPvGP50xyO
 QCnNAao+0i5wu6u856aOo62g8/Covoge52OmCC+tnFpV74xV1r/lROq5MS+WAoujXH1t
 8BHVkEdnF0dAZHQjp5gY6NEUD8LsRbPpeNtPToiipzQVeNEzfnvnSKu+Bd57lCTwDnox
 KU8Wq6RecDb0euoM2o8h1AxeniSkujxVo+TzPns97/KSSE4XG7cz4+XDJI75jk+Vw1Di
 bDPggVh/sjLUTsOgHFksYJsZpWW+wU0Ftg8BP29BMUToT3hOkEXDMwmo1LebJY9VUqCM
 QtZw==
X-Gm-Message-State: AC+VfDyBY39SrARrCADwEMT1zdx6gJVgx6hTmKJs+GlppeOGw3HLr2di
 oxxUiRSaCp1UfarzL3g9TDWX2i8sVPexiary7iH57BzBf2bjMuN2lnsTNjVz8FypbUYthxTPA5x
 Jnmn35MmsNqWsjAt5awiinzgqzQ==
X-Received: by 2002:a05:6214:e4d:b0:5c7:d03c:f2b2 with SMTP id
 o13-20020a0562140e4d00b005c7d03cf2b2mr361315qvc.28.1684441851037; 
 Thu, 18 May 2023 13:30:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vnjCpdmwKeoU/jIRT/FUAUaf5A1UGyq52Jfrp1Qr7akRm4t7XVgexBhARVnPncRSkeITgNQ==
X-Received: by 2002:a05:6214:e4d:b0:5c7:d03c:f2b2 with SMTP id
 o13-20020a0562140e4d00b005c7d03cf2b2mr361277qvc.28.1684441850746; 
 Thu, 18 May 2023 13:30:50 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 cx3-20020a056214188300b006238f82cde4sm763000qvb.108.2023.05.18.13.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 13:30:50 -0700 (PDT)
Message-ID: <b07c93bc7cb71a32091794cd97f7c702c34539da.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Ben Skeggs <bskeggs@redhat.com>, Karol Herbst
 <kherbst@redhat.com>
Date: Thu, 18 May 2023 16:30:49 -0400
In-Reply-To: <20230518134253.909623-4-hch@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
 <20230518134253.909623-4-hch@lst.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-3.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 3/4] drm/nouveau: stop using is_swiotlb_active
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks for getting to this!

On Thu, 2023-05-18 at 15:42 +0200, Christoph Hellwig wrote:
> Drivers have no business looking into dma-mapping internals and check
> what backend is used.  Unfortunstely the DRM core is still broken and
> tries to do plain page allocations instead of using DMA API allocators
> by default and uses various bandaids on when to use dma_alloc_coherent.
>=20
> Switch nouveau to use the same (broken) scheme as amdgpu and radeon
> to remove the last driver user of is_swiotlb_active.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/nouveau/nouveau_ttm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouv=
eau/nouveau_ttm.c
> index 1469a88910e45d..486f39f31a38df 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -24,9 +24,9 @@
>   */
> =20
>  #include <linux/limits.h>
> -#include <linux/swiotlb.h>
> =20
>  #include <drm/ttm/ttm_range_manager.h>
> +#include <drm/drm_cache.h>
> =20
>  #include "nouveau_drv.h"
>  #include "nouveau_gem.h"
> @@ -265,7 +265,6 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>  =09struct nvkm_pci *pci =3D device->pci;
>  =09struct nvif_mmu *mmu =3D &drm->client.mmu;
>  =09struct drm_device *dev =3D drm->dev;
> -=09bool need_swiotlb =3D false;
>  =09int typei, ret;
> =20
>  =09ret =3D nouveau_ttm_init_host(drm, 0);
> @@ -300,13 +299,10 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>  =09=09drm->agp.cma =3D pci->agp.cma;
>  =09}
> =20
> -#if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
> -=09need_swiotlb =3D is_swiotlb_active(dev->dev);
> -#endif
> -
>  =09ret =3D ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev-=
>dev,
>  =09=09=09=09  dev->anon_inode->i_mapping,
> -=09=09=09=09  dev->vma_offset_manager, need_swiotlb,
> +=09=09=09=09  dev->vma_offset_manager,
> +=09=09=09=09  drm_need_swiotlb(drm->client.mmu.dmabits),
>  =09=09=09=09  drm->client.mmu.dmabits <=3D 32);
>  =09if (ret) {
>  =09=09NV_ERROR(drm, "error initialising bo driver, %d\n", ret);

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


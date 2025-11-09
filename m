Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFB4C4390F
	for <lists+nouveau@lfdr.de>; Sun, 09 Nov 2025 07:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E124C10E13D;
	Sun,  9 Nov 2025 06:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YfmwViU/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9907B10E13D
 for <nouveau@lists.freedesktop.org>; Sun,  9 Nov 2025 06:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762669168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVrRgmXsUu34ydz6PRK5FiXmgS7u5Ru1tv952Jc6wdc=;
 b=YfmwViU/yKS50IokD6RBsPLxcbolnskSY5kHL9gsUh7GVmQsb1X8lSkbiRAKItnvuIj+OZ
 ZsOwfQesWZHKKrKkuUG+H59L26Pnc3/Y+lcBPKne7xY0Uv7vWu60VLvzACPqDzSo3FAH6I
 42TBqvmI9EM2MPGO8EVERxeKUTMODas=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-Un98dSymOTmJeAqr1vHLew-1; Sun, 09 Nov 2025 01:19:26 -0500
X-MC-Unique: Un98dSymOTmJeAqr1vHLew-1
X-Mimecast-MFC-AGG-ID: Un98dSymOTmJeAqr1vHLew_1762669165
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-295915934bfso31786725ad.0
 for <nouveau@lists.freedesktop.org>; Sat, 08 Nov 2025 22:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762669165; x=1763273965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bVrRgmXsUu34ydz6PRK5FiXmgS7u5Ru1tv952Jc6wdc=;
 b=u7NO4BWEvE86oIhb934GnyGZQQJHisWVRSyzZRHts5mkCSkSWqlwS+7x5TsLdJgQ9g
 gvpi7n/YDHooS4lmsU+FoVyCCg/O9NhrINMPiuvoP10tqR/QJHRh1q6LG+xhCeZ65MnG
 WssBITBBZV7bsxbM3dP9aHUfAo6XPZ5tYZTnHjHftxHhVJMPvoqBZUrWDBb495FD50yF
 3AbJRzxZRo2Q+20Ji3t/OArTHnD+I7+QnLgZxzpjW63WRJmHwU2oRfWr6Aqg1GOuWNj9
 aH/ktjtWV8OsJsq6eORhnHwZ+Ohf1TtyGkCM8E3TUJhLtxYdaFxSdWTHCz0v8Zo8HnE8
 BY9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKaNusZTXTMM/Vt7TNQu5+YlpAbbM7UiR6urpxgDUWvZTY5VtwIQsT3bUC2E+RF8K9F/LcFm3A@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDtS+Gq9b9v9/PK0nPbTNlP1V0s6yXV93aZV069C7kaWGghn8u
 HrzTjawzTjtuEXIq1xlKEJU6MYbyO2fR6LI8f29Qq+F0lgdp4kWXuRA+KtXGpkM6C2UEKiKNmZZ
 d+m9mvlRub/uYMN1Q6QQ0M3gvPJ2HT8qvjRXPvC8QHZSenRNTpLrDd1zZe53KUxNILCr0tvA0As
 6joRGqmgxH8tF6pdDONqk7C/1ns9T+VQXcrtpBfJyYmw==
X-Gm-Gg: ASbGnct1IgtO94/QGuEx+Zguur1jd+rZ3m72LudNxaISt0RLnvjqz59hKuV6Q9IJetX
 KiMK9pu7IaW3l51AZf7rnHh25Td9O6YYeL7MTlPgD6HrvfA6Tw9w/U0Bv85dHLLZXDL2SlKXovh
 AbCaviQfdBgO7Te8IizzBcPCT/84rNUTSJlDxh3rDtfFD0qqCXsCzXCw==
X-Received: by 2002:a17:902:e888:b0:290:9a74:a8ad with SMTP id
 d9443c01a7336-297e56ef4d9mr48387505ad.53.1762669165195; 
 Sat, 08 Nov 2025 22:19:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ/sCq/hauK2bBklx8hx85BDHsDXwnBUJmSL/DIfAQJUFbFj1eM7mRCPYsekZc7IXd2P4FmnCHAZwSPWhMX70=
X-Received: by 2002:a17:902:e888:b0:290:9a74:a8ad with SMTP id
 d9443c01a7336-297e56ef4d9mr48387295ad.53.1762669164812; Sat, 08 Nov 2025
 22:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20251031161045.3263665-1-ttabi@nvidia.com>
In-Reply-To: <20251031161045.3263665-1-ttabi@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Sun, 9 Nov 2025 16:19:13 +1000
X-Gm-Features: AWmQ_bnLbmy_9ptmxCReUuTl6BLSvquZ3oxgN9GrD4A-LnjMw7BbjefGKuFW_1g
Message-ID: <CAMwc25pOob3aXPH8u2ON7HZ-Bk+a_d9JWg0+wLNOycnFsVWHSg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: set DMA mask before creating the flush page
To: Timur Tabi <ttabi@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TfYiCiFh1449mPgTJhEQE7b8dwMWVVvxtM4iOW2nJdY_1762669165
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

On Sat, Nov 1, 2025 at 2:12=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote:
>
> Set the DMA mask before calling nvkm_device_ctor(), so that when the
> flush page is created in nvkm_fb_ctor(), the allocation will not fail
> if the page is outside of DMA address space, which can easily happen if
> IOMMU is disable.  In such situations, you will get an error like this:
>
> nouveau 0000:65:00.0: DMA addr 0x0000000107c56000+4096 overflow (mask fff=
fffff, bus limit 0).
>
> Commit 38f5359354d4 ("rm/nouveau/pci: set streaming DMA mask early")
> set the mask after calling nvkm_device_ctor(), but back then there was
> no flush page being created, which might explain why the mask wasn't
> set earlier.
>
> Flush page allocation was added in commit 5728d064190e ("drm/nouveau/fb:
> handle sysmem flush page from common code").  nvkm_fb_ctor() calls
> alloc_page(), which can allocate a page anywhere in system memory, but
> then calls dma_map_page() on that page.  But since the DMA mask is still
> set to 32, the map can fail if the page is allocated above 4GB.  This is
> easy to reproduce on systems with a lot of memory and IOMMU disabled.
>
> An alternative approach would be to force the allocation of the flush
> page to low memory, by specifying __GFP_DMA32.  However, this would
> always allocate the page in low memory, even though the hardware can
> access high memory.


So this caused a regression, because the sysmem flush page has to be
inside 40 bits.

look in openrm:
src/nvidia/src/kernel/gpu/mem_sys/arch/maxwell/kern_mem_sys_gm107.c:kmemsys=
InitFlushSysmemBuffer_GM107

The prop driver tries to use GFP_DMA32, then use 40 bits and the code
is all horrible. It's probably fine for use to just set the dma_bits
to 40 here before and then the full range after.

Dave.
>
> Fixes: 5728d064190e ("drm/nouveau/fb: handle sysmem flush page from commo=
n code")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/engine/device/pci.c  | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/device/pci.c
> index 8f0261a0d618..7cc5a7499583 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> @@ -1695,6 +1695,18 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const=
 char *cfg, const char *dbg,
>         *pdevice =3D &pdev->device;
>         pdev->pdev =3D pci_dev;
>
> +       /* Set DMA mask based on capabilities reported by the MMU subdev.=
 */
> +       if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
> +               bits =3D pdev->device.mmu->dma_bits;
> +       else
> +               bits =3D 32;
> +
> +       ret =3D dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(bit=
s));
> +       if (ret && bits !=3D 32) {
> +               dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32)=
);
> +               pdev->device.mmu->dma_bits =3D 32;
> +       }
> +
>         ret =3D nvkm_device_ctor(&nvkm_device_pci_func, quirk, &pci_dev->=
dev,
>                                pci_is_pcie(pci_dev) ? NVKM_DEVICE_PCIE :
>                                pci_find_capability(pci_dev, PCI_CAP_ID_AG=
P) ?
> @@ -1708,17 +1720,5 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const=
 char *cfg, const char *dbg,
>         if (ret)
>                 return ret;
>
> -       /* Set DMA mask based on capabilities reported by the MMU subdev.=
 */
> -       if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
> -               bits =3D pdev->device.mmu->dma_bits;
> -       else
> -               bits =3D 32;
> -
> -       ret =3D dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(bit=
s));
> -       if (ret && bits !=3D 32) {
> -               dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32)=
);
> -               pdev->device.mmu->dma_bits =3D 32;
> -       }
> -
>         return 0;
>  }
>
> base-commit: 18a7e218cfcdca6666e1f7356533e4c988780b57
> --
> 2.51.0
>


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0659408B03
	for <lists+nouveau@lfdr.de>; Mon, 13 Sep 2021 14:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DF06E183;
	Mon, 13 Sep 2021 12:25:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEA06E183
 for <nouveau@lists.freedesktop.org>; Mon, 13 Sep 2021 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631535922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R9PBEt7/CuZtqSZaYKWhgvkbmUFr8etXaLnK2K6IfPg=;
 b=S5TCJLC2Vk+vrkmwHz6fhFCzid7/eTklBw3GBqAovwlEEMqDv2zpCOrxOzpmTA4yuw8nBj
 c70a0pc9bXkFi342XwA1y4hPD9oUrouwLQ4KdW4ud+xxc5nA4A2JZpRFbTO+T7GpVJ2+Pl
 EIZl2OFc7ZuFtzzUYPVI5CELTvXVjb8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-R3ibjpTIMzuNRvVRkTiJtQ-1; Mon, 13 Sep 2021 08:25:19 -0400
X-MC-Unique: R3ibjpTIMzuNRvVRkTiJtQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso2612690wrw.13
 for <nouveau@lists.freedesktop.org>; Mon, 13 Sep 2021 05:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R9PBEt7/CuZtqSZaYKWhgvkbmUFr8etXaLnK2K6IfPg=;
 b=ETn3JZkfArs9BW+7RFNO0lE8qyzpqmlGqe1ekmEcUWOgG5lnmIsun/CZaNliTFubPv
 i3ai3XW8wInzOLy7mRXLb9cGT0n+RmberfTWIb+nzPEUMcjOEzSaopm3jZgL4fKjTHgc
 7vd10zW7J2aexa/AwBttCb5CTCrO1rMR8CErCIJ/cpKRkPsj/4sjFMZy4IIEHxUVEcKR
 uAR8H9pKKv6hICP7qsOnUK94GqrH3+n8MbBVDVk7pJNXB2QcbvIyIy2qTeS9NGvJJGML
 Snd2DwQHlEVnTpNAsyvpz9Kd3oJch8BH/QygHWhoEZgeKQQLIn0NJTTBOTo46BoWvQ13
 ZuXA==
X-Gm-Message-State: AOAM532d9FwJC35eGZy1aLTBBsCQB4Fpkk2un13tFXMeydPMFMtdGaOq
 jYo7XTxH4FtZREeokv7k2/u9pWxwao0wZzT/rgyiE/AtoT1lqsWrO8gK1vx/xqBuf0YVoDSNeoy
 HvsrWGgCN0KXaQ8OB9NwQQSgh5gET3NfDz6BnWk1Oyg==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr12614347wrm.49.1631535918379; 
 Mon, 13 Sep 2021 05:25:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/D3ue7ej0yAfVdriVDFkbGanxJ8AFfbKBsNgIIIdagpkw+ezh/hOAbTcOIWYpvO+TzZ7Tp4Ddx4WaQ4W7HoM=
X-Received: by 2002:adf:e44c:: with SMTP id t12mr12614327wrm.49.1631535918157; 
 Mon, 13 Sep 2021 05:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR19MB278000DDEC936A67E85752E5BCF59@DM6PR19MB2780.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB278000DDEC936A67E85752E5BCF59@DM6PR19MB2780.namprd19.prod.outlook.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 13 Sep 2021 14:25:07 +0200
Message-ID: <CACO55tuzHmwrgPEnzHf-xVHt3n4gqrzQ5NJD63xMnsHYNFHiSw@mail.gmail.com>
To: Ratchanan Srirattanamet <peathot@hotmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau: don't detect DSM for non-NVIDIA
 device
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

Sorry for taking this long to take a look, it's just that I don't want
this to get merged without testing, and I'd like to test it on the
different kinds of hybrid GPU setups we have so that nothing
unexpected happens here.

I am not 100% sure how all of that works before optimus, so I have to
find a laptop covering this generation of hardware. I think my oldest
one here actually is, but the entire system on it is quite broken and
it still has some private stuff on it so I would rather not touch that
one :(

But if others would be able to test that, that would be awesome.

I will see if I can find a clean machine somewhere at work I can use
for testing.

On Sun, Aug 8, 2021 at 9:24 PM Ratchanan Srirattanamet
<peathot@hotmail.com> wrote:
>
> The call site of nouveau_dsm_pci_probe() uses single set of output
> variables for all invocations. So, we must not write anything to them
> unless it's an NVIDIA device. Otherwise, if we are called with another
> device after the NVIDIA device, we'll clober the result of the NVIDIA
> device.
>
> For example, if the other device doesn't have _PR3 resources, the
> detection later would miss the presence of power resource support, and
> the rest of the code will keep using Optimus DSM, breaking power
> management for that machine. In particular, this fixes power management
> of the NVIDIA card in Lenovo Legion 5-15ARH05... well, at least
> partially. New error shows up, but this patch is correct in itself
> anyway.
>
> Also, because we're detecting NVIDIA's DSM, it doesn't make sense to run
> this detection on a non-NVIDIA device anyway. Thus, check at the
> beginning of the detection code if this is an NVIDIA card, and just
> return if it isn't.
>
> As a bonus, we'll also stop preventing _PR3 usage from the bridge for
> unrelated devices, which is always nice, I guess.
>
> https://gitlab.freedesktop.org/drm/nouveau/-/issues/79
>
> Signed-off-by: Ratchanan Srirattanamet <peathot@hotmail.com>
> ---
>
> It's been discussed in the "previous" patch series ("[PATCH] drm/
> nouveau: don't touch has_pr3 for likely-non-NVIDIA device" [1]) that,
> instead of changing how the detection works, it's better to check if
> the device's vendor is NVIDIA, or if it's a secondary device. I don't
> find a feasible way to detect the secondary-ness of a device, so I
> opted for checking the vendor code [2].
>
> Thus, this makes the patch different enough to warant a different
> summary phrase and description.
>
> [1] https://lore.kernel.org/nouveau/CACO55tsYWW_dfAFWBFLrH51SVivUeN72Omc6DRTCtzVWSLE68w@mail.gmail.com/T/#mb710275dc1dd7e9d83028c218b886400d3a43bfc
> [2] It's been suggested to use `nouveau_dsm_get_client_id()`, however,
>     on my machine it would return _DIS on both cards, so it can't be
>     used.
>
>  drivers/gpu/drm/nouveau/nouveau_acpi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> index 7c15f6448428..9c55f205ab66 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -220,6 +220,9 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
>         int optimus_funcs;
>         struct pci_dev *parent_pdev;
>
> +       if (pdev->vendor != PCI_VENDOR_ID_NVIDIA)
> +               return;
> +
>         *has_pr3 = false;
>         parent_pdev = pci_upstream_bridge(pdev);
>         if (parent_pdev) {
> --
> 2.25.1
>


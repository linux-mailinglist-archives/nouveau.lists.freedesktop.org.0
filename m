Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60B3D74DC
	for <lists+nouveau@lfdr.de>; Tue, 27 Jul 2021 14:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D5E6E1FB;
	Tue, 27 Jul 2021 12:12:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8196E8EB
 for <nouveau@lists.freedesktop.org>; Tue, 27 Jul 2021 12:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627387922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQAyjxcRyBkQ7EQF6gV5mRRFtvTieivZ975mxLn5TPg=;
 b=Ps3sT1oeTFi4LtY47iJ9AaUU9UWBuwAjTC+Wga7NggmkZ6f7oqwNadBF1omFXszEIpP29m
 S9H7sDzOweDsVxjoI5zxRqecFrP1q8GekWwcGQXJo3Y9S+19WR5c5GhiQ70ZkIvBHYXltu
 Qksi7+D2jzJxPekT5zRIC9dhbEdDGdw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-clMJ-HKIMiiT_Y9v5szwgw-1; Tue, 27 Jul 2021 08:12:00 -0400
X-MC-Unique: clMJ-HKIMiiT_Y9v5szwgw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l7-20020a5d48070000b0290153b1557952so1159941wrq.16
 for <nouveau@lists.freedesktop.org>; Tue, 27 Jul 2021 05:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQAyjxcRyBkQ7EQF6gV5mRRFtvTieivZ975mxLn5TPg=;
 b=gGG60uewpJqAz0LRFnaiBXjPnh3VDAvU/KRHowIJVit1j6VuOtvNvxT8odRJ6Kir4T
 IAseH5xbEKQtBMGaR7ocnrNLiZin6McvmZ9oag5Oi5xJPUQytpG21JR0FvJE5tY8dCBX
 sEeDDY5ys9XAmrOcMVaIiuvtWOpgm0kvFfC1wkVRoK3h1GXXDjwKgc2/kIy5g/vPWfvQ
 K0/+2nMTsWII1fBFsddb1Dum3LDIQZVhw0HPM0Cf0kwsZBnTl96hJYMlUMpbMiw+S9wY
 ktg6cM25CNMFOImJ738VQ659Fu3y4D4SW+faFxDFFaOFyUmovCzUuYGe/aZwdHgxrAVe
 8vnw==
X-Gm-Message-State: AOAM530s2DclL/twINDOz2xwuU2Nj+y9CflA7hpvH/8vGJryKdu39kV6
 qaW0/67yZkRgoVSnW7Mzlj/JgHY3SeNKKRpdhJ80YMgDGtw2cL1/0X3jkdfs2RbUYzwl5705X0B
 1b+NfTQBRDK9nY7L2KuN2HMbKG2I8gftfkXRJiPbJ3g==
X-Received: by 2002:adf:e507:: with SMTP id j7mr6251458wrm.113.1627387919226; 
 Tue, 27 Jul 2021 05:11:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPc5lB9jSqIZ4ajtwt1T8JN7JgYqq83sKLX39CnHv4NLLv3OznsjTS+sVc8VtJR5zGAL6vEabEk5UTwnKb+aM=
X-Received: by 2002:adf:e507:: with SMTP id j7mr6251435wrm.113.1627387919049; 
 Tue, 27 Jul 2021 05:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR19MB278063772C30271C6B8929B5BC109@DM6PR19MB2780.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB278063772C30271C6B8929B5BC109@DM6PR19MB2780.namprd19.prod.outlook.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 27 Jul 2021 14:11:48 +0200
Message-ID: <CACO55tsYWW_dfAFWBFLrH51SVivUeN72Omc6DRTCtzVWSLE68w@mail.gmail.com>
To: Ratchanan Srirattanamet <peathot@hotmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau: don't touch has_pr3 for
 likely-non-NVIDIA device
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 5:10 AM Ratchanan Srirattanamet
<peathot@hotmail.com> wrote:
>
> The call site of nouveau_dsm_pci_probe() uses single set of output
> variables for all invocations. So, we must not write anything to them
> until we think this is an NVIDIA device of interest. Otherwise, if we
> are called with another device after the NVIDIA device, we'll clober the
> result of the NVIDIA device.
>
> In this case, if the other device doesn't have _PR3 resources, the
> detection later would miss the presence of power resource support, and
> the rest of the code will keep using Optimus DSM, breaking power
> management for that machine. In particular, this fixes power management
> of the NVIDIA card in Lenovo Legion 5-15ARH05... well, at least
> partially. New error shows up, but this patch is correct in itself
> anyway.
>
> As a bonus, we'll also stop preventing _PR3 usage from the bridge for
> unrelated devices, which is always nice, I guess.
>
> As noted in commit ccfc2d5cdb024 ("drm/nouveau: Use generic helper to
> check _PR3 presence"), care is taken to leave the _PR3 detection outside
> of the optimus_func condition.
>
> https://gitlab.freedesktop.org/drm/nouveau/-/issues/79
>
> Fixes: ccfc2d5cdb024 ("drm/nouveau: Use generic helper to check _PR3
> presence")
> Signed-off-by: Ratchanan Srirattanamet <peathot@hotmail.com>
> ---
>
> Hello,
>
> This is my first time submitting a Linux patch. I've done a
> number of PR/MR workflows on GitHub or GitLab, but never done any
> email-oriented development. So, please excuse me if I'm doing something
> incorrectly.
>
>  drivers/gpu/drm/nouveau/nouveau_acpi.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> index 7c15f6448428..c88bda3ac820 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -220,15 +220,6 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
>         int optimus_funcs;
>         struct pci_dev *parent_pdev;
>
> -       *has_pr3 = false;
> -       parent_pdev = pci_upstream_bridge(pdev);
> -       if (parent_pdev) {
> -               if (parent_pdev->bridge_d3)
> -                       *has_pr3 = pci_pr3_present(parent_pdev);
> -               else
> -                       pci_d3cold_disable(pdev);
> -       }
> -
>         dhandle = ACPI_HANDLE(&pdev->dev);
>         if (!dhandle)
>                 return;
> @@ -249,6 +240,15 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
>         *has_opt = !!optimus_funcs;
>         *has_opt_flags = optimus_funcs & (1 << NOUVEAU_DSM_OPTIMUS_FLAGS);
>
> +       *has_pr3 = false;
> +       parent_pdev = pci_upstream_bridge(pdev);
> +       if (parent_pdev) {
> +               if (parent_pdev->bridge_d3)
> +                       *has_pr3 = pci_pr3_present(parent_pdev);
> +               else
> +                       pci_d3cold_disable(pdev);
> +       }
> +

given that we call this code for all GPUs, I _think_ it is better to
check for GPU Vendors or check if the GPU we touch is the secondary
one. We also have systems with two Nvidia GPUs. But I don't know how
the detection worked there and if that's fine in the end... I might
have to investigate this on all laptops with various hybrid GPU types,
but... mhh. Maybe checking for "this is a secondary GPU" is good
enough.

>         if (optimus_funcs) {
>                 uint32_t result;
>                 nouveau_optimus_dsm(dhandle, NOUVEAU_DSM_OPTIMUS_CAPS, 0,
> --
> 2.25.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

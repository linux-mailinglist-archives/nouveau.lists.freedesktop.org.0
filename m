Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFD33D27A1
	for <lists+nouveau@lfdr.de>; Thu, 22 Jul 2021 18:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155FB6EA8F;
	Thu, 22 Jul 2021 16:36:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A156EA8F
 for <nouveau@lists.freedesktop.org>; Thu, 22 Jul 2021 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626971790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fZMOkA64FJekOUjL3voBbJsSGt3gN9+JWVUWGD6ac8M=;
 b=KVGDrtR5HlAvfLh82Ap7hK2NdOFFGYD0T9dXPobpN5WZjLAV+BklLHTfrG1kbflP65PVFR
 ziQy24ZMlkUDl/5Ubp+yEiKnLuWADGcbAV8yw7piEGSnKIkOMIS6PJUP0tl14Nt3ElRW2l
 l/G9eL+aK44PhyU6ISKvJSNpex08wmo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-935gl_86MkSTyEdfu1yn4w-1; Thu, 22 Jul 2021 12:36:26 -0400
X-MC-Unique: 935gl_86MkSTyEdfu1yn4w-1
Received: by mail-wr1-f72.google.com with SMTP id
 t8-20020a05600001c8b029013e2027cf9aso2624617wrx.9
 for <nouveau@lists.freedesktop.org>; Thu, 22 Jul 2021 09:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZMOkA64FJekOUjL3voBbJsSGt3gN9+JWVUWGD6ac8M=;
 b=GJnjHspW1wcrbLrnJMi9pYmt/zpTowZhND0I5hsmy2zY7myrOGYwa1arWNAw+Fxa2S
 1/9YdwIllJ500JpUpGQDn84FxYHTRZPWTfWmjtCGuSouVMUAHfKpA8luaEb3Ayb4zN3z
 ZHuRubEh1DxE79O71h71wsYZewtsObJufZEPYFLwnpllWPGJq0i7KH7024lM14zU7LxG
 4/YRJJstYgs8f3UHTIkXwPf/EdQ57A+4G8GsJNyDAhx3ibu2vtu8ZnN5EKY2qWZcQtv8
 vMVxVbdODsLjUHuAYQSkATnV6aQqMrwb+/gwWwaFfBc47j4tTMJ9DCpjHjWrWLitFSyk
 H3SA==
X-Gm-Message-State: AOAM5312NTs3ch8/oVGtFGYW+MIrkIjOD8GwhQIIFo9isMRjwdOeNxOw
 ua3o5PlNaXZPpAaR4SR5IZbSmo3qJ+Hi2BY8mw1wMk/CNIZyzZZ8Zsc/Gv0Wy5oYTdn0KA7DW4C
 uLRhLAOC4a75Z/OdwzkK4yHcpJXYYeGhgh6S7elj/pg==
X-Received: by 2002:a1c:808c:: with SMTP id b134mr9966359wmd.139.1626971785122; 
 Thu, 22 Jul 2021 09:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7BIablWte6MNaOXuJrxC32Tz7Dn+HKj5O7WrF/JIyJTXVI6odjmNUqMrHB7dqF1UaRKB/TGW656sB4DYSi0g=
X-Received: by 2002:a1c:808c:: with SMTP id b134mr9966343wmd.139.1626971784910; 
 Thu, 22 Jul 2021 09:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR19MB278063772C30271C6B8929B5BC109@DM6PR19MB2780.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB278063772C30271C6B8929B5BC109@DM6PR19MB2780.namprd19.prod.outlook.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 22 Jul 2021 18:36:14 +0200
Message-ID: <CACO55tuHsFyAsVxtsggtJXWQuiLKDOWoFUaRmJr=7VdOJTaAaw@mail.gmail.com>
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

hey, thanks for the patch. But I am a bit confused on why that patch
actually helps. It should only be called for nvidia GPUs, but are we
ending up checking it for AMD GPUs as well?

Mind posting the output of lspci -tvnn?

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

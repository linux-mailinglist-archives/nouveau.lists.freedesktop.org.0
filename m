Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18B072234E
	for <lists+nouveau@lfdr.de>; Mon,  5 Jun 2023 12:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB6710E28B;
	Mon,  5 Jun 2023 10:21:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E5D10E28B
 for <nouveau@lists.freedesktop.org>; Mon,  5 Jun 2023 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685960493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5G/dz9nbK/JSD2enIPaONJbILsF/54DvTtt6irDTng=;
 b=EH3AfPs14kUdSPYmJ0QOL5xMFjmub6lmGQgipEJxKg0GkjLpiDWBKPLSmXc8Dr3sg/J/Kz
 8cU0ocPnNyRYnb1hY/mVA5Xzf9B+3PUQk7I26BUW8qsjxm2zaZcwMe24+X5AuwVoDrV4s5
 Q7zhCeQOslEKoy9U4W7LSwvx2QsHzEQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-kTQwn3pnOUigPKcpj6m0ZQ-1; Mon, 05 Jun 2023 06:21:31 -0400
X-MC-Unique: kTQwn3pnOUigPKcpj6m0ZQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b1bc54374aso2258821fa.0
 for <nouveau@lists.freedesktop.org>; Mon, 05 Jun 2023 03:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685960490; x=1688552490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5G/dz9nbK/JSD2enIPaONJbILsF/54DvTtt6irDTng=;
 b=FWkiGmFpbOMCc/P734BYrl26LRww3LWhOKwPZQAcyK0fGMDrXnx94LC9CmnW7VpCi2
 RjreouMNIcpje/bPqmE4zEQ2YvhHAeOAN6e39MDJd8NWH/2eJO0DU3oerZmroTxPUDIC
 1BLIb3kGwGkFcoAImsP8VZgtKq+IIHtG2ba2/qt2HYpWLIt95SUL6XbqSkPX3sDof/wD
 Vjwbh5O2vMz1M5uu7131uhCzF3FjKhyMa0aDRpjALZa9AbOZRmXJu79rKOvE3vveMGEG
 YeS0jIPvUbbOV7eoTR9jRGDsWassX6Xwzz6V+2N2v5v13qOwaHjzhlgRdWpcNVkmDTkW
 Lu8A==
X-Gm-Message-State: AC+VfDz+NvmR/I4LpLUj6AoCJi13ggSRnaFTbtjK2DpMyVLJ2tK0Pna5
 JkUkx2+Z+9+ElqCHtmTZkJ1fzaI311ElLqx+pXZOSFEMCqsvBc/HR8CJDJi/B63q3fHyaBAVSzn
 GgFsIULUDuDYFgJLv9SPYnSC9CeUDvtKS4xBwDEc9cA==
X-Received: by 2002:a05:651c:309:b0:2b1:b012:e126 with SMTP id
 a9-20020a05651c030900b002b1b012e126mr3214652ljp.3.1685960490473; 
 Mon, 05 Jun 2023 03:21:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Ifasbc4YdoMu43AjBf53AQoBF88rpDabFVOadXuldaSfVB0lpoRYF1UqDwhH+sAHsyBu2d/h+9h+nspcCqU0=
X-Received: by 2002:a05:651c:309:b0:2b1:b012:e126 with SMTP id
 a9-20020a05651c030900b002b1b012e126mr3214639ljp.3.1685960490092; Mon, 05 Jun
 2023 03:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR19MB2780805D4BE1E3F9B3AC96D0BC409@DM6PR19MB2780.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB2780805D4BE1E3F9B3AC96D0BC409@DM6PR19MB2780.namprd19.prod.outlook.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 5 Jun 2023 12:21:18 +0200
Message-ID: <CACO55ttutaud0zO-aw=x9i-++jhsOBmDJKiFE9NT=1tYc1GXuQ@mail.gmail.com>
To: Ratchanan Srirattanamet <peathot@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: don't detect DSM for
 non-NVIDIA device
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
Cc: nouveau@lists.freedesktop.org, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 11:12=E2=80=AFPM Ratchanan Srirattanamet
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
> management for that machine.
>
> Also, because we're detecting NVIDIA's DSM, it doesn't make sense to run
> this detection on a non-NVIDIA device anyway. Thus, check at the
> beginning of the detection code if this is an NVIDIA card, and just
> return if it isn't.
>
> This, together with commit d22915d22ded ("drm/nouveau/devinit/tu102-:
> wait for GFW_BOOT_PROGRESS =3D=3D COMPLETED") developed independently and
> landed earlier, fixes runtime power management of the NVIDIA card in
> Lenovo Legion 5-15ARH05. Without this patch, the GPU resumption code
> will "timeout", sometimes hanging userspace.
>
> As a bonus, we'll also stop preventing _PR3 usage from the bridge for
> unrelated devices, which is always nice, I guess.
>
> Signed-off-by: Ratchanan Srirattanamet <peathot@hotmail.com>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/79
> ---
> V1 -> V2:
> - Update the changelog to indicate that it now actually fixes the issue.
> - Add 'Closes:' tag.
>
>  drivers/gpu/drm/nouveau/nouveau_acpi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nou=
veau/nouveau_acpi.c
> index 8cf096f841a9..a2ae8c21e4dc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -220,6 +220,9 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pde=
v, acpi_handle *dhandle_out
>         int optimus_funcs;
>         struct pci_dev *parent_pdev;
>
> +       if (pdev->vendor !=3D PCI_VENDOR_ID_NVIDIA)
> +               return;
> +
>         *has_pr3 =3D false;
>         parent_pdev =3D pci_upstream_bridge(pdev);
>         if (parent_pdev) {
>
> base-commit: 5fe326b4467689ef3690491ee2ad25ff4d81fe59
> --
> 2.34.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

I'll add a Cc: <stable@vger.kernel.org> when pushing the change as
I'll also think about how far in the past to get it applied. Though it
shouldn't hurt as it shouldn't make things worse on any system.


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674B59FD0D
	for <lists+nouveau@lfdr.de>; Wed, 24 Aug 2022 16:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118FD10E930;
	Wed, 24 Aug 2022 14:16:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA93B10E930
 for <nouveau@lists.freedesktop.org>; Wed, 24 Aug 2022 14:16:49 +0000 (UTC)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B4633F80F
 for <nouveau@lists.freedesktop.org>; Wed, 24 Aug 2022 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1661350605;
 bh=XAZIO9+48GRjlnarFRC1UPi0uDzTdLs9Ete1xQbj9h8=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=EZpMJZQ0ou0ZDalWOw6icdAw2Ml5wRb6LpddB+0jUoVSO/skrdWN83/zpzt6HeNvI
 kAobpVJLVSeAA4OcAb0QqpOgqi+1K45r/M5XP3LFWnfoe9TqU5PLRjQMEhoDWLNuDq
 LN43AHwgnCP2YPW0m7/5cVrpUE8r2X/vqwFzsyoudx/yOXPhKXSuthWSYOAIVXHvNO
 Cfj6ecYcca2zDH7g/SZQbMWRPAVouGvk6yOi4/ybgy1y/XPwjgIQnSUoGBKcXHDtMG
 qtnJo/gUPNLACyPNdQbWQzAHY2V2MbB+qMR1PAMw0uoy8Ej4ycWAiK8oyVNHUCV5sY
 /KUPpOAW5Jrmg==
Received: by mail-oo1-f71.google.com with SMTP id
 h12-20020a4ad28c000000b00448bee68970so8387407oos.10
 for <nouveau@lists.freedesktop.org>; Wed, 24 Aug 2022 07:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=XAZIO9+48GRjlnarFRC1UPi0uDzTdLs9Ete1xQbj9h8=;
 b=Wd1Q0GzQMHF5YQVEY5K9ULsXZqKOLlg4bEIb5uO0jyNM/2BzwSVxGY7Rh9Z5iJu7lf
 v+n9gnUSD6qo1mPKev562Od1MeihVOak7zovuLqi7xMt/bE9Hc6rQxczu3Z48676wtC+
 UsjQmLvgr7MjQqEhQG0rO4W9QWB6L2bQO9Pk/weUJdoAXVpOW17d/tPyYg2eIXgQ/GX4
 FXyOj+k4SOLecPAp14PjTeZRPG6s9IvNlVXdoCMIcHTQ/dHgu8Ps+JSl8Ehp7ZKD3YN4
 +6jsuoshaTA2LBmzucp9rVYWyA8iNRBaMekZbzbXR7qybpy7AiXKI/fT6YLVmKm7G/sf
 ShUA==
X-Gm-Message-State: ACgBeo0aoJzSXr3Rh20kHlyDXppLhLE0MCIiHt1mX+ca+U4IwVBGKI68
 K9nFumABU35xW9A6XIBDNi9mxsCqc7myEeALQeTc085QL19IctLuMvWwP429z+k+8z8UnsH4wNW
 IDfkAxOsNBF/2kcIoQnyD7hj8wSJYV3dFKJLZ7y4U34vaQ2y0D9au6vHKUi4=
X-Received: by 2002:a05:6870:8901:b0:11d:416d:2ccb with SMTP id
 i1-20020a056870890100b0011d416d2ccbmr3609437oao.176.1661350602961; 
 Wed, 24 Aug 2022 07:16:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4S/bXPjudD5r+jeg8zjdF8VIIfPTbKsr6UBU4BPdcvaSuYf6QRJqDYyWMLocI8oex7KKC2lxdqQd8jgQ9wzG0=
X-Received: by 2002:a05:6870:8901:b0:11d:416d:2ccb with SMTP id
 i1-20020a056870890100b0011d416d2ccbmr3609414oao.176.1661350602662; Wed, 24
 Aug 2022 07:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220823185134.14464-1-mario.limonciello@amd.com>
 <20220823185134.14464-2-mario.limonciello@amd.com>
In-Reply-To: <20220823185134.14464-2-mario.limonciello@amd.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 24 Aug 2022 22:16:30 +0800
Message-ID: <CAAd53p6MfBaRTTNJ5mAFU6XfDndLFJihLHKdrbq8Nq-27LArjg@mail.gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 1/4] ACPI: OSI: Remove Linux-Dell-Video _OSI
 string
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
Cc: ddadap@nvidia.com, linux-acpi@vger.kernel.org, rafael@kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 hdegoede@redhat.com, Dell.Client.Kernel@dell.com, Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 2:51 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> This string was introduced because drivers for NVIDIA hardware
> had bugs supporting RTD3 in the past.  Thoes bugs have been fixed
> by commit 5775b843a619 ("PCI: Restore config space on runtime resume
> despite being unbound"). so vendors shouldn't be using this string
> to modify ASL anymore.

Add some backgrounds on what happened.

Before proprietary NVIDIA driver supports RTD3, Ubuntu has a mechanism
that can switch PRIME on and off, though it requires to logout/login
to make the library switch happen.
When the PRIME is off, the mechanism unload NVIDIA driver and put the
device to D3cold, but GPU never came back to D0 again. So ODM use the
_OSI to expose an old _DSM method to switch the power on/off.

The issue is fixed by the said commit so we can discard the workaround now.

Kai-Heng

>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/acpi/osi.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
> index 9f6853809138..c2f6b2f553d9 100644
> --- a/drivers/acpi/osi.c
> +++ b/drivers/acpi/osi.c
> @@ -44,15 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
>         {"Processor Device", true},
>         {"3.0 _SCP Extensions", true},
>         {"Processor Aggregator Device", true},
> -       /*
> -        * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
> -        * cards as RTD3 is not supported by drivers now.  Systems with NVidia
> -        * cards will hang without RTD3 disabled.
> -        *
> -        * Once NVidia drivers officially support RTD3, this _OSI strings can
> -        * be removed if both new and old graphics cards are supported.
> -        */
> -       {"Linux-Dell-Video", true},
>         /*
>          * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
>          * audio device which is turned off for power-saving in Windows OS.
> --
> 2.34.1
>

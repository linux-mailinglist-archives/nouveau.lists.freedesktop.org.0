Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A807E0987
	for <lists+nouveau@lfdr.de>; Fri,  3 Nov 2023 20:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9360710EA83;
	Fri,  3 Nov 2023 19:38:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785FE10EA83
 for <nouveau@lists.freedesktop.org>; Fri,  3 Nov 2023 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699040307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18fxGFPyEfYX6zujRVQDCVGp1gVPnAg8xcOJqGUDNpU=;
 b=WEkItedecRds0qOcBxKgV+BlXanqPNvIhVM5BPB+KWD42h5LD+wCXlA7+0afMHD2HRzct6
 aw1oH+KuwFhmX5ToyHwMeCo/q/KLiUER6Ujmq6O+OslgxjzVLMGrjuMrAeY9wibNMVIyYB
 tK+yddk4hNYtAkEd+AB9NeOH7Z9pGw8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-TKP5hwJaPhCrskOLD00BAw-1; Fri, 03 Nov 2023 15:38:26 -0400
X-MC-Unique: TKP5hwJaPhCrskOLD00BAw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9ba247e03aeso173682966b.1
 for <nouveau@lists.freedesktop.org>; Fri, 03 Nov 2023 12:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699040305; x=1699645105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18fxGFPyEfYX6zujRVQDCVGp1gVPnAg8xcOJqGUDNpU=;
 b=MstlXjE1p/2ZE7CwYq0by3MKBedkVdOmo5KA2cbEU2B+1L4b+vNKLZuvPq927p1Tg/
 PtDmW1We/SNyft9YW/6KoVkgPTCm4dxENWF/36914yX7EJIMx8coHXGoirUujx/CiQtZ
 rwuMCCZGjWaxaxELRANEx2zXdnN4/Y5GRUmaIwlnL1aDR3YqTMhLBJLFCBqTlNeoMdQK
 OZUTWGCaIKrLxt86t96SyKUnGZJ6o2+AuBkfXovT0W80obNlbMJmwyB68bY5+3NQ3sZR
 8M+85fJNVo28hJm9MDyjC86TCFRmDf/jLmLS4eYX5Xi0xqPpUq2IBw08lpgON5yAJ0y4
 x8fA==
X-Gm-Message-State: AOJu0YzW6A0t26F5eZWd39Kax6mklyF9vEufL1SLYLppsw9TAakgIoma
 jMU5PiCWOxccXhJlK+BiV9VhnKSybpiccU6n2O+H63v3TXSKAC3OxXZ7TLLNWadIH7RaD9L2rby
 kdpSkoy1iasINHDbmgd2tMNrPHQ==
X-Received: by 2002:a17:907:3da1:b0:9b7:37de:6009 with SMTP id
 he33-20020a1709073da100b009b737de6009mr8119046ejc.3.1699040305148; 
 Fri, 03 Nov 2023 12:38:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2EgYFYkxhAFVhtUcYX07z+ZAHa6gRCnHShMvlzepM1PxNvaeqEAxxrCtaSa8ojD2/gCJsUw==
X-Received: by 2002:a17:907:3da1:b0:9b7:37de:6009 with SMTP id
 he33-20020a1709073da100b009b737de6009mr8119007ejc.3.1699040304766; 
 Fri, 03 Nov 2023 12:38:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 lk22-20020a170906cb1600b0099d804da2e9sm1220533ejb.225.2023.11.03.12.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 12:38:24 -0700 (PDT)
Message-ID: <d6466210-fdb7-e9e2-68bb-551b263f439d@redhat.com>
Date: Fri, 3 Nov 2023 20:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Mario Limonciello <mario.limonciello@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-7-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231103190758.82911-7-mario.limonciello@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 6/9] PCI: Rename is_thunderbolt to
 is_tunneled
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
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Mark Gross <markgross@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Andreas Noever <andreas.noever@gmail.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 11/3/23 20:07, Mario Limonciello wrote:
> The `is_thunderbolt` bit has been used to indicate that a PCIe device
> contained the Intel VSEC which is used by various parts of the kernel
> to change behavior. To later allow usage with USB4 controllers as well,
> rename this to `is_tunneled`.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Here is my ack for the trivial drivers/platform/x86/apple-gmux.c change:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Bjorn, feel free to route this through the PCI tree.

Regards,

Hans




> ---
>  drivers/pci/pci.c                 | 2 +-
>  drivers/pci/probe.c               | 2 +-
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  include/linux/pci.h               | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 59c01d68c6d5..d9aa5a39f585 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3032,7 +3032,7 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
>  			return true;
>  
>  		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> -		if (bridge->is_thunderbolt)
> +		if (bridge->is_tunneled)
>  			return true;
>  
>  		/* Platform might know better if the bridge supports D3 */
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 795534589b98..518413d15402 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -1597,7 +1597,7 @@ static void set_pcie_thunderbolt(struct pci_dev *dev)
>  	/* Is the device part of a Thunderbolt controller? */
>  	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
>  	if (vsec)
> -		dev->is_thunderbolt = 1;
> +		dev->is_tunneled = 1;
>  }
>  
>  static void set_pcie_untrusted(struct pci_dev *dev)
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 1417e230edbd..20315aa4463a 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -774,7 +774,7 @@ static int gmux_resume(struct device *dev)
>  
>  static int is_thunderbolt(struct device *dev, void *data)
>  {
> -	return to_pci_dev(dev)->is_thunderbolt;
> +	return to_pci_dev(dev)->is_tunneled;
>  }
>  
>  static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 439c2dac8a3e..b1724f25fb02 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -440,7 +440,7 @@ struct pci_dev {
>  	unsigned int	is_virtfn:1;
>  	unsigned int	is_hotplug_bridge:1;
>  	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
> -	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
> +	unsigned int	is_tunneled:1;		/* Tunneled TBT or USB4 link */
>  	unsigned int	no_command_complete:1;	/* No command completion */
>  	/*
>  	 * Devices marked being untrusted are the ones that can potentially


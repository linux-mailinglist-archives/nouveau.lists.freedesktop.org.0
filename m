Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658B4B2078
	for <lists+nouveau@lfdr.de>; Fri, 11 Feb 2022 09:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA3B10EA1F;
	Fri, 11 Feb 2022 08:46:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDC610EA24
 for <nouveau@lists.freedesktop.org>; Fri, 11 Feb 2022 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644569161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIGJSGdDR+e/0lqDusmjI7J0UIItqFB5EseqZJ+/itg=;
 b=JWBBVROHNDyDfUEi5eAEEopZINg2s1HncjBe0675uzx9nZdArY2kqmyW+TUBaiSSRo+lLU
 FE0P/ZBJ32V9N7pjdgeOhXhGED0I/Du1iLPKMyxGebFqbNY6kWxqOBMJgweOdGfI10InBj
 JPFP51oRizc8wLb7tvSxBU4beQ+ebVY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-LfOlhUV-PXCPJVbRF_WGHg-1; Fri, 11 Feb 2022 03:46:00 -0500
X-MC-Unique: LfOlhUV-PXCPJVbRF_WGHg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x6-20020a05640226c600b0040fe1993eebso4232973edd.6
 for <nouveau@lists.freedesktop.org>; Fri, 11 Feb 2022 00:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NIGJSGdDR+e/0lqDusmjI7J0UIItqFB5EseqZJ+/itg=;
 b=5YIVx8BLB5JuIwj4fae+7haGjSuhRNgmbYFaXk335IBBTTyIs1DxjzQctsL50t36Vl
 nird188dg67LPanhnrM07IvBy+da3BFN+4bxeBrSqtkP1PoWRybdk6Iv4r4e3irGBy3f
 jNJza+YAZBPoGibRYgKE8WZR6RH3zsYLafvO7NJhnQJKK19zyajI+EImJjVhWeUxEdTE
 5XkLdxWkD4CeNkyQAJiVIqGfpN0WY5GD66oIti5Pp0zg0iBrzCvN52g+xIOtZXdiFBwu
 2VRS0/K2uPYn0FySibKLuS3YmMnAomq7eAUICyve1bHtEB6xJ6iblTv3CtArb1clYvW8
 1c1g==
X-Gm-Message-State: AOAM532v1/8+1FuqLeO6eP1I6Agn94eT98ju37fqFSDiiidW/XuxogFV
 2gCcupRgn3xmoZCpOzxWJ+9MbpPLUsHtul+8e/8Sgdj7PRH0zXXrm9JFbluGGwgKJBcHxGXqLQ7
 7LstKDVO23BY7yNuTNTjyfhuNDA==
X-Received: by 2002:a17:907:168a:: with SMTP id
 hc10mr466717ejc.283.1644569159100; 
 Fri, 11 Feb 2022 00:45:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQtGaHy5U9JGMvxdUhyHS51vk9smJiabHDR4QMkXJw//KX0Gh6ttUq7C+QmDdzvWmB7pzNDQ==
X-Received: by 2002:a17:907:168a:: with SMTP id
 hc10mr466695ejc.283.1644569158862; 
 Fri, 11 Feb 2022 00:45:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id v5sm10859303edb.15.2022.02.11.00.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 00:45:58 -0800 (PST)
Message-ID: <d8c31b9a-49fd-e10b-34ef-751fe1262513@redhat.com>
Date: Fri, 11 Feb 2022 09:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Mario Limonciello <mario.limonciello@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-9-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220210224329.2793-9-mario.limonciello@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 8/9] platform/x86: amd-gmux: drop the use
 of `pci_is_thunderbolt_attached`
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 2/10/22 23:43, Mario Limonciello wrote:
> Currently `pci_is_thunderbolt_attached` is used to indicate a device
> is connected externally.
> 
> The PCI core now marks such devices as removable and downstream drivers
> can use this instead.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, this looks good to me. I assume that this whole series
will be merged in one go through another tree (e.g. the PCI tree),
so here is my ack for merging this patch through another tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 04232fbc7d56..ffac15b9befd 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
>  
>  static int is_thunderbolt(struct device *dev, void *data)
>  {
> -	return pci_is_thunderbolt_attached(to_pci_dev(dev));
> +	return dev_is_removable(dev);
>  }
>  
>  static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> 


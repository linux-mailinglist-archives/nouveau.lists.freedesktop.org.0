Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901792244A0
	for <lists+nouveau@lfdr.de>; Fri, 17 Jul 2020 21:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67FA6E8B0;
	Fri, 17 Jul 2020 19:52:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCEC6E8BA
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 19:52:17 +0000 (UTC)
Received: from mail-pj1-f69.google.com ([209.85.216.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alex.hung@canonical.com>) id 1jwWP1-0005bs-Su
 for nouveau@lists.freedesktop.org; Fri, 17 Jul 2020 19:52:16 +0000
Received: by mail-pj1-f69.google.com with SMTP id h93so8512390pjb.2
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 12:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAr/PZNCVVXHi2XM5sV5Vjv9LxoATUMG734KVRfdoVY=;
 b=HmRggxCfkYglF+MMcIj+egspFev2gIZTzzQbog2ukPweqttx2VfqL7NH0rSt7kkw/z
 dY9FV6NlN3Zm+JooV/dFE8JXqYqV1RIMv7EHHzi5C3EquT987y0P6YgU2aZv4xqxqKfl
 NHlXku1fudpEiXOzzK+l2ih6Fkx1oWMXdZZ9Jh1I2Ir4iBB9r+3+dY7uA6cBWEwI6SZL
 aILc9vky1rx7k6b0oPmmwvlrbMEPkw+HBZLBm9LBKX7sOhWSM0hdhH1dbf9I9BN9zRWt
 dsT0WKH6I5bfPFdzqBWMsK16tgl324M2N3v8yIfzkabXX9nwnB3fig9aKBmalVlbNahF
 foSA==
X-Gm-Message-State: AOAM530nv173+srHBw+NcAtYYjrzkj/tZxCKLh7kPH9WaV8aCDSE8iaB
 Y6BYYk5XCkxIyAtSkdyKl6kjp0Ba/CXJzZ/HavqVmxY5ipAxczGuW4i+uNEqubXSDdMwpydqaRk
 UQc8nn1QbmXorMUxAL7rxLdTPz1P55G7n+MTOBuPRBjk=
X-Received: by 2002:aa7:948c:: with SMTP id z12mr9462517pfk.47.1595015534158; 
 Fri, 17 Jul 2020 12:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF78FcXCHrTAzm5SmDiVs60gWF5qYGsvPUKF/R7mEJtjZqtf1yjMbW37ZZ3kS+Mkgqg35euA==
X-Received: by 2002:aa7:948c:: with SMTP id z12mr9462501pfk.47.1595015533842; 
 Fri, 17 Jul 2020 12:52:13 -0700 (PDT)
Received: from [192.168.0.119] (d66-222-144-129.abhsia.telus.net.
 [66.222.144.129])
 by smtp.gmail.com with ESMTPSA id o23sm8923638pfd.126.2020.07.17.12.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 12:52:13 -0700 (PDT)
To: Karol Herbst <kherbst@redhat.com>, linux-acpi@vger.kernel.org
References: <20200717190547.648604-1-kherbst@redhat.com>
From: Alex Hung <alex.hung@canonical.com>
Message-ID: <e7a8cb3a-e9f8-b78a-93f0-c09e5eb5ed10@canonical.com>
Date: Fri, 17 Jul 2020 13:52:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717190547.648604-1-kherbst@redhat.com>
Content-Language: en-US
Subject: Re: [Nouveau] [PATCH] RFC: ACPI / OSI: remove workarounds for
 hybrid graphics laptops
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
Cc: nouveau@lists.freedesktop.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2020-07-17 1:05 p.m., Karol Herbst wrote:
> It's hard to figure out what systems are actually affected and right now I
> don't see a good way of removing those...
> 
> But I'd like to see thos getting removed and drivers fixed instead (which
> happened at least for nouveau).
> 
> And as mentioned before, I prefer people working on fixing issues instead
> of spending time to add firmware level workarounds which are hard to know
> to which systems they apply to, hard to remove and basically a big huge
> pain to work with.> In the end I have no idea how to even figure out what systems are affected
> and which not by this, so I have no idea how to even verify we can safely
> remove this (which just means those are impossible to remove unless we risk
> breaking systems, which again makes those supper annoying to deal with).
> 
> Also from the comments it's hard to get what those bits really do. Are they
> just preventing runtime pm or do the devices are powered down when booting?
> I am sure it's the former, still...
> 
> Please, don't do this again.
> 
> For now, those workaround prevent power savings on systems those workaround
> applies to, which might be any so those should get removed asap and if
> new issues arrise removing those please do a proper bug report and we can
> look into it and come up with a proper fix (and keep this patch out until
> we resolve all of those).
> 
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> CC: Alex Hung <alex.hung@canonical.com>
> CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> CC: Len Brown <lenb@kernel.org>
> CC: Lyude Paul <lyude@redhat.com>
> CC: linux-kernel@vger.kernel.org
> CC: dri-devel@lists.freedesktop.org
> CC: nouveau@lists.freedesktop.org
> ---
>  drivers/acpi/osi.c | 24 ------------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
> index 9f68538091384..d4405e1ca9b97 100644
> --- a/drivers/acpi/osi.c
> +++ b/drivers/acpi/osi.c
> @@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
>  	{"Processor Device", true},
>  	{"3.0 _SCP Extensions", true},
>  	{"Processor Aggregator Device", true},
> -	/*
> -	 * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
> -	 * cards as RTD3 is not supported by drivers now.  Systems with NVidia
> -	 * cards will hang without RTD3 disabled.
> -	 *
> -	 * Once NVidia drivers officially support RTD3, this _OSI strings can
> -	 * be removed if both new and old graphics cards are supported.
> -	 */
> -	{"Linux-Dell-Video", true},
> -	/*
> -	 * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
> -	 * audio device which is turned off for power-saving in Windows OS.
> -	 * This power management feature observed on some Lenovo Thinkpad
> -	 * systems which will not be able to output audio via HDMI without
> -	 * a BIOS workaround.
> -	 */
> -	{"Linux-Lenovo-NV-HDMI-Audio", true},
> -	/*
> -	 * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
> -	 * output video directly to external monitors on HP Inc. mobile
> -	 * workstations as Nvidia and AMD VGA drivers provide limited
> -	 * hybrid graphics supports.
> -	 */
> -	{"Linux-HPI-Hybrid-Graphics", true},
>  };
>  
>  static u32 acpi_osi_handler(acpi_string interface, u32 supported)
> 

The changes were discussed and tested a while ago, and no crashes were
observed. Thanks for solving PM issues in nouveau.

Acked-by: Alex Hung <alex.hung@canonical.com>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

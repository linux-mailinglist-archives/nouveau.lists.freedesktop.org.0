Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C3F22554B
	for <lists+nouveau@lfdr.de>; Mon, 20 Jul 2020 03:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0813289FD3;
	Mon, 20 Jul 2020 01:18:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB1C89FD9
 for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2020 01:18:57 +0000 (UTC)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alex.hung@canonical.com>) id 1jxKSG-00036M-39
 for nouveau@lists.freedesktop.org; Mon, 20 Jul 2020 01:18:56 +0000
Received: by mail-pf1-f199.google.com with SMTP id a8so11608824pff.3
 for <nouveau@lists.freedesktop.org>; Sun, 19 Jul 2020 18:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dTQyUG61kX2XCwIUiPSY5cCF6yJekK9Ymo10gmabLSw=;
 b=KVeLysOJASgC9rl9OfJg1lV+OZKalqsnJ2yyUPwCBKYfejUNL3lQW08N5M3BmAM0SN
 zgm0+DBzWkWzkhEfULEbiGV6FPHhiY59wr4TejOPIVNPAVlDK4v+scbasL3/a9Yci3Zo
 r4D5d0D9XFZb/SVhP5qGFROC/YnLa6pQ+4bc6FOO4jQybOE1FY2aLOVoYGK21GBpUT/2
 ao52+jdpQu7WbSdekfXymooVRJd4j9m5/LY6vAGOOO2GppIRx4iZdQPNE91k/hyAZSLX
 M+aiOjZ0DCGV8njD73DWl1r6G8YqJ1P8HNyl5WsfqVp12smHSYru93+4bcDQqHMIqq0f
 g4CA==
X-Gm-Message-State: AOAM533oHftd+f0Ypc4tp6+rKUYBQx1pcOxyi4pwwmT8j6+kfP6cRn0F
 00cRbK14JWaHUa6QXXv7/mElG68BkxcCDAxEOCmgnSiF+4mbSDp3Fx4/j6//XbGTP1Z4vuO6Z7r
 RLpkMn74a0PV8ukOWfukquhAmyYFOARXv2SrsIegEoG8=
X-Received: by 2002:a65:490d:: with SMTP id p13mr16441331pgs.183.1595207934351; 
 Sun, 19 Jul 2020 18:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwudbwMDOJLkji0WfrSzxkPuyTod60uCI/xIM8pY05aS+io4K0fWco4Zfmkc0P1TnvefU0aMw==
X-Received: by 2002:a65:490d:: with SMTP id p13mr16441307pgs.183.1595207933994; 
 Sun, 19 Jul 2020 18:18:53 -0700 (PDT)
Received: from [192.168.0.119] (d66-222-144-129.abhsia.telus.net.
 [66.222.144.129])
 by smtp.gmail.com with ESMTPSA id 15sm10012333pjs.8.2020.07.19.18.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jul 2020 18:18:53 -0700 (PDT)
To: Karol Herbst <kherbst@redhat.com>
References: <20200717190547.648604-1-kherbst@redhat.com>
 <e7a8cb3a-e9f8-b78a-93f0-c09e5eb5ed10@canonical.com>
 <CACO55tvLCrqeV8MsVDbTaWP2EPAeZtfU08Kb2fVGCD6X+g3-rg@mail.gmail.com>
From: Alex Hung <alex.hung@canonical.com>
Message-ID: <8ad1866d-eb61-a30c-5875-5ffbfd2e17e1@canonical.com>
Date: Sun, 19 Jul 2020 19:18:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACO55tvLCrqeV8MsVDbTaWP2EPAeZtfU08Kb2fVGCD6X+g3-rg@mail.gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2020-07-19 1:50 p.m., Karol Herbst wrote:
> On Fri, Jul 17, 2020 at 9:52 PM Alex Hung <alex.hung@canonical.com> wrote:
>>
>> On 2020-07-17 1:05 p.m., Karol Herbst wrote:
>>> It's hard to figure out what systems are actually affected and right now I
>>> don't see a good way of removing those...
>>>
>>> But I'd like to see thos getting removed and drivers fixed instead (which
>>> happened at least for nouveau).
>>>
>>> And as mentioned before, I prefer people working on fixing issues instead
>>> of spending time to add firmware level workarounds which are hard to know
>>> to which systems they apply to, hard to remove and basically a big huge
>>> pain to work with.> In the end I have no idea how to even figure out what systems are affected
>>> and which not by this, so I have no idea how to even verify we can safely
>>> remove this (which just means those are impossible to remove unless we risk
>>> breaking systems, which again makes those supper annoying to deal with).
>>>
>>> Also from the comments it's hard to get what those bits really do. Are they
>>> just preventing runtime pm or do the devices are powered down when booting?
>>> I am sure it's the former, still...
>>>
>>> Please, don't do this again.
>>>
>>> For now, those workaround prevent power savings on systems those workaround
>>> applies to, which might be any so those should get removed asap and if
>>> new issues arrise removing those please do a proper bug report and we can
>>> look into it and come up with a proper fix (and keep this patch out until
>>> we resolve all of those).
>>>
>>> Signed-off-by: Karol Herbst <kherbst@redhat.com>
>>> CC: Alex Hung <alex.hung@canonical.com>
>>> CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>>> CC: Len Brown <lenb@kernel.org>
>>> CC: Lyude Paul <lyude@redhat.com>
>>> CC: linux-kernel@vger.kernel.org
>>> CC: dri-devel@lists.freedesktop.org
>>> CC: nouveau@lists.freedesktop.org
>>> ---
>>>  drivers/acpi/osi.c | 24 ------------------------
>>>  1 file changed, 24 deletions(-)
>>>
>>> diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
>>> index 9f68538091384..d4405e1ca9b97 100644
>>> --- a/drivers/acpi/osi.c
>>> +++ b/drivers/acpi/osi.c
>>> @@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
>>>       {"Processor Device", true},
>>>       {"3.0 _SCP Extensions", true},
>>>       {"Processor Aggregator Device", true},
>>> -     /*
>>> -      * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
>>> -      * cards as RTD3 is not supported by drivers now.  Systems with NVidia
>>> -      * cards will hang without RTD3 disabled.
>>> -      *
>>> -      * Once NVidia drivers officially support RTD3, this _OSI strings can
>>> -      * be removed if both new and old graphics cards are supported.
>>> -      */
>>> -     {"Linux-Dell-Video", true},
>>> -     /*
>>> -      * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
>>> -      * audio device which is turned off for power-saving in Windows OS.
>>> -      * This power management feature observed on some Lenovo Thinkpad
>>> -      * systems which will not be able to output audio via HDMI without
>>> -      * a BIOS workaround.
>>> -      */
>>> -     {"Linux-Lenovo-NV-HDMI-Audio", true},
>>> -     /*
>>> -      * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
>>> -      * output video directly to external monitors on HP Inc. mobile
>>> -      * workstations as Nvidia and AMD VGA drivers provide limited
>>> -      * hybrid graphics supports.
>>> -      */
>>> -     {"Linux-HPI-Hybrid-Graphics", true},
>>>  };
>>>
>>>  static u32 acpi_osi_handler(acpi_string interface, u32 supported)
>>>
>>
>> The changes were discussed and tested a while ago, and no crashes were
>> observed. Thanks for solving PM issues in nouveau.
>>
>> Acked-by: Alex Hung <alex.hung@canonical.com>
>>
> 
> By any chance, do you have a list of systems implementing those workarounds?
> 

I don't keep a list but the workaround, in theory, should only apply to
the systems with the specific nvidia hardware.

I reminded OEMs and ODMs that these _OSI strings were temporary
solutions, and highlighted we were going to remove them after our
discussion last year. If they were paying attentions recent systems
shouldn't have these _OSI strings.

-- 
Cheers,
Alex Hung
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

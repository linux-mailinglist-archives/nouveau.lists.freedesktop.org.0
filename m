Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77F7E92BF
	for <lists+nouveau@lfdr.de>; Sun, 12 Nov 2023 21:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36D210E31B;
	Sun, 12 Nov 2023 20:43:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7010F10E31A
 for <nouveau@lists.freedesktop.org>; Sun, 12 Nov 2023 20:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699821802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/lZSLfHSJ3lgfaPtLw9pH3ZZ2OWkdNMAIZm5OTZRi4=;
 b=PW7Gm/5fJ6YFe+7grXiQH5Xz0O214ZsZWIxSjDsTQHPXj35jINtXZTaQd34446f2lYWack
 /NK56oAu232xf2J0rYV0Zf1rsQvp98Pu9dk+7OwWjQUpBXQKw2vnVG1zSWcYa0SciS8w87
 dBtHBWYk6bxz7rUGV6gvMrZW9+XaDQo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-d5iFyhC4OCygXOFxPw98QQ-1; Sun, 12 Nov 2023 15:43:19 -0500
X-MC-Unique: d5iFyhC4OCygXOFxPw98QQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9e8b2d32d88so31748466b.0
 for <nouveau@lists.freedesktop.org>; Sun, 12 Nov 2023 12:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699821798; x=1700426598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R/lZSLfHSJ3lgfaPtLw9pH3ZZ2OWkdNMAIZm5OTZRi4=;
 b=v6ujnx8HVgsw0NRlztnL3yammWeCP4s15GAqbrVxFtyO5LB4vmgDblCE1wWKCPb7s9
 s+AR/9v3k9JKhz0E/WHafazRc6J8Kn25ILQ1jkAjrG31qpjP6XhH67jgXyPh/qFi7xfc
 C5c+R/how3c/owya1rjalgk8DcbjwzNYl3G3CKZPOACaTerLWLUona46Z9HZ7vi7HWT5
 ZzbnTwxZJ6mDTAKyd6WfAKgIh7rngJJXebSfkMI1wIHAyxs0g6xJFfmbF58yI0bPChT4
 ZJJf736ebqYpsOTgPof/XmE1m2d/sj7nySTOCizRgVJ3sGa6BczV1xT2R1qk/9OvGmVk
 85hw==
X-Gm-Message-State: AOJu0YxzqbPToMioor4bG9qvckqmDvqjmLkIYg+w847/X7/RiC3M2inB
 GPHnRq5DrJyJL0D5uGluY14Fz+xreFyDuleU6evbdQwhik2vliMfEq/s4dMrEgj/ntaU7AtbgrO
 6DBMwp2hUQmSmiXyO3iWQ+BYtjg==
X-Received: by 2002:a17:906:300b:b0:9ba:a38:531e with SMTP id
 11-20020a170906300b00b009ba0a38531emr3544788ejz.52.1699821798016; 
 Sun, 12 Nov 2023 12:43:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpZkasG8Lh5Q8a2Bx2iRoNIZThOCEb3KwkB/3fA6F8wH2CFJrCrtz7uQQMTLVT5JttMyI6IA==
X-Received: by 2002:a17:906:300b:b0:9ba:a38:531e with SMTP id
 11-20020a170906300b00b009ba0a38531emr3544777ejz.52.1699821797566; 
 Sun, 12 Nov 2023 12:43:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a170906260800b009dd98089a48sm2973331ejc.43.2023.11.12.12.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Nov 2023 12:43:16 -0800 (PST)
Message-ID: <55698544-8cba-4413-bdd3-79cfaa1f3c44@redhat.com>
Date: Sun, 12 Nov 2023 21:43:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Owen T. Heisler" <writer@owenh.net>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
 <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
 <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
 <CAAd53p608qmC3pvz=F+y2UZ9O39f2aq-pE-1_He1j8PGQmM=tg@mail.gmail.com>
 <d1ac9c1e-f3fe-4d06-ba2e-2c049841d19b@owenh.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d1ac9c1e-f3fe-4d06-ba2e-2c049841d19b@owenh.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [REGRESSION]: acpi/nouveau: Hardware unavailable upon
 resume or suspend fails
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 11/10/23 17:58, Owen T. Heisler wrote:
> Hi everyone,
> 
> On 11/10/23 06:52, Kai-Heng Feng wrote:
>> On Fri, Nov 10, 2023 at 2:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> On 11/10/23 07:09, Kai-Heng Feng wrote:
>>>> On Fri, Nov 10, 2023 at 5:55 AM Owen T. Heisler <writer@owenh.net> wrote:
>>>>> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
>>>>> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
>>>>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218124
>>>>
>>>> Thanks for the bug report. Do you prefer to continue the discussion
>>>> here, on gitlab or on bugzilla?
> 
> Kai-Heng, you're welcome and thank you too. By email is fine with me.
> 
>>> Owen, as Kai-Heng said thank you for reporting this.
> 
> Hans, you're welcome, and thanks for your help too.
> 
>>>>> ## Reproducing
>>>>>
>>>>> 1. Boot system to framebuffer console.
>>>>> 2. Run `systemctl suspend`. If undocked without secondary display,
>>>>> suspend fails. If docked with secondary display, suspend succeeds.
>>>>> 3. Resume from suspend if applicable.
>>>>> 4. System is now in a broken state.
>>>>
>>>> So I guess we need to put those devices to ACPI D3 for suspend. Let's
>>>> discuss this on your preferred platform.
>>>
>>> Ok, so I was already sort of afraid we might see something like this
>>> happening because of:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=89c290ea758911e660878e26270e084d862c03b0
>>>
>>> As I mentioned during the review of that, it might be better to
>>> not touch the video-card ACPI power-state at all and instead
>>> only do acpi_device_fix_up_power() on the child devices.
>>
>> Or the child devices need to be put to D3 during suspend.
>>
>>> Owen, attached are 2 patches which implement only
>>> calling acpi_device_fix_up_power() on the child devices,
>>> can you build a v6.6 kernel with these 2 patches added
>>> on top please and see if that fixes things ?
> 
> Yes, with those patches v6.6 suspend works normally. That's great, thanks!
> 
> I tested with v6.6 with the 2 patches at <https://lore.kernel.org/regressions/a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com/> using <https://gitlab.freedesktop.org/drm/nouveau/uploads/788d7faf22ba2884dcc09d7be931e813/v6.6-config1>. I tested both docked and un-docked, just in case.
> 
> Tested-by: Owen T. Heisler <writer@owenh.net>
> 
>>> Kai-Heng can you test that the issue on the HP ZBook Fury 16 G10
>>> is still resolved after applying these patches ?
>>
>> Yes. Thanks for the patch.
>>
>> If this patch also fixes Owen's issue, then
>> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com

Owen, Kai-Heng thank you for testing. I've submitted these patches
to Rafael (the ACPI maintainer) now (with you on the Cc).
Hopefully they will get merged soon.

Regards,

Hans


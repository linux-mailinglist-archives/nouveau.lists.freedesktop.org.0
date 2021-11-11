Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572BE44D2E7
	for <lists+nouveau@lfdr.de>; Thu, 11 Nov 2021 09:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025A489A62;
	Thu, 11 Nov 2021 08:08:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5B889A61
 for <nouveau@lists.freedesktop.org>; Thu, 11 Nov 2021 08:08:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d3so8349156wrh.8
 for <nouveau@lists.freedesktop.org>; Thu, 11 Nov 2021 00:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=51dymTkgSz0QJT2R8Ob3b6wj+Gw0q5ejxUB7mZIrxRA=;
 b=eUpUD/hhTu5zzWdrq3UQ7N42+BPqA25xSOiSlxgwH3g0eXBNtOKt2BpyY9a7plqOKw
 Y3+NjdXxK5op8VKgqfjq/mZkFyIxHxkbsz3UwlM0z1SUGqkBkQxIUXf23NO9RjOh8Dur
 HpiHbb/GgPAvvasrzTfrWz8UfcCZN6Hk3rdCyOOy1HXvBA7YnCd/vA1mf/ZJV/fb+4+x
 oP6i2dTvwjGrFIo/QPEq9ReeLqiz5XgMwFhEXmw7roSLHuf/M6A103QOiX+dLpnIiAr2
 9NO7rQfG5kps1KcuXA/EeC2bacamb4ygVrgmdq1dpGocoXSccxptV23WV3WXr8jpxXsG
 EOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=51dymTkgSz0QJT2R8Ob3b6wj+Gw0q5ejxUB7mZIrxRA=;
 b=Kt0H1AT2wTZkrl2L2jvjcYO/SA/FdFX5Mqa71ESgz7aoVEKnNPuqgOrFN08nr+kMAV
 zIakgrRqPN5ljyBkqKD5Q8MlsvsOy1p9C/wlfTAiqAyVMISpNjfVHyXpwxpK4POSFeQZ
 EViLzJHbd4EHvDB+edcliwcgGNlmS67bgm+6WuiB8NKyyVloLjhUvqukKlOzxykSoWI7
 LXjNdlpjZcPI07cV7unToKeN8EYnaYarvGy7Mqd2H2QTMKUbVoY7TuZ8SrAswXQJeP68
 MkRj4spq6pIeRsQ6DAePT15/znvhVVNFHgTOLkIoGhl4sODJ45o8p79TQ1tw84cUmWl4
 jQYg==
X-Gm-Message-State: AOAM532BBnFhMSQ7HtEdF04J12tXwe3zKdJA27FClp92sFGuFwJBOjbv
 lBv0PGBjDbCQ+8cKAEqFEZlk9NrSyjQ=
X-Google-Smtp-Source: ABdhPJxUTVtgEKrtMhY7y+DiT9o7VEhnCWvuCcXiGPITaIM7nlV9Q7lKJVBphFYg82J1heA8AXW6hQ==
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr6459480wrs.81.1636618085608; 
 Thu, 11 Nov 2021 00:08:05 -0800 (PST)
Received: from ?IPV6:2a02:8070:a2a8:1a00:5605:dbff:fe76:161d?
 ([2a02:8070:a2a8:1a00:5605:dbff:fe76:161d])
 by smtp.googlemail.com with ESMTPSA id x21sm7874441wmc.14.2021.11.11.00.08.05
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 00:08:05 -0800 (PST)
Message-ID: <a17361fb-975e-a845-b715-82cba2d8de11@gmail.com>
Date: Thu, 11 Nov 2021 09:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: de-DE
To: nouveau@lists.freedesktop.org
References: <4a8b1573-3cd6-19cc-b18b-588d7d8283d9@gmx.net>
 <CACO55tun0ohXCNV_3o3eZozs7+ehy-Bv0_cxP+uaOMFgwkq_Nw@mail.gmail.com>
 <3301ae21-6427-b706-e544-67ec82109271@gmx.net>
From: Uwe Sauter <uwe.sauter.de@gmail.com>
In-Reply-To: <3301ae21-6427-b706-e544-67ec82109271@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] hardware donation
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
Reply-To: uwe.sauter.de@gmail.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Am 11.11.21 um 08:54 schrieb Linux User #330250:
> On 02 Nov 2021, 02:24, Karol Herbst wrote:
>> On Tue, Oct 26, 2021 at 9:56 PM Linux User #330250
>> <linuxuser330250@gmx.net> wrote:
>>>
>>> Hello!
>>>
>>> I have a ThinkPad T61 with an Nvidia Quadro G86M [NVS 140M] graphics
>>> card. Recently the nvidia binary driver, version 340.x, has been removed
>>> from most Linux distributions, forcing the use of nouveau.
>>>
>>> In the past, when nouveau was unstable/unusable, people moved to the
>>> binary driver. Since this in no longer an option, nouveau is now the
>>> only option. And I'm totally okay with it, I would have prferred an open
>>> source solution anyway... BUT.
>>>
>>> BUT nouveau is unstable. I experience random freezes, like others too:
>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=995866
>>>
>>> The only option was to use nomodeset and to have an unaccelerated
>>> graphics output. But if you want to use the laptop as a desktop machine,
>>> this is not much fun.
>>>
>>> Long story short, the question I have:
>>>
>>> According to https://nouveau.freedesktop.org/HardwareDonations.html such
>>> a graphics card could be of use?
>>>
>>
>> If you are willing to give away the system anyway, it might make sense
>> to retest with recent software, like newest Fedora or debian sid. We
>> usually fix bugs, but often fixes are not added downstream. And I
>> think the issue shown in this bug is actually fixed already as I
>> remember seeing something like this and we fixed it.
>>
>> If the issue is still there with a recent kernel (newest 5.14 or even
>> 5.15) we can look into it.
>>
>> Thanks
> 
> Hi!
> Sorry for the late reply. I don't have the time at the moment, but I
> will try the newest Debian testing on that system and report back. If
> that does work, it is an option to actually keep the system and use it
> as originally intended.
> 
> If it doesn't work, I'm thinking about 1) Fedora and 2) Gentoo (because
> that's what I normally use). Even though the later would be quite time
> consuming, I'd certainly get the newest available sources to the hardware.

Hi,

if you don't have time to compile a whole new Gentoo system then take a look at Arch Linux where you
will find the latest kernel release only a few days after there were released.

I was using Gentoo for many years but it became too time consuming and the change to Arch was time
well spent (in regards to how much time I need now to keep the systems up to date).

(This post's intention is not to start discussions regarding distributions, only to bring awareness
to Arch as rolling update distribution using the newest kernel and drivers.)

Regards,

	Uwe


> 
>>> Thanks,
>>> Linux User #330250


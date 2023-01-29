Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E543E6801A4
	for <lists+nouveau@lfdr.de>; Sun, 29 Jan 2023 22:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA7210E009;
	Sun, 29 Jan 2023 21:36:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0D010E009
 for <nouveau@lists.freedesktop.org>; Sun, 29 Jan 2023 21:36:39 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gr7so2288359ejb.5
 for <nouveau@lists.freedesktop.org>; Sun, 29 Jan 2023 13:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zs19kDc/7qwAXdCYJEeMzxXKqq/Z0D6o3tKd1HBVTWM=;
 b=WsR3N4uDCcnGPIknDXyHFA5Shco/+ci9NhgKlOFDL13yZ3HIhHLOzAVi/qZrRAH14O
 6td5ZKHKPt8i7+5V8AqWud4uRo7dZPLfJU+2QYKz07hrtVx29AOLv1u6ELXwai6wip8P
 240hmmA7p7DME7fgFm9WD9YCyGB75YMlSe1bZd55YU8f4Cw6jQb8vxPfHaoeY1cQ9jUj
 lV3uUN2k/GGnXFqjA1qfn6QGxQI+xPZJtbFFTEWLzCqCPyM+EVV1+mH7cd/kYpvGkhjw
 pp4P6WL/s0+VPBLcyzSkQshmxbEZKR7xWasRah1pC8nqnde1hu2tehdc/1HK8ck4NLgt
 CNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zs19kDc/7qwAXdCYJEeMzxXKqq/Z0D6o3tKd1HBVTWM=;
 b=KwoTG56Z5FZEpTwNCyRx25ga8tuqQEWLascLbxjfagqFh4bRIZJKmd09FfuHir46Is
 1nGFiTOTy3s5GxyYn3BI+10HNyuXo6GZl1fQBo7X8igYzGghZcNyO8kNNgDOy2TJa+Vc
 n8DVkb9g04oJoD5VTpk/cfS/XilUQVwhASB0oO8gXC2P9GBMEMSujQDhJntly1vioc/u
 Tj9xpA/gQgEQ71j04SKnJApbp6CqdZuD+iw7C0epuhyevxeeb/qA4yBoiIb9yX96QTbd
 DZpcJS99wGAZ7Ej9bvcKDfSKxJTol55JWg74jU2ncZ1S+R2EecFJWUM8yIyHlDCgyiLR
 uELQ==
X-Gm-Message-State: AO0yUKXbOwKLe+SUPKNqB93x2EwU7LxKZSj25I9HBtTAeNFrCyiyTpEb
 f/JKr32xkoU/wlefz86Wx7RaougYGbxKOQ==
X-Google-Smtp-Source: AK7set/b/XDGVNdc4I8L4igCCg0eAo8R/JgP1m4pwI8f6gpG3mSiQLCLW2JDgwtkTK5EYCd99gEiKw==
X-Received: by 2002:a17:907:76ea:b0:878:8294:9179 with SMTP id
 kg10-20020a17090776ea00b0087882949179mr13424205ejc.54.1675028198174; 
 Sun, 29 Jan 2023 13:36:38 -0800 (PST)
Received: from [192.168.178.20] (host-95-250-162-30.retail.telecomitalia.it.
 [95.250.162.30]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05640210c200b00499e5659988sm5713473edu.68.2023.01.29.13.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 13:36:37 -0800 (PST)
Message-ID: <51511ea3-431f-a45c-1328-5d1447e5169b@gmail.com>
Date: Sun, 29 Jan 2023 22:36:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: Salvatore Bonaccorso <carnil@debian.org>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20220819200928.401416-1-kherbst@redhat.com>
 <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
 <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
 <CAHSpYy117N0A1QJKVNmFNii3iL9mU71_RusiUo5ZAMcJZciM-g@mail.gmail.com>
 <cdfc26b5-c045-5f93-b553-942618f0983a@gmail.com> <Y9VgjLneuqkl+Y87@kroah.com>
 <Y9V8UoUHm3rHcDkc@eldamar.lan>
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
In-Reply-To: <Y9V8UoUHm3rHcDkc@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Greg,
Hello Salvatore,

On 28/01/2023 20:49, Salvatore Bonaccorso wrote:
> Hi Greg,
> 
> I'm not the reporter, so would like to confirm him explicitly, but I
> believe I can give some context:
> 
> On Sat, Jan 28, 2023 at 06:51:08PM +0100, Greg KH wrote:
>> On Sat, Jan 28, 2023 at 03:49:59PM +0100, Computer Enthusiastic wrote:
>>> Hello,
>>>
>>> The patch "[Nouveau] [PATCH] nouveau: explicitly wait on the fence in
>>> nouveau_bo_move_m2mf" [1] was marked for kernels v5.15+ and it was merged
>>> upstream.
>>>
>>> The same patch [1] works with kernel 5.10.y, but it is not been merged
>>> upstream so far.
>>>
>>> According to Karol Herbst suggestion [2], I'm sending this message to ask
>>> for merging it into 5.10 kernel.
>>
>> We need to know the git commit id.  And have you tested it on 5.10.y?
>> And why are you stuck on 5.10.y for this type of hardware?  Why not move
>> to 5.15.y or 6.1.y?
> 
> This would be commit 6b04ce966a73 ("nouveau: explicitly wait on the
> fence in nouveau_bo_move_m2mf") in mainline, applied in 6.0-rc3 and
> backported to 5.19.6 and 5.15.64.
> 
> Computer Enthusiastic, tested it on 5.10.y:
> https://lore.kernel.org/nouveau/CAHSpYy1mcTns0JS6eivjK82CZ9_ajSwH-H7gtDwCkNyfvihaAw@mail.gmail.com/
> 
> It was reported in Debian by the user originally as
> https://bugs.debian.org/989705#69 after updating to the 5.10.y series in Debian
> bullseye.
> 
> I guess the user could move to the next stable release Debian bookworm, once
> it's released (it's currently in the last milestones to finalize, cf.
> https://release.debian.org/ but we are not yet there). In the next release this
> will be automatically be fixed indeed.
> 
> Computer Enthusiastic, can you confirm please to Greg in particular the first
> questions, in particular to confirm the commit fixes the suspend issue?
> 
> Regards,
> Salvatore

Thanks for replaying to my request: I really appreciate.

I apologize if my request was not formally correct.

The upstream kernel 5.10.y hangs on suspend or fails to resume if it is 
suspended to ram or suspended to disk (if nouveau kernel module is used 
with some nvidia graphic cards).

I confirm the commit ID 6b04ce966a73 (by Karol Herbst) fixes the 
aforementioned suspend to ram and suspend to disk issues with kernel 
5.10.y . It tested it with my own computer.

The last kernel version I tested is 5.10.165, that I patched and 
installed in Debian Stable (11.6) that I'm currently running and that I 
tested again today.

It would be nice if the next point release of Debian Stable could ship a 
kernel that includes patch commit ID 6b04ce966a73 for the benefit of 
nouveau module users.

Thanks again.

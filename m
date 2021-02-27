Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE2326D08
	for <lists+nouveau@lfdr.de>; Sat, 27 Feb 2021 13:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22516E4B3;
	Sat, 27 Feb 2021 12:28:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870EB6E4B3
 for <nouveau@lists.freedesktop.org>; Sat, 27 Feb 2021 12:28:30 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c23so7782250edr.13
 for <nouveau@lists.freedesktop.org>; Sat, 27 Feb 2021 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RnQda0POTe7oIp7ncWIGuDPasxv40/2QcPNf1DIIfok=;
 b=punA/OLY4oRktcVewKKv2XUjMrw6FQVkcZCMN8Zu/Tmp96PZtKdE1unSGLnyPIfxhX
 zDB4JJaNdjtyDsCa1VnQZDytjRM6E+Xim2h4e/vEc1u8ggyMnXF5nXrfOVfLOlWc1QeO
 HeT6YzKsHsjIUx7SQiYXr0IBUAAShq5TyvkisVi9YU6IwhD0NE0knkE7Pcjd9JTudrwt
 eFvWcevXHHy7GWYKy5ksP0hoCyR6Ia1lYYSNspZmMfVKKWgx2CNhkqDvRHbPCTTCD2pu
 bRPbr0O4T35syQ5Wq9Eeq1O8IxFWSutDGEoXSAmRnuHyl2ENgsFGKip86kzq8R27xw+r
 aDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RnQda0POTe7oIp7ncWIGuDPasxv40/2QcPNf1DIIfok=;
 b=M/ni6IALsZGsHA9ogqW0YhDofaDJeiAWrcltVldBD1ejP2bX/fFgUb75jvYzH/FPnh
 RIoJUNII3CAFwYezmXg/PJaXthf1znLyrZcJilgnaYsG97NxiDjT3mRpJ7FjhheNwSrf
 J3Xi1zxxyZ8vqkHrH+o9e9fMRFmh5tDaktNSTj0TcWRd7aEj04BfaITpG3ClgU07G2O8
 4dOFuplHMBiMmc8qp643mDIOtCaLAVFhLMgeKh5hFibWJ7tyy9Yykjz5+ap2k4JXITFh
 wwXlBve1KQlD8YfoTTejBUHGELdDUu/TrCNP85G4VmzL4GMWYZ7RvCaCbcXOgN8rbTz5
 LbYg==
X-Gm-Message-State: AOAM533CWu49Hxm9v092J08sVs79Cqtu+Gp4eZiFdYjY0SgRlOT3gnlc
 4dqD2aGPU58nBtAAMTQ7S8MVjkoCeG6gbQ==
X-Google-Smtp-Source: ABdhPJx0PRSOoDGxyBCYIfLiOWVxf4ye07Hvy72tu1xzUKhm1cy8jBI+SW5BVUjiHCYTQMYIhsX7iQ==
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr7960501edb.285.1614428909232; 
 Sat, 27 Feb 2021 04:28:29 -0800 (PST)
Received: from ?IPv6:2a02:8070:a396:f000:1fe8:2143:afba:18b4?
 ([2a02:8070:a396:f000:1fe8:2143:afba:18b4])
 by smtp.googlemail.com with ESMTPSA id c18sm7848895edu.20.2021.02.27.04.28.28
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Feb 2021 04:28:28 -0800 (PST)
To: nouveau@lists.freedesktop.org
References: <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
From: Uwe Sauter <uwe.sauter.de@gmail.com>
Message-ID: <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
Date: Sat, 27 Feb 2021 13:28:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
Content-Language: de-DE
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Ilia,

Am 24.02.21 um 18:47 schrieb Ilia Mirkin:
> On Wed, Feb 24, 2021 at 12:03 PM Alex Riesen
> <alexander.riesen@cetitec.com> wrote:
>>
>> Ilia Mirkin, Wed, Feb 24, 2021 17:57:41 +0100:
>>> On Wed, Feb 24, 2021 at 11:53 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
>>>> Ilia Mirkin, Wed, Feb 24, 2021 17:48:39 +0100:
>>>>> Just to be crystal clear -- are you saying that 128x128 works or does
>>>>> not work? (You said "yes", which would imply it works OK, but then you
>>>>> said both cases, which would imply doesn't work since 256x256 doesn't
>>>>> work?)
>>>>
>>>> Modetest with 128x128 cursor works. Without damage to the cursor: modetest
>>>> shows normal cursor in vanilla v5.11. Modetest also shows normal cursor in
>>>> vanilla v5.11 with the commit reverted.
>>>
>>> But modetest with 256x256 doesn't work (correctly) right? Or did I
>>> misunderstand?
>>
>> Right. That's why I was asking if I did everything right: it was just corrupted
>> in both kernels.
> 
> OK. So 128x128 works, 256x256 does not. Interesting.
> 
>>
>>> All the patch does is allow those large cursors to be used, which gets
>>> reported via drm APIs and modesetting picks the largest cursor
>>> available. (And actually I think it's even not required to use the
>>> large cursors, it just controls what's reported in the defaults to
>>> userspace.)
>>
>> Maybe something in X code is not prepared to handle the kernel reporting
>> large cursor support? Even though 128x128 is pretty large, and I don't think
>> I even use that large cursors in X configuration. How can I check?
> 
> Yes, 64x64 is enough for anyone (or was it 640kb?) But it's unlikely
> to be an issue. I believe that AMD also exposes 256x256 cursors
> depending on the gen:
> 
> display/dc/dce100/dce100_resource.c:    dc->caps.max_cursor_size = 128;
> display/dc/dce110/dce110_resource.c:    dc->caps.max_cursor_size = 128;
> display/dc/dce112/dce112_resource.c:    dc->caps.max_cursor_size = 128;
> display/dc/dce120/dce120_resource.c:    dc->caps.max_cursor_size = 128;
> display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
> display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
> display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
> display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
> display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
> display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
> display/dc/dcn10/dcn10_resource.c:      dc->caps.max_cursor_size = 256;
> display/dc/dcn20/dcn20_resource.c:      dc->caps.max_cursor_size = 256;
> display/dc/dcn21/dcn21_resource.c:      dc->caps.max_cursor_size = 256;
> display/dc/dcn30/dcn30_resource.c:      dc->caps.max_cursor_size = 256;
> 
> which should have the equivalent effect.
> 
> But since you're seeing issues with modetest as well (which uses the
> ioctl's pretty directly), presumably Xorg is not to blame.
> 
> It's easy enough to adjust the kernel to report a lower size (and
> reject the larger cursors), I just want to understand which gens are
> affected by this.

I can also report that the modesetting ddx that comes with xorg-server 1.20.10-3 (Arch Linux package) shows this kind of 
cursor-cut-into-horizontal-stripes behavior. Changing to xf86-video-nouveau 1.0.17-1 solves this issue. But nouveau has 
issues with Mate 1.24 (as discussed earlier this month).

My hardware:
# lspci -s 3:0.0 -v
03:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 710] (rev a1) (prog-if 00 [VGA controller])
	Subsystem: ASUSTeK Computer Inc. GT710-4H-SL-2GD5
	Flags: bus master, fast devsel, latency 0, IRQ 36, IOMMU group 12
	Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
	Memory at fff0000000 (64-bit, prefetchable) [size=128M]
	Memory at fff8000000 (64-bit, prefetchable) [size=32M]
	I/O ports at f000 [size=128]
	Expansion ROM at fc000000 [disabled] [size=512K]
	Capabilities: [60] Power Management version 3
	Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [78] Express Legacy Endpoint, MSI 00
	Capabilities: [100] Virtual Channel
	Capabilities: [128] Power Budgeting <?>
	Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
	Capabilities: [900] Secondary PCI Express
	Kernel driver in use: nouveau
	Kernel modules: nouveau


If I can help in any way please let me know.

Regards,

	Uwe




> Cheers,
> 
>    -ilia
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

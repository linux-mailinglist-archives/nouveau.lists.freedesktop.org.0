Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8887D66F8
	for <lists+nouveau@lfdr.de>; Wed, 25 Oct 2023 11:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF1110E617;
	Wed, 25 Oct 2023 09:35:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21E410E617
 for <nouveau@lists.freedesktop.org>; Wed, 25 Oct 2023 09:35:24 +0000 (UTC)
Received: from [192.168.0.33] (unknown [91.156.66.55])
 (Authenticated sender: martin.peres@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E920019F553;
 Wed, 25 Oct 2023 11:35:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1698226523;
 bh=P3+lsoAwPDLOikEC8R/jnyDMtVyY0yS0lV93729cfW4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qh74f4x29gG+E1pCUP8Q/EFHufdXfivZyPEm7uKs7X8kKW65WIKAI7/MFPtn/eY0R
 w/Ik80ax6T+94K5zsLFZxf6u9GvdnkAuvY3YPn1MrxV7y+n75dZ+JK0qEUC5Gc2oY8
 m9T7HUr/M+CqDYk/hWFvtcrk37bxExiKEGlulIvNu7QeyhJdIlbQIuVwfMbtrCRU0K
 Ky3Wn2GMRUFOaKFL30Sf5Fp8hRBpB9jQUI7/8Uc77KyPkTrzjKPL/6lp/PiVmLNRkt
 XMAo6qgshifcolLrewexoprTHXB/GKl09Rw5GMDkRwI+GR1WCcisa+tUE0hfbjqpsk
 uWFPRMbVIuehw==
Message-ID: <f2483b59-2f77-4cbb-8e73-cae7246191d9@free.fr>
Date: Wed, 25 Oct 2023 12:35:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Philipp Stanner <pstanner@redhat.com>, Ben Skeggs <skeggsb@gmail.com>,
 nouveau@lists.freedesktop.org
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-43-skeggsb@gmail.com>
 <a8948198c085246bff4bbc3ca696461523180545.camel@redhat.com>
From: Martin Roukala <martin.peres@free.fr>
In-Reply-To: <a8948198c085246bff4bbc3ca696461523180545.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 42/44] drm/nouveau/nvenc/r535: initial support
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/24/23 12:51, Philipp Stanner wrote:
> On Tue, 2023-09-19 at 06:21 +1000, Ben Skeggs wrote:
>> From: Ben Skeggs <bskeggs@redhat.com>
>>
>> Adds support for allocating VIDEO_ENCODER classes from RM.
>>
>> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>

[...]

>> +static void *
>> +r535_nvenc_dtor(struct nvkm_engine *engine)
>> +{
>> +       struct nvkm_nvenc *nvenc = nvkm_nvenc(engine);
>> +
>> +       kfree(nvenc->engine.func);
>> +       return nvenc;
>> +}
> 
> Why is nvenc returned as void * when it's clearly always of type
> struct nvkm_nvenc * ?
> 
> If it's sometimes necessary to convert it to a void-pointer I think it
> would be better to do that by assigning to a void-pointer at the place
> where r535_nvenc_dtor() is actually called. This void-pointer's
> subsequent usage then would make it obvious why it's void *
> 
> Is it necessary to return it in an opaque form? If so, that should be
> commented.

This is part of Nouveau's conventions for object-oriented programming. 
This would be part of the so-called "core". It's been a while since I 
worked with it, but the reason why it is a `void *` is because it makes 
other functions easier to write.

I hope this helps!

Cheers,
Martin

PS: I am not checking out Nouveau's mailing list often, so if anyone has 
some questions related to the kernel driver, feel free to ping me 
(mupuf) on #nouveau and I will try my best to provide some context or a 
pointer to someone else could be a good person to answer :)

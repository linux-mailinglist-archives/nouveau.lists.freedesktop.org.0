Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F13884FB2D
	for <lists+nouveau@lfdr.de>; Fri,  9 Feb 2024 18:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0B710EC52;
	Fri,  9 Feb 2024 17:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cq0iKiAR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A7910EC52
 for <nouveau@lists.freedesktop.org>; Fri,  9 Feb 2024 17:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707500503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8cXBiboRfo0of98MkHU2Vfc0DFLaOgC0qAVl8Vrox4=;
 b=cq0iKiARZ/bhwbmjXk6kVvCafTL9ZxaH2Rnh61YcjYQ5q/BWvMNs6HjhPqCaPhyAEiz6gz
 5sVKLF/Lm/TIqXgj2kf3gty9twgw3/mvBkrqg37ymnOTb5oCcPfrHvpoQJ4e2sjvxAZCd0
 JmAlhOEnTFMWhZvC5xK2/Id/+YgWNdE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-10qfjpSGN0SkcPctFP5qfQ-1; Fri, 09 Feb 2024 12:41:37 -0500
X-MC-Unique: 10qfjpSGN0SkcPctFP5qfQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a388c223625so64499066b.2
 for <nouveau@lists.freedesktop.org>; Fri, 09 Feb 2024 09:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707500496; x=1708105296;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q8cXBiboRfo0of98MkHU2Vfc0DFLaOgC0qAVl8Vrox4=;
 b=h+9xtpDEdr0+K79MQGLGuSyQ0SHpgdEgiErI8b6ZAYXeNq2N4JvooiKiFAHDII0EbR
 EycXDRLPrLahfztBlTHoZJ/XjzWObyRSm2M8vpVy8U7ieDSs1w/mj7WJCJ9KuUIVpnP/
 3ev+B7FQuxPnXOHoV1QC7tE87/cPifIlYZfO2Ex/6kEy22FKqeA6p6VitXY6sh6IEExZ
 ji8H4TyInP7Sgq65eNN+Qu8R+9IXsUdYiiobcj8RMSAGOY9vBErOAAfIyEO30dsG5thI
 Oq4l0F+3T85WgLFPsod/gQnLLBnEDFF01hI5Fyr+QS/YbrWZJGv9bkzjBOCVylfZ8fGi
 Nzdw==
X-Gm-Message-State: AOJu0YwQR8tl6zRBk5pPTWb6tRN/meghO9jlTITFPELWvcO06E/flVEm
 FemCMH0hRPsZOJcEwBJEbah4G56ED2r0JZxjUpaibDsB861db/rAGxN5gJmM3s67Mk8nztkouBT
 o/oTSli4B/WatG9/DIVUleCBi3i0jUsgmdv0kwuH88wXlzMMU1LMHze/8LxSpc7nD6XPyFZs=
X-Received: by 2002:a17:906:4a59:b0:a3b:b021:57de with SMTP id
 a25-20020a1709064a5900b00a3bb02157demr1622772ejv.1.1707500496144; 
 Fri, 09 Feb 2024 09:41:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4BLqGxaw+J2KCDiFAKvA8Y2np5p5tVtIPTiuNc65jwhq42iS9D8ldpllWAeE6VMNQ5GCIeQ==
X-Received: by 2002:a17:906:4a59:b0:a3b:b021:57de with SMTP id
 a25-20020a1709064a5900b00a3bb02157demr1622762ejv.1.1707500495795; 
 Fri, 09 Feb 2024 09:41:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQPiLVfXpkISblVZchHlkpfuHTMzVz5Xsu9LLNgEGAJ0rfP8aJjcltB7QY0Ceflkk7aqoIkFhP8R0hEOlB8nt3KlvUgIZ4KvNFOpifEDIKVCC/phGWbXoPOmwrg+N4EWBiZw==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a1709062cd000b00a36c3e2e52dsm968511ejr.61.2024.02.09.09.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 09:41:35 -0800 (PST)
Message-ID: <a2174cc2-ea65-4bcf-a112-f60f26b7213c@redhat.com>
Date: Fri, 9 Feb 2024 18:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
To: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
 <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
 <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
 <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2/6/24 15:03, Daniel Vetter wrote:
> On Mon, Feb 05, 2024 at 11:00:04PM +0100, Danilo Krummrich wrote:
>> On 2/5/24 22:08, Dave Airlie wrote:
>>> On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
>>>>
>>>> On 1/29/24 02:50, Dave Airlie wrote:
>>>>> From: Dave Airlie <airlied@redhat.com>
>>>>>
>>>>> This should break the deadlock between the fctx lock and the irq lock.
>>>>>
>>>>> This offloads the processing off the work from the irq into a workqueue.
>>>>>
>>>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>>
>>>> Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
>>>> safe deferring fence signalling to the kernel global wq. However, I wonder
>>>> if we could create deadlocks by building dependency chains into other
>>>> drivers / kernel code that, by chance, makes use of the kernel global wq as
>>>> well.
>>>>
>>>> Admittedly, even if, it's gonna be extremely unlikely given that
>>>> WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
>>>>
>>>> Also, do we need to CC stable?
>>>
>>> I pushed this to Linus at the end of last week, since the hangs in 6.7
>>> take out the complete system and I wanted it in stable.
>>>
>>> It might be safer to use a dedicated wq, is the concern someone is
>>> waiting on a fence in a workqueue somewhere else so we will never
>>> signal it?
>>
>> Yes, if some other work is waiting for this fence (or something else in the same
>> dependency chain) to signal it can prevent executing the work signaling this fence,
>> in case both are scheduled on the same wq. As mentioned, with the kernel global wq
>> this would be rather unlikely to lead to an actual stall with WQ_MAX_ACTIVE == 512,
>> but formally the race condition exists. I guess a malicious attacker could try to
>> intentionally push jobs directly or indirectly depending on this fence to a driver
>> which queues them up on a scheduler using the kernel global wq.
> 
> I think if you add dma_fence_signalling annotations (aside, there's some
> patch from iirc Thomas Hellstrom to improve them and cut down on some
> false positives, but I lost track) then I think you won't get any splats
> because the wq subsystem assumes that WC_MAX_ACTIVE is close enough to
> infinity to not matter.

As mentioned, for the kernel global wq it's 512. (Intentionally) feeding the kernel
with enough jobs to to provoke a deadlock doesn't seem impossible to me.

I think it'd be safer to just establish not to use the kernel global wq for executing
work in the fence signalling critical path.

We could also run into similar problems with a dedicated wq, e.g. when drivers share
a wq between drm_gpu_scheduler instances (see [1]), however, I'm not sure we can catch
that with lockdep.

[1] https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/gpu/drm/nouveau/nouveau_drm.c#L313

> 
> I'm not sure we should care differently, but I guess it'd be good to
> annotate it all in case the wq subsystem's idea of how much such deadlocks
> are real changes.
> 
> Also Teo is on a mission to get rid of all the global wq flushes, so there
> should also be no source of deadlocks from that kind of cross-driver
> dependency. Or at least shouldn't be in the future, I'm not sure it all
> landed.
> -Sima


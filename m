Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C100CBAA78
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA2E10EA52;
	Sat, 13 Dec 2025 12:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="UZeQoVEq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B660210E731
 for <nouveau@lists.freedesktop.org>; Thu, 22 May 2025 12:57:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a37535646aso2999208f8f.0
 for <nouveau@lists.freedesktop.org>; Thu, 22 May 2025 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747918667; x=1748523467;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3J9AMbyW3GoHyzEzAk0eTuO9WQLNRNBObnNC+tBgquY=;
 b=UZeQoVEqCxDhl56RoqeEaSMwRHwb3X3TPc/XzcYj1jzMAIv8HhGT4w7ElhccvI4p8z
 j7J7bNnxcfZkVvnyGGL2MfCkmAFA7nCYt7XXr1Rj1+TY2NIEmFLzCykEMSdvfRZzkV9o
 82rChsjfxWDfQcT4r26z0CAI+9yK3awThIPa9PjrzamNr4CDnXeGxq6JGMHFC4HCCkNZ
 NLZa4/yCZ6K+lPrIBWx7nxv6zFZlfvfsVkY+i5aTMbVZvYf+L5EPIyqN5F4l/hqCQzCx
 GIC4n+g12BfGRl9yalsOJNr3/uVjZelBEwT7F1VO8Bw7VOjeqSpvbCklGWgUsFQ1wA1/
 bM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747918667; x=1748523467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3J9AMbyW3GoHyzEzAk0eTuO9WQLNRNBObnNC+tBgquY=;
 b=r9vmtmxz6g1AJp0SqRVmt/Q1F8/G0xAuQLPu8J1RfzS0JNOlj8N2U8methAdRHk05F
 gG24e35vOQBfGKYx8vzf68/zoTnaSImO5/kHpyjK+Je301Qsl04Z9NzqgG/1968yuto7
 UNBCHbddwzCWCxu3CU1pxLcb1jKMhYbyU/c0D+HiOjH0O64HvieJ3ASzMqD6P8qnorHH
 i204BMcMjRfZl/Fm1wm0AXDJJ9+fZa7jTTogsSzx3+P0h4s+dyR2ssenV+K8kf/uFkmn
 xJY1Q5xBu6TYwOTfXE+pPsnqkgzUr1PJuV308Hp38KrG3eZwoZql67e9q0o24dDHNF8R
 wmMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKM6DQ+CUqcTdWbiWvnK1Xy4hsj6fZV1Kt+kWTOfgvLB95qIjlHKyMYbKeR4ZkzWEzK2vTc7Yy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4UQzTpyqAt2wVhl9C4GDxhxIUJYLfZgBC9RgiGmA5xxwCQ8q4
 lUNnNOAHbBaS2fSaM2Uh/A1S2iNHz32ViqAJ97AeY2lg3G1DAqOZ+wSESj5+M2XzVvs=
X-Gm-Gg: ASbGncsVnX127qvSnFPHM27JAzEEx1q21SkrSavXwMqLos6P3eS688GscML2yx9i68o
 wDImhXmXycPpu6/NbK+T/flTDQNkH4ratGRUdx6M9VcHwA7Mvshr4aUznplAgwl9i9q05l97FHx
 NJ19cNQ8wjeNdbWNVcUmVSVBOXFFdZRHzn/4W8seD3ezZah1wH0tOBLWZk9U2jZ3at/9G9+pV0j
 1LRbg6T4L94MknLpAgKnPXGXtvldCogUQ37XDOwv9OSI4Fuv7IcJOLjW42Uk/f7fujx+sHRWotH
 cW1CiWKLTG2f0yZGgZ8j31H6AlYO4Q0l6zyOWS9vy26FXmCGqaXmpi+PvCuxcFMRog==
X-Google-Smtp-Source: AGHT+IHvgtQQC0r16ZhryOrtlBzgjmQhsHS0R3Z6+yIPce93CHi+ORR3bGFByrXrywpyK9wgMjlkUA==
X-Received: by 2002:a05:6000:40dd:b0:3a3:7816:3e17 with SMTP id
 ffacd0b85a97d-3a378163e38mr12097933f8f.8.1747918666820; 
 Thu, 22 May 2025 05:57:46 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca6210asm22857327f8f.41.2025.05.22.05.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 05:57:46 -0700 (PDT)
Message-ID: <096c06b8-2cb6-4231-93aa-7091ea558e22@ursulin.net>
Date: Thu, 22 May 2025 13:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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


On 22/05/2025 13:34, Christian König wrote:
> On 5/22/25 14:20, Philipp Stanner wrote:
>> On Thu, 2025-05-22 at 14:06 +0200, Christian König wrote:
>>> On 5/22/25 13:25, Philipp Stanner wrote:
>>>> dma_fence_is_signaled_locked(), which is used in
>>>> nouveau_fence_context_kill(), can signal fences below the surface
>>>> through a callback.
>>>>
>>>> There is neither need for nor use in doing that when killing a
>>>> fence
>>>> context.
>>>>
>>>> Replace dma_fence_is_signaled_locked() with
>>>> __dma_fence_is_signaled(), a
>>>> function which only checks, never signals.
>>>
>>> That is not a good approach.
>>>
>>> Having the __dma_fence_is_signaled() means that other would be
>>> allowed to call it as well.
>>>
>>> But nouveau can do that here only because it knows that the fence was
>>> issued by nouveau.
>>>
>>> What nouveau can to is to test the signaled flag directly, but that's
>>> what you try to avoid as well.
>>
>> There's many parties who check the bit already.
>>
>> And if Nouveau is allowed to do that, one can just as well provide a
>> wrapper for it.
> 
> No, exactly that's what is usually avoided in cases like this here.
> 
> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.
> 
> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
> 
> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.

But why? Say for example scheduler dependencies - why the scheduler 
couldn't ignore them at add time, but it can before trying to install a 
callback on them, and instead has to opportunistically signal someone 
else's fences?

I don't see it. But even if there is a reason, advantage of the helper 
is that it can document this at a centralised place.

Regards,

Tvrtko

>> That has the advantage of centralizing the responsibility and
>> documenting it.
>>
>> P.
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> index d5654e26d5bc..993b3dcb5db0 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
>>>> nouveau_fence_chan *fctx, int error)
>>>>   
>>>>   	spin_lock_irqsave(&fctx->lock, flags);
>>>>   	list_for_each_entry_safe(fence, tmp, &fctx->pending, head)
>>>> {
>>>> -		if (error && !dma_fence_is_signaled_locked(&fence-
>>>>> base))
>>>> +		if (error && !__dma_fence_is_signaled(&fence-
>>>>> base))
>>>>   			dma_fence_set_error(&fence->base, error);
>>>>   
>>>>   		if (nouveau_fence_signal(fence))
>>>
>>
> 


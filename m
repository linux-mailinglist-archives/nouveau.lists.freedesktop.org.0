Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1897EA339
	for <lists+nouveau@lfdr.de>; Mon, 13 Nov 2023 20:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27BA10E3E0;
	Mon, 13 Nov 2023 19:00:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E68410E188
 for <nouveau@lists.freedesktop.org>; Mon, 13 Nov 2023 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699902039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjJH04gFEMWV/cqlv7v8adTIMmJNmVfPhb2cpZ40Pn0=;
 b=BrEi+je9SakxIWOkiOJulaARRa2EwgTph1h3cwkeN3BYA7LYtB+00BFokVOkFrz+dDptFd
 eDZlAID7jYHn9tjQ91MIGyasLk2giLNaNySiAnPi9ROtM2kYYmOiLqn5QRHBKVZvYK6A8x
 rgQLLscRygMjQKdIm1g1MLbwM9XwXA4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-_nQHHp7cOLqWie-tksyPPQ-1; Mon, 13 Nov 2023 14:00:36 -0500
X-MC-Unique: _nQHHp7cOLqWie-tksyPPQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c7822862b5so29074021fa.3
 for <nouveau@lists.freedesktop.org>; Mon, 13 Nov 2023 11:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699902035; x=1700506835;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xjJH04gFEMWV/cqlv7v8adTIMmJNmVfPhb2cpZ40Pn0=;
 b=oCzDw8jyhFVfMYkQ24L+Qs1Kt5xfSMMsw18PJA306HVrc1xC46UjrR30Ad52AZ1Bv7
 xx77jvg9FI1VfD0wMpRP8NT3lIWs98muLQR3REhp49ug9tBN4baFQFpMnLcrL2mBkMDq
 iNOtxvV60S/3RLVa/na+n9/CljGjEZBTON7PBX/TFzb9rQdM3lUGi86Op1SlfbS0S6Gh
 eagpjKlL1P27qf52KmjpUvtOtRLHmxaUP/yFkc3X0sHg9u33JlDIGqWz0WqxgVlv02Qg
 KV29GFmxIK+RN2rOEagPkBvPuy5AMxNk0L1FzETecRwkVmYPNbyFCX3yqZS63I2Y7VLw
 KFWg==
X-Gm-Message-State: AOJu0Yz0tHbRwgZ9fZ9Q/mHLb3zgrB7cMRBcFzLVVLvV5wK+ibcunzZT
 V0GtRwn+VZn6+zqx5sJQGdd93czLJ/AxQQ7QR/jmzZcKezCHGvRievtA41VyyVFkvJo8Kpc0rlP
 ZZNWqYvlRcQblV36PKZXK61/eNA==
X-Received: by 2002:a2e:be8b:0:b0:2bc:f5a0:cc25 with SMTP id
 a11-20020a2ebe8b000000b002bcf5a0cc25mr135222ljr.2.1699902035079; 
 Mon, 13 Nov 2023 11:00:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKOZlXh+pNOQnEDYBQ7KmjIxq11+FS8KLtk5tk8xefyvp983ehULtBUTIJnRwL82VT3c4gjA==
X-Received: by 2002:a2e:be8b:0:b0:2bc:f5a0:cc25 with SMTP id
 a11-20020a2ebe8b000000b002bcf5a0cc25mr135210ljr.2.1699902034760; 
 Mon, 13 Nov 2023 11:00:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090629c300b009b94fe3fc47sm4386719eje.159.2023.11.13.11.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 11:00:34 -0800 (PST)
Message-ID: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
Date: Mon, 13 Nov 2023 20:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
 <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
 <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
 <d0b1fb36-d2a6-446c-8a04-2101981f3a00@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <d0b1fb36-d2a6-446c-8a04-2101981f3a00@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH v2] driver: gpu: Fixing warning directly
 dereferencing a rcu pointer
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
Cc: nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/13/23 19:55, Abhinav Singh wrote:
> On 11/14/23 00:19, Danilo Krummrich wrote:
>> Hi,
>>
>> thanks for sending a v2.
>>
>> On 11/13/23 19:42, Abhinav Singh wrote:
>>> This patch fixes a sparse warning with this message
>>> "warning:dereference of noderef expression". In this context it means we
>>> are dereferencing a __rcu tagged pointer directly.
>>
>> Better use imperative here, e.g. "Fix a sparse warning ...".
>>
>> Wouldn't ask you to send a v3 for that alone...
>>
>>>
>>> We should not be directly dereferencing a rcu pointer, rather we should
>>> be using rcu helper function rcu_dereferece() inside rcu read critical
>>> section to get a normal pointer which can be dereferenced.
>>
>> ...but this doesn't seem accurate anymore as well.
>>
>> - Danilo
>>
>>>
>>> I tested with qemu with this command
>>> qemu-system-x86_64 \
>>>     -m 2G \
>>>     -smp 2 \
>>>     -kernel bzImage \
>>>     -append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
>>>     -drive file=bullseye.img,format=raw \
>>>     -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
>>>     -net nic,model=e1000 \
>>>     -enable-kvm \
>>>     -nographic \
>>>     -pidfile vm.pid \
>>>     2>&1 | tee vm.log
>>> with lockdep enabled.
>>>
>>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>>> ---
>>> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
>>> also removed the rcu locking and unlocking function call.
>>>
>>>   drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
>>> index 5b71a5a5cd85..cdbc75e3d1f6 100644
>>> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
>>> @@ -39,7 +39,7 @@ struct nv04_fence_priv {
>>>   static int
>>>   nv04_fence_emit(struct nouveau_fence *fence)
>>>   {
>>> -    struct nvif_push *push = fence->channel->chan.push;
>>> +    struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>>>       int ret = PUSH_WAIT(push, 2);
>>>       if (ret == 0) {
>>>           PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
>>
> Hi maintainers thanks a lot for reviewing this patch.
> I think I should fix my mistake by sending in another patch so that the code changes and description matches. So should I send another patch ?

Yes, please send a v3.

> 
> Thank You,
> Abhinav Singh
> 


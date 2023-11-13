Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7070182EE31
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100E710E4D8;
	Tue, 16 Jan 2024 11:47:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A201710E093;
 Mon, 13 Nov 2023 18:55:30 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-58962bf3f89so320395a12.0; 
 Mon, 13 Nov 2023 10:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699901730; x=1700506530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G+f4rJoyzPIE0y6h0wORDQt+kRBF7nK+PXXMCBjyvGI=;
 b=MZtATveJ/end93gWzTAs4XgVkY4Co/if2JQRZLQFt4xkSbimbiYHCEqcT8zU9LFBay
 trPaU81pyJMYoxZp8BtzHUTdMfa9fQPlvAoGE/7iZ83D3E51GEn4gFJ4JktmCZcAJnJE
 ojvBLlxZ0OD7Urr/7+k9eSzp0a16uv0To9hKliR/uua3DAZSgu+C2MquqeykHm6/UE0m
 UaDlv6rnviG2UWw4aPeIWV1W3de5DhYGib/vHwDZymDEnnG6TPhGoYiIg9cYEeIM4RMd
 f7VCnqhh5NNA8X103BNZqRdRko6xv/8Ki39pxopB3+0o2/LTLUktVzYxRz3DRBy/1zRY
 JX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699901730; x=1700506530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G+f4rJoyzPIE0y6h0wORDQt+kRBF7nK+PXXMCBjyvGI=;
 b=H+oC9D4/2cr9OaFshKhxo84V2tzWZ54G1wuHHDO0GFkU3z99Fn2UJiBwf048Cm0ZM3
 dmnYVvHfA4U2LWh7a+/wIYqjMwXs5C7ZHeKsS35szRpJKE1g4m2qQ0CmIdIZpvFE1yGQ
 i0hAlZVNKVSZmsoyACU3yNHNeBVydwMoQVZeI5PgGNAVJmMI4wP+jdfrYMKjbaSfnkPK
 nkusbS2qGOz/bRYysci8LnjQT5ZpJmZ5rwLpXWljeEqOCnXVoCj31tHyWSLMXCl7xHsf
 3S+c3r61T5aWEx2oLahfc3qq1ASag3lhUnBXVfu9SrRD0Lu8x4GIhDAqf2VhWPWG3qYf
 naqg==
X-Gm-Message-State: AOJu0YxNosQlspZlMXWqLazheOguLT6wfaWrxsRz3+qH49EXfWRG1b4e
 6armH2zj8PRRXR8PpJVyEb8=
X-Google-Smtp-Source: AGHT+IE5duZlYWLgqLzfa5RiDEmFjpMM0G68cLOdfphgOn3YyS8OIU25TqGIK0nk9u3XKZly5FW4rQ==
X-Received: by 2002:a05:6a20:9381:b0:163:d382:ba84 with SMTP id
 x1-20020a056a20938100b00163d382ba84mr130227pzh.5.1699901730166; 
 Mon, 13 Nov 2023 10:55:30 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.210])
 by smtp.gmail.com with ESMTPSA id
 ka27-20020a056a00939b00b0069102aa1918sm4091818pfb.48.2023.11.13.10.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:55:29 -0800 (PST)
Message-ID: <d0b1fb36-d2a6-446c-8a04-2101981f3a00@gmail.com>
Date: Tue, 14 Nov 2023 00:25:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver: gpu: Fixing warning directly dereferencing a
 rcu pointer
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, kherbst@redhat.com, lyude@redhat.com, 
 airlied@gmail.com, daniel@ffwll.ch
References: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
 <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
 <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:29 +0000
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

On 11/14/23 00:19, Danilo Krummrich wrote:
> Hi,
> 
> thanks for sending a v2.
> 
> On 11/13/23 19:42, Abhinav Singh wrote:
>> This patch fixes a sparse warning with this message
>> "warning:dereference of noderef expression". In this context it means we
>> are dereferencing a __rcu tagged pointer directly.
> 
> Better use imperative here, e.g. "Fix a sparse warning ...".
> 
> Wouldn't ask you to send a v3 for that alone...
> 
>>
>> We should not be directly dereferencing a rcu pointer, rather we should
>> be using rcu helper function rcu_dereferece() inside rcu read critical
>> section to get a normal pointer which can be dereferenced.
> 
> ...but this doesn't seem accurate anymore as well.
> 
> - Danilo
> 
>>
>> I tested with qemu with this command
>> qemu-system-x86_64 \
>>     -m 2G \
>>     -smp 2 \
>>     -kernel bzImage \
>>     -append "console=ttyS0 root=/dev/sda earlyprintk=serial 
>> net.ifnames=0" \
>>     -drive file=bullseye.img,format=raw \
>>     -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
>>     -net nic,model=e1000 \
>>     -enable-kvm \
>>     -nographic \
>>     -pidfile vm.pid \
>>     2>&1 | tee vm.log
>> with lockdep enabled.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
>> also removed the rcu locking and unlocking function call.
>>
>>   drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c 
>> b/drivers/gpu/drm/nouveau/nv04_fence.c
>> index 5b71a5a5cd85..cdbc75e3d1f6 100644
>> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
>> @@ -39,7 +39,7 @@ struct nv04_fence_priv {
>>   static int
>>   nv04_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nvif_push *push = fence->channel->chan.push;
>> +    struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>>       int ret = PUSH_WAIT(push, 2);
>>       if (ret == 0) {
>>           PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
> 
Hi maintainers thanks a lot for reviewing this patch.
I think I should fix my mistake by sending in another patch so that the 
code changes and description matches. So should I send another patch ?

Thank You,
Abhinav Singh

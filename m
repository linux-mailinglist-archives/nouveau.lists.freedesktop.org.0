Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0177F2302
	for <lists+nouveau@lfdr.de>; Tue, 21 Nov 2023 02:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE89F10E248;
	Tue, 21 Nov 2023 01:20:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179510E248
 for <nouveau@lists.freedesktop.org>; Tue, 21 Nov 2023 01:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700529650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCIj+Yck5hQUwyiYPGShSSX7xq3O6mmynZaUoJB6T40=;
 b=BpNSQjRIRB9TcxoqSB8m7P6F1HKoswoaSXB82Cj/4R7TkV11MIVdmYODKio/aeSBCPtgFH
 RNghLu4TioYUbgRTnhgGbk1yxhEWmhsL/RNDlh/xKczQOHc/8Av4suJfcwsNhuqabwV43k
 +44V/gZJfuvTVDyPwUdArYCOwsHeOEs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-IkfWQZpCMKixE1M9ETTXNw-1; Mon, 20 Nov 2023 20:20:48 -0500
X-MC-Unique: IkfWQZpCMKixE1M9ETTXNw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a00dd93a5fcso52346466b.3
 for <nouveau@lists.freedesktop.org>; Mon, 20 Nov 2023 17:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700529647; x=1701134447;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kCIj+Yck5hQUwyiYPGShSSX7xq3O6mmynZaUoJB6T40=;
 b=QF4GUgP+2JOiSwpc+ZZjZy+FT2e+RqnYqBR+TaXJ8p4svCcmX4XwbwM0R6DR29B0j8
 4Rsj2q/0+XCGaMAqLqyyY/xlRXKmYSbrrC4JLSp6QbXbIkZMV2Z6oE6w/o4IuoVYfHSw
 k7+J8OsoCVXYWYvCf0+PooTsNTtfn5nviwNTEQxL2BztvbkySFmY8Y7e+GuVvx/gWxnX
 gYkJzxrPMJUW1TssQBN+GjGtRIhIDfeygAGuJbo65QxOgcgEQAumdJOSMhc5owjrz70r
 WUD6GaQA8VkGBlwbGBs9J6WvuX1Ymu7v/uxDJV2UokhOkFH/w503O0JWZ6i/yrXjKc9d
 H08g==
X-Gm-Message-State: AOJu0YwIRGf79HO0TuYsLY7xj2ufM/iRHYEbEm/tI4p9hF7IlC9Y5fcr
 TGoCTB684kgb3pqN8f79QdNAHsNFnRpEdvO5LZFTonmzHtLiKeAHmud+0Pig2XTSRu4EuEezqoV
 BbplSb6+cE7U8KUKZ4LqkXG7vFg==
X-Received: by 2002:a17:907:75c2:b0:a00:5a2:1270 with SMTP id
 jl2-20020a17090775c200b00a0005a21270mr1978742ejc.21.1700529647759; 
 Mon, 20 Nov 2023 17:20:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyBCCXNkml7//Jq8+SMQnK5DKpWB+c9i7u+CTdreYkrRUsU87iIOGRCYGYKmhOrD1fz3e5Zg==
X-Received: by 2002:a17:907:75c2:b0:a00:5a2:1270 with SMTP id
 jl2-20020a17090775c200b00a0005a21270mr1978732ejc.21.1700529647502; 
 Mon, 20 Nov 2023 17:20:47 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709066c8200b009e656ce2930sm4468816ejr.60.2023.11.20.17.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 17:20:46 -0800 (PST)
Message-ID: <0754e669-8b00-461c-b6fe-79c659bf59a3@redhat.com>
Date: Tue, 21 Nov 2023 02:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
 <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v3] driver: gpu: Fixing warning directly
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

On 11/13/23 20:13, Abhinav Singh wrote:
> This patch fixes a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.
> 
> We should not be directly dereferencing a rcu pointer. To get a normal
> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
> function unrcu_pointer(...). The non __rcu tagged pointer then can be
> dereferenced just like a normal pointer.
> 
> I tested with qemu with this command
> qemu-system-x86_64 \
> 	-m 2G \
> 	-smp 2 \
> 	-kernel bzImage \
> 	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
> 	-drive file=bullseye.img,format=raw \
> 	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
> 	-net nic,model=e1000 \
> 	-enable-kvm \
> 	-nographic \
> 	-pidfile vm.pid \
> 	2>&1 | tee vm.log
> with lockdep enabled.
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>

Applied, thanks!

There are a few more such occurrences. [1][2] Plan to fix them as well?

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nv10_fence.c#L35
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nv84_fence.c#L88

> ---
> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
>             also removed the rcu locking and unlocking function call.
> v2 -> v3 : Changed the description of the patch to match it with the actual
> 	   implementation.
> 
>   drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
> index 5b71a5a5cd85..cdbc75e3d1f6 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
> @@ -39,7 +39,7 @@ struct nv04_fence_priv {
>   static int
>   nv04_fence_emit(struct nouveau_fence *fence)
>   {
> -	struct nvif_push *push = fence->channel->chan.push;
> +	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>   	int ret = PUSH_WAIT(push, 2);
>   	if (ret == 0) {
>   		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);


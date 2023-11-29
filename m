Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F467FE457
	for <lists+nouveau@lfdr.de>; Thu, 30 Nov 2023 00:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBEA10E3EA;
	Wed, 29 Nov 2023 23:52:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7353710E3EA
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 23:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701301967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DMKF7ZGyx5GoQuAFp4AyN/BySHZDI7ZFOdXRc26u9o=;
 b=VIqUmKuyXbOicdjbwOY6o1VSdPqzvgcDkfFwShk8ojjAbSQlBCvtrhSdlXOX8oIUSg0Ehi
 tkMh2GCw6KPa6thxvNp7JPHI4ZoGxvV3i2lBGbCaOF56uJiPhVEwT/Qvg93Aoml0XdgOjB
 n4EtVHN8BmdVdzXZNZCLs5uemA900gE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-0sEFwdj5MM61Y22tsgtg3Q-1; Wed, 29 Nov 2023 18:52:45 -0500
X-MC-Unique: 0sEFwdj5MM61Y22tsgtg3Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-54af5527a17so116083a12.3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 15:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701301964; x=1701906764;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0DMKF7ZGyx5GoQuAFp4AyN/BySHZDI7ZFOdXRc26u9o=;
 b=ddr65LPGBrHTKWOdUF7s7yTi4mmqJFRVsqP4htLzc3HxiuxNOzUJiRcaqww7J7Ng5K
 HLVZ5TYqWTsDFpCz/H8WWVlVE20GVN4qx8WeplMyOB2ocbTTn4AXezkVIrTDxQ1qXcvY
 zFU0fERKBazrzzyeZuDnhbWoUYpQorf0Sfo/NuEbRenV5M3AFHjCzMoIoNJeDUrAswz/
 pFlxs8GqFOu+bgYdUub2oJFQO9imxRHte4SK/fe+u5tgeBxZCursKXjQQV5nnJMRcTeM
 4P/0twCnTF9TcGyaTl/ZfcKdwUgwia/TMs4UQ+7NVY9+sqd9kzGVG/bi24dRK3IZjqyo
 sRvA==
X-Gm-Message-State: AOJu0YyI4IBJq1zJPArjOVTmrRjbAUajreipDI2G3/tSz5SNGFx2Gg61
 Uxa+fxmwxcrDtbLP829YIydp5myRXutqe+p3w0bSKDJ43K/YfZ2fcZcnhAftb9Wf+O8qPLShf0n
 hFkB2VQ8yfJiyvS/YoU+c464klg==
X-Received: by 2002:a17:907:d407:b0:a02:ad84:3ab3 with SMTP id
 vi7-20020a170907d40700b00a02ad843ab3mr14530385ejc.44.1701301964731; 
 Wed, 29 Nov 2023 15:52:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Ukuv1GKWzasfo9LAPEUmsG843xaS5Q/R1hpoDiLL/MvrRWEV6+4Y1JuxN9p0wrwz093U2A==
X-Received: by 2002:a17:907:d407:b0:a02:ad84:3ab3 with SMTP id
 vi7-20020a170907d40700b00a02ad843ab3mr14530375ejc.44.1701301964478; 
 Wed, 29 Nov 2023 15:52:44 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 qc14-20020a170906d8ae00b009a9fbeb15f2sm15030ejb.62.2023.11.29.15.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 15:52:44 -0800 (PST)
Message-ID: <f5a69710-f1a6-444d-9d2a-7c07589a2bdc@redhat.com>
Date: Thu, 30 Nov 2023 00:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
References: <20231126145723.388162-1-singhabhinav9051571833@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231126145723.388162-1-singhabhinav9051571833@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] driver: gpu: Fix warning directly
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Abhinav,

Thanks for sending this follow-up patch.

On 11/26/23 15:57, Abhinav Singh wrote:
> Fix a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.
> 
> We should not be directly dereferencing a rcu pointer. To get a normal
> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
> function unrcu_pointer(...). The non __rcu tagged pointer then can be
> dereferenced just like a normal pointer.

Can you please add a brief explanation why unrcu_pointer() is fine here?

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

How is that relevant for this patch?

- Danilo

> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/nv10_fence.c | 2 +-
>   drivers/gpu/drm/nouveau/nv84_fence.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
> index c6a0db5b9e21..845b64c079ed 100644
> --- a/drivers/gpu/drm/nouveau/nv10_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv10_fence.c
> @@ -32,7 +32,7 @@
>   int
>   nv10_fence_emit(struct nouveau_fence *fence)
>   {
> -	struct nvif_push *push = fence->channel->chan.push;
> +	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>   	int ret = PUSH_WAIT(push, 2);
>   	if (ret == 0) {
>   		PUSH_MTHD(push, NV06E, SET_REFERENCE, fence->base.seqno);
> diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
> index 812b8c62eeba..d42e72e23dec 100644
> --- a/drivers/gpu/drm/nouveau/nv84_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv84_fence.c
> @@ -85,7 +85,7 @@ nv84_fence_chid(struct nouveau_channel *chan)
>   static int
>   nv84_fence_emit(struct nouveau_fence *fence)
>   {
> -	struct nouveau_channel *chan = fence->channel;
> +	struct nouveau_channel *chan = unrcu_pointer(fence->channel);
>   	struct nv84_fence_chan *fctx = chan->fence;
>   	u64 addr = fctx->vma->addr + nv84_fence_chid(chan) * 16;
>   


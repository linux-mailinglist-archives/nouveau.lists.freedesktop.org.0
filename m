Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75F7EA310
	for <lists+nouveau@lfdr.de>; Mon, 13 Nov 2023 19:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5A710E3E9;
	Mon, 13 Nov 2023 18:49:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E38110E3E9
 for <nouveau@lists.freedesktop.org>; Mon, 13 Nov 2023 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699901365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9Fat91VCfWswbfB4dQoar2RJWXbpc4KeUVKZoklMG4=;
 b=UTnm1QUR5rZRRZ3/+AIS0gDlleJ7KCgUVGQWKZF2kuLq0vJnjIeitJRybnU7xAQezDxCZ/
 fE0Wl/IFE0W6OY5145a5jf8Zbl3tqWIvM4BYH0t5KSa/XYVdo4HHJiRruJSciIduvS+UvH
 JSOlBgFfWwunXRLOtiqUVOGLNgsltWo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-5KXh9O0PM3WOoJnoaIj2aw-1; Mon, 13 Nov 2023 13:49:23 -0500
X-MC-Unique: 5KXh9O0PM3WOoJnoaIj2aw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9e5dd91b0ebso216528366b.1
 for <nouveau@lists.freedesktop.org>; Mon, 13 Nov 2023 10:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699901362; x=1700506162;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J9Fat91VCfWswbfB4dQoar2RJWXbpc4KeUVKZoklMG4=;
 b=ePRVIZ2aeoVYM49V4P8Y0D5Xs4VhkxSbA6ZKc+ojKcgLc6Z0nZZwIIRHyjnzV5iQKy
 wajZPBGRTsqOG0faJwtxRgSgitWjT+bRB5YLO/7tvd1Sv11ErJyTX+B9MqbrdCAfon7X
 QyK5JT/i6R2BVqprxE9i8rtdt99Zs4Cjum9McUlUPM7bL9FP+uYTsGQkyYwmsYPcG/aw
 fkrzuAn7zuOkQ5ChhVdHWrGTBmLt7q+vVC5QnT7elR8zBJmIedLSc0Zv16cc3PeZt+Jz
 6IraY5Wc+GjKiOBqx8Ol8WNzz8NwSnvyJ+JJpPrbW9qLVt64n5QxjmCE0p5opBUfiuBS
 RWRA==
X-Gm-Message-State: AOJu0YwMKM4hGib7lxfHuDJrslVQ3pSFWQN2XC4/o+O8vokG6wCsEdfn
 dtL6PfdPF1LqsJKJ2YziVfEuDI4VfWG4uNTzvRO5uVe4JRG2hOdHYNG0H3VUOcLwc45yRRCquah
 nM5VAEel7msVJMxio2KABxqrn8g==
X-Received: by 2002:a17:906:3bd7:b0:9dd:7ccf:77f8 with SMTP id
 v23-20020a1709063bd700b009dd7ccf77f8mr4957516ejf.20.1699901362785; 
 Mon, 13 Nov 2023 10:49:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQ0uVWVogauvgHwe0HaAW2uaROhlGctVUZQkTd5P1FixQh0Rbjuz2KkG7VPVhO+wwo/3DUDA==
X-Received: by 2002:a17:906:3bd7:b0:9dd:7ccf:77f8 with SMTP id
 v23-20020a1709063bd700b009dd7ccf77f8mr4957500ejf.20.1699901362466; 
 Mon, 13 Nov 2023 10:49:22 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a170906471800b009dda94509casm4368759ejq.102.2023.11.13.10.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:49:21 -0800 (PST)
Message-ID: <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
Date: Mon, 13 Nov 2023 19:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
 <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

thanks for sending a v2.

On 11/13/23 19:42, Abhinav Singh wrote:
> This patch fixes a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.

Better use imperative here, e.g. "Fix a sparse warning ...".

Wouldn't ask you to send a v3 for that alone...

> 
> We should not be directly dereferencing a rcu pointer, rather we should
> be using rcu helper function rcu_dereferece() inside rcu read critical
> section to get a normal pointer which can be dereferenced.

...but this doesn't seem accurate anymore as well.

- Danilo

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
> ---
> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
> also removed the rcu locking and unlocking function call.
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


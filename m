Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D54D74A069
	for <lists+nouveau@lfdr.de>; Thu,  6 Jul 2023 17:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5947610E432;
	Thu,  6 Jul 2023 15:06:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2206F10E0D3
 for <nouveau@lists.freedesktop.org>; Thu,  6 Jul 2023 15:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688655975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBrZyv4SeS88lfz2tuwTeytkys5cHxpW1/ocT+u64Kg=;
 b=ip22LYqrZVKz8eZEzCdQp2sDKjGnCzQBS4oHKcaPpXyKiFVHTMqXwhtOGP5VLwQUxorAWL
 I0HMc7ZRlsorSFHz/2iDrR1LzNHpMnrFVji6QRfVQOplM1/100MWTPPbyKrVgFj7cD79/e
 Z00+KZ4uKitYVU6Zj/hnz8GVltrOpNo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-9rn5wfs1Oy6j8LZv06QT7Q-1; Thu, 06 Jul 2023 11:06:12 -0400
X-MC-Unique: 9rn5wfs1Oy6j8LZv06QT7Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbdd5d09b8so5590285e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 06 Jul 2023 08:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688655971; x=1691247971;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aBrZyv4SeS88lfz2tuwTeytkys5cHxpW1/ocT+u64Kg=;
 b=QbqkD0z8kMHTiqtxwsL5dbzejnd0pR0ihVNgoXh1lPpAM42tBASVl3gM5ALXiggDCz
 /0dTAMtw606KwJu/TC7zEYSKdL8vtrxMXXiW8mRqwm2zr51cPN6/o8l2AKcwWMmmTayM
 h5QSxBPUvBU/FSQ2qj3IIHTtWiGd7p+2fhu5tPy305Z8VfTDg7nIci6chv0EQJve9Ez0
 +bWc6nIwdB0a1Lr4aEsX4tkwozncawcTQavsxt+C68WU1V6e2xKN75RFWLU/RHv48u55
 Wk9JoMB7glN2PgCtgE/oozJVJSOQLidwdP7sKenU4QkoMXqcmEy3YesOI6um1EvP3evX
 Ms0w==
X-Gm-Message-State: ABy/qLbiX2cgvM5g4KEZRE30fOk2QvSYd+WdOBXe2xr7iq+vzUkprmi5
 V9oyH6gun2+ZsU6LSPXOQm3rInGF3qCQWJI9e6Rm43sHphLr+bV2GmACF3RG/dxGyhuukZgWvHU
 HA9JV0mVjfo3sOAZ+g0fsemzbKw==
X-Received: by 2002:adf:e501:0:b0:314:2732:e81e with SMTP id
 j1-20020adfe501000000b003142732e81emr1731524wrm.8.1688655971510; 
 Thu, 06 Jul 2023 08:06:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFpJS9FsPB4MntXS4dsjBkf35pUwEqsFTMjaC/v0icaEvOb2xevK4a+6WRUIV6dmnzpGQHBBw==
X-Received: by 2002:adf:e501:0:b0:314:2732:e81e with SMTP id
 j1-20020adfe501000000b003142732e81emr1731496wrm.8.1688655971118; 
 Thu, 06 Jul 2023 08:06:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adfe586000000b003112f836d4esm2085203wrm.85.2023.07.06.08.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 08:06:10 -0700 (PDT)
Message-ID: <755b3aeb-8067-2fa5-5173-d889811e954a@redhat.com>
Date: Thu, 6 Jul 2023 17:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <20230630100252.7ff6421d@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230630100252.7ff6421d@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-next v6 02/13] drm: manager to keep track
 of GPUs VA mappings
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
Cc: matthew.brost@intel.com, willy@infradead.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, alexdeucher@gmail.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Boris,

On 6/30/23 10:02, Boris Brezillon wrote:
> Hi Danilo,
> 
> On Fri, 30 Jun 2023 00:25:18 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> + *	int driver_gpuva_remap(struct drm_gpuva_op *op, void *__ctx)
>> + *	{
>> + *		struct driver_context *ctx = __ctx;
>> + *
>> + *		drm_gpuva_remap(ctx->prev_va, ctx->next_va, &op->remap);
>> + *
>> + *		drm_gpuva_unlink(op->remap.unmap->va);
>> + *		kfree(op->remap.unmap->va);
>> + *
>> + *		if (op->remap.prev) {
>> + *			drm_gpuva_link(ctx->prev_va);
> 
> I ended up switching to dma_resv-based locking for the GEMs and I
> wonder what the locking is supposed to look like in the async-mapping
> case, where we insert/remove the VA nodes in the drm_sched::run_job()
> path.

If you decide to pick the interface where you just call 
drm_gpuva_sm_[un]map() and receive a callback for each operation it 
takes to fulfill the request, you probably do this because you want to 
do everything one shot, updating the VA space, link/unlink GPUVAs 
to/from its corresponding backing GEMs, do the actual GPU mappings.

This has a few advantages over generating a list of operations when the 
job is submitted. You've pointed out one of them, when you noticed that 
with a list of operations one can't sneak in a synchronous job between 
already queued up asynchronous jobs.

However, for the asynchronous path it has the limitation that the 
dma-resv lock can't be used to link/unlink GPUVAs to/from its 
corresponding backing GEMs, since this would happen in the fence 
signalling critical path and we're not allowed to hold the dma-resv lock 
there. Hence, as we discussed I added the option for drivers to provide 
an external lock for that, just to be able to keep some lockdep checks.

> 
> What I have right now is something like:
> 
> 	dma_resv_lock(vm->resv);
> 
> 	// split done in drm_gpuva_sm_map(), each iteration
> 	// of the loop is a call to the driver ->[re,un]map()
> 	// hook
> 	for_each_sub_op() {
> 		
> 		// Private BOs have their resv field pointing to the
> 		// VM resv and we take the VM resv lock before calling
> 		// drm_gpuva_sm_map()
> 		if (vm->resv != gem->resv)
> 			dma_resv_lock(gem->resv);
> 
> 		drm_gpuva_[un]link(va);
> 		gem_[un]pin(gem);
> 
> 		if (vm->resv != gem->resv)
> 			dma_resv_unlock(gem->resv);
> 	}
> 
> 	dma_resv_unlock(vm->resv);
> 

I'm not sure I get this code right, reading "for_each_sub_op()" and 
"drm_gpuva_sm_map()" looks a bit like things are mixed up?

Or do you mean to represent the sum of all callbacks with 
"for_each_sub_op()"? In this case I assume this code runs in 
drm_sched::run_job() and hence isn't allowed to take the dma-resv lock.

> In practice, I don't expect things to deadlock, because the VM resv is
> not supposed to be taken outside the VM context and the locking order
> is always the same (VM lock first, and then each shared BO
> taken/released independently), but I'm not super thrilled by this
> nested lock, and I'm wondering if we shouldn't have a pass collecting
> locks in a drm_exec context first, and then have
> the operations executed. IOW, something like that:
> 
> 	drm_exec_init(exec, DRM_EXEC_IGNORE_DUPLICATES)
> 	drm_exec_until_all_locked(exec) {
> 		// Dummy GEM is the dummy GEM object I use to make the VM
> 		// participate in the locking without having to teach
> 		// drm_exec how to deal with raw dma_resv objects.
> 		ret = drm_exec_lock_obj(exec, vm->dummy_gem);
> 		drm_exec_retry_on_contention(exec);
> 		if (ret)
> 			return ret;
> 
> 		// Could take the form of drm_gpuva_sm_[un]map_acquire_locks()
> 		// helpers
> 		for_each_sub_op() {
> 			ret = drm_exec_lock_obj(exec, gem);
> 			if (ret)
> 				return ret;
> 		}
> 	}
> 
> 	// each iteration of the loop is a call to the driver
> 	// ->[re,un]map() hook
> 	for_each_sub_op() {
> 		...
> 		gem_[un]pin_locked(gem);
> 		drm_gpuva_[un]link(va);
> 		...
> 	}
> 
> 	drm_exec_fini(exec);

I have a follow-up patch (still WIP) in the queue to generalize dma-resv 
handling, fence handling and GEM validation within the GPUVA manager as 
optional helper functions: 
https://gitlab.freedesktop.org/nouvelles/kernel/-/commit/a5fc29f3b1edbf3f96fb5a21b858ffe00a3f2584

This was suggested by Matt Brost.

- Danilo

> 
> Don't know if I got this right, or if I'm just confused again by how
> the drm_gpuva API is supposed to be used.
> 
> Regards,
> 
> Boris
> 
>> + *			ctx->prev_va = NULL;
>> + *		}
>> + *
>> + *		if (op->remap.next) {
>> + *			drm_gpuva_link(ctx->next_va);
>> + *			ctx->next_va = NULL;
>> + *		}
>> + *
>> + *		return 0;
>> + *	}
> 


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB57914E53
	for <lists+nouveau@lfdr.de>; Mon, 24 Jun 2024 15:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEB110E434;
	Mon, 24 Jun 2024 13:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FjswAf6h";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECF910E434
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jun 2024 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719235251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnTr8tfZk1oGUwAK63GyIrIBK4qZD9V6rFpdtZGWCRI=;
 b=FjswAf6hKYKJ7tJ2RsxCxIZqyEBk1imXkRIj/dLHJuDg96+RI0CN4U+i9acwLWiGu/gyeO
 989tPJlFzC3R7b3V0zQIW5BoL2IBwYF/lhF2N/Ic0Vll64jvFoRsypzy5ewd9YCK8z6cpz
 6Kt1T9yIwx6qrJarbsxVVw1zKPWqJRM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-sfBGMTNvMXyjmQcxzvZrmA-1; Mon, 24 Jun 2024 09:20:47 -0400
X-MC-Unique: sfBGMTNvMXyjmQcxzvZrmA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4246e5fd996so24249045e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jun 2024 06:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235245; x=1719840045;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hnTr8tfZk1oGUwAK63GyIrIBK4qZD9V6rFpdtZGWCRI=;
 b=CwnWQGOQ0biS3kGEgZbvI4tq3RQio0tAF3mwqV56afwB5i13oiucWTuiVlugStqFTw
 /6p8Uc3xtUIZ1okZxXI52oZv8mNe7dTdbCOUB3v2K6k+VGa2A0d9GO9jRZwNX4SPIHte
 cXcAMIzEI2ou8VBL33Cex1YDodeFeaIdh5Achumq+7MvRQEnMHQ40TSwIm2HdIwzaXV2
 8TiDv8PAKjcoX1aTOHkAr0ediR59IHI1H8jHuxckAKXqYcP+BXX3YVr+/SM9EfoPuvuT
 HKAAUDabDpavb9vzrB6qEgVy8ecbd0kIOW9F+e9Zhn2ng1r96SRlUwXEvq9onvqDiHKC
 TWgw==
X-Gm-Message-State: AOJu0YyGnIF+8K8A/T+LMR1PGvSenoTB8hN/vl9VVtkbrMBj4sugWBhB
 IACQVq9TaBYEy55oX7Ca0D6p+mpEFPcnMQIZi3q7HMiisopzKqTfxfqKCaja20TJMXLetTvemNn
 GVp2kR2iDcOAQZxL/7g/AP1M1XgHvud0XEe+GEvtk/j6YBdiNwZyZ05w0S2g5UIA=
X-Received: by 2002:a05:600c:6ca:b0:424:8dc4:ee43 with SMTP id
 5b1f17b1804b1-4248dc4ef8cmr36057735e9.6.1719235245645; 
 Mon, 24 Jun 2024 06:20:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEvwc475B/g9z7KXZWYs9el2gccH3wB9CI8DaUprjE1R6KILq1++Lr/tql303dHh73GAszHw==
X-Received: by 2002:a05:600c:6ca:b0:424:8dc4:ee43 with SMTP id
 5b1f17b1804b1-4248dc4ef8cmr36057535e9.6.1719235245215; 
 Mon, 24 Jun 2024 06:20:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3664178f5f7sm9942107f8f.19.2024.06.24.06.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:20:44 -0700 (PDT)
Message-ID: <9393dcb6-569c-4577-bdb4-95eb3772ab9f@redhat.com>
Date: Mon, 24 Jun 2024 15:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] [v5] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>
References: <20240612235253.1624004-1-ttabi@nvidia.com>
 <20240612235253.1624004-2-ttabi@nvidia.com> <ZnCUb-lWCVlV5x0v@cassiopeiae>
 <dff9b893cd9499ac41b7835ae5489eb44435f616.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <dff9b893cd9499ac41b7835ae5489eb44435f616.camel@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/18/24 23:02, Timur Tabi wrote:

Please stick to plain text for future replies.

> On Mon, 2024-06-17 at 21:54 +0200, Danilo Krummrich wrote:

<snip>

>>> +#ifdef CONFIG_DEBUG_FS
>>> +/**
>>> + * gsp_logs - list of nvif_log GSP-RM logging buffers
>>> + *
>>> + * Head pointer to a a list of nvif_log buffers that is created for each GPU
>>> + * upon GSP shutdown if the "keep_gsp_logging" command-line parameter is
>>> + * specified.  This is used to track the alternative debugfs entries for the
>>> + * GSP-RM logs.
>>> + */
>>> +extern struct list_head gsp_logs;
>>
>> Better wrap this in a struct nvif_logs (or similar) and pass this down through
>> nvkm_device_pci_new() / nvkm_device_tegra_new() instead of relying on sharing
>> a global.
> 
> I'm still having difficulty understanding what you mean by this.  I think you need to be more explicit in what you want.

The idea was to not rely on a "public" global variable, but somehow pass it down
through the callchain to the point where it's actually needed - r535_gsp_retain_logging().

We could use nvkm_device_pci_new() -> nvkm_device_ctor() and then store it in
struct nvkm_device.

But now that I think about it more, it doesn't seem ideal either. It's probably fine to keep
the global access.

> 
> struct nvif_logs
> {
> struct list_head logs;
> } gsp_logs;
> 
> First, I don't understand what this gets me.  It just wraps one struct inside another.

Technically, nothing. But it gives a bit more context on what this (otherwise) random
struct list_head is for.

> 
> Should I add this to struct nvkm_device_func?  And then do something like this in pci.c:
> 
> static struct nvif_logs gsp_logs;
> 
> static const struct nvkm_device_func
> nvkm_device_pci_func = {
> 
> ...
> .nvif_logs = &gsp_logs,
> };
> 
> So nvkm_device_pci_new() calls nvkm_device_ctor(). nvkm_device_ctor() then calls the .ctor() for every subdevice via NVKM_LAYOUT_ONCE() and NVKM_LAYOUT_INST().  This is where I get lost, because I don't see how I make sure only the GSP constructor tries to initialize gsp_logs.
> 

As mentioned above, it's I agree it's probably fine to keep the global access.

>>>
>>> +#ifdef CONFIG_DEBUG_FS
>>> +/**
>>> + * gsp_logs - list of GSP debugfs logging buffers
>>> + */
>>> +LIST_HEAD(gsp_logs);
>>
>> Better wrap this in a NVIF_LOGS_DECLARE() macro.
> 
> Like this?
> 
> #define NVIF_LOGS_DECLARE(x) LIST_HEAD(x)
> 
> Do you want a macro to replace this as well?
> 
> extern struct list_head gsp_logs;

I thought of something like

#define NVIF_LOGS_DECLARE(name) \
	struct nvif_logs name = { LIST_HEAD_INIT(name.head) }

> 
>>
>>> +#endif
>>> +
>>>   static u64
>>>   nouveau_pci_name(struct pci_dev *pdev)
>>>   {
>>> @@ -1446,6 +1454,17 @@ nouveau_drm_exit(void)
>>>   #endif
>>>   	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
>>>   		mmu_notifier_synchronize();
>>> +
>>> +#ifdef CONFIG_DEBUG_FS
>>> +	if (!list_empty(&gsp_logs)) {
>>> +		struct nvif_log *log, *n;
>>> +
>>> +		list_for_each_entry_safe(log, n, &gsp_logs, head) {
>>> +			/* shutdown() should also delete the log entry */
>>> +			log->shutdown(log);
>>> +		}
>>> +	}
>>> +#endif
>>
>> Please move this to include/nvif/log.h as nvif_log_shutdown().
> 
> Sure, but I don't understand why.  This code will only be called in nouveau_drm_exit().

I just want to encapsulate this in a clean interface, rather than have it open coded.

> 
>>> +/**
>>> + * r535_gsp_msg_libos_print - capture log message from the PMU
>>> + * @priv: gsp pointer
>>> + * @fn: function number (ignored)
>>> + * @repv: pointer to libos print RPC
>>> + * @repc: message size
>>> + *
>>> + * See _kgspRpcUcodeLibosPrint
>>
>> What is this reference?
> 
> It's in OpenRM.  Pretty much all of the "See" commands are references to the corresponding function in OpenRM".

I don't see that this provides a lot of value. _kgspRpcUcodeLibosPrint() is undocumented.

And even if it would be documented, we'd need this to be a full and stable reference, i.e.
provide a link, version, etc.

Until we get some documentation of the GSP firmware interface we can link to, I think it's
best to put a brief description of what is important in nouveau directly.

> 
>>
>>> + */
>>> +static int r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
>>> +{
>>> +	struct nvkm_gsp *gsp = priv;
>>> +	struct nvkm_subdev *subdev = &gsp->subdev;
>>> +	struct {
>>> +		u32 ucodeEngDesc;
>>> +		u32 libosPrintBufSize;
>>> +		u8 libosPrintBuf[];
>>
>> Why are those camelCase? Please use snake_case instead.
> 
> Sure.  They match the names from OpenRM (see g_rpc-structures.h).  I'll change them, though.  When I copy a struct directly from OpenRM, I prefer to keep it as identical as possible to make it easier to see the connection.

If it's part of the actual imported firmware header files that's fine. Otherwise we don't
align the style of upstream drivers to OOT modules.

<snip>

>>> +
>>> +/**
>>> + * is_empty - return true if the logging buffer was never written to
>>> + * @b: blob wrapper with ->data field pointing to logging buffer
>>> + *
>>> + * The first 64-bit field of loginit, and logintr, and logrm is the 'put'
>>> + * pointer, and it is initialized to 0.  If the pointer is still 0 when
>>
>> Double space.
> 
> Uh, are you only now noticing that I always put two spaces after a "."?  I do that everywhere.

I remember I previously noticed it, not sure I actually pointed it out though.

Please remove them, I think it's better to stick with what the rest of the kernel
does for consistency reasons.

> 
>> Also, what would 'put' point to in case it's non-zero? Is it a
>> pointer actually, or is it just some kind of counter?
> 
> It's called the "put pointer" internally, but it's actually a dword-based index into the buffer.  So a value of 1 is an iffset of 4, a value of 2 is an offset of 8, etc.
> 
> I'll update the docs.
> 
>>
>>> + * GSP-RM is shut down, that means that it was never written do, so it
>>
>> "written to"
> 
> Fixed, thanks.
> 
>>
>>>   void
>>>   r535_gsp_dtor(struct nvkm_gsp *gsp)
>>>   {
>>> @@ -2514,6 +2864,14 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>>>   	nvkm_gsp_mem_dtor(&gsp->rmargs);
>>>   	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
>>>   	nvkm_gsp_mem_dtor(&gsp->shm.mem);
>>> +
>>> +#ifdef CONFIG_DEBUG_FS
>>> +	r535_gsp_retain_logging(gsp);
>>> +
>>> +	kfree(gsp->blob_pmu.data);
>>> +	gsp->blob_pmu.data = NULL;
>>
>> Please move this to r535_gsp_libos_debugfs_fini() to make it a bit more obvious
>> why this needs to be cleaned up here.
> 
> So first, I made a mistake, and the #ifdef is only supposed to be around the call to r535_gsp_retain_logging().
> 
> Second, are you saying you want this?
> 
> /**
>   * r535_gsp_libos_debugfs_fini - retrain debugfs buffers if necessary
>   *
>   * bla bla some text about why we're doing this
>   */
> static void r535_gsp_libos_debugfs_fini(struct nvkm_gsp __maybe_unused *gsp)
> {
> #ifdef CONFIG_DEBUG_FS
> r535_gsp_retain_logging(gsp);
> #endif
> }

Yes, but please also put the 'gsp->blob_pmu' cleanup inside of this function.

> 
> 


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1C79714E
	for <lists+nouveau@lfdr.de>; Thu,  7 Sep 2023 11:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C3E10E79E;
	Thu,  7 Sep 2023 09:41:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057A010E602
 for <nouveau@lists.freedesktop.org>; Thu,  7 Sep 2023 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694079676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVgj5u+n4ytdhz89LH1dh0Jm4Qa5YH8eL53V/NQmF08=;
 b=CjI2yUMHIwHOGG1kU+9dWFrq71e1Ezzp/XGnVWOIoOVt0g+QfkgWr6n3UwU71UL34C7hOW
 XLfsmdCBjDkaM4ANu/a6YNwU0xlrwjnHm9QB1nnErUovSB6Xjkko4CdZyI2A/QOssWL+1L
 lpuhd3n14uVoFcjO/40J11XRfirA8mc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-Dd1z_QbSOPK5q54cGbct4Q-1; Thu, 07 Sep 2023 05:41:14 -0400
X-MC-Unique: Dd1z_QbSOPK5q54cGbct4Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-51a5296eb8eso501841a12.2
 for <nouveau@lists.freedesktop.org>; Thu, 07 Sep 2023 02:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694079674; x=1694684474;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EVgj5u+n4ytdhz89LH1dh0Jm4Qa5YH8eL53V/NQmF08=;
 b=ZL87BcYJeO5sUEH4k687otKjmcqmzgH1/78F01NPDviZAtf1YsZaBWihxQB+1j5p9t
 Vsm0YQ/sGvchvc2dGeopge529zElmAi4JorXzw25VcIXqzt0JeuyagjE+6ncI2hfC2JX
 XjVU3/4Q0UBEjUJacSRXZ1p0mb/Hk662NAPLAJVihQdz93C8HqWbIvF0p8rMOAc9Er5H
 FRTj11xpNu73f4uJ/YvRMi6WIEEQoAj36uV9edFINIJ7R5w2zAf7R1JG7uNqysXa5Vhh
 r/fBIZiIJBfJys/1OiDAoplLm0PCWIFfIyldpEfS3UhhPDy2m9JB5UzI9Um7JnMStFsn
 +9bA==
X-Gm-Message-State: AOJu0Yx/mxjgEG63nJxT1o0ZNiebeRbewMjrtbYJw1Y30537jcRwY5e+
 O/d/fuMZjplN/7PMnymBahA+EG+nmj2bxkXytHDkOF+r4Ho1/gJfD78lKktnvyIVGK4TFI9srt+
 cqj3fWJ+E2802n+41MO2OU+FM6g==
X-Received: by 2002:a17:907:1dee:b0:9a1:f21e:cdfd with SMTP id
 og46-20020a1709071dee00b009a1f21ecdfdmr4269857ejc.34.1694079673854; 
 Thu, 07 Sep 2023 02:41:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4QX1xQ5c7FSGik6QJJx3KU6K2gTDdOyyCDY1ZR2k6aTunzdJhBvyM89miqz+SlE9Gm8xV4g==
X-Received: by 2002:a17:907:1dee:b0:9a1:f21e:cdfd with SMTP id
 og46-20020a1709071dee00b009a1f21ecdfdmr4269824ejc.34.1694079673501; 
 Thu, 07 Sep 2023 02:41:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a170906365600b009a5f1d1564dsm10059659ejb.126.2023.09.07.02.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 02:41:13 -0700 (PDT)
Message-ID: <b3a322f0-9b0b-0ad8-be5d-e081f4061f13@redhat.com>
Date: Thu, 7 Sep 2023 11:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230906214723.4393-1-dakr@redhat.com>
 <20230906214723.4393-6-dakr@redhat.com>
 <20230907104252.4e15acb9@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230907104252.4e15acb9@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v2 5/7] drm/gpuvm: add an
 abstraction for a VM / BO combination
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, daniel@ffwll.ch, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/7/23 10:42, Boris Brezillon wrote:
> On Wed,  6 Sep 2023 23:47:13 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> +void drm_gpuvm_bo_destroy(struct kref *kref);
> 
> I usually keep kref's release functions private so people are not
> tempted to use them.

I think I did that because drm_gpuvm_bo_put() needs it.

> 
>> +
>> +/**
>> + * drm_gpuvm_bo_get() - acquire a struct drm_gpuvm_bo reference
>> + * @vm_bo: the &drm_gpuvm_bo to acquire the reference of
>> + *
>> + * This function acquires an additional reference to @vm_bo. It is illegal to
>> + * call this without already holding a reference. No locks required.
>> + */
>> +static inline struct drm_gpuvm_bo *
>> +drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
>> +{
>> +	kref_get(&vm_bo->kref);
>> +	return vm_bo;
>> +}
>> +
>> +/**
>> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm_bo reference
>> + * @vm_bo: the &drm_gpuvm_bo to release the reference of
>> + *
>> + * This releases a reference to @vm_bo.
>> + */
>> +static inline void
>> +drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
>> +{
>> +	kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
> 
> nit: can we have
> 
> 	if (vm_bo)
> 		kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
> 
> so we don't have to bother testing the vm_bo value in the error/cleanup
> paths?
> 
>> +}
>> +
> 


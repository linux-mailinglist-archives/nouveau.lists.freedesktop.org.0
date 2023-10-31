Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D717DD240
	for <lists+nouveau@lfdr.de>; Tue, 31 Oct 2023 17:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B5910E133;
	Tue, 31 Oct 2023 16:39:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DA110E500
 for <nouveau@lists.freedesktop.org>; Tue, 31 Oct 2023 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698770378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJqCZxrLTKcwcLAE87Zs5L0NcoxMkUhMyUSeCCjP4ho=;
 b=e8RJvwWETCmvqMLYFNueCelFvSZH1lRK3Wg9IdyI8grJR2A1WZvHROsf67Q07A2Q24JbA+
 WVBPZVJUajhXWcVcgegMx7dGGYkN/WhR0CpQTG9rqPMuRCNi98HttIT2/d719i5IYSBZlF
 oNWxMnNpFFRsdhp7MRGst7hYQMs2ERY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-mmik-HKaO6aJgOBwzzWYbA-1; Tue, 31 Oct 2023 12:39:37 -0400
X-MC-Unique: mmik-HKaO6aJgOBwzzWYbA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9c6a4a60033so396927366b.1
 for <nouveau@lists.freedesktop.org>; Tue, 31 Oct 2023 09:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698770375; x=1699375175;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJqCZxrLTKcwcLAE87Zs5L0NcoxMkUhMyUSeCCjP4ho=;
 b=sYpu/c0HwKf3NtRzA5EAuQA3yl00aQ1FXx+JRHzyUZMvnfFqjCxonEY3GsY9fI9reh
 6VUSobNWqgJYzwE/qUaz4IwcxY1thZNtdjrLCwn1cFtYnL+V/dwHF8Y3tjet3lD0GMu0
 HchmXqCVnWNHWbqRFgHUG0eA4W/O3ZGjrCeaZLNhCPZQkAFdTyNjkl1JzMSPrxW2PXkz
 1kMKLkJUp/1mtPA4dHr+oLhW1IL9VONuRh3ZRFHihiwMMb4q0CZpReU7hkO37mAxZ85K
 8UqOUswC1DoWiVeswNg+afZdXAUgZtJnJfAyPUk0fvZDhd/Ba0EiWCrUhTo2//8q9bAq
 C02Q==
X-Gm-Message-State: AOJu0YyH1pxOz6dXxHblFSEMwoOcyCwQn/3sYfDdHdoqSTb7LqUmzQb8
 +Ag/lTbAz66Dn2lJir5xKLvT5WM8aZpCrAKwljhAvTY2TMVhcVRcSGygGeqa/u71HrLTCAfkXye
 q20B9SrdyO4WvmRXvms+J26xsQ5EtL4kjJg==
X-Received: by 2002:a17:906:fd8b:b0:9bf:30e8:5bfd with SMTP id
 xa11-20020a170906fd8b00b009bf30e85bfdmr11756714ejb.48.1698770375522; 
 Tue, 31 Oct 2023 09:39:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuyO5pLCHn8pJ83CSPTWoms/T8gldqXUtB/D0/4Zzvxqi9jtHduxrXbKLdaxRhtjX8nVkSdQ==
X-Received: by 2002:a17:906:fd8b:b0:9bf:30e8:5bfd with SMTP id
 xa11-20020a170906fd8b00b009bf30e85bfdmr11756697ejb.48.1698770375172; 
 Tue, 31 Oct 2023 09:39:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a170906bc5900b009b9977867fbsm1230584ejv.109.2023.10.31.09.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 09:39:34 -0700 (PDT)
Message-ID: <980754a3-7f5a-465e-88a9-62a40c82cae8@redhat.com>
Date: Tue, 31 Oct 2023 17:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <4a51c1cd9e2435332e033f9426bac8fae1c21c60.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <4a51c1cd9e2435332e033f9426bac8fae1c21c60.camel@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/31/23 12:25, Thomas Hellström wrote:
> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>> Add an abstraction layer between the drm_gpuva mappings of a
>> particular
>> drm_gem_object and this GEM object itself. The abstraction represents
>> a
>> combination of a drm_gem_object and drm_gpuvm. The drm_gem_object
>> holds
>> a list of drm_gpuvm_bo structures (the structure representing this
>> abstraction), while each drm_gpuvm_bo contains list of mappings of
>> this
>> GEM object.
>>
>> This has multiple advantages:
>>
>> 1) We can use the drm_gpuvm_bo structure to attach it to various
>> lists
>>     of the drm_gpuvm. This is useful for tracking external and evicted
>>     objects per VM, which is introduced in subsequent patches.
>>
>> 2) Finding mappings of a certain drm_gem_object mapped in a certain
>>     drm_gpuvm becomes much cheaper.
>>
>> 3) Drivers can derive and extend the structure to easily represent
>>     driver specific states of a BO for a certain GPUVM.
>>
>> The idea of this abstraction was taken from amdgpu, hence the credit
>> for
>> this idea goes to the developers of amdgpu.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 335 +++++++++++++++++++++--
>> --
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  64 +++--
>>   include/drm/drm_gem.h                  |  32 +--
>>   include/drm/drm_gpuvm.h                | 188 +++++++++++++-
>>   4 files changed, 533 insertions(+), 86 deletions(-)
> 
> That checkpatch.pl error still remains as well.

I guess you refer to:

ERROR: do not use assignment in if condition
#633: FILE: drivers/gpu/drm/nouveau/nouveau_uvmm.c:1165:
+                       if (!(op->gem.obj = obj))

This was an intentional decision, since in this specific case it seems to
be more readable than the alternatives.

However, if we consider this to be a hard rule, which we never ever break,
I'm fine changing it too.

> 
> Thanks,
> Thomas
> 


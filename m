Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BC679710D
	for <lists+nouveau@lfdr.de>; Thu,  7 Sep 2023 10:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3521A10E788;
	Thu,  7 Sep 2023 08:54:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB66D10E79E
 for <nouveau@lists.freedesktop.org>; Thu,  7 Sep 2023 08:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694076860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56TqKCcZL60A+Wc7kJAS/gDpfEBf+hRJ5ysg2ApH3tE=;
 b=F0GoGWwO/mQ2vrg3Jmzh4mV1Hqgi1a5iuO8U8PTzzP8zUnygnnCyy9Fl+ZzTdnC+hpctyg
 qCKZ8no0kavdzCUb0Rhyx90CnOPP27CKXdwaRJl54GGdv5LGiaY1fAYkcBybelB1z43fd7
 /nyJXvWB3BUG9E0BsnIuoX6fyUTM/v8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-eBz2ZG1OMAWzJxdDibAmoA-1; Thu, 07 Sep 2023 04:54:19 -0400
X-MC-Unique: eBz2ZG1OMAWzJxdDibAmoA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99bcb13d8ddso43664366b.0
 for <nouveau@lists.freedesktop.org>; Thu, 07 Sep 2023 01:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694076858; x=1694681658;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56TqKCcZL60A+Wc7kJAS/gDpfEBf+hRJ5ysg2ApH3tE=;
 b=hbGjR7eL3i5/xLhSWWad+cDI8KCeAs6/KnngJC4RNwQ+TFDIi/1/UpHs7c5u1dDX7G
 VjjATl8cO5nYa4r1mwYOMEfeRvPFe/k9wUohjy0XeAbG7RkM6XfP9DynwqomLHqvXBKi
 8gzd8qzUBS79vWX/8Bd/WF620KO8hSzUcK0RWwtTO45QCQ+5hOsyuRiLtaIq6TMJEn5P
 +GP43HpPFeaQIQ7fQ8a0Und/jq631hw76LxSMwMQfGfhDvHJqIF10ELkTy0Ar46FAqHm
 j9X8N42sI6XlPgRlkFdH5wPmxh21J+mqY7tZeVA/OrLvJsZ3H/RwVx88bASFUZQpVEOb
 +AKQ==
X-Gm-Message-State: AOJu0YwxYIjbvs9+lBIIkhorz9KSPEOCz8DjaeQkOeo02bsTSv8QmCwS
 RwIL+fSVTiBCvg7RJ/lM37gU4SieedLyVi+J/1xRavh2JFUo7yUm7V9Wlp27VsW04VxfW4K+2rm
 9SFQozu4Gd6KaxMZJ0O5xx326QA==
X-Received: by 2002:a17:906:3014:b0:9a1:e231:67e5 with SMTP id
 20-20020a170906301400b009a1e23167e5mr4093425ejz.39.1694076858813; 
 Thu, 07 Sep 2023 01:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkjF/oeSxCuBoHl+DyVfde/AyF2LYClR/AcdAAKcsH7MTToGTtYqE/ni8+s35VoLBdgb9ozQ==
X-Received: by 2002:a17:906:3014:b0:9a1:e231:67e5 with SMTP id
 20-20020a170906301400b009a1e23167e5mr4093414ejz.39.1694076858449; 
 Thu, 07 Sep 2023 01:54:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a170906941300b0099bcb44493fsm10266693ejx.147.2023.09.07.01.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 01:54:18 -0700 (PDT)
Message-ID: <149184db-8003-d1d4-4ae0-1401ff1b3359@redhat.com>
Date: Thu, 7 Sep 2023 10:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230906214723.4393-1-dakr@redhat.com>
 <20230906214723.4393-3-dakr@redhat.com>
 <20230907095649.13dbd49c@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230907095649.13dbd49c@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v2 2/7] drm/gpuvm: rename struct
 drm_gpuva_manager to struct drm_gpuvm
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
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/7/23 09:56, Boris Brezillon wrote:
> On Wed,  6 Sep 2023 23:47:10 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> Rename struct drm_gpuva_manager to struct drm_gpuvm including
>> corresponding functions. This way the GPUVA manager's structures align
>> very well with the documentation of VM_BIND [1] and VM_BIND locking [2].
>>
>> It also provides a better foundation for the naming of data structures
>> and functions introduced for implementing a common dma-resv per GPU-VM
>> including tracking of external and evicted objects in subsequent
>> patches.
> 
> I'm fine with this rename, but I feel like some bits are missing in
> this patch. I see a few functions taking a drm_gpuvm object and still
> being prefixed with drm_gpuva_ (I'm not talking about functions that
> only manipulate a drm_gpuva object, but those updating the the VM state,
> like the sm_map/unmap helpers), and I think it'd be preferable to
> rename the source files and the Kconfig option too.
> 

I was a bit hesitant to also rename the source files in the first place,
but I think that makes sense.


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B8736E21
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 15:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDA710E2E1;
	Tue, 20 Jun 2023 13:59:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AF410E2E4
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jun 2023 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687269549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTLnyrCbOY1xAfP5SqHK9oZhSTIFzQoN+FT5nbHO/xo=;
 b=O1Ci1He5Pqida7gpPZxPF3LEn2855ZrfPzD8zlsGYkAg6peMgzLrlcATGn1G/HLFDVRfNM
 Zasx1sj4tuo1TpaYj8iG3GS0oNizqsSDzLjKJPtwcWehCHOUq9hRCmgN30+w8CpXxtjcIJ
 SCkbmR6lm+HRTxkpnmKjipHZfBmQQnk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-EJNJWMiIOD6zCx_eNbNkPw-1; Tue, 20 Jun 2023 09:59:05 -0400
X-MC-Unique: EJNJWMiIOD6zCx_eNbNkPw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-514a6909c35so3104319a12.3
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jun 2023 06:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687269544; x=1689861544;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QTLnyrCbOY1xAfP5SqHK9oZhSTIFzQoN+FT5nbHO/xo=;
 b=Wq/KrODflA/D6LLHJzyuz0LtyqHoG53cpLI6R9RH/qjyV7tU6O0mhVaAlgcB6pobAc
 vkRi/1e/0Lgm7O52vGo67FoJMBn7+vzveT3BxafaXne3D1TFEYgVYZUWpFMdtFkhM3YK
 LHeoXcjAkZUGQs6weFoS9FBjD6t0htvK+Lo7sP/7Ar1KLWyP5zEcOtRyV9ZGQrbBmHtU
 I2q6GwX6Ve8Wx6nWCKI9lkbL/oHzOQzZHUqfDLeN+S5dw/sBaqkbE5Y5C353zQx1a6LF
 mabmjGuAA8DcjqZ7gLWCbbaQ6tzEFwSPI0COFP2nOcvc/xebIyFoVkNMY0lugoosgLIs
 a2GQ==
X-Gm-Message-State: AC+VfDz4cua7lT912gpc3B6sFxFOjtD3sxCoE+nf5oyLTEfp8P9avQYJ
 lf9VW8W3/Ij6svRN22mUD5B5+f9n/+NpHAQOOZYjxBFSC44+MbkSFxH4lg8/8Z+2VzeSiKDrdwt
 fc47UQd9CQipe2Inf/8ylv0mqww==
X-Received: by 2002:aa7:d888:0:b0:51a:23fb:355c with SMTP id
 u8-20020aa7d888000000b0051a23fb355cmr8076347edq.10.1687269543787; 
 Tue, 20 Jun 2023 06:59:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6b5AT6QAAjfNGSFqHnSqiPb5mv+npztwci67WB0CYLQf6lJNAROx+U2HhYdxy7fYnS0gvCQg==
X-Received: by 2002:aa7:d888:0:b0:51a:23fb:355c with SMTP id
 u8-20020aa7d888000000b0051a23fb355cmr8076320edq.10.1687269543440; 
 Tue, 20 Jun 2023 06:59:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x22-20020aa7dad6000000b0050d83a39e6fsm1278687eds.4.2023.06.20.06.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 06:59:02 -0700 (PDT)
Message-ID: <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
Date: Tue, 20 Jun 2023 14:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, bskeggs@redhat.com, Liam.Howlett@oracle.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-next v5 03/14] drm: manager to keep track
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Donald Robson <donald.robson@imgtec.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Christian,

On 6/20/23 08:45, Christian König wrote:
> Hi Danilo,
> 
> sorry for the delayed reply. I've trying to dig myself out of a hole at 
> the moment.

No worries, thank you for taking a look anyway!

> 
> Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
>> [SNIP]
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index bbc721870c13..5ec8148a30ee 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -36,6 +36,8 @@
>>   #include <linux/kref.h>
>>   #include <linux/dma-resv.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>>   #include <drm/drm_vma_manager.h>
>> @@ -379,6 +381,18 @@ struct drm_gem_object {
>>        */
>>       struct dma_resv _resv;
>> +    /**
>> +     * @gpuva:
>> +     *
>> +     * Provides the list of GPU VAs attached to this GEM object.
>> +     *
>> +     * Drivers should lock list accesses with the GEMs &dma_resv lock
>> +     * (&drm_gem_object.resv).
>> +     */
>> +    struct {
>> +        struct list_head list;
>> +    } gpuva;
>> +
>>       /**
>>        * @funcs:
>>        *
> 
> I'm pretty sure that it's not a good idea to attach this directly to the 
> GEM object.

Why do you think so? IMHO having a common way to connect mappings to 
their backing buffers is a good thing, since every driver needs this 
connection anyway.

E.g. when a BO gets evicted, drivers can just iterate the list of 
mappings and, as the circumstances require, invalidate the corresponding 
mappings or to unmap all existing mappings of a given buffer.

What would be the advantage to let every driver implement a driver 
specific way of keeping this connection? Do you see cases where this 
kind of connection between mappings and backing buffers wouldn't be good 
enough? If so, which cases do you have in mind? Maybe we can cover them 
in a common way as well?

> 
> As you wrote in the commit message it's highly driver specific what to 
> map and where to map it.

In the end the common case should be that in a VA space at least every 
mapping being backed by a BO is represented by a struct drm_gpuva.

> 
> Instead I suggest to have a separate structure for mappings in a VA 
> space which driver can then add to their GEM objects or whatever they 
> want to map into their VMs.

Which kind of separate structure for mappings? Another one analogous to 
struct drm_gpuva?

- Danilo

> 
> Regards,
> Christian.
> 
> 


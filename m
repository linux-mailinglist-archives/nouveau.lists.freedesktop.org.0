Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEB74B10C
	for <lists+nouveau@lfdr.de>; Fri,  7 Jul 2023 14:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE3510E579;
	Fri,  7 Jul 2023 12:41:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF80410E579
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jul 2023 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688733689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Pvx8BnPDazf3dvRsddP57JfF7wRhoQ8lQ+cKlGDP24=;
 b=IGFrpt9Jqem6+YGSFrTmjGy6KcSbzT0eshpXJQRPEeGGi55T9/YIC3WB88SPQaNOGl1fCL
 L6iayasKRuwW1+6yBYuDvC2LlJ2CMyZWOG6pW+VZS9IWb0KpzTEbZSnekbJT+2Q/Ukx6oj
 hNL7l6/k0Q9zkkyOyIOeXIz40bGECig=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-0yhyyRQROKioL_gfuU77pQ-1; Fri, 07 Jul 2023 08:41:26 -0400
X-MC-Unique: 0yhyyRQROKioL_gfuU77pQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-993d631393fso29258166b.0
 for <nouveau@lists.freedesktop.org>; Fri, 07 Jul 2023 05:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688733685; x=1691325685;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Pvx8BnPDazf3dvRsddP57JfF7wRhoQ8lQ+cKlGDP24=;
 b=YBOPABrOLqVxPgsGSSCHmcud1tJomHd+qVOAzURZ0e2n9j9+8USieRXCREYVK3FgAW
 xp9Yy7SQCkRCaJxi1QSbBgsz8v1n0XPfd3fOQudsLCP7q8sHuDc9wqX6izm/28bbcY6g
 B4ZFyTt1aphhQFsBTyQ1YJYqtMkWAz2yopOz+R7HRW/RJz5RnFW16xhvetyle6O2zSNn
 SJ43xc08vfVMVabwX12Myvw6LC/NgVF+H4YxSXce95aB/GMnVQZZzWPtd5gewTu7okY1
 vNdYQVJhN3eTaXg1IbpUADZFQA1rVhiCBh8GLQqE4D8Kg3k6xz6KcymcZRoyS9JiD6/C
 ZsVw==
X-Gm-Message-State: ABy/qLaXd8/ueLodPb+8zeWFK6aq3WONp87jrcOSmB7E/4GdZ4UROYW3
 /E+diN7KH/5HCLJkbrskCGPyvwj6YwD9ZjFiaQFwXeNuhveCUzkkkPiHJxwrGNfcOciZtyrXY/2
 mCApJyxczRpRq8T1lFOrfht1oqA==
X-Received: by 2002:a17:906:7a0f:b0:974:1c98:d2d9 with SMTP id
 d15-20020a1709067a0f00b009741c98d2d9mr4407023ejo.3.1688733685810; 
 Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjteGIi3KT97fwOWlMdZkLiUsbSPeH2eror+aBLBU9/BQlYnfXmM4DYbHJ8zXHqJFnCi0/Wg==
X-Received: by 2002:a17:906:7a0f:b0:974:1c98:d2d9 with SMTP id
 d15-20020a1709067a0f00b009741c98d2d9mr4406995ejo.3.1688733685531; 
 Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 qh27-20020a170906ecbb00b0098733a40bb7sm2148920ejb.155.2023.07.07.05.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
Message-ID: <e92219d7-77f7-a40a-39d9-ea7afc5f3687@redhat.com>
Date: Fri, 7 Jul 2023 14:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <20230707130010.1bd5d41b@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230707130010.1bd5d41b@collabora.com>
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

On 7/7/23 13:00, Boris Brezillon wrote:
> On Fri, 30 Jun 2023 00:25:18 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> +/**
>> + * drm_gpuva_for_each_va_range - iternator to walk over a range of &drm_gpuvas
>> + * @va__: &drm_gpuva structure to assign to in each iteration step
>> + * @mgr__: &drm_gpuva_manager to walk over
>> + * @start__: starting offset, the first gpuva will overlap this
>> + * @end__: ending offset, the last gpuva will start before this (but may
>> + * overlap)
>> + *
>> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
>> + * between @start__ and @end__. It is implemented similarly to list_for_each(),
>> + * but is using the &drm_gpuva_manager's internal interval tree to accelerate
>> + * the search for the starting &drm_gpuva, and hence isn't safe against removal
>> + * of elements. It assumes that @end__ is within (or is the upper limit of) the
>> + * &drm_gpuva_manager. This iterator does not skip over the &drm_gpuva_manager's
>> + * @kernel_alloc_node.
>> + */
>> +#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
>> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)); \
> 
> drm_gpuva_find_first() takes the range size as its last argument, not
> the range end:
> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
> 

Good catch! Originally this was

drm_gpuva_it_iter_first(&(mgr)->rb.tree, (start__), (end__) - 1)

but then I changed it since I did not want to expose the interval tree 
functions directly.

> 
>> +	     va__ && (va__->va.addr < (end__)) && \
>> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
>> +	     va__ = list_next_entry(va__, rb.entry))
> 
> If you define:
> 
> static inline struct drm_gpuva *
> drm_gpuva_next(struct drm_gpuva *va)
> {
> 	if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
> 		return list_next_entry(va, rb.entry);
> 
> 	return NULL;
> } >
> the for loop becomes a bit more readable:

Yes, it would. However, I don't want it to be confused with 
drm_gpuva_find_next(). Maybe I should rename the latter to something 
like drm_gpuva_find_next_neighbor() then.

> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
> 	     va__ && (va__->va.addr < (end__)); \
> 	     va__ = drm_gpuva_next(va__))
> 
>> +
>> +/**
>> + * drm_gpuva_for_each_va_range_safe - iternator to safely walk over a range of
>> + * &drm_gpuvas
>> + * @va__: &drm_gpuva to assign to in each iteration step
>> + * @next__: another &drm_gpuva to use as temporary storage
>> + * @mgr__: &drm_gpuva_manager to walk over
>> + * @start__: starting offset, the first gpuva will overlap this
>> + * @end__: ending offset, the last gpuva will start before this (but may
>> + * overlap)
>> + *
>> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
>> + * between @start__ and @end__. It is implemented similarly to
>> + * list_for_each_safe(), but is using the &drm_gpuva_manager's internal interval
>> + * tree to accelerate the search for the starting &drm_gpuva, and hence is safe
>> + * against removal of elements. It assumes that @end__ is within (or is the
>> + * upper limit of) the &drm_gpuva_manager. This iterator does not skip over the
>> + * &drm_gpuva_manager's @kernel_alloc_node.
>> + */
>> +#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
>> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)), \
>> +	     next__ = va ? list_next_entry(va__, rb.entry) : NULL; \
>> +	     va__ && (va__->va.addr < (end__)) && \
>> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
>> +	     va__ = next__, next__ = list_next_entry(va__, rb.entry))
> 
> And this is the safe version using the drm_gpuva_next() helper:
> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
> 	     next__ = drm_gpuva_next(va__); \
> 	     va__ && (va__->va.addr < (end__)); \
> 	     va__ = next__, next__ = drm_gpuva_next(va__))
> 
> Those changes fixed an invalid pointer access I had in the sm_unmap()
> path.
> 

Sorry you did run into this bug.

- Danilo


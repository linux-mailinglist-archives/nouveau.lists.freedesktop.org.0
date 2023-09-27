Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E37B0ABF
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 18:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1FE10E575;
	Wed, 27 Sep 2023 16:59:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BEC10E575
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695833959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6cdl+aga/6XxqqAgUUx1HZQLiVlXgz3gMJOL8B3acE=;
 b=H0OOtMfpQXekn9Ix7Dg8w9PJcG/MLb/C5/1mvWf5ddbB0JrNL8vnVowNiaFELKlGiCAyg7
 UZMT9VWqsVWAlWEughH4i6Wnd2KBmWLSg/LvGc4XhWPuGhp9Fgd7fg8qg88TJHoBjP7SMs
 aHdET4XfH0aE117D7raWnqjTKwHH3GU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-kjypz8GFNZqokV6caCdW0Q-1; Wed, 27 Sep 2023 12:59:18 -0400
X-MC-Unique: kjypz8GFNZqokV6caCdW0Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-530f2ccceeeso9098541a12.3
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 09:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833956; x=1696438756;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6cdl+aga/6XxqqAgUUx1HZQLiVlXgz3gMJOL8B3acE=;
 b=KT41bTwR2AaywYj8YTTEcjgX9ENV2TNW1hxg6ehtELDdJeMoARS1fPxA/La2/LSXxX
 Dth8JyuF6i2B8GOimVnsTeG7l6IKe7IwClUR1OGYhB7rBCvpdiTlvEx2GFELz2JD2gtc
 QBUKktvDdIpPL91P+MOUXe5fGPpRWx8n4K3SXfnbKi0BajnFZLBnmNdBtIEYH/xSiUNv
 X5SU50QaLVALCWixmtCj+4zprcjCXCuSHRai4VhNuH6KF2ragCLiCZ384O2eTx5cIRC7
 LXbFPhrO7XPziedu7rcWjo4NrlzOraPX+Km89BcunlGqJcXYe+znP707lV8MR8Mreg8v
 P3EA==
X-Gm-Message-State: AOJu0YwwVFF4xF1VP8p2my6iXVEyRZqy5UMuf81UigxnGbfi4FGkC3aH
 QdUA4WEpmy38wwDaaoxLQOI/afC1fHkmf6RuSpLMcE+8wcGAg7j0Dps6BV0CGucCMAOXIXxc6uZ
 +9owvahj9s4zEe03c3SONYvX0Mg==
X-Received: by 2002:aa7:d0d8:0:b0:530:a0a9:ee36 with SMTP id
 u24-20020aa7d0d8000000b00530a0a9ee36mr2095707edo.38.1695833956676; 
 Wed, 27 Sep 2023 09:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKMrmbuENX8FTtWAevq2VNbPYGGhr9ZiqqUZp9scNnPqDJ3oJHDnGAkbey4dkMV7CVYYlnMQ==
X-Received: by 2002:aa7:d0d8:0:b0:530:a0a9:ee36 with SMTP id
 u24-20020aa7d0d8000000b00530a0a9ee36mr2095696edo.38.1695833956385; 
 Wed, 27 Sep 2023 09:59:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a056402014300b0052595b17fd4sm8315439edu.26.2023.09.27.09.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 09:59:15 -0700 (PDT)
Message-ID: <a46f49b8-3680-9476-046b-e3d821184851@redhat.com>
Date: Wed, 27 Sep 2023 18:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-8-dakr@redhat.com>
 <20230922134548.7ede67c0@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230922134548.7ede67c0@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v4 7/8] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
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

On 9/22/23 13:45, Boris Brezillon wrote:
> On Wed, 20 Sep 2023 16:42:40 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> +	/**
>> +	 * @DRM_GPUVM_RESV_PROTECTED: GPUVM is protected externally by the
>> +	 * GPUVM's &dma_resv lock
> 
> I think we need to be more specific, and list the fields/operations
> that need to be externally protected when DRM_GPUVM_RESV_PROTECTED is
> set.

I agree, we should probably keep a list somewhere. However, there are also
lockdep asserts where a lock is required to be held.

> 
>> +	 */
>> +	DRM_GPUVM_RESV_PROTECTED = (1 << 0),
> 


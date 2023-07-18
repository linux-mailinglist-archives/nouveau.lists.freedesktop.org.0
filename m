Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC3757DB9
	for <lists+nouveau@lfdr.de>; Tue, 18 Jul 2023 15:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9E10E343;
	Tue, 18 Jul 2023 13:35:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7014510E0D9
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jul 2023 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689687327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEu1yb4Zgq1SLELJ8rlpOHBQWwE2NJnVWaDiK7u0B4Q=;
 b=G7h3ahF7YZIu7wF/bCeYmvQ2knQ7V0soXbpPHE1MRYjb9Ixn0sxVgW9ODMZ6vXWAYBdUAp
 S+vRPC4yg6s886n4dWD9bhxdZoQqCjIz2TSdEhqk2WMrLTtlUzcpnlHd9NdW4KRXu8eemt
 1C4yAd78NWRFWSNFUTpxvDTzigwiF9w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-BQZj5nQmPqSbxQZw_9MUjg-1; Tue, 18 Jul 2023 09:35:26 -0400
X-MC-Unique: BQZj5nQmPqSbxQZw_9MUjg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f7a2b21fdso354549566b.2
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jul 2023 06:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689687325; x=1692279325;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cEu1yb4Zgq1SLELJ8rlpOHBQWwE2NJnVWaDiK7u0B4Q=;
 b=QNNJaybLanFm77WFhJWuqxN8mbNdiy1byFJnGAmGPoLukPojW90gEHIHRNyt/BkXQh
 G2YzEgyWIpaNZTTJlojwPPAe2nUvcc/afTFMg/1eVMqcKCbCw7a/TZb7KtT1XJ+lYyap
 OlFywPvBDyrQTQOkQ8uscnkD31QKVyUsS6AwBILIGgSeVgaYHIOkLw18q48Fly78U9TM
 qEalyUOmRh3jikyAL6pCgaJ/oStYnkBw/lFeMjul80bLxpVldPol6C1lJiGHkQGq4H8u
 jLBU9dJXxtkFdWxNjRZN8c/GHn8ndl+bypVTl3+ek6QBM78D91jnAon04YVItcAMOSNf
 5GXg==
X-Gm-Message-State: ABy/qLbXVPzKo6Ah2D86aiorB4xiicnvu3S3hlxvfV7ryadmAuZFFpoM
 q25Q4JnZaAUpSSG5iCprTItTHFNZqpiU/NRUOa9DpJqXJUqdryNKnb+rA2TwSYDbnNQzP8t7Qlr
 fcsz97gJabKYSpQjodi0l6nRvng==
X-Received: by 2002:a17:906:eb82:b0:991:f7cb:cc3d with SMTP id
 mh2-20020a170906eb8200b00991f7cbcc3dmr13327534ejb.65.1689687324862; 
 Tue, 18 Jul 2023 06:35:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE6BIgUGric7bcLk/QABEzPWeIdh0wiGZkCK6sZV8z78PAPNcNuqus+Bife1lVy6P9Ah+mfdA==
X-Received: by 2002:a17:906:eb82:b0:991:f7cb:cc3d with SMTP id
 mh2-20020a170906eb8200b00991f7cbcc3dmr13327514ejb.65.1689687324521; 
 Tue, 18 Jul 2023 06:35:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a056402516100b00521a3d8474csm1244859ede.57.2023.07.18.06.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 06:35:24 -0700 (PDT)
Message-ID: <51968407-c87a-e565-28f7-868a1b923d5c@redhat.com>
Date: Tue, 18 Jul 2023 13:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Donald Robson <Donald.Robson@imgtec.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "jason@jlekstrand.net" <jason@jlekstrand.net>,
 "willy@infradead.org" <willy@infradead.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <20230713170429.2964-1-dakr@redhat.com>
 <20230713170429.2964-3-dakr@redhat.com>
 <f5957892c4fb41becd7084ac93310aae3a6e091a.camel@imgtec.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f5957892c4fb41becd7084ac93310aae3a6e091a.camel@imgtec.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-next v7 02/13] drm: manager to keep track
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 7/17/23 12:00, Donald Robson wrote:
> Hi Danilo,
> The below part of the documentation is out of date now.
> Thanks,
> Donald

Thanks Donald for pointing this out.

If there aren't any further objections in general I will fix up the 
comment and then push the GPUVA Manager parts of the series to 
drm-misc-next.

- Danilo

> 
> On Thu, 2023-07-13 at 19:03 +0200, Danilo Krummrich wrote:
>>
>> +
>> +/**
>> + * DOC: Locking
>> + *
>> + * Generally, the GPU VA manager does not take care of locking itself, it is
>> + * the drivers responsibility to take care about locking. Drivers might want to
>> + * protect the following operations: inserting, removing and iterating
>> + * &drm_gpuva objects as well as generating all kinds of operations, such as
>> + * split / merge or prefetch.
>> + *
>> + * The GPU VA manager also does not take care of the locking of the backing
>> + * &drm_gem_object buffers GPU VA lists by itself; drivers are responsible to
>> + * enforce mutual exclusion using either the GEMs dma_resv lock or alternatively
>> + * a driver specific external lock by setting the @DRM_GPUVA_MANAGER_LOCK_EXTERN
>> + * flag.
>> + *
>> + * For the latter, functions such as drm_gpuva_link() or drm_gpuva_unlink()
>> + * contain lockdep checks to indicate locking issues. For this to work drivers
>> + * must provide (in case the @DRM_GPUVA_MANAGER_LOCK_EXTERN flag is set) their
>> + * external lock with drm_gpuva_manager_set_ext_lock() after initialization.
>> + */
>>


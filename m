Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F352776C5C
	for <lists+nouveau@lfdr.de>; Thu, 10 Aug 2023 00:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA9810E119;
	Wed,  9 Aug 2023 22:41:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B0D10E119
 for <nouveau@lists.freedesktop.org>; Wed,  9 Aug 2023 22:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691620857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqkWptdyICgKZLcTvquabOW8rAvUOuPeScuQD1YQUKA=;
 b=XbhWl7gJz61HdCfNcX9isnaOJpsgEcAa9PcT89v4Zcz/wogp7ZuM7SEZv15fTm2C7Qmu7h
 tljZPsyq30Xdj1klCj6blY+wzDX5Z16kcTBpH1VY59P61nO39mIeQ17e01O2413uJSQbkZ
 3jvWNERSq8nz2MGEFEGr1E3vhPklh/Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-JVOJVVIWPsCrKU7jfKu7ZA-1; Wed, 09 Aug 2023 18:40:56 -0400
X-MC-Unique: JVOJVVIWPsCrKU7jfKu7ZA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5234e6cc76fso158422a12.1
 for <nouveau@lists.freedesktop.org>; Wed, 09 Aug 2023 15:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691620855; x=1692225655;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kqkWptdyICgKZLcTvquabOW8rAvUOuPeScuQD1YQUKA=;
 b=SnrUcr+8GNh5SBTn3R54dpWyX5JxR2n0EC/DSoJERw27qYS9ubrbdCEd1UJJ1Zecjb
 ierB5oHK7q1KNTR2KEKYT5YDszxPulr5UlPlcTezHY2QI3YTFV1Hl/lQ7iZ88/iwAAAI
 J8HdIN2TcsiaFGVWuJSceTcVLzUOW1taE6mlNHMy4z2h9IN6KDqNJOOIbsNCOxO78Wh9
 xVmiNiF9XXMCn26Bl8U8HX6T5IQrpSzzjufyzbg+zMT0oLbYQGIARF+w7AX7Lf5s/SFL
 Ms1bbzpi3mHd6fUdLdwXnZD/CQlhv33MQjoTuR1EdwNJ+ZkylL8aMJh6P0nxxMByPYQK
 fvZg==
X-Gm-Message-State: AOJu0YwlxYgo5a5ZpymycEHfxa5UIkDAt3fuFbDw+nbuvKuJ8ZTDmPBj
 qNF678h9UmA1Dh1IVqGbl3mi8R5ZmLR8COztF5difeAKPxBsF38uTaaNFmceN+bnLXnQRT6SuWz
 A6rR87FMxTKjbrBS0AfMs7hT1LA==
X-Received: by 2002:aa7:c687:0:b0:522:4cd7:efb0 with SMTP id
 n7-20020aa7c687000000b005224cd7efb0mr469656edq.17.1691620855563; 
 Wed, 09 Aug 2023 15:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbc5d+5Pwrcb2mWJiUCFNf5HjHJlFOgUzg5E8ZB5Bw31sbH+4nAOdQBye19n8yg+HHqaYiFA==
X-Received: by 2002:aa7:c687:0:b0:522:4cd7:efb0 with SMTP id
 n7-20020aa7c687000000b005224cd7efb0mr469630edq.17.1691620855277; 
 Wed, 09 Aug 2023 15:40:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a056402071a00b0052369656ed3sm48675edx.3.2023.08.09.15.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 15:40:54 -0700 (PDT)
Message-ID: <3f4beed9-6aca-b544-80a2-9ea5264da119@redhat.com>
Date: Thu, 10 Aug 2023 00:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230803165238.8798-1-dakr@redhat.com>
 <20230803165238.8798-2-dakr@redhat.com>
 <20230808092117.7f7fdef9@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230808092117.7f7fdef9@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v9 01/11] drm/gem: fix lockdep
 check for dma-resv lock
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
 Liam.Howlett@oracle.com, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 8/8/23 09:21, Boris Brezillon wrote:
> On Thu,  3 Aug 2023 18:52:20 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> When no custom lock is set to protect a GEMs GPUVA list, lockdep checks
>> should fall back to the GEM objects dma-resv lock. With the current
>> implementation we're setting the lock_dep_map of the GEM objects 'resv'
>> pointer (in case no custom lock_dep_map is set yet) on
>> drm_gem_private_object_init().
>>
>> However, the GEM objects 'resv' pointer might still change after
>> drm_gem_private_object_init() is called, e.g. through
>> ttm_bo_init_reserved(). This can result in the wrong lock being tracked.
>>
>> To fix this, call dma_resv_held() directly from
>> drm_gem_gpuva_assert_lock_held() and fall back to the GEMs lock_dep_map
>> pointer only if an actual custom lock is set.
>>
>> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> but I'm wondering if it wouldn't be a good thing to add a
> drm_gem_set_resv() helper, so the core can control drm_gem_object::resv
> re-assignments (block them if it's happening after the GEM has been
> exposed to the outside world or update auxiliary data if it's happening
> before that).

I agree, this might be a good idea. There are quite a few places where 
drm_gem_object::resv is set from external code.

> 
>> ---
>>   include/drm/drm_gem.h | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index c0b13c43b459..bc9f6aa2f3fe 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -551,15 +551,17 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>    * @lock: the lock used to protect the gpuva list. The locking primitive
>>    * must contain a dep_map field.
>>    *
>> - * Call this if you're not proctecting access to the gpuva list
>> - * with the dma-resv lock, otherwise, drm_gem_gpuva_init() takes care
>> - * of initializing lock_dep_map for you.
>> + * Call this if you're not proctecting access to the gpuva list with the
>> + * dma-resv lock, but with a custom lock.
>>    */
>>   #define drm_gem_gpuva_set_lock(obj, lock) \
>> -	if (!(obj)->gpuva.lock_dep_map) \
>> +	if (!WARN((obj)->gpuva.lock_dep_map, \
>> +		  "GEM GPUVA lock should be set only once.")) \
>>   		(obj)->gpuva.lock_dep_map = &(lock)->dep_map
>>   #define drm_gem_gpuva_assert_lock_held(obj) \
>> -	lockdep_assert(lock_is_held((obj)->gpuva.lock_dep_map))
>> +	lockdep_assert((obj)->gpuva.lock_dep_map ? \
>> +		       lock_is_held((obj)->gpuva.lock_dep_map) : \
>> +		       dma_resv_held((obj)->resv))
>>   #else
>>   #define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
>>   #define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
>> @@ -573,11 +575,12 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>    *
>>    * Calling this function is only necessary for drivers intending to support the
>>    * &drm_driver_feature DRIVER_GEM_GPUVA.
>> + *
>> + * See also drm_gem_gpuva_set_lock().
>>    */
>>   static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
>>   {
>>   	INIT_LIST_HEAD(&obj->gpuva.list);
>> -	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
>>   }
>>   
>>   /**
> 


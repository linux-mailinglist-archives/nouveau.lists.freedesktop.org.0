Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E98CB69F760
	for <lists+nouveau@lfdr.de>; Wed, 22 Feb 2023 16:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9610E9EA;
	Wed, 22 Feb 2023 15:08:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EFB10E9EA
 for <nouveau@lists.freedesktop.org>; Wed, 22 Feb 2023 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677078479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRCEb4SvpDKPjZLK4vn9/q7q7Y3I8z1o20cZm/AYJwk=;
 b=MGAVENluDGkNE7r3DBZSkYqSbgygbAJqeSwY35bQ1PvemjAst6JJcxOQ6F5GpNnt3Gx75m
 5rPjqJZTPsWY3+3Htb2vN9PASJdJJoA938u50W/Vee2spEbQ18jdY16YgRtTfEneI6nPG0
 jmgBXPA4OKg8hW7amKOGd4CShtDbE5o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-TqL64WIyNXyLVncBSB0BpQ-1; Wed, 22 Feb 2023 10:07:57 -0500
X-MC-Unique: TqL64WIyNXyLVncBSB0BpQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 ck7-20020a0564021c0700b004a25d8d7593so10541354edb.0
 for <nouveau@lists.freedesktop.org>; Wed, 22 Feb 2023 07:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRCEb4SvpDKPjZLK4vn9/q7q7Y3I8z1o20cZm/AYJwk=;
 b=GOocFtC83FbnKKK0pJIAV36fMu0PqOGcP+SGNUKqd5bILAF3qD6i+PixgSbSFYdXV0
 AUjLrbxBXbqcY4g++/YlBDAiMZygQbbTWcNMxiLd27hy6mDN8BrCYpfwfqfb5V1v5Sq8
 rUDmKHoqrRPnWfK0psw7jZd0j+MKBRZ+sZ5Tsuz/VVJ443o4pqYXisPC53KChvQmNHx6
 PGfI0YLtbFrtpzO7cEBMcIITd5bsRDValqvn4rIIzlzthaq8iv/EKEuJkI441/nMIHT4
 SYh/kt8r4UNQ4a4x6/NwE8Aw/M9Jj1pgzaFYh01iZU7zEqpo+ZAhK1gAGAhBimSLTc3u
 5fjg==
X-Gm-Message-State: AO0yUKVgCXga2kSetNoQdhbuXrrBDmb7C/QlFDzgVhgmmQ2X4CO7PZV8
 Krfj4VOCSIACedRsdEIW9OLviJxLrseiir5OOSD3FxdpUzofBA+ALMY3jWlw6hNC3nBKTU6bp+x
 iYecxOEnJmUfHJ4nKqyF1fzpBng==
X-Received: by 2002:a17:907:1623:b0:8b1:76dd:f5f6 with SMTP id
 hb35-20020a170907162300b008b176ddf5f6mr29151557ejc.50.1677078475598; 
 Wed, 22 Feb 2023 07:07:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8V2KGVMm3Rh6GnmJnl329zmNElexUMuVrYhLPpVZhOY6NIjF1ZDTeKB87CfdRbYWnWGPbc0Q==
X-Received: by 2002:a17:907:1623:b0:8b1:76dd:f5f6 with SMTP id
 hb35-20020a170907162300b008b176ddf5f6mr29151515ejc.50.1677078475224; 
 Wed, 22 Feb 2023 07:07:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a170906771400b008e57b5e0ce9sm1160273ejm.108.2023.02.22.07.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 07:07:54 -0800 (PST)
Message-ID: <cc8eeaf4-31e7-98e4-a712-012fc604e985@redhat.com>
Date: Wed, 22 Feb 2023 16:07:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <70ba382f-1559-289a-4922-ca9c371aaf59@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <70ba382f-1559-289a-4922-ca9c371aaf59@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-next v2 05/16] drm: manager to keep track
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
 mripard@kernel.org, linux-mm@kvack.org, alexdeucher@gmail.com,
 boris.brezillon@collabora.com, bskeggs@redhat.com, Liam.Howlett@oracle.com,
 Dave Airlie <airlied@redhat.com>, bagasdotme@gmail.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2/22/23 11:25, Christian König wrote:
> Am 17.02.23 um 14:44 schrieb Danilo Krummrich:

<snip>

>> +/**
>> + * DOC: Overview
>> + *
>> + * The DRM GPU VA Manager, represented by struct drm_gpuva_manager 
>> keeps track
>> + * of a GPU's virtual address (VA) space and manages the 
>> corresponding virtual
>> + * mappings represented by &drm_gpuva objects. It also keeps track of 
>> the
>> + * mapping's backing &drm_gem_object buffers.
>> + *
>> + * &drm_gem_object buffers maintain a list (and a corresponding list 
>> lock) of
>> + * &drm_gpuva objects representing all existent GPU VA mappings using 
>> this
>> + * &drm_gem_object as backing buffer.
>> + *
>> + * If the &DRM_GPUVA_MANAGER_REGIONS feature is enabled, a GPU VA 
>> mapping can
>> + * only be created within a previously allocated &drm_gpuva_region, 
>> which
>> + * represents a reserved portion of the GPU VA space. GPU VA mappings 
>> are not
>> + * allowed to span over a &drm_gpuva_region's boundary.
>> + *
>> + * GPU VA regions can also be flagged as sparse, which allows drivers 
>> to create
>> + * sparse mappings for a whole GPU VA region in order to support Vulkan
>> + * 'Sparse Resources'.
> 
> Well since we have now found that there is absolutely no technical 
> reason for having those regions could we please drop them?

I disagree this was the outcome of our previous discussion.

In nouveau I still need them to track the separate sparse page tables 
and, as you confirmed previously, Nvidia cards are not the only cards 
supporting this feature.

The second reason is that with regions we can avoid merging between 
buffers, which saves some effort. However, I agree that this argument by 
itself probably doesn't hold too much, since you've pointed out in a 
previous mail that:

<cite>
1) If we merge and decide to only do that inside certain boundaries then 
those boundaries needs to be provided and checked against. This burns 
quite some CPU cycles

2) If we just merge what we can we might have extra page table updates 
which cost time and could result in undesired side effects.

3) If we don't merge at all we have additional housekeeping for the 
mappings and maybe hw restrictions.
</cite>

However, if a driver uses regions to track its separate sparse page 
tables anyway it gets 1) for free, which is a nice synergy.

I totally agree that regions aren't for everyone though. Hence, I made 
them an optional feature and by default regions are disabled. In order 
to use them drm_gpuva_manager_init() must be called with the 
DRM_GPUVA_MANAGER_REGIONS feature flag.

I really would not want to open code regions or have two GPUVA manager 
instances in nouveau to track sparse page tables. That would be really 
messy, hence I hope we can agree on this to be an optional feature.

> 
> I don't really see a need for them any more.
> 
> Regards,
> Christian.
>  


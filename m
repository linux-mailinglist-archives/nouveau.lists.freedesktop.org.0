Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453268C600
	for <lists+nouveau@lfdr.de>; Mon,  6 Feb 2023 19:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99A10E43B;
	Mon,  6 Feb 2023 18:42:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4284F10E43B
 for <nouveau@lists.freedesktop.org>; Mon,  6 Feb 2023 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675708945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mV7wu48lUfeS3GU07IXyzbGWRiDs4lMjYJhBoJBL7dQ=;
 b=fq0UWva9yxi5hqLzIDdA9BUWX2XOGF3KazdWfgeTWhvnWwP8NbbvaclChmulYjXGf5NzAt
 LtbgowpcegTcCkJLCWydZs/cMXw7vV7yjgiSjg8SKIMARWPJtBvSDVPbpBF/WzUoc4ecyx
 e3REH1RKrJ8vo2UOnYMcuKVZYMvweSQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-mRkJcDSnNMaF0qOkrZW4Yg-1; Mon, 06 Feb 2023 13:42:02 -0500
X-MC-Unique: mRkJcDSnNMaF0qOkrZW4Yg-1
Received: by mail-ed1-f70.google.com with SMTP id
 g19-20020a056402115300b004a26cc7f6cbso8312937edw.4
 for <nouveau@lists.freedesktop.org>; Mon, 06 Feb 2023 10:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mV7wu48lUfeS3GU07IXyzbGWRiDs4lMjYJhBoJBL7dQ=;
 b=nkA2U5rfb8MI0N1x4gkUts0tCY+H5deVVXonfBJwTC2GzuHEa0+QUIA6pR8QED7GeR
 cGZ3aNOMwGoNfksWwSqf5D+9gjQrk/2jPuxamLq9U1rdTvL04mHpWWk7fpgysz0ZA4kN
 EnL6Dhe3tDG6a4yyaM0F2hIqAu+iY3vyJFahez430AgetBz2YRyvaoDG13Ds8jFDxGkY
 buV7pD8W14aOTXEmU66U9w2Umz/T1aVAyQedZBN+c8CUvnWjleBmMa+MLGgXSl0Pvm0x
 uVv4oTr+RG9LOJt/ef4867GyLPVm73KbU1/tvt7eN2q3BUHyrv44Cd4SG8CavnFTFk1e
 53aw==
X-Gm-Message-State: AO0yUKWwKpbiJ9ec0JpkuiO3bs5Ds054FfrYBtVoKRQvcc7ntB0g/QKO
 265bhxgiJWL5TSX9xCTvmHRveTCyAPnqeEeauJdrF0utxNShYPQU0wlpN+sPN7iy4UDMNLCtMkD
 oXlw4I/oD7CK8njEuqH6SPEmwAg==
X-Received: by 2002:a17:906:1dc8:b0:878:8237:7abb with SMTP id
 v8-20020a1709061dc800b0087882377abbmr383408ejh.35.1675708885089; 
 Mon, 06 Feb 2023 10:41:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9FFg9WxyaDxE9MX9rbZD0l91/5bcmXcVyXebsSOuym8lZQpDrI3Bo83tXHjG/CiZX7/gEa+A==
X-Received: by 2002:a17:906:1dc8:b0:878:8237:7abb with SMTP id
 v8-20020a1709061dc800b0087882377abbmr383390ejh.35.1675708884883; 
 Mon, 06 Feb 2023 10:41:24 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 bu18-20020a170906a15200b0088351ea808bsm5750226ejb.46.2023.02.06.10.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:41:24 -0800 (PST)
Message-ID: <4439c44b-cbd0-7160-da3d-e78f6aeeec77@redhat.com>
Date: Mon, 6 Feb 2023 19:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
 <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
 <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
 <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2/6/23 17:14, Christian König wrote:
> Concentrating this discussion on a very big misunderstanding first.
> 
> Am 06.02.23 um 14:27 schrieb Danilo Krummrich:
>> [SNIP]
>> My understanding is that userspace is fully responsible on the parts 
>> of the GPU VA space it owns. This means that userspace needs to take 
>> care to *not* ask the kernel to modify mappings that are in use 
>> currently.
> 
> This is a completely wrong assumption! Take a look at what games like 
> Forza Horizzon are doing.
> 
> Basically that game allocates a very big sparse area and fills it with 
> pages from BOs while shaders are accessing it. And yes, as far as I know 
> this is completely valid behavior.

I also think this is valid behavior. That's not the problem I'm trying 
to describe. In this case userspace modifies the VA space 
*intentionally* while shaders are accessing it, because it knows that 
the shaders can deal with reading 0s.

Just to have it all in place, the example I gave was:
  - two virtually contiguous buffers A and B
  - binding 1 mapped to A with BO offset 0
  - binding 2 mapped to B with BO offset length(A)

What I did not mention both A and B aren't sparse buffers in this 
example, although it probably doesn't matter too much.

Since the conditions to do so are given, we merge binding 1 and binding 
2 right at the time when binding 2 is requested. To do so a driver might 
unmap binding 1 for a very short period of time (e.g. to (re-)map the 
freshly merged binding with a different page size if possible).

 From userspace perspective buffer A is ready to use before applying 
binding 2 to buffer B, hence it would be illegal to touch binding 1 
again when userspace asks the kernel to map binding 2 to buffer B.

Besides that I think there is no point in merging between buffers anyway 
because we'd end up splitting such a merged mapping anyway later on when 
one of the two buffers is destroyed.

Also, I think the same applies to sparse buffers as well, a mapping 
within A isn't expected to be re-mapped just because something is mapped 
to B.

However, in this context I start wondering if re-mapping in the context 
of merge and split is allowed at all, even within the same sparse buffer 
(and even with a separate page table for sparse mappings as described in 
my last mail; shaders would never fault).

> 
> So you need to be able to handle this case anyway and the approach with 
> the regions won't help you at all preventing that.
> 
> Regards,
> Christian.
> 


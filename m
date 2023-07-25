Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD51D762706
	for <lists+nouveau@lfdr.de>; Wed, 26 Jul 2023 00:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5340B10E18E;
	Tue, 25 Jul 2023 22:48:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC5510E18E
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jul 2023 22:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690325327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqtwPYmHGNsoP1pFuN8jF45AEQfTNG8g69I653X2PAs=;
 b=cpbOXseG36fl6vzagfBRrQPsMhHZr8u099BMO16tkW/kp1GXeHXl0MFTU6Np7S8k56kt1U
 CJdiDPuz2H8eCc5Ir+94NV3Yp4HRX+cKkf+QWc17vvBfTpIicyUAzNTvBWtKra8HDhDlqO
 FTLkSwDPuAiReTYxxg2BzqVogZtEn1k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-5ilSyUABMPqQihgIuw6eLw-1; Tue, 25 Jul 2023 18:48:46 -0400
X-MC-Unique: 5ilSyUABMPqQihgIuw6eLw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-993eeb3a950so350585766b.2
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jul 2023 15:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690325325; x=1690930125;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fqtwPYmHGNsoP1pFuN8jF45AEQfTNG8g69I653X2PAs=;
 b=bXgYmFjuJbExuKiAlHso7ZPxZC5VaIuQUtxvwO4f5O6WQWifd16Y2mq414XBaLRS2v
 etRg3zXDBVWMb2gBNxfxKWAD9e+NcBS3arU6C4aGtjy1MajtV4xBy6dlfb3IpLaEO+xs
 DereOMqvLwwb6e0xEd11efyxuDy3IF5vqMPTCZbV8gp3cZ+eWKpKR8vafsQDfP7Al4i7
 IF2JJpezCr+OiQZb4WwphRaQxainzN/XVPPRMAA1nN2YtkCZ1XB/SzJ5qiHVypseX/gN
 BrBoerw43QHdsENaHnOJ6Un2cCphi+MnckQga4JlEEnYIxN/u/JwgyayPrAiLN5v7kr2
 DnZg==
X-Gm-Message-State: ABy/qLYjiWxznAjlNwJCUgSaTPq96/rP5XMx8Xvd6eVfhfyNuCCb3iI6
 oJhav7l9NeVfyC3GmsW4YmgwrFbv+M/KdhsxTrLnavxuWFj9sPUoyIcYe4Lm1a6KQbg5SWOPh8q
 3PTeKQtXtaWlXP3L/nm13tsYmBQ==
X-Received: by 2002:a17:907:2be9:b0:982:7545:efb6 with SMTP id
 gv41-20020a1709072be900b009827545efb6mr158278ejc.66.1690325324932; 
 Tue, 25 Jul 2023 15:48:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFjV59E7oAEbgLcfuvqGzUWbSIkW/kHUTr3BMaofJ0Plmev7uMfuohC5/16L7eW3+4p7WZnVA==
X-Received: by 2002:a17:907:2be9:b0:982:7545:efb6 with SMTP id
 gv41-20020a1709072be900b009827545efb6mr158266ejc.66.1690325324597; 
 Tue, 25 Jul 2023 15:48:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 lg23-20020a170906f89700b0098733a40bb7sm8814043ejb.155.2023.07.25.15.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 15:48:44 -0700 (PDT)
Message-ID: <21ea63fe-33d7-a075-7291-35dd1b2a9b64@redhat.com>
Date: Tue, 25 Jul 2023 23:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Danilo Krummrich <dakr@redhat.com>
To: Faith Ekstrand <faith@gfxstrand.net>
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-12-dakr@redhat.com>
 <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
 <542203c6-781a-dc44-6fa1-13cd20ab9e21@redhat.com>
 <CAOFGe94sG5==GM+spcTihcAtMCoj2xZYpN8NsYE6CEckdHJ8rQ@mail.gmail.com>
 <75c86224-6183-07fe-da04-6a2101615a50@redhat.com>
Organization: RedHat
In-Reply-To: <75c86224-6183-07fe-da04-6a2101615a50@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v8 11/12] drm/nouveau: implement
 new VM_BIND uAPI
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
 mripard@kernel.org, alexdeucher@gmail.com, boris.brezillon@collabora.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 7/25/23 18:43, Danilo Krummrich wrote:
> On 7/25/23 18:16, Faith Ekstrand wrote:
>> Thanks for the detailed write-up! That would definitely explain it. If 
>> I remember, I'll try to do a single-threaded run or two. If your 
>> theory is correct, there should be no real perf difference when 
>> running single-threaded. Those runs will take a long time, though, so 
>> I'll have to run them over night. I'll let you know in a few days once 
>> I have the results.
> 
> I can also push a separate branch where I just print out a warning 
> whenever we run into such a condition including the time we were waiting 
> for things to complete. I can probably push something later today.

https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-track-stalls

It prints out the duration of every wait as well as the total wait time 
since boot.

- Danilo

> 
>>
>> If this theory holds, then I'm not concerned about the performance of 
>> the API itself. It would still be good to see if we can find a way to 
>> reduce the cross-process drag in the implementation but that's a perf 
>> optimization we can do later.
> 
>  From the kernel side I think the only thing we could really do is to 
> temporarily run a secondary drm_gpu_scheduler instance, one for VM_BINDs 
> and one for EXECs until we got the new page table handling in place.
> 
> However, the UMD could avoid such conditions more effectively, since it 
> controls the address space. Namely, avoid re-using the same region of 
> the address space right away in certain cases. For instance, instead of 
> replacing a sparse region A[0x0, 0x4000000] with a larger sparse region 
> B[0x0, 0x8000000], replace it with B'[0x4000000, 0xC000000] if possible.
> 
> However, just mentioning this for completeness. The UMD surely shouldn't 
> probably even temporarily work around such a kernel limitation.
> 
> Anyway, before doing any of those, let's see if the theory holds and 
> we're actually running into such cases.
> 
>>
>> Does it actually matter? Yes, it kinda does. No, it probably doesn't 
>> matter for games because you're typically only running one game at a 
>> time. From a development PoV, however, if it makes CI take longer then 
>> that slows down development and that's not good for the users, either.
> 
> Fully agree.
> 
> - Danilo
> 
>>
>> ~Faith
>>
>>     - Danilo
>>
>>      >
>>      > ~Faith
>>      >
>>


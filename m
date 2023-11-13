Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F477E9C7E
	for <lists+nouveau@lfdr.de>; Mon, 13 Nov 2023 13:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EF310E36F;
	Mon, 13 Nov 2023 12:57:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFF510E36F
 for <nouveau@lists.freedesktop.org>; Mon, 13 Nov 2023 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699880244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99HQPaexgy0VlHo7G+FMrZBwsYGZqGO7/PNoylZTCAo=;
 b=GgnCfXgkwjUJWoureE5sOUdMqq6HrAWc612/PtOja0hdSx5vDsWhIZ9Fz6P3Xa/80cE/37
 iX01TGT1qxo3vI3pt2Q9tYxl1VwfL8qz2PXPbIbmhrs+1PgkRZoKtUha45+4+bfVDJ3prz
 HofECLGYcsuLdsUNivZvDbTE0LZ7TPo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-qqso0nttNwSgy9WX4fLMcQ-1; Mon, 13 Nov 2023 07:57:23 -0500
X-MC-Unique: qqso0nttNwSgy9WX4fLMcQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9c797b497e8so287823666b.0
 for <nouveau@lists.freedesktop.org>; Mon, 13 Nov 2023 04:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699880242; x=1700485042;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99HQPaexgy0VlHo7G+FMrZBwsYGZqGO7/PNoylZTCAo=;
 b=iC7GzcbN5eD6vw/5bWD6Pz7dPKLWuWdH5Tg/fbbtK8zv3lElUJPwgDUwPlis5vIDtz
 PjPmTNfnnTyFeDhJ05y7qdwzUqKn3iPqPtWk18Tp/IdHjqmdehngl1/fhlF5V0fkXQmh
 dDn9oYoJy13ko/aRRmHfmUAWWWD3exMaCx3aJ/AxLiuold0n5LPgXcnFzI/ztepkzWls
 kHMILe6wQ4ItrcG+2SOJ3mlB1V1DBw8Idkkg/l3ZSL2UW8dFlBGPA53qObrE3vk/b2GF
 a0tG2jfmu2W5fqqVBbG6FZfHxYJ2mainqaMH1TG5LlVyxYFx3PszDgbrr/Z8DLRQHPL0
 1uzA==
X-Gm-Message-State: AOJu0YxsxOYe27r012z6tV/0RBUUSuqZAnwysLXgTwPl5xY8kq7n35ae
 iXmCnt/Vv7ypN/QRcwS+VFgqHa9Lp9aCyImMKZdNoZVJu8C8j//HONaFyVR2mFEIrfzYY+ixYrb
 nHAsJrGbNk1JWplazNUzQXe9zlw==
X-Received: by 2002:a17:906:340c:b0:9d8:27e2:4c12 with SMTP id
 c12-20020a170906340c00b009d827e24c12mr4300051ejb.63.1699880242346; 
 Mon, 13 Nov 2023 04:57:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhqSC5pNXAAfTn2Ku8ibOoV0faQFodi6FP8YDestjtCGX+ELhgazhdKJkF80CqKfD4FjEM0g==
X-Received: by 2002:a17:906:340c:b0:9d8:27e2:4c12 with SMTP id
 c12-20020a170906340c00b009d827e24c12mr4300043ejb.63.1699880241912; 
 Mon, 13 Nov 2023 04:57:21 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a1709066c8a00b009dbe08bc793sm4108212ejr.18.2023.11.13.04.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 04:57:21 -0800 (PST)
Message-ID: <45ba5373-6454-4687-b21c-46748a3a6e5d@redhat.com>
Date: Mon, 13 Nov 2023 13:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com> <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com> <ZUj0DdYZUgjhcvf5@pollux>
 <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com> <ZUkXkJ+zT7OFGosC@pollux>
 <44bc28c7-05f4-4419-5183-453c4951aac0@linux.intel.com>
 <6c536c94-7072-403c-9c63-d932252fd66b@amd.com>
 <4532d9d5-4c5a-4639-8136-d3ba9995d7b6@redhat.com>
 <1d4ca394-ee0c-4617-adbe-1d47e295c8fb@amd.com>
 <987ac707-8f9b-4e33-86c3-decdc1c48a3a@redhat.com>
 <71a50cac-3253-480f-adff-da475738ae6b@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <71a50cac-3253-480f-adff-da475738ae6b@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference
 count drm_gpuvm structures
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/13/23 08:22, Christian König wrote:
> Am 10.11.23 um 17:57 schrieb Danilo Krummrich:
>> On 11/10/23 09:50, Christian König wrote:
>>> [SNIP]
>>>>>
>>>>>>
>>>>>> Another issue Christian brought up is that something intended to be embeddable (a base class) shouldn't really have its own refcount. I think that's a valid point. If you at some point need to derive from multiple such structs each having its own refcount, things will start to get weird. One way to resolve that would be to have the driver's subclass provide get() and put() ops, and export a destructor for the base-class, rather than to have the base-class provide the refcount and a destructor  ops.
>>>>
>>>> GPUVM simply follows the same pattern we have with drm_gem_objects. And I think it makes
>>>> sense. Why would we want to embed two struct drm_gpuvm in a single driver structure?
>>>
>>> Because you need one drm_gpuvm structure for each application using the driver? Or am I missing something?
>>
>> Right, *one*, but not more than one. Wasn't that the concern? Maybe I misunderstood something. :)
> 
> Well, there is the use case of native context with XEN/KVM. In that situation QEMU opens tons of driver file descriptors on behalves of the virtual environment clients.
> 
> In this use case you have many drm_gpuvm instances for a single application. So you can't assume that you only have one VM per PID/TGID or something like that.

Well, that's fine. I think Xe can have multiple VMs per PID as well. In this case you'd keep creating driver VM structures with a single GPUVM as base class. But not multiple GPUVMs serving as base class for a single driver structure, which I thought was the concern here. For the latter I can't see a use case.

> 
> AMD already made that mistake with KFD and I strongly suggest not to repeat it :)
> 
> Regards,
> Christian.
> 


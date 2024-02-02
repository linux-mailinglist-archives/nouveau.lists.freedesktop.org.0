Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14840847609
	for <lists+nouveau@lfdr.de>; Fri,  2 Feb 2024 18:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CA310E16C;
	Fri,  2 Feb 2024 17:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SZtirSUc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71810E16C
 for <nouveau@lists.freedesktop.org>; Fri,  2 Feb 2024 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706894685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR9kxX8LamvTtOW2aP7TGdeFVn3e+6VB6fTyt9wV3EY=;
 b=SZtirSUcghvmPbKmN9dc2fwVph447U0OsocnPhrU77FhMMou/ovMOo1T1OGIYG/03jDqM5
 Zx7hxJSTYwIfj/l4yQTdHZGTbfACdxXOlJlEtrnQh+1EYMySzKUpMDFtB0v97lyLxdA2zq
 ocTnx+cInmjd/6QLilBFZxmq1WyAL24=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-w0HnoNrTNDqW37s_e-YOWw-1; Fri, 02 Feb 2024 12:24:43 -0500
X-MC-Unique: w0HnoNrTNDqW37s_e-YOWw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a34a22e09ccso108733666b.1
 for <nouveau@lists.freedesktop.org>; Fri, 02 Feb 2024 09:24:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706894682; x=1707499482;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PR9kxX8LamvTtOW2aP7TGdeFVn3e+6VB6fTyt9wV3EY=;
 b=V6J4Njon2plSDWN2AnzAXpacZegU58uH8GrFi61XVJsvwcPirWmtHtg+bQjbNFiG6j
 2HcZi+bsdBUsiNeQwqyiLMhQ8qxCBuGiQ0IFF46tFpNqWcN0x/nObnkfhJYuWiHsUsu2
 RYZfzfXa3GbGCeBCq6OtOH50k9jVBLfoddRYrxXEWnxkuLdD9F7/Gg0ov7EFMCFRz5j6
 1yH/ZlU0V22IDxn2voKO828CbGeZYLp8b1AyNEPqnwrTzNGZ8wWUN/GgVTKVRR7gwh8v
 l+ucQfLFOYJvJMMa2gsEiZpe268CaNp4+1MW/TQ9B98Wk/U1sB+gpka59JpYcYYdHAWl
 +Www==
X-Gm-Message-State: AOJu0YwhwyBH4fHbXjHVJi5p1n3TmKWF/6RJvaeg2DcqMll/GGcNT5fA
 GJzlKpZAgRi0dgqSuYiiAXtT4Es0TPw7dqjzC36Ovhl3YEtXvGCGpJ8H/g4a37I2nx2zX5IzL6d
 SjWD+7GqB9PrmcOLN0WG3jtsBac4hnhO34oBqF4SvqKbOgSI4pQmQ1I84l4xCSPM=
X-Received: by 2002:a17:907:7843:b0:a37:319a:38eb with SMTP id
 lb3-20020a170907784300b00a37319a38ebmr360102ejc.0.1706894682602; 
 Fri, 02 Feb 2024 09:24:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt8w6p84sMHOJSfZibvUkQPXI8mvCcukNAxY5GZC3AlBTh3NCHIb+7Crh8iBNkA83HESz25A==
X-Received: by 2002:a17:907:7843:b0:a37:319a:38eb with SMTP id
 lb3-20020a170907784300b00a37319a38ebmr360092ejc.0.1706894682352; 
 Fri, 02 Feb 2024 09:24:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWTL2A4x27iGLnCsksvK2YWnZzEynpuvQY4pY4zMtAU/KvmFzdEHdRNGrci8xKvfz4pYUOtv2L3zaYuW3bbFzhnfgyrjirMTbQIXYPu0e00t/Bruvn+DvarNJ6gavm75H++Z+dI3mKfqB8Wru0myGHuVP27c8HNiDXxoE9RtsfQ87LDr2/c7Q==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a37116e2885sm712133ejd.84.2024.02.02.09.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 09:24:41 -0800 (PST)
Message-ID: <57c944d6-153b-480c-88b9-14fdcecaec50@redhat.com>
Date: Fri, 2 Feb 2024 18:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kherbst@redhat.com" <kherbst@redhat.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "airlied@gmail.com"
 <airlied@gmail.com>
References: <20240202000606.3526-1-dakr@redhat.com>
 <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2/2/24 18:14, Timur Tabi wrote:
> On Fri, 2024-02-02 at 01:05 +0100, Danilo Krummrich wrote:
>> nouveau_abi16_ioctl_channel_alloc() and nouveau_cli_init() simply call
>> their corresponding *_fini() counterpart. This can lead to
>> nouveau_sched_fini() being called without struct nouveau_sched ever
>> being initialized in the first place.
> 
> Thanks, I've confirmed that these patches do fix the problem

Cool, gonna add your 'Tested-by' then.

- Danilo
  


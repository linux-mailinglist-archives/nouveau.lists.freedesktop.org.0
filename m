Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75999845D63
	for <lists+nouveau@lfdr.de>; Thu,  1 Feb 2024 17:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C329710F1FA;
	Thu,  1 Feb 2024 16:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FdTsqJsG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740B610F1F9
 for <nouveau@lists.freedesktop.org>; Thu,  1 Feb 2024 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706805358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tueqlGr+RGqjhlry8Af5ashVwklsbO6S9+HD5EnfRrc=;
 b=FdTsqJsGfRZxUYlBCf3ST6U3CqcXL5MofyBbFUWosmTRGiYppDLW9pT8Ebx/bbIYKAs0bZ
 YZMO/hABBDhbSs0yXNZm3lYHmV74SqTOBOtH+dnw71pBjQArRTVIaPZ8ZaX0CgVvXsGpd8
 cpfxJKcVD7UzI//YiW+oxqY/C8x5kuM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-5d0Ypi3pO2mIW5RdNlQBkg-1; Thu, 01 Feb 2024 11:35:54 -0500
X-MC-Unique: 5d0Ypi3pO2mIW5RdNlQBkg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a2f71c83b7eso70750466b.1
 for <nouveau@lists.freedesktop.org>; Thu, 01 Feb 2024 08:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706805353; x=1707410153;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tueqlGr+RGqjhlry8Af5ashVwklsbO6S9+HD5EnfRrc=;
 b=SMOQOjJqi0FbbA3CzQ8vfGwK/UxRz8KgiCE0wmASco716ql2PTJsF0o4+aml9ITEYf
 0WbjuCClNaeJwKuDpGya4w4y1bvUUNpfeAxzGGtm93cNvY6+mjPw51TKqnGk0+O/caBm
 6iZzICzkhldv0B38sAH7obHNNdQO5DdWt8undb5ChEbBsXffn5fiOjmC4lV3WmoOY96n
 bHPbud8wO7DnmWiDyXXx+pz2RT3TVjFD86f9cCl3WiJseVC7UC7O0437+PYPf8sCJBdA
 CfItq3P8ThUXqmYsjlFqtWP6Y2T/LR7ch/J+Tm+Ap6DH03QAGu4u4h2/00El4DFAJFh0
 0NcA==
X-Gm-Message-State: AOJu0YxtcbwawG+S15sELqv4x1LQnq16xFwK2Vb3oVobBY0BeQIScYkO
 +qdYfiIaHBdt4hd9KKtrRxHWRjC43srU3aHoxM/GWIip/pUrzyqx3n3tFNLNVja0B/tPqF+Y6ys
 zDkHAi5nJeRfr1qG/J0C7/APBffSLRbAEdp/EFx+yVbm1kX+5I28JMkKT2a8WN/A=
X-Received: by 2002:a17:906:22cb:b0:a2b:1fb1:ed8a with SMTP id
 q11-20020a17090622cb00b00a2b1fb1ed8amr1977188eja.36.1706805353104; 
 Thu, 01 Feb 2024 08:35:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdAoZ1ETEoBe23Agfew6golQZD5ARsVzZybp9qyHYd0dUjd5JQG2fJvpbwyFmez3S+9+ATzQ==
X-Received: by 2002:a17:906:22cb:b0:a2b:1fb1:ed8a with SMTP id
 q11-20020a17090622cb00b00a2b1fb1ed8amr1977179eja.36.1706805352838; 
 Thu, 01 Feb 2024 08:35:52 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU2hzU7zMvcS4rERiNMeHYAQUUO9otoTbSIAal+12pCStiZ8ydqxYQA22aQ8bgACZ6GMBxgfWU+b//+gkXtLw6U5BnQ/M95ZcBt/zTHxA==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 tl7-20020a170907c30700b00a358b6242fcsm5187183ejc.114.2024.02.01.08.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 08:35:52 -0800 (PST)
Message-ID: <3cf2e6eb-07c2-4d85-8141-79568e78d8c9@redhat.com>
Date: Thu, 1 Feb 2024 17:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: nouveau_sched_fini() should check for init
 failure
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20240131213917.1545604-1-ttabi@nvidia.com>
 <cf79b780-2add-438e-aac0-e29b08799314@redhat.com>
 <036b1f1d704d02b2681a366f70ad93bf3143e8d0.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <036b1f1d704d02b2681a366f70ad93bf3143e8d0.camel@nvidia.com>
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

On 2/1/24 17:20, Timur Tabi wrote:
> On Thu, 2024-02-01 at 13:58 +0100, Danilo Krummrich wrote:
>> I wonder if we should allocate struct nouveau_sched dynamically instead and
>> just
>> check for NULL in the corresponding *_fini() functions.
>>
>> Actually, in nouveau_abi16_ioctl_channel_alloc() we can omit creating a
>> scheduler
>> instance entirely if !nouveau_cli_uvmm().
> 
> I am all for a better solution if you can think of one.  I don't really like
> the idea of "bool initialized", but I couldn't think of a more reliable test.

Yeah, it's not really ideal that there is a single error path calling the
corresponding *_fini() in nouveau_abi16_ioctl_channel_alloc() and
nouveau_cli_init() only. Maybe this can be re-worked to only reverse what has
actually been done already.

However, I'd probably not do that for -fixes. Maybe we should go with the dynamic
allocation and a NULL check for now.

Do you want to send another patch? Otherwise I can also come up with something and
add your Reported-by.

- Danilo

> 
> 


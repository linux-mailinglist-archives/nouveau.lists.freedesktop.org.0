Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07D8B76B5
	for <lists+nouveau@lfdr.de>; Tue, 30 Apr 2024 15:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906310F613;
	Tue, 30 Apr 2024 13:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="elv7G6R/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC4D10F48C
 for <nouveau@lists.freedesktop.org>; Tue, 30 Apr 2024 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714482918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lc07mIYcskfJD6gmXNvynk5dUWHpLlMvh2bKKxgUtE=;
 b=elv7G6R/p9YNE6AADC6kP/Euhz85AGJ47N39+JOWkE3ROqde8d8l4xm1qNS5kUHaSjpsh1
 eH6rnjVSEwk5w7VGti9C0GyS7LM6vxnwOki6oMGfRPgN/k2NJbBjBChkYmk8mUPlXwKD9r
 l3rTzOV57/wtRaM3EVUB8+L8+8/Qbx0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-78u2Piv1O5exB9sm6aAQ1Q-1; Tue, 30 Apr 2024 09:15:16 -0400
X-MC-Unique: 78u2Piv1O5exB9sm6aAQ1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-41681022d82so25377375e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 30 Apr 2024 06:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714482915; x=1715087715;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lc07mIYcskfJD6gmXNvynk5dUWHpLlMvh2bKKxgUtE=;
 b=tD87bBQfQvRcIgeIZ9LW7BXD5eXJB731vOkyQzZZMoN2+jVWFFTK4c+6Ea2BycAPay
 5xhfEtRKjoUda0gikLhWA+O4kgWPwME4jSl3NZnBLLRLgHIjfEO+8DHMJrZmpZCG2AB9
 ZqAgpoUF08ZTvQOMKIRaaS9hAmIeIJX57SEXEhkxE2yh7ztWMJ5PTwfZo7WsijGi+4XM
 /ujzQtID0XTB3sfvhiv3tb+z/iGoz3r1iMYloCqFVokAHa492qW11BXel6pDghuL7q5F
 tQ0BnVTd37TQHpjR4HysAZxhXiLc+XOlgbE7OH1oYL4TphulWKl8T9mDL5ZSMTIlSMLk
 4LYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQq3eRgovleDdDYG260dJKeBBwcvCK15cO6RHRHQ/YwfnyyINLMN3C35XCHgazxla9goSTNJxZVV8yfnxdHccrhQCVY0Rxgp9Nrqh72g==
X-Gm-Message-State: AOJu0YyEiXLWfzrixv2V2lsV427XcWekAvDRi8nStc3HzOY0sVn+U04p
 x9MOqpx3k797rj5K63SqvCmMgxbVknxsmvLTNgPcCWZmRqvjKBe8G00QXaZhzkcVwplbCVVxSuH
 5SHB/J+H/rxuAqh31shV0BrGQtaZKkOQputv/Hl86h2HD3E5/6Skz5ARmMbSOWpE=
X-Received: by 2002:a05:600c:45ca:b0:418:e6fc:3708 with SMTP id
 s10-20020a05600c45ca00b00418e6fc3708mr10319801wmo.24.1714482915266; 
 Tue, 30 Apr 2024 06:15:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ5/5+7+gSf8MNd12lRRU2c1txGOMK5iIFL6Awsfwq4VI/aYibKkB5lPplwQgJd8+1F8dxmA==
X-Received: by 2002:a05:600c:45ca:b0:418:e6fc:3708 with SMTP id
 s10-20020a05600c45ca00b00418e6fc3708mr10319786wmo.24.1714482914922; 
 Tue, 30 Apr 2024 06:15:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0041c012ca327sm10523076wmq.45.2024.04.30.06.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 06:15:14 -0700 (PDT)
Message-ID: <59308970-b85a-4f09-a047-146bb24ffcb0@redhat.com>
Date: Tue, 30 Apr 2024 15:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
To: Timur Tabi <ttabi@nvidia.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 chaitanya.kumar.borah@intel.com, dri-devel@lists.freedesktop.org
References: <20240417215317.3490856-1-ttabi@nvidia.com>
 <162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com>
 <913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com>
 <5df03f8d-7835-4a90-b8fa-d20bd05e62fc@redhat.com>
 <wuoxhpvhh7pzmniv5clkr3756fjrqyukahw63ugbljte72o5gq@fdc3wpcasimh>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <wuoxhpvhh7pzmniv5clkr3756fjrqyukahw63ugbljte72o5gq@fdc3wpcasimh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 4/30/24 15:06, Lucas De Marchi wrote:
> On Fri, Apr 26, 2024 at 06:08:19PM GMT, Danilo Krummrich wrote:
>> On 4/25/24 18:38, Timur Tabi wrote:
>>> On Thu, 2024-04-25 at 15:22 +0200, Danilo Krummrich wrote:
>>>>> +        size_t length;
>>>>> +
>>>>> +        /* Remove any whitespace from the parameter string */
>>>>> +        length = strip(p, " \t\n");
>>>>
>>>> With that, I see the following warning compiling this patch.
>>>>
>>>> warning: variable ‘length’ set but not used [-Wunused-but-set-variable]
>>>>
>>>> Did you intend to use the length for anything?
>>>
>>> No, and I could have sworn I fixed that before sending out v7.  I think I
>>> originally intended 'length' to determine when I finished parsing the
>>> string.
>>>
>>>> Also, looking at the warning made me aware of 'p' potentially being NULL.
>>>>
>>>> If you agree, I can fix the warning and add the corresponding NULL check
>>>> when
>>>> applying the patch.
>>>
>>> Yes, that would be great.  You can just delete 'length'.  The NULL check for
>>> 'p' should call clean_registry() before returning -ENOMEM.
>>
>> Applied to drm-misc-next, thanks!
> 
> 
> since this commit our CI is failing to build with the following error:
> 
>        CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
>      ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function ‘build_registry’:
>      ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at end of compound statement
>      1266 |   default:
>            |   ^~~~~~~
>        CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
>        HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
>        CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
>      make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
>      make[7]: *** Waiting for unfinished jobs....
> 
> you are missing a `break;` after that default.

@Timur, do you want to send a quick fix for this yourself? Otherwise, I can send
one as well.

We should fix this asap.

- Danilo

> 
> 
>>
>>>
>>> Thanks for catching this.
>>
> 


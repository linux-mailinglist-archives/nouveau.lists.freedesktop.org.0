Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AB58B3C6F
	for <lists+nouveau@lfdr.de>; Fri, 26 Apr 2024 18:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7DE10E3DA;
	Fri, 26 Apr 2024 16:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MF0zb0Mc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712A310E3DA
 for <nouveau@lists.freedesktop.org>; Fri, 26 Apr 2024 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714147704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwfQiLbi1pzZKqmW1K0qCRjxzpkqwWMkFjXVAf0jJbQ=;
 b=MF0zb0MckZVuKmQqdTte2lfnW7rV3KpNxR/gwy2PbYTvlZfhVIadlLibt9ytSPyLsEG8nx
 EJqnNZzIgvsw6NUDe5tkyibIbQ9KNxEwKHJ0lxDXa82LtJQhtnxNZ0GovNKXKePvZGKgZ5
 xaOsN/tIoYeTEg1fFTB4SF16EI2eYNw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-EA1bF_bvMqaN3cEZ2gEZ9Q-1; Fri, 26 Apr 2024 12:08:23 -0400
X-MC-Unique: EA1bF_bvMqaN3cEZ2gEZ9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-41aa1bbddadso9597335e9.0
 for <nouveau@lists.freedesktop.org>; Fri, 26 Apr 2024 09:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714147702; x=1714752502;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwfQiLbi1pzZKqmW1K0qCRjxzpkqwWMkFjXVAf0jJbQ=;
 b=nSGpPXf+sDoVt3CcV3SghVqBybb4Mfzi7nuuqxoJcfTWmFYpuGY/PvdCH17A2fzh7o
 Eaj4elBvBmVG5YNJq+1L+uwxxIjZs1pXD0oM9Bl22rVEcE1Teb8fQTjE9NDYd3qzzwRi
 FmiAED9S8WfIxPE1aH9KOEbBJcKBD2WrUiDgjqRu11lhEjY7UdzcVckwnnFn2aYBZwzL
 faxxPdHPOLajdKYYX1ZVJHV5A6SyngUiwJlO4pPVqL4q8GxGdcuW6t7VfLAPOBFtKdlL
 1+XD8Vi+HrT+b+ZjpA3MQluolI43ppm/FvAlK+6nD0fT0haT8Ac6jjb2gz5BwL4pXJ1L
 1vIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpM2y52QsPBUlXMJ7eiSSwA5KBWVym281Q9TprmAc4nk3sK3emTp++mPHi+Q0T5ZQFAC5GFY7o4U0Acez0l4w3fNi4oOhihba0VZzSzg==
X-Gm-Message-State: AOJu0YwD9izmz3lLmWwrroIMVIiVzUg8N/EITAUv9dO0hNtJTgQI40sm
 E2W6G7LdqobkXO/XVBXYWHSI9y11cN8nzJcLaFN5e3zYfSKdA0uVxdvzi/sfAsFvnWB+EcD1WsR
 nXzg6b+U6K5WDYr2IktFAZBfGtXKtnD/iQLEeIn5uAABTK5KbiWbd0Hivzg8I/hE=
X-Received: by 2002:a05:600c:35d4:b0:41a:4819:ebf4 with SMTP id
 r20-20020a05600c35d400b0041a4819ebf4mr3097858wmq.39.1714147701857; 
 Fri, 26 Apr 2024 09:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy7d5GZx8GcXhyXKZbewGFOItmC+Tp+SpuAdpojAZEzp62gc1C085rp8nNBoFjoTw6vjrZgw==
X-Received: by 2002:a05:600c:35d4:b0:41a:4819:ebf4 with SMTP id
 r20-20020a05600c35d400b0041a4819ebf4mr3097844wmq.39.1714147701536; 
 Fri, 26 Apr 2024 09:08:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b00419f7b73c55sm23120148wmq.0.2024.04.26.09.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 09:08:20 -0700 (PDT)
Message-ID: <5df03f8d-7835-4a90-b8fa-d20bd05e62fc@redhat.com>
Date: Fri, 26 Apr 2024 18:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20240417215317.3490856-1-ttabi@nvidia.com>
 <162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com>
 <913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com>
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

On 4/25/24 18:38, Timur Tabi wrote:
> On Thu, 2024-04-25 at 15:22 +0200, Danilo Krummrich wrote:
>>> +		size_t length;
>>> +
>>> +		/* Remove any whitespace from the parameter string */
>>> +		length = strip(p, " \t\n");
>>
>> With that, I see the following warning compiling this patch.
>>
>> warning: variable ‘length’ set but not used [-Wunused-but-set-variable]
>>
>> Did you intend to use the length for anything?
> 
> No, and I could have sworn I fixed that before sending out v7.  I think I
> originally intended 'length' to determine when I finished parsing the
> string.
> 
>> Also, looking at the warning made me aware of 'p' potentially being NULL.
>>
>> If you agree, I can fix the warning and add the corresponding NULL check
>> when
>> applying the patch.
> 
> Yes, that would be great.  You can just delete 'length'.  The NULL check for
> 'p' should call clean_registry() before returning -ENOMEM.

Applied to drm-misc-next, thanks!

> 
> Thanks for catching this.


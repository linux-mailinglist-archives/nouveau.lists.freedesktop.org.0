Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54183775A
	for <lists+nouveau@lfdr.de>; Tue, 23 Jan 2024 00:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E021D10F0E8;
	Mon, 22 Jan 2024 23:04:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A2F10F0E8
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jan 2024 23:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705964668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7c3FgscPu0lXJFm3GTXyVD6XcnpcGhNdTIze30CTggI=;
 b=GYrB/epGPdEDDORJ9eq/thNRIr2OB+pECdR0KORkAh4SJX6seMGoFmDC1Bf1u3h0W1HNFI
 herYPRxBR4QJyJGLBHbKVeRrnDRv6z0tiKV5zLRaDVu9qALibLGlKXTI5vo3JFInhd/JGe
 Ykc1ePF3ttD3zv2DOml59rdZ1XUyZ94=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-0rL9FjvaN_K92puiWpH8Ug-1; Mon, 22 Jan 2024 18:04:26 -0500
X-MC-Unique: 0rL9FjvaN_K92puiWpH8Ug-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e74860cb0so15686665e9.3
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jan 2024 15:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705964665; x=1706569465;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7c3FgscPu0lXJFm3GTXyVD6XcnpcGhNdTIze30CTggI=;
 b=wdaebfW4m3T5pRDowK9o93OYZ4u1DzVtALHTR2AtdP89ooE8iS0lXY92mD/q2l0DuT
 7MTiGiqb55k+CP4NDT/8wbLvKWl4F+VJbwzoYPU3T2kq+OSWc6rp45fqALMMFNwJYUIr
 C8NF1LlGAii3Pq7NeVowe92lNV4YDjvh6bO4pdOHrexQnC8N3s7bUTc821Jq1vywxUXe
 Mt3SpsCdWIIEmw64NKOaDEShCwNO1nCpnzcGxNw0z46b+/+kTloV9sq4guNL3nIRhbSF
 Lv6AVzFPdbloDD25b39DA+QBvpQ5HN8ANxKT2bqVaxrdRFHaEP7XQzk65MjrxZjdyLiN
 +aXQ==
X-Gm-Message-State: AOJu0YwYCxPE+oTseAeAPArhqRZEi/H+Ppc2IaBmZDM1Z8Ubymx9/mOP
 vioAGN767pJERwjUnpvKANCnyYhhVYJTXO76DPgO9Dhfl+A6OeLDFqMSiaJ56YamIcn7bTYtdzS
 Vb9VTVYdC2k1vQG/AR3sULeEZs5dBc8u9QWSaJYsFGvph23JuSs7nmip+yR4/p9g=
X-Received: by 2002:a05:600c:19d0:b0:40e:47f5:c74e with SMTP id
 u16-20020a05600c19d000b0040e47f5c74emr2213230wmq.23.1705964665582; 
 Mon, 22 Jan 2024 15:04:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8352cOmaMtQLEHn07VgcDYdo9jNcXTeLbFnRyNs5Xa66msABsScIDJEFKORTq82yXMRla/w==
X-Received: by 2002:a05:600c:19d0:b0:40e:47f5:c74e with SMTP id
 u16-20020a05600c19d000b0040e47f5c74emr2213221wmq.23.1705964665204; 
 Mon, 22 Jan 2024 15:04:25 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040d7b340e07sm40645479wmq.45.2024.01.22.15.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 15:04:24 -0800 (PST)
Message-ID: <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>
Date: Tue, 23 Jan 2024 00:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Colin Ian King <colin.i.king@gmail.com>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
 <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/16/24 13:31, Dan Carpenter wrote:
> On Tue, Jan 16, 2024 at 11:16:09AM +0000, Colin Ian King wrote:
>> The variable ret is being assigned a value but it isn't being
>> read afterwards. The assignment is redundant and so ret can be
>> removed.
>>
>> Cleans up clang scan build warning:
>> warning: Although the value stored to 'ret' is used in the enclosing
>> expression, the value is never actually read from 'ret'
>> [deadcode.DeadStores]
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   drivers/gpu/drm/nouveau/nvif/fifo.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
>> index a463289962b2..e96de14ce87e 100644
>> --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
>> +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
>> @@ -73,9 +73,9 @@ u64
>>   nvif_fifo_runlist(struct nvif_device *device, u64 engine)
>>   {
>>   	u64 runm = 0;
>> -	int ret, i;
>> +	int i;
>>   
>> -	if ((ret = nvif_fifo_runlists(device)))
>> +	if (nvif_fifo_runlists(device))
>>   		return runm;
> 
> Could we return a literal zero here?  Otherwise, I'm surprised this
> doesn't trigger a static checker warning.

Why do you think so? Conditionally, runm is used later on as well. I don't
think the checker should complain about keeping the value single source.

If you agree, want to offer your RB?

- Danilo

> 
> regards,
> dan carpenter
> 


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41651885CD3
	for <lists+nouveau@lfdr.de>; Thu, 21 Mar 2024 17:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C01810ED24;
	Thu, 21 Mar 2024 16:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MvnyzV5S";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47310ED52
 for <nouveau@lists.freedesktop.org>; Thu, 21 Mar 2024 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711036836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pA4bDQzJgQc55/Q1qXyy9IrKql1wmAKmErZ20EpE948=;
 b=MvnyzV5SdN9lOVMz5YdJQP14Jd5nBYSNXqYO0hQTopm4nZhu1hXE1mPeqk8uuQ8WX5WjXM
 PjORDEQByXI4sL5NqVO0lmS1862iORT0e7gv7wt/R4emLjAXou2WFCZu0g7mFRfjn7mjq+
 t85SGbZ5CsbmCDHS8elr/Da/h/KGbmo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-YtC7lqfkMQa0jzmfui33iw-1; Thu, 21 Mar 2024 12:00:34 -0400
X-MC-Unique: YtC7lqfkMQa0jzmfui33iw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a4715d8c761so46244166b.1
 for <nouveau@lists.freedesktop.org>; Thu, 21 Mar 2024 09:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711036833; x=1711641633;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pA4bDQzJgQc55/Q1qXyy9IrKql1wmAKmErZ20EpE948=;
 b=eswdBVp0g4fErH5WaRfl5XKhMUVomq4bqeR//t6MKtx1/r5MzjmLAhtF41a29cpN7g
 oqdbRW/tTulwTMqGXKx6XhwJklYDIVLS1ur88KDOgjmMP/UtJnPHS2XSKhRWbW4yqNca
 ilLlT8H2h4J6NhCtq3rYWGNotnNvbEDobDODQrYDFF3TdMWe3+1MQ7l+uJ+XhEmIBzH+
 dnRPuH3C5ijVEn6jVCH/0lq1pN7cKVGLZkmLs6lADeOWGmrOQQeLWTjIfDJ04B2qaP3P
 I7rNtwE9tvUWHZbuk+BJVAJjxc55rFy5PzsizGmhLNeyyP2TansxSGK4+TI9OqPZcpKW
 WKaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNuqSbwlQxtLZvbfoLc1OUzho74fM+X2zDw13KpNt1t8IgTl2kx4BxPiF5PYppJZRHogTB0OeZIYoydX7TyJWoLkKlqNwB3/g8aCvREw==
X-Gm-Message-State: AOJu0YwLaG60//vhSEABPB2IjFXT0sdlRwT3bkqipP41hYmO4Xx6Ssmt
 HFFiLzDaXOxIEdJNuT8Kh2QBv7Z3gGA9UsihalRei56adGEnqhlY3mUV950q3JekKVBSOGTd4uq
 VYffXAEU86VR0vOoF3FmMSi4TU6FZ6SKqdCR4jGcAQnzIbHFjpvjKHUgqUTGIP5I=
X-Received: by 2002:a17:906:2349:b0:a47:e62:4d72 with SMTP id
 m9-20020a170906234900b00a470e624d72mr1440099eja.15.1711036833380; 
 Thu, 21 Mar 2024 09:00:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCl5KuLjS7xRKsaXBzYt1KO2iysY/Flvmf0e9AVJsMtbx+ck9FXPfY3IJWXYYE7zJIka1LBw==
X-Received: by 2002:a17:906:2349:b0:a47:e62:4d72 with SMTP id
 m9-20020a170906234900b00a470e624d72mr1440084eja.15.1711036833062; 
 Thu, 21 Mar 2024 09:00:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a1709062c4600b00a469604c464sm55774ejh.160.2024.03.21.09.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 09:00:32 -0700 (PDT)
Message-ID: <250692ec-db4a-4e2a-b473-31b0a88035dd@redhat.com>
Date: Thu, 21 Mar 2024 17:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v4] nouveau: add command-line GSP-RM registry support
To: Timur Tabi <ttabi@nvidia.com>, "airlied@redhat.com" <airlied@redhat.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
References: <20240220215805.3201094-1-ttabi@nvidia.com>
 <7eb28bbf-76aa-4f97-b426-f0d87c4d2d7a@redhat.com>
 <6b4a8006471041a96d41f10010c7b192a69ab620.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <6b4a8006471041a96d41f10010c7b192a69ab620.camel@nvidia.com>
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

On 3/21/24 00:27, Timur Tabi wrote:
> On Mon, 2024-03-04 at 13:57 +0100, Danilo Krummrich wrote:
>>
>> Thanks for sending a new version of the patch.
>>
>> Please make sure that for future patches you include a changelog, such that
>> it's easier for reviewers to keep track of what has changed.
> 
> Will do.
> 
>>>    .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   6 +
>>>    .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 375 ++++++++++++++++--
>>>    2 files changed, 357 insertions(+), 24 deletions(-)
>>
>> There are a few issues pointed out by checkpatch.pl, that I think should be fixed.
> 
> checkpatch showed me nothing:
> 
> $ scripts/checkpatch.pl 0001-v4-nouveau-add-command-line-GSP-RM-registry-
> support.patch
> total: 0 errors, 0 warnings, 420 lines checked
> 
> 0001-v4-nouveau-add-command-line-GSP-RM-registry-support.patch has no
> obvious style problems and is ready for submission.

I used '--strict'. I think we should get the kmalloc(), the blank lines and the
alignment ones fixed.

- Danilo


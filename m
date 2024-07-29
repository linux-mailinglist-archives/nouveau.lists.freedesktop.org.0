Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B194018A
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2024 01:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829C810E3AF;
	Mon, 29 Jul 2024 23:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EdknhOzl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286B710E3AF
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2024 23:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722294635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBz1d/TO5Ih/08nY4czabqXU7p2T0GWl9zrDSZGPyqY=;
 b=EdknhOzlReixCIFjAl3sasNwD1Pr5c5FAOmtVdeEgU1PFpvfY3mUBdQVSV4PQamMMEbv4g
 XrLUiXCJF5jtF/gGHykg/GceeN46TKdm7PBETVlyMrsQL9WunfaMPBxeOzFNBQJG8ETC//
 DNfyCghtzBdAQ89bNevelLY7ahdh5CU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-Nw7ks0rROS2vBRjjESXoKQ-1; Mon, 29 Jul 2024 19:10:33 -0400
X-MC-Unique: Nw7ks0rROS2vBRjjESXoKQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-427ffa0c9c7so29991765e9.1
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2024 16:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722294632; x=1722899432;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dBz1d/TO5Ih/08nY4czabqXU7p2T0GWl9zrDSZGPyqY=;
 b=YW+68S+r+3ugEXhnzbe+xFceqyITD/Gnd8SQR0kQ/UQlPeO/6QPSkJds6fzKnVOI5T
 7VFM5N8fBmc4XIgi4GBHaAWwtHpSmOLdqYbK6Ecf0Jrxeu2+STlQYt5GApWlwN6ZR7VJ
 aUBIHTmFmOLQHMCwNV7/sHmlocokbmGD7vi+cMJ9n/60E7wIbQHNLLHw/dPXD4VEdLnK
 ArU403/ojyt6InL1Hfp+8AoIlGLl5gsYoit7s5TD2ah0bLXKGCv7ONelrgGfc8cP3YEG
 8G6ksxTa5ZjuSls3Ac47mb2NzZSr3SIqxX52onZ0VnVOzqMCkgnynTcDwCUAfKgnaaRN
 4YUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXvSemcgzX2byQ0N40Z5JArND7uKLDmg+laJVn2s9i8+h6UGSeJcg/2eI9FXF1arUb24ejpenpFVO5Ffm4eYZ/whVf5uLn26GsXKop2w==
X-Gm-Message-State: AOJu0YxfYHnm2AioQJUfQEdd5gwF6QbK7IwvIgpKTN34P046uNGjWOGB
 CJE5KM9uJSlj37M2d3YINN7CUUoylx21Zmguo6xZL2At814kFG1O3Y3GnraMJg2oshviVSz4W9f
 ndixcLo6E6qRUppX5gOlWHgayPIWMOiqlBf+wqHk/AT00WhNCHJA65RTTqvP1smk=
X-Received: by 2002:a05:600c:6c8a:b0:426:63f1:9a1b with SMTP id
 5b1f17b1804b1-42811e0b6femr78420965e9.33.1722294632532; 
 Mon, 29 Jul 2024 16:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRTBqrhfu6ngt519x475xnIE5G6u5F+9DzO/0dg7rIO3kRSfTgIzX4TMORiEijzOp3Q1b8ww==
X-Received: by 2002:a05:600c:6c8a:b0:426:63f1:9a1b with SMTP id
 5b1f17b1804b1-42811e0b6femr78420815e9.33.1722294632026; 
 Mon, 29 Jul 2024 16:10:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281a936944sm66787105e9.31.2024.07.29.16.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 16:10:31 -0700 (PDT)
Message-ID: <568a9a8c-e907-479a-80ef-7dfc1c81c1a6@redhat.com>
Date: Tue, 30 Jul 2024 01:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in
 nvkm_gsp_mem object
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>
References: <20240729230720.1305760-1-ttabi@nvidia.com>
 <749743ec8a8d0261dab066af0828a59dcbbb13be.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <749743ec8a8d0261dab066af0828a59dcbbb13be.camel@nvidia.com>
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

On 7/30/24 1:09 AM, Timur Tabi wrote:
> On Mon, 2024-07-29 at 18:07 -0500, Timur Tabi wrote:
>> Store the struct device pointer used to allocate the DMA buffer in
>> the nvkm_gsp_mem object.  This allows nvkm_gsp_mem_dtor() to release
>> the buffer without needing the nvkm_gsp.  This is needed so that
>> we can retain DMA buffers even after the nvkm_gsp object is deleted.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com  <mailto:ttabi@nvidia.com>>
>>
>> v2:
>> added get/put_device calls
> 
> Ugh, I forgot to move this to under the ---

No worries. I can remove when I apply the patch.

- Danilo


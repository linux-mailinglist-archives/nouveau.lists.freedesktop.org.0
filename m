Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17A769CF87
	for <lists+nouveau@lfdr.de>; Mon, 20 Feb 2023 15:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64B910E0F7;
	Mon, 20 Feb 2023 14:38:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A210E108
 for <nouveau@lists.freedesktop.org>; Mon, 20 Feb 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676903899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZooPx0J4FahhlqcFr0VVGzJP8CK2Lifinz64+tcHuxs=;
 b=FmJjSnvqrAMUAk5uUlffMYY+ktnL01a+8f4LUF1L5BIAVg7Bof9WsKyvE4xXY7U7oH+1tW
 PeQ8CeyKXZPhdWs2FZXqBBUg77gZaNulD4u3dTeZr1gAAb0Uwsz4mnz+DvZMdyysGZ6jP3
 /L+3MLXK8MUHg5fNcQPVUf/ZsWqmSlE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-539-x-e9EAINN-yrQkOopAoajQ-1; Mon, 20 Feb 2023 09:38:17 -0500
X-MC-Unique: x-e9EAINN-yrQkOopAoajQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so1802606edc.9
 for <nouveau@lists.freedesktop.org>; Mon, 20 Feb 2023 06:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZooPx0J4FahhlqcFr0VVGzJP8CK2Lifinz64+tcHuxs=;
 b=R2VeM/T7w1zPZilrj60ZC6PLTNdz5XSQEsWWxz33MGzZ/yGTBt533qjmlBnkrQ5wGZ
 jt85H3pA+IvlevnqvO8KeQ8HIcYNhwmxDKAd5cH9Ej0pf37wWwcFBy3b7KpThfz9VYOp
 I6CVTUMnVGgKkV0LQNQYg9Kzme/q0U3F5OqqqtKN6GkuZwBtpKvNKbecYJ9T/0ELnYFN
 xErHM5w2DOvlwRYVTLA1iifX8XVeerNKnnUP/SxgVzhr9nFHm9YO9iWE304CKnO4lKne
 DCcHt9uRTAaLQNAZTiEb9eqni7ZFqptYeN3EOCMX1ewxqKMiDwz+Po5KA+xmZ/pO3ivR
 1TAg==
X-Gm-Message-State: AO0yUKXjp3Gqoz2cDDTg8s+3+IpH7YolctBZcRO/PIx0j4YQhJ+kP2YL
 MEKsjMYPF8Hu4WsOIayOnU6v+ropDITFhxl33gGWkUbf4aidiHG42Rbj8k+fmmDpeFcwaG7+S6F
 kDOl+BxVNY0e+fKkJqjcY7OG8yw==
X-Received: by 2002:a17:907:c10:b0:87b:da74:d272 with SMTP id
 ga16-20020a1709070c1000b0087bda74d272mr11177680ejc.45.1676903896717; 
 Mon, 20 Feb 2023 06:38:16 -0800 (PST)
X-Google-Smtp-Source: AK7set890fgad0EenmfhXcAtdl+hYlW2r/ANHXfflzV6RWOHKEQ6317uyFhrXsZ5SSZOJN3kSOCx5Q==
X-Received: by 2002:a17:907:c10:b0:87b:da74:d272 with SMTP id
 ga16-20020a1709070c1000b0087bda74d272mr11177652ejc.45.1676903896465; 
 Mon, 20 Feb 2023 06:38:16 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 kj8-20020a170907764800b008c0b8dd4cbdsm3118420ejc.112.2023.02.20.06.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:38:15 -0800 (PST)
Message-ID: <e4244345-962d-1175-6ee3-a55083389437@redhat.com>
Date: Mon, 20 Feb 2023 14:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Matthew Wilcox <willy@infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-4-dakr@redhat.com>
 <Y+/ZW/8WXzrkQnUT@casper.infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y+/ZW/8WXzrkQnUT@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-next v2 03/16] maple_tree: split up
 MA_STATE() macro
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
Cc: matthew.brost@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 corbet@lwn.net, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 linux-mm@kvack.org, alexdeucher@gmail.com, boris.brezillon@collabora.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2/17/23 20:45, Matthew Wilcox wrote:
> On Fri, Feb 17, 2023 at 02:44:09PM +0100, Danilo Krummrich wrote:
>> \#define SAMPLE_ITER(name, __mgr) \
>> 	struct sample_iter name = { \
>> 		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),
> 
> This is usually called MA_STATE_INIT()

Yep, that's better.

> 
>> #define sample_iter_for_each_range(it__, start__, end__) \
>> 	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
>> 	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))
> 
> This is a bad iterator design.  It's usually best to do this:
> 
> 	struct sample *sample;
> 	SAMPLE_ITERATOR(si, min);
> 
> 	sample_iter_for_each(&si, sample, max) {
> 		frob(mgr, sample);
> 	}
> 


The reason why I don't set index (and max) within SAMPLE_ITER() is that 
the range to iterate might not yet be known at that time, so I thought 
it could just be set in sample_iter_for_each_range().

However, I see that this might prevail users to assume that it's safe to 
iterate a range based on the same iterator instance multiple times 
though. Instead users should maybe move the tree walk to another 
function once the range is known.

The reason for the payload structure to be part of the iterator is that 
I have two maple trees in the GPUVA manager and hence two different 
payload types. Within the iterator structure they're just within a union 
allowing me to implement the tree walk macro just once rather than twice.

Anyway, I feel like your approach looks cleaner, hence I'll change it.

> I don't mind splitting apart MA_STATE_INIT from MA_STATE, and if you
> do that, we can also use it in VMA_ITERATOR.
> 


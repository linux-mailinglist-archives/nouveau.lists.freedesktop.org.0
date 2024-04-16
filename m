Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E8C8AB17B
	for <lists+nouveau@lfdr.de>; Fri, 19 Apr 2024 17:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537EB10EEA1;
	Fri, 19 Apr 2024 15:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NHk4v9GS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F313D112782
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713303441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyR66O5KebHaLN8ijHptmbQtlcZeugRZ6bv0WwQzUvY=;
 b=NHk4v9GSgpvCZ+whQeaNkkKPH6qgWZmMqe4fOlZjBwYzdRu0w6g+HuCypXc5AIUnw4CB2k
 Lk+XWUZbCtS4QQ0mVLW4v+cfGXIcVH5vNaWGBEJ/fH9gaUapxQRjbAlIDb+/nWf0bpzLgf
 hXRsJdHkB1jqvvmUwGLEeimsp+h9vHw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-h02MMf90N2u8cw1yUxAv3A-1; Tue, 16 Apr 2024 17:37:20 -0400
X-MC-Unique: h02MMf90N2u8cw1yUxAv3A-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-56fd91d9ec0so2730546a12.1
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 14:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713303439; x=1713908239;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hyR66O5KebHaLN8ijHptmbQtlcZeugRZ6bv0WwQzUvY=;
 b=jeAebnwwDT+dY5KhVbF5a7u4bH5sHpxvtXJQYCZHEha/Eov9tsWuQ7fFplvn/QyAah
 4ND7P6cofIDnDsPCd0PUKWeS+aRHpaaJE7/kLU9S7liPkwzK6yTII3Wx+T0qL4c8D2Er
 eg8N+VIwvsr22jOWD7X7m8jQaChd1GQIkfqo0mCInESVoit1RC4v/GAtD0Ulp76YThuy
 oCvO9KcdsoRcQUIEOkINlMmdWtsCiEAU44f4V8s+zImT9P/vFSc8G4Bu5Gzrgqd8d2ot
 rwemtHDcSFJOwCH7hdTub2dYOi9Elr5UxKYaV74903TB2bwjWJByCR3SyoYH83f80+kn
 ob6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAfdXWK2qzOtaXVScSmxhaURBQ0dmyse5lnSbEckP3iTE0P2kfsVw4t5S2nx9WMuDSBmR1RPilqUDHhOaikfvAlL/br6/J72dxhkQB/Q==
X-Gm-Message-State: AOJu0Ywb8sNWjal/s7KEPtXA/2A+V/SsqIZ8l+PGdjsj9Q8weCj6tkMM
 54j5goqBEF3xEEHb0hnOZzNthukRYxpktMzh14Qn4XYHFgxnBtD4MvhImjGj+5WO3W2Rwoi6zJI
 0TjPodAm7o5UT9lA4qClomzzB2jYDdgaB5Ts6sxWues+Iks6FvqHEfjykZpVYlkU=
X-Received: by 2002:a50:9b1a:0:b0:56e:2464:7c41 with SMTP id
 o26-20020a509b1a000000b0056e24647c41mr10681519edi.19.1713303438909; 
 Tue, 16 Apr 2024 14:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNX1RoptkAToV18ifLV3n6oovQ6nST5ACj0WhBIGH3aOOPnFeDZRX49iq74mz+NdlfHPK/4Q==
X-Received: by 2002:a50:9b1a:0:b0:56e:2464:7c41 with SMTP id
 o26-20020a509b1a000000b0056e24647c41mr10681512edi.19.1713303438505; 
 Tue, 16 Apr 2024 14:37:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ij5-20020a056402158500b0056e598155fasm6359068edb.64.2024.04.16.14.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 14:37:16 -0700 (PDT)
Message-ID: <4b8f01ab-ab0f-4d1a-b8e4-a37a0a9c1785@redhat.com>
Date: Tue, 16 Apr 2024 23:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v5] nouveau: add command-line GSP-RM registry support
To: Timur Tabi <ttabi@nvidia.com>, "mripard@kernel.org" <mripard@kernel.org>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
References: <20240409231552.2557643-1-ttabi@nvidia.com>
 <ZhZ4apj6ZEMlbiLR@pollux>
 <359a614b7daba206c59b17e7ec966e38bc9661e8.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <359a614b7daba206c59b17e7ec966e38bc9661e8.camel@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Apr 2024 15:14:15 +0000
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

On 4/15/24 18:06, Timur Tabi wrote:
> On Wed, 2024-04-10 at 13:30 +0200, Danilo Krummrich wrote:
>> On Tue, Apr 09, 2024 at 06:15:52PM -0500, Timur Tabi wrote:
>>> Add the NVreg_RegistryDwords command line parameter, which allows
>>> specifying additional registry keys to be sent to GSP-RM.  This
>>> allows additional configuration, debugging, and experimentation
>>> with GSP-RM, which uses these keys to alter its behavior.
>>>
>>> Note that these keys are passed as-is to GSP-RM, and Nouveau does
>>> not parse them.  This is in contrast to the Nvidia driver, which may
>>> parse some of the keys to configure some functionality in concert with
>>> GSP-RM.  Therefore, any keys which also require action by the driver
>>> may not function correctly when passed by Nouveau.  Caveat emptor.
>>>
>>> The name and format of NVreg_RegistryDwords is the same as used by
>>> the Nvidia driver, to maintain compatibility.
>>>
>>> Signed-off-by: Timur Tabi <ttabi@nvidia.com  <mailto:ttabi@nvidia.com>>
>>> ---
>>> v5:
>>> Add REGISTRY_MAX_KEY_LENGTH
>>> registry_list_entry.key is now char[64] instead of char *
>>> use strnlen instead of strlen
>>> removed some debug printks
>>> fixed most checkpatch complaints
>>> rebased to drm-fixes
>>
>> This patch seems to be based on drm-misc-fixes instead. For this patch the
>> correct target branch would be drm-misc-next though.
> 
> Ok, but then you need to pick up Kees' patch "nouveau/gsp: Avoid addressing beyond end of rpc->entries" because I expect my patch to be applied on top of it.  That's why I chose that branch.

We can ask Maxime to backmerge.

> 
>> You can, additionally, use '--base' when running git format-patch. This will
>> include the hash of the base commit.
> 
> I will take drm-misc-next, add Kees' patch, and rebase onto that.  I'll use --base but I'm not sure whether it will print something useful at this point.

Yeah, that sounds good.

> 
>>> +struct registry_list_entry {
>>> +	struct list_head head;
>>> +	enum registry_type type;
>>> +	size_t klen;
>>> +	size_t vlen;
>>> +	char key[REGISTRY_MAX_KEY_LENGTH] __counted_by(klen);
>>
>> Now that this is an array, we should remove the __counted_by() annotation.
> 
> Ok.
> 
>>> +	u32 dword;				/* TYPE_DWORD */
>>> +	u8 binary[] __counted_by(vlen);	/* TYPE_BINARY or TYPE_STRING */
>>
>> NIT: Can't we put these two into a union?
> 
> Sure.
> 
>>> +static int add_registry(struct nvkm_gsp *gsp, const char *key,
>>> +			enum registry_type type, const void *data, size_t length)
>>> +{
>>> +	struct registry_list_entry *reg;
>>> +	size_t nlen = strnlen(key, REGISTRY_MAX_KEY_LENGTH) + 1;
>>
>> Guess the only reason for strnlen() here is that you want to stop counting once
>> you exceed REGISTRY_MAX_KEY_LENGTH anyway, right?
> 
> Exactly.
> 
>>
>>> +	size_t vlen; /* value length, non-zero if binary or string */
>>> +
>>> +	if (nlen > REGISTRY_MAX_KEY_LENGTH)
>>> +		return -EFBIG;
>>
>> Still prefer EINVAL, EFBIG doesn't really apply here.
> 
> I knew I was forgetting something.
> 
>>> +	vlen = (type == REGISTRY_TABLE_ENTRY_TYPE_DWORD) ? 0 : length;
>>> +
>>> +	reg = kmalloc(sizeof(*reg) + vlen, GFP_KERNEL);
>>> +	if (!reg)
>>> +		return -ENOMEM;
>>> +
>>> +	switch (type) {
>>> +	case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
>>> +		reg->dword = *(const u32 *)(data);
>>> +		break;
>>> +	case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
>>> +	case REGISTRY_TABLE_ENTRY_TYPE_STRING:
>>> +		memcpy(reg->binary, data, length);
>>
>> Prefer to use vlen here...
> 
> I'll change it, but I think 'length' is more correct, since it's supposed to be the actual size of the data, whereas 'vlen' is just used to determine the size of the structure.  Especially since ...

Yes, I agree, length is the one to choose here. However, I wouldn't call it vlen,
but alloc_size or similar, since that's confusing.

> 
>>
>>> +		break;
>>> +	default:
>>> +		nvkm_error(&gsp->subdev, "unrecognized registry type %u for '%s'\n",
>>> +			   type, key);
>>> +		kfree(reg);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	memcpy(reg->key, key, nlen);
>>> +	reg->klen = nlen;
>>> +	reg->vlen = length;
>>
>> ...and here.
> 
> ... it can't be vlen here because the value has to be '4' for dwords, and 'vlen' is 0 for dwords.

That's even more confusing then. Please rename the local vlen variable.

> 


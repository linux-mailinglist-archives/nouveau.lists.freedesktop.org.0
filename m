Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826C8539DC
	for <lists+nouveau@lfdr.de>; Tue, 13 Feb 2024 19:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4610E8DF;
	Tue, 13 Feb 2024 18:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XFAZjafF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAD610E8CC
 for <nouveau@lists.freedesktop.org>; Tue, 13 Feb 2024 18:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707848755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+lItpgF1xlay88BZPDVmR2YqVIquoyLBDxcxYTZTL0=;
 b=XFAZjafF6bhtBSKaiUw1MEbLvPWaUqmAdNEtivJ4aU4O0VJj6lgxODYTC83PEKLn+Ild7B
 L/htixSO11MNfZ8AcCcrTS9GcTT5BRNeEeXI/EdhH5hEsYxeLvGv8/+AZHAXSD5pgd47QX
 nmMPjLtQ4DpxDr/xDO25e5YQWYJUGU8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-4cNsVJdAMo-RfaJM5UA-_A-1; Tue, 13 Feb 2024 13:25:54 -0500
X-MC-Unique: 4cNsVJdAMo-RfaJM5UA-_A-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5621b24876dso72690a12.1
 for <nouveau@lists.freedesktop.org>; Tue, 13 Feb 2024 10:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707848753; x=1708453553;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0+lItpgF1xlay88BZPDVmR2YqVIquoyLBDxcxYTZTL0=;
 b=Wgq+UXim5C0t/O0u6zJMIiMcM2DLqgqznEQEgPiePC7bLa+/cb+Hfj2etXlKJx/ubp
 qXfniR7KgbzO9qL3+sXmTNz3z6be1YRkFJrKPAph54bwTdqyVZ4UZ87RIHQdAjzUl/1y
 cvxuqacwDoOUiQo6ObKRHMQ4w8otSg4ltxT7c5Donwl1OKr0N0C9rjVLgLKlJUfA8KpO
 tp8c/6p2T61hPPQz3l9tmEhMvz4Prmhi4W1Z1ngjd7P8k6zrdj0ttHjOu8VjHptK9ntV
 fUEWuElBi1lS1DiDpFy1pg5rztJqIbj/yjHBaAHbVIYc8fmR1/OBqqZxnYw5QVG0/cdb
 rVJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwJwAEv8JDVQpjdnjwhO00a6gPOFmmXF7P+sa9lGnRcB51bsb7U6ow+C0Eu1Z0t+foQ+OvanXmKSetdfwdZQ/q5aEfeS329am9m/nsGA==
X-Gm-Message-State: AOJu0Yw6XBl6xBTt4OqpUg7vUAUq6hXBKmvvTfslOabBNN6IEfMbdWlN
 kc6uUoc5xeeu9jrNxlTb9weItHgOm5gKq9ZKiTtCGcGZQvVsbU83ejbgSXslUCviV6E02fa3hwf
 A728wHxsidVVT5t7CujNIaKi1vX8zaOTm3hm6KD/n0VTCwj1FA9lenS8WbB07SYk=
X-Received: by 2002:aa7:c48c:0:b0:560:c9b5:c440 with SMTP id
 m12-20020aa7c48c000000b00560c9b5c440mr355387edq.11.1707848752820; 
 Tue, 13 Feb 2024 10:25:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGvG/ugCy95i+6QJDIT+zqNvQ1nPRmrp7FznbPCU6OYd2A88lvUcIert84/4Y0uAfaVTg0jg==
X-Received: by 2002:aa7:c48c:0:b0:560:c9b5:c440 with SMTP id
 m12-20020aa7c48c000000b00560c9b5c440mr355374edq.11.1707848752541; 
 Tue, 13 Feb 2024 10:25:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXVeA4+7ORknTp4+q9DNEB2b+kfn820bd4LxEzlAZFd/Ay4nVQi0oyx7D+TSmkNJ0z8u1iqLmJU6O0mpeMUs2+C8otYqBr6WVbjPoRs+hYHU7B2MMvENZUhMGmvVAF7IAT+ibPiDiNIHA4/aV770+1VYAQwNSj3XhTEDRhSwNMVEA==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ef13-20020a05640228cd00b005612025465asm3932829edb.74.2024.02.13.10.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 10:25:52 -0800 (PST)
Message-ID: <65c06619-9078-4be7-8fb8-0c57e11ec756@redhat.com>
Date: Tue, 13 Feb 2024 19:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] [v3] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240212211548.1094496-1-ttabi@nvidia.com>
 <20240212211548.1094496-3-ttabi@nvidia.com>
 <62204be5-9367-4e52-9d25-be9c99a1a856@redhat.com>
 <42cbb398d41273d8f743fff24015bbd0e535b151.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <42cbb398d41273d8f743fff24015bbd0e535b151.camel@nvidia.com>
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

On 2/13/24 18:10, Timur Tabi wrote:
> On Tue, 2024-02-13 at 17:57 +0100, Danilo Krummrich wrote:
>>> +	struct debugfs_blob_wrapper blob_init;
>>> +	struct debugfs_blob_wrapper blob_intr;
>>> +	struct debugfs_blob_wrapper blob_rm;
>>> +	struct debugfs_blob_wrapper blob_pmu;
>>> +	struct dentry *debugfs_logging_dir;
>>
>> I think we should not create those from within the nvkm layer, but rather pass
>> them down through nvkm_device_pci_new().
> 
> Should they be created in nvkm_device_pci_new() also, even though we have no idea whether GSP is involved at that point?

We can pass some structure to nvkm_device_pci_new() where GSP sets the pointers to
the buffers and maybe a callback to clean them up. Once nvkm_device_pci_new() returns
we'd see if something has been set or not. If so, we can go ahead and create the
debugfs nodes.

> 
>>
>> Lifecycle wise I think we should ensure that removing the Nouveau kernel module
>> also cleans up those buffers. Even though keep-gsp-logging is considered unsafe,
>> we shouldn't leak memory.
> 
> I agree, but then there needs to be some way to keep these debugfs entries until the driver unloads.  I don't know how to do that without creating some ugly global variables.

I fear that might be the only option. However, I still prefer a global list over a
memory leak.

> 
>>
>> For instance, can we allocate corresponding buffers in the driver layer, copy
>> things over and keep those buffers until nouveau_drm_exit()? This would also
>> avoid exposing those DMA buffers via debugfs.
> 
> The whole point behind this patch is to expose the buffers via debugfs.  How else should they be exposed?
> 

I think I only thought about the fail case where we could just copy over the data from
the DMA buffer to another buffer and expose that one instead. However, that doesn't
work if GSP loads successfully.

Hence, as mentioned above, we might just want to have some structure that we can add to
the global list that contains the pointers to the DMA buffers and maybe a callback
function to clean them up defined by the GSP code that we can simply call from
nouveau_drm_exit().


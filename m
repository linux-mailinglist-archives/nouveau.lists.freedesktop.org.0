Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5ADCBAFCD
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966F310ECB5;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdtZYyTK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C38B10E0DD
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 14:56:20 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso987460f8f.1
 for <nouveau@lists.freedesktop.org>; Sun, 02 Nov 2025 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762095379; x=1762700179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WNRp8GBQqKKuNk9ZiQRhReDm9E3VEBrBLSW1DlgX55M=;
 b=bdtZYyTK2fdKMwaLxsrsXgRtVU970xOA7S+9X3r4gGNzV7p8r0UUj4QhP5PVTgjdxB
 nMs0lJmpvZOXDW8xCsY9jFVqEq/7CGSEDRGBABnGP/n8/n4nGiUQfRehML2Eguru8F6J
 bfVR2BnxudgYWqp7GaRWcQl360V16SGtsRzwlKK5YGuuRk+vpU5+pFDbvp3Nq4nlmAZi
 52z5hX3gw8iPy4dgdTwlq0foP+DDFanvJyPvgAwccXsUJdHWYdhb8aWJql63Oqec1+6G
 WTl/ge66OhgZ4ASSOJk7UvOu1FDy+QRBOaP8UFQAd92DXnlYixj667uBwZPFdhLwLlNy
 3Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762095379; x=1762700179;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WNRp8GBQqKKuNk9ZiQRhReDm9E3VEBrBLSW1DlgX55M=;
 b=f12LOEzblNUqBxRrYHKs6uqKrTfPOnwEUpoInSnumR4rITqX+KbAcpJOv/zbbBUq9A
 KMQ3kz2zZ3sfphN8v+Z0CXaiv7vM/WdNgmngicLFZEgEVvMo19lV0f6W4lFJWeIvBj67
 gQd1PrZEKZsV5WNMHRshNIjIBUtbhHNs4pzEQ8AGwdhpkYGT0KkVBPsPjDh34LT+Q3O9
 Fh6Q/JLk3hAAGAxea6OdaSG8SlZ7Ae6cr0mZX9Yq6Hm3m5dZhDh3j1fb/kXojCf98eG+
 rClaz/Qj4kF1DFx0kFxj3FGBrT4uAH9BoevWJPAb8o5FSAmDjaOkR+aHzDLto2/Ztmau
 JA/w==
X-Gm-Message-State: AOJu0YywbqDRdYj8UGpxw+L2INgInPAhfarIm7H30+aTtPW6WIOPPS7k
 FV4xCjVdFiAJYtcSAfyExJGWsrGu0CRY33Pndt7PZUMOq5qN0DqRTJ0L
X-Gm-Gg: ASbGncvGxyJvlOCNnIPsY9SQjnIbeHQTAwmwiJ394YgjCw7La0xcCEd2rVtwtKu+nKO
 sQQUUgB52soP8hNqDjZAuP8KDD4mvamC8l3TFCuafTOB76v6uPpM5JTSJBsP61J1Iftc43vMlrQ
 iFLYqmadKO2e/lb6PlavzWCxyrTYPUIO2qMfVyaeDPK8Kke1spH7xvYAyyUKlU6C4LceS8Ll6l9
 i1F84Zm3YEVnuJC7Vk0JEWpKo3ahPmm0lSQcytBgbXVspTzM7exMPKV5/UgVo5L+Kql8FfWb6bW
 9BO4/LLzU43SHar5ZpX7XhOcM2RTFtu9tHryzjufvlOiQU6Bv6rPX6Y1Ivatdd6HNjp5hngS2w8
 VBl8+26/l4RfhRql34IGufMSkpA4KYUrEQmmEur17s7DHacsDmorjaQG76VcXpHpIqhkKTzRdgv
 51OB738Z7rqjInwzSR2cKr6Vkv4vwny+48VL9f4CGFSxc33UdPaz49m5C8Mzj5W6EAhNQ=
X-Google-Smtp-Source: AGHT+IEAwtgyxniTz4Ai5mtawKx2HjkKK2OW7gZ2ITGD+2oJ/4ffgGzrS5E/3uRYJ89wkLzNjfq3hg==
X-Received: by 2002:a05:6000:1a85:b0:429:d2a9:5dea with SMTP id
 ffacd0b85a97d-429d2a95f05mr675088f8f.15.1762095378417; 
 Sun, 02 Nov 2025 06:56:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13f2b5asm14807337f8f.40.2025.11.02.06.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Nov 2025 06:56:18 -0800 (PST)
Message-ID: <51200cc6-042a-4e83-81b0-720385c67bb5@gmail.com>
Date: Sun, 2 Nov 2025 15:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nova-core: Simplify `DmaObject::from_data` in
 nova-core/dma.rs
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
 <20251023205146.196042-2-delcastillodelarosadaniel@gmail.com>
 <DDXC0YKKJJT4.18JQ1MJQ7I31Y@nvidia.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <DDXC0YKKJJT4.18JQ1MJQ7I31Y@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:46 +0000
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

Hi Alexandre,

On 11/1/25 12:46, Alexandre Courbot wrote:
> On Fri Oct 24, 2025 at 5:51 AM JST, Daniel del Castillo wrote:
>> This patch solves one of the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> It uses the `write` method from `CoherentAllocation`.
>>
>> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
>>
>> ---
>>
>> V1 -> V2: Split previous patch into two. One per reference to COHA.
>>           Added more details in Safety comment. Let me know your thoughts
>>           Kept the original map to avoid a temporary variable
>> ---
>>  drivers/gpu/nova-core/dma.rs | 15 +++------------
>>  1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
>> index 94f44bcfd748..620d31078858 100644
>> --- a/drivers/gpu/nova-core/dma.rs
>> +++ b/drivers/gpu/nova-core/dma.rs
>> @@ -26,18 +26,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
>>  
>>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
>>          Self::new(dev, data.len()).map(|mut dma_obj| {
>> -            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
>> -            // SAFETY:
>> -            // - `dma_obj`'s size is at least `data.len()`.
>> -            // - We have just created this object and there is no other user at this stage.
>> -            unsafe {
>> -                core::ptr::copy_nonoverlapping(
>> -                    data.as_ptr(),
>> -                    dma_obj.dma.start_ptr_mut(),
>> -                    data.len(),
>> -                );
>> -            }
>> -
>> +            // SAFETY: We have just allocated the DMA memory, we are the only users and
>> +            // we haven't made the device aware of the handle yet.
>> +            unsafe { dma_obj.write(data, 0)? }
> 
> This doesn't build for me:
> 
>     error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `core::ops::FromResidual`)
>       --> ../drivers/gpu/nova-core/dma.rs:31:44
>       |
>     28 |         Self::new(dev, data.len()).map(|mut dma_obj| {
>       |                                        ------------- this function should return `Result` or `Option` to accept `?`
>     ...
>     31 |             unsafe { dma_obj.write(data, 0)? }
>       |                                            ^ cannot use the `?` operator in a closure that returns `dma::DmaObject`
> 
> Could you double-check? I guess you will need to change the `map` into
> `and_then`.

You are totally right. I'm not sure what happened. I'll fix it. Thanks!

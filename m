Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5596CCBABE0
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BA310EB16;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf+Rn5iy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5076310E0E5
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 15:09:58 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4711810948aso25395295e9.2
 for <nouveau@lists.freedesktop.org>; Sun, 02 Nov 2025 07:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762096197; x=1762700997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KeEh++c4R7x24Ob6ITABSkGpnIKxyH2JeGroaXixafA=;
 b=Pf+Rn5iy37BksctCTQD7vMX3C3PGJdF06M8l9GWpK7gRxT0JKR71yfhxm5nkLp7a+z
 IvJXOfPzkyevVH6t8ivV/QiBzSnn/S88EDshETUTJyF6PKUOdROR/fNLH9cqyk7zPhgf
 pbDWMB1kHtrtbkAweMspANCfwaoBOu/IX0aQh4ObsSRN8/NzQUMWH82zEyroF1Dccnmb
 3v8eYDtJUxbny0HQOHizmMMBWliF+gFFyZLggiUV4K8J9QKW/AwSkaifnrk/lxqMLMSL
 cmdpb+ePeVN0NPEkD+dEY3OjmfxuIH74SgKfUQH8LEVaqDOf+2EKIKEvvjDoL4q5oE2f
 /RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762096197; x=1762700997;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KeEh++c4R7x24Ob6ITABSkGpnIKxyH2JeGroaXixafA=;
 b=nD3DdGxylgI4MeUefwhKW7nX7Xdn/CpMQhLwmOMzuffK97Zblkp7jvhDaojSFsfwQT
 8GJb4W+UZoyHol+grv9K53ebWT44gqNhIaYgo99KxkPFrR2CPoPMZsf8BPRw2tABTliz
 ONaUqYor5ip+1gQ6Cj3UJZSvfWv3Np4r2gZdLDxRPWoYNEboZxTwUu+VgNRGAxltV8cO
 aoettOnD+qyLWZ5r3q9/XJFwgqFtn2YKAcddYelIiEvZ1xJ9/xPAgoAeGNBgW4QH7+/r
 qot5V/zfoa2ah6JqOxpbE9uOZrlKWYpIx6jWGDqYakr35AIpWaAO0srVH5PInUYBCgkZ
 fC5Q==
X-Gm-Message-State: AOJu0YzbQ1NTDlWdOPNft+Xtg3YMJmURor9NbsXnMzYmpyC6qmnsk0o5
 gqAVfr5ImWVY5me2jpfWZNFgBPqq06FXOqzE9ikKGLUo0LCdWR8tuHno
X-Gm-Gg: ASbGncsERO9hqoaDRUSplQeo7JXLh+uy0lgemVXEzEMMYbfZEdfdDCp8H03gloYz8oL
 zTbBQVKfn+1sFyXXmEcd7nNMYBuWLSMHGrgZF5q0Ma6yJ+DHZ0mDtFJW/PXONXYX6JE169U+grc
 BrrNMuLFSH8S/I3GEPMV2tuVuZx41JUwpaTfxoPfNCQN7z+mNLYonM7AWKDMHEgRPnSBXYReXLu
 kipPobdPO821QhHwq2Wm1hayM1Yxpt7u9RuL2QPxYiogbbsIPK+hoO6HyAVPwScCcxY52JzQwpn
 AM2UCQ57mCYIMvpZ1kGjuUSyNp72Al9Vlo31Oq5mLZuH2zMYxP45vR0jpNLzh1emKHcBVNOomDa
 JL4kuNC8+s7kOIuYkvnVRTlkU78F2z7T4uF+8i/j/VepyiuzNevFtD18nQ4v3V1hspyRQ4Mce7L
 U9kFuTRz+PspiLr+kyCsCCkma1jVg2cDSs0imBKNpfbLsE9f05fi1dToQNWvQX7vs/cyI=
X-Google-Smtp-Source: AGHT+IHGrARufC9tZYIoG9QCHsV4kZ8J2Ovz4A4hPVeK83i602JTm5CAJj2RXLSVlTY6X+3zPvhvCQ==
X-Received: by 2002:a05:600c:83ce:b0:471:989:9d85 with SMTP id
 5b1f17b1804b1-47730871fa6mr104046745e9.19.1762096196688; 
 Sun, 02 Nov 2025 07:09:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429d1061efasm3179609f8f.24.2025.11.02.07.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Nov 2025 07:09:55 -0800 (PST)
Message-ID: <70210168-ee28-4996-89f0-83f8590cb716@gmail.com>
Date: Sun, 2 Nov 2025 16:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] nova-core: Simplify `transmute` and
 `transmute_mut` in fwsec.rs
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
 <DDXC17HXPXFZ.3TIX7FHUJHAI7@nvidia.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <DDXC17HXPXFZ.3TIX7FHUJHAI7@nvidia.com>
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

On 11/1/25 12:47, Alexandre Courbot wrote:
> On Fri Oct 24, 2025 at 5:51 AM JST, Daniel del Castillo wrote:
>> This patch solves one of the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> It uses the new `from_bytes` method from the `FromBytes` trait as
>> well as the `as_slice` and `as_slice_mut` methods from
>> `CoherentAllocation`.
>>
>> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
>>
>> ---
>>
>> I confirmed by talking to Alexandre Courbot, that the reading/writing
>> methods in `CoherentAllocation` can never be safe, so
>> this patch doesn't actually change `CoherentAllocation`, but rather
>> tries to solve one of the existing references to [COHA].
>>
>> V1 -> V2: Split previous patch into two. One per reference to COHA.
>>           Improved comments. Let me know if they are okay now.
>>           Use of `{...}` syntax for the `if let`
>>
>>  drivers/gpu/nova-core/firmware/fwsec.rs | 129 +++++++++++-------------
>>  1 file changed, 60 insertions(+), 69 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
>> index 8edbb5c0572c..507ef3868565 100644
>> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
>> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
>> @@ -11,12 +11,12 @@
>>  //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
>>  
>>  use core::marker::PhantomData;
>> -use core::mem::{align_of, size_of};
>> +use core::mem::size_of;
>>  use core::ops::Deref;
>>  
>>  use kernel::device::{self, Device};
>>  use kernel::prelude::*;
>> -use kernel::transmute::FromBytes;
>> +use kernel::transmute::{AsBytes, FromBytes};
>>  
>>  use crate::dma::DmaObject;
>>  use crate::driver::Bar0;
>> @@ -35,7 +35,7 @@ struct FalconAppifHdrV1 {
>>      entry_size: u8,
>>      entry_count: u8,
>>  }
>> -// SAFETY: any byte sequence is valid for this struct.
>> +// SAFETY: Any byte sequence is valid for this struct.
>>  unsafe impl FromBytes for FalconAppifHdrV1 {}
>>  
>>  #[repr(C, packed)]
>> @@ -44,7 +44,7 @@ struct FalconAppifV1 {
>>      id: u32,
>>      dmem_base: u32,
>>  }
>> -// SAFETY: any byte sequence is valid for this struct.
>> +// SAFETY: Any byte sequence is valid for this struct.
>>  unsafe impl FromBytes for FalconAppifV1 {}
>>  
>>  #[derive(Debug)]
>> @@ -68,8 +68,10 @@ struct FalconAppifDmemmapperV3 {
>>      ucode_cmd_mask1: u32,
>>      multi_tgt_tbl: u32,
>>  }
>> -// SAFETY: any byte sequence is valid for this struct.
>> +// SAFETY: Any byte sequence is valid for this struct.
> 
> I appreciate the capitalization, but these changes are a bit
> distracting. :) If you absolutely want to do this, let it be its own
> patch so the current one stays focused on what it actually does.
> 
>>  unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
>> +// SAFETY: This struct doesn't contain unitialized bytes and doesn't have interior mutability.
> 
> Typo: s/unitialized/uninitialized (and in other comments as well).
> 
I will move the capitalization to another patch and fix the typo.

> Otherwise this looks ok - it doesn't apply cleanly on drm-rust-next
> though, could you rebase for the next version?

About this, I was basing myself on nova-next [1]. I will rebase on top
of drm-rust-next for the next version.


Link: https://gitlab.freedesktop.org/drm/nova [1]
Link:
https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next [2]

> 
> Thanks for the cleanup!

Thanks to you for the reviews and the patience!




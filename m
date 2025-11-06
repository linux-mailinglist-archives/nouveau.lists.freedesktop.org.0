Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27DBCBAFD3
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBBD10ECC9;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnQrDaOy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAA510E9DA
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 21:25:02 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47754b9b050so330675e9.2
 for <nouveau@lists.freedesktop.org>; Thu, 06 Nov 2025 13:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762464301; x=1763069101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YKes0XVjNGJ2FggkAmqRR788Mxk3TjUGRm3n1mueSWg=;
 b=CnQrDaOyC3tkAso3tecfhttGehls4MispX2XH6/Q+VLIeE1XTZP0NzKMxUbBFClU7v
 pNaQDAevtX75LXlC7KL/AmUjX43V8CPfxMfvnRPFm5yaWkGOfBdjEsHdWDkjgPW9iW76
 kz9SBcV047cW5fz87jd9MRWtYBLu8N82DA32uJ3m/HbL7s5U3sd4oEn6WL6278fj67Zf
 nB3HLvixc7XEn7YOTfMRn6VU7jXlplkRHqxYA7PqcfoMhM53nn8GlaZKRY/tHw3KTOfl
 Rrkkm9DW0TkMvG0th5Nzzqnh89RpR710e9hANgfyyaOUR0Y3L9RbbjKbsxpe44kAynUn
 RvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762464301; x=1763069101;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKes0XVjNGJ2FggkAmqRR788Mxk3TjUGRm3n1mueSWg=;
 b=YELQxmXtbc+1j9s7dAbJ25S30USJYUAZrW5E6ByLAQ3MIjfaP3upwoxA8nyoFaBBw2
 Arbjc+VwBvDHYrYUzxWaCSAB1DTWyj9b+6je1D3kn/aDYzzCdOUKRLrpm41IE0xqg/XG
 An/tiI9pC0KDFH00ujGGDL2Pv1nD/4cKql+hV9GuQU024PQ3UL58Ftsco+PsUrMjxSmg
 h+YelwXMcOA+PhXCNIPoog4LGFejqyu3dg0vHpm1F6TtIQ2TiY3uxkawn1nozBRS9L+T
 L9vval+YqXDoM7ag5dSbWJ5gYWPsfxPuBa/u98WTTVQj8B9lWPWqJ58jLTNlA0SA6n/f
 dlZg==
X-Gm-Message-State: AOJu0YxR0p5IfofI5l9izAd4ebJaDNm40FyHMi2XoUTtf0TUBcUIvmjl
 dtAKLsGVCU/CdKTX+CFbV7UqV7jo/LLtOb92lAIKQUnKtjFHl+1fs5ZX
X-Gm-Gg: ASbGncv1hCRnD0SBMUcsnyR59Rg9w0F+Pq/iC9HBK94Q4dV0WT8zIV3z6V+fMBQRhSy
 WL+1kuTaLP9cl/TFd/ywZEgum7IsxpmPipHz+8Bb28Uge3pXMnpvxYfP1HuJSiMAiWsgibROH7j
 6rgaW6Bmm/x8uv0ooy0YVUoA7VQD9HS/+si4laIVYps9JuqBbAex+J9jIs9felt76sruWbOfcEU
 YmOrQ9XLHAv5twD/bVB3PG9GoJQ9STOrgPQg/FBvUm7ZLTdV85Ru64Pb93VATHzXy9KmI7pnjIb
 5D8np0xV2i71FzbJk64/Y26uXtgzXAByGlPv+9kz18NUvLFvxjOw5A6p7atUjcem2aRm8wsMJZ2
 NSFJeuWpXYsS/UTuvvbVWAg3Tigx8kd1Rh2DxrARuzRGXYLDHEZgazWj9daVLgRcTqKLRYhB5ft
 FzmJO+zYrzH9BljLnNltIpSlixfppigclxhB/FWQOhk4LaWf7eCy2rmNg9WP+LNx+wLWw=
X-Google-Smtp-Source: AGHT+IFRtleD8p3GDaRn7y4cLlgvtrJ8k9u0N/dFUXsYAq553rRak+Diry9dTEA+SBjhoD9RJ2Xd8A==
X-Received: by 2002:a05:600c:1384:b0:46f:aac5:daf with SMTP id
 5b1f17b1804b1-4776bcfd091mr7371805e9.35.1762464301183; 
 Thu, 06 Nov 2025 13:25:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67920fcsm1257502f8f.39.2025.11.06.13.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 13:25:00 -0800 (PST)
Message-ID: <ff95096e-83de-433c-9048-55a35dab3dde@gmail.com>
Date: Thu, 6 Nov 2025 22:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] nova-core: Simplify `transmute` and
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
References: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
 <DE1H0USFAGNU.FFRA802H95RG@nvidia.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <DE1H0USFAGNU.FFRA802H95RG@nvidia.com>
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

On 11/6/25 09:32, Alexandre Courbot wrote:
> On Wed Nov 5, 2025 at 4:37 AM JST, Daniel del Castillo wrote:
>> This patch solves one of the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> It uses the new `from_bytes` method from the `FromBytes` trait as
>> well as the `as_slice` and `as_slice_mut` methods from
>> `CoherentAllocation`.
>>
>> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
> 
> Thanks, this looks great so I am staging this series for pushing after a
> short grace period (probably tomorrow if nobody screams).

Perfect. Thanks for all the help!

> One nit, the prefix for Nova patches is typically "gpu: nova-core:", but
> I will fix it when pushing.

I'll keep it in mind for the next time ;)

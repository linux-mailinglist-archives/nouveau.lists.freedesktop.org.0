Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2513FCBACCA
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008CD10EB77;
	Sat, 13 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rds6/S5S";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB8210EAA8
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 21:46:31 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso1120316f8f.1
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760651189; x=1761255989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qLVbGWoACrgE9VODWgB1TKnJBzMVwNUtM6cFxhgg3wc=;
 b=Rds6/S5SjgEEL3SyTBlCntcmdsi66P01NmBR0x1+MslmifFyqHrJgjtvehVZvxDt8B
 JU5jxsmxk7BmTT4Wl4H3HobXTe+jVDCB2WAcsjoqRSQGKHQxZ0HDi8893M3IlnfjjySz
 6cawn+3LUzVmyK49RYggJ1BxQ7MU5W+kR8ZUzivjRN8ARYV2UIIG/09dFlsNaq26EmMk
 rcxfIlhm3pjjpOBSiRB9DWnXP8CSX2hAKKj+PwS6CYM6aWWkfIr1xERfRxyCp4HSB45m
 F+x2xNN3zEIpocEESTqBCIDiZ0z4yqX+iRisQDF/A2FKm5IQKWU3YtNSiZHUbJD7y2iv
 tsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760651189; x=1761255989;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qLVbGWoACrgE9VODWgB1TKnJBzMVwNUtM6cFxhgg3wc=;
 b=Noxdcedz9stzqGNm2uBDT8tdlqhkhfIofRcwz1CqZwpNQBeV2jYVEE4UaE25Sq4Ndg
 Po7CsUJGLRhYq+ZvcXO7CdjmC+7n7iJ2/+dW1Nnjq7dd9sJjZDEezPh3cXZAsa10X13q
 ilgPPPDgN6U1sx55WNN0tQle7vS7BtUFgCGZ+OyVFfQeDawdtjCKm7yyO8XK1SJWdzPs
 PxmgG06+JbjKWGAu8EviYHJro78XZUbl7SwV1d+nlBseJ1GD3I+iZ2LztiRL9KEjORiW
 h0yrrc6C5QpsE/TAUttCJ+bwwI5HyMXuTQ5DAmNjE63a7hm0f7FYijuCZwmibssDLicK
 PUMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWruheIsrNnVfzODvhtYc8RNM8rAoKOAjWvitlT4iLqxejLgcGLzBxobrpBWhD11A4QmtXcVl+Y@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI2FbJbKDAaagjb20Pr/zEcWUEyvdTF9HckIr5y1r4WFEdxmNw
 0vAvVrIt1eZ/8uHPtOLaaQpUc7kxtoZ9IcvkwqnOeSDlevZ6Mi7VuX6W
X-Gm-Gg: ASbGnctquyE2bSFfVBVlqQ6xx1vcLbbCKhoIsTKw0BBKGZMs3T0Cpk/9XAr0Rd8WOOf
 +IeY/hKsoMgOKTymL2zvS9TCOxHsOsdvQulr/u3xgwhPEsgODwRB/oWwAoJDPaCRPK67uUGEj/z
 TOnb50psuxw96dltaAOyALE1IvgBVFxsc5D0tdS2yHD4HomuV5g9gDn4pS6TOf+6lue8MASYsa2
 j1yQ3yHvHKeogqPFRwcjQjOrV2A2dBzCddOmI2Uq+Ek+lazzfTixoblay3hqtjv8O1VgvgZ+x1Z
 gtR/D+1CP7ii6DoAJGARzhwX0VxA0mn09ESVj4vm62bgzgPxHSh8rAmEPEYOyfnMlnGGY37Ko0+
 6PzgMXaFqCbTA7BUwXatBhshKKc070vpMxTGXRhotoJFnY0twAe+c0eI2MBRpXnjneq/KWnlW0c
 Ff1SCp0T+vCiKicIfxVVJ7ETbHv+oxGBYHSxzb7RlAPFdNor943HyRDTTx1IqJy6H09h/2bxS2K
 ybp96ZC9zTq4Vsl
X-Google-Smtp-Source: AGHT+IH/zjgPG/HV9ngqclxgSOqwAQJ1HFnhUiJ+6D/aP5dTWD4NXoIdy+KZQeUj/f6oIUnU/Azdag==
X-Received: by 2002:a05:6000:2911:b0:425:8bc2:9c43 with SMTP id
 ffacd0b85a97d-42704d7e987mr1012235f8f.1.1760651189397; 
 Thu, 16 Oct 2025 14:46:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d4bbsm37423275f8f.2.2025.10.16.14.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 14:46:29 -0700 (PDT)
Message-ID: <a7ccda73-2c40-419c-a7c3-3155739648d0@gmail.com>
Date: Thu, 16 Oct 2025 23:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
 <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
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

Hi Danilo,

On 10/15/25 22:04, Danilo Krummrich wrote:
>> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
>> index 94f44bcfd748..639a99cf72c4 100644
>> --- a/drivers/gpu/nova-core/dma.rs
>> +++ b/drivers/gpu/nova-core/dma.rs
>> @@ -25,21 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
>>      }
>>  
>>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
>> -        Self::new(dev, data.len()).map(|mut dma_obj| {
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
>> -            dma_obj
>> -        })
>> +        let mut dma_obj = Self::new(dev, data.len())?;
>> +        // SAFETY: We have just created this object and there is no other user at this stage.
> 
> The safety comment should rather confirm that it is guaranteed that the device
> won't access this memory concurrently.

I actually don't know how this is guaranteed. It wasn't explicitly
explained before here, although unless I'm mistaken it was already a
requirement. Could you help me? I guess it's related to the already
mentioned fact that we just allocated this DMA memory and the device
isn't yet initialized?

Thanks,
Daniel

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4017B3C44D
	for <lists+nouveau@lfdr.de>; Fri, 29 Aug 2025 23:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC64910E28F;
	Fri, 29 Aug 2025 21:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RjlXGPXv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1844510E28F
 for <nouveau@lists.freedesktop.org>; Fri, 29 Aug 2025 21:46:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E6AF660146;
 Fri, 29 Aug 2025 21:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CF4C4CEF1;
 Fri, 29 Aug 2025 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756503996;
 bh=3rY67k6MnCyDXpesTvug9/O8iMMcv+FgZYCMGYyMrQA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RjlXGPXvqrjY9ZCVJNXCCoFXt59IucY4djtBKq+54ySfDXybevK08We6nk0BKIA72
 zwWKavbHbJGFR4/pqJjS6YrznXgmg7Zj4DsK0L88gbcAPjVLNsOi0WiUulfjbieCzu
 pSF1DH4C7yqShH/OTu3BXUJo9zCssUlCNeCdu5td6ZIxopM6a8qk5pw2xYtYW225Ms
 sYoIyji05uqYODiNqmO1PanlsvhuVR2EXJaWu/AxY0a0bpubFL7pCzWGCX7Akpsj7l
 +jrCPQCXgupoGN1Ao7N4klmRN6grmkJ42r9YWXNk8+vBNmV+F8viMyTqfepQdDRMgc
 1lI+ygBLQxYeg==
Message-ID: <5fa42689-4f7b-4770-bc44-a4c17d9de79f@kernel.org>
Date: Fri, 29 Aug 2025 23:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] rust: pci: use pci::Vendor instead of
 bindings::PCI_VENDOR_ID_*
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>
References: <20250826231224.1241349-1-jhubbard@nvidia.com>
 <20250826231224.1241349-6-jhubbard@nvidia.com>
 <DCE3EV79EX7N.DCIT9JWFGXGG@nvidia.com>
 <4b525afa-1031-4f99-a1ab-e89af77616eb@kernel.org>
 <cd20f283-bd92-47c9-a336-fe9ff46d82ed@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <cd20f283-bd92-47c9-a336-fe9ff46d82ed@nvidia.com>
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

On 8/29/25 11:38 PM, John Hubbard wrote:
> On 8/28/25 6:59 AM, Danilo Krummrich wrote:
>> On 8/28/25 3:25 PM, Alexandre Courbot wrote:
>>> On Wed Aug 27, 2025 at 8:12 AM JST, John Hubbard wrote:
>>> <snip>
>>>> diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
>>>> index 4b0ad8d4edc6..fd7a789e3015 100644
>>>> --- a/rust/kernel/pci/id.rs
>>>> +++ b/rust/kernel/pci/id.rs
>>>> @@ -118,15 +118,14 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
>>>>    /// ```
>>>>    /// # use kernel::{device::Core, pci::{self, Vendor}, prelude::*};
>>>>    /// fn log_device_info(pdev: &pci::Device<Core>) -> Result<()> {
>>>> -///     // Compare raw vendor ID with known vendor constant
>>>> -///     let vendor_id = pdev.vendor_id();
>>>> -///     if vendor_id == Vendor::NVIDIA.as_raw() {
>>>> -///         dev_info!(
>>>> -///             pdev.as_ref(),
>>>> -///             "Found NVIDIA device: 0x{:x}\n",
>>>> -///             pdev.device_id()
>>>> -///         );
>>>> -///     }
>>>> +///     // Get the validated PCI vendor ID
>>>> +///     let vendor = pdev.vendor_id();
>>>> +///     dev_info!(
>>>> +///         pdev.as_ref(),
>>>> +///         "Device: Vendor={}, Device=0x{:x}\n",
>>>> +///         vendor,
>>>> +///         pdev.device_id()
>>>> +///     );
>>>
>>> Why not use this new example starting from patch 2, which introduced the
>>> previous code that this patch removes?
>>
>> I think that's because in v2 vendor_id() still returns the raw value. I think it
> 
> That is correct.
> 
>> makes a little more sense if this patch simply introduces the example as an
>> example for vendor_id() itself.
>>
>> I think struct Vendor does not necessarily need an example by itself.
> 
> I'm not quite sure if you are asking for a change to this patch? The
> example already exercises .vendor_id(), so...?

Yes, I think the example above should be on the vendor_id() method rather than
on the Vendor struct and should be introduced by this patch.

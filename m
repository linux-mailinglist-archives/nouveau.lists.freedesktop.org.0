Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0663B39F82
	for <lists+nouveau@lfdr.de>; Thu, 28 Aug 2025 15:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D5310E9C0;
	Thu, 28 Aug 2025 13:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hk71lSfC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD55710E9B4
 for <nouveau@lists.freedesktop.org>; Thu, 28 Aug 2025 13:59:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 795754057C;
 Thu, 28 Aug 2025 13:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDDFC4CEED;
 Thu, 28 Aug 2025 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756389555;
 bh=WEtI0/FN3xpSJ6agHNJuplApkchRGtOGLb1rARd7JN4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hk71lSfCh0+8Gp8mDS+rJtbB16TzpROCk59jFIJkk8xGS3HPEjWs7IyU+hvCHsDyX
 3WXeUuz+1EJlJfLab3Hoz3YfNT7H4smxqUWZEMhb4wkPS8aQlUhYLfVxbKLFQp7Nhw
 exXrt10hund93QkYlyiCZ6bEK++oMBaRJtZ392vGe7x9IpNoJlbYSH5GTsK4jQ5Owz
 5GdfouP7S1kClIv/VeZv7H6WCLAa9eAudFg45QTbKm8TBPqUPZkhZpJ0waSFaxGOet
 RijKqRrBTkbT5vOT8Mp8SDuWvwhxEdPGvthIyALhqiG1yNbtaDZlYn94J8ioQ23jW7
 jRzI8aXCNxLYg==
Message-ID: <4b525afa-1031-4f99-a1ab-e89af77616eb@kernel.org>
Date: Thu, 28 Aug 2025 15:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] rust: pci: use pci::Vendor instead of
 bindings::PCI_VENDOR_ID_*
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DCE3EV79EX7N.DCIT9JWFGXGG@nvidia.com>
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

On 8/28/25 3:25 PM, Alexandre Courbot wrote:
> On Wed Aug 27, 2025 at 8:12 AM JST, John Hubbard wrote:
> <snip>
>> diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
>> index 4b0ad8d4edc6..fd7a789e3015 100644
>> --- a/rust/kernel/pci/id.rs
>> +++ b/rust/kernel/pci/id.rs
>> @@ -118,15 +118,14 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
>>   /// ```
>>   /// # use kernel::{device::Core, pci::{self, Vendor}, prelude::*};
>>   /// fn log_device_info(pdev: &pci::Device<Core>) -> Result<()> {
>> -///     // Compare raw vendor ID with known vendor constant
>> -///     let vendor_id = pdev.vendor_id();
>> -///     if vendor_id == Vendor::NVIDIA.as_raw() {
>> -///         dev_info!(
>> -///             pdev.as_ref(),
>> -///             "Found NVIDIA device: 0x{:x}\n",
>> -///             pdev.device_id()
>> -///         );
>> -///     }
>> +///     // Get the validated PCI vendor ID
>> +///     let vendor = pdev.vendor_id();
>> +///     dev_info!(
>> +///         pdev.as_ref(),
>> +///         "Device: Vendor={}, Device=0x{:x}\n",
>> +///         vendor,
>> +///         pdev.device_id()
>> +///     );
> 
> Why not use this new example starting from patch 2, which introduced the
> previous code that this patch removes?

I think that's because in v2 vendor_id() still returns the raw value. I think it
makes a little more sense if this patch simply introduces the example as an
example for vendor_id() itself.

I think struct Vendor does not necessarily need an example by itself.

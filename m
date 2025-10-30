Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42087C20AFA
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 15:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10110E9BB;
	Thu, 30 Oct 2025 14:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PxhXs4JB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241CA10E9BB
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 14:46:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A2DC60216;
 Thu, 30 Oct 2025 14:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88A9C4CEF1;
 Thu, 30 Oct 2025 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761835562;
 bh=P6OeGJeDpadoVy4JMF0e0f1jzLKG2wtlWUYKOJhRJ5M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PxhXs4JBJw2rJl9t/rzoMywma2ZzFbMmJavH4kJNf1PN+A+dDmK3QGKpTFEFuNTDn
 uzl05wStMd5oMf3H05Q5UDxaXsYRfQyIeiedA5P/nkJD0JJjglBoxruAR/SV5Dre8X
 Qc7Up9Y2cpvaQ9somuQyUC3Uo4yfY4qIErXNgKwafAnnsOSP2UuBPAYJ1mSFriZYfq
 6C4LZKoKYbYOjMAY07J5/Cp9cLBXQLEcV256cxSR+mH+8EFYv4nnV3DWuL8zDpX0wY
 j95PGc4mj2bFJ91gS8iRPXoh4tLkG3oMqGgaDh3fTns7IquJyXSJRA1NvoUfJmQ2iS
 DHckKOPJ3Xt2w==
Message-ID: <6ac08d3e-6057-4869-ae41-03a0f900a0bb@kernel.org>
Date: Thu, 30 Oct 2025 15:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Timur Tabi <ttabi@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
 <72be0fbab026191152154b1f04a45b32dfeb402d.camel@nvidia.com>
 <b9686644-e2dd-4abf-9dd7-fc12081f400f@nvidia.com>
 <479ae6b7fb05376d21bdfe1fcde9e3705c11ecc4.camel@nvidia.com>
 <b8796ee0-05fc-48e1-a075-2bad99b938d2@nvidia.com>
 <35c2d37d02409be8fea5acd713832da938966c43.camel@nvidia.com>
 <a1622011-6c86-4052-a808-31553e0b4916@nvidia.com>
 <18f013a69371ecd86783d09f73c7fb66d860e7df.camel@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <18f013a69371ecd86783d09f73c7fb66d860e7df.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/30/25 3:22 PM, Timur Tabi wrote:
> On Wed, 2025-10-29 at 22:30 -0700, John Hubbard wrote:
>> However, I don't want anyone to have to risk reading boot42 on some
>> ancient GPU (earlier than Fermi, even), with uncertain results.
>>
>> And our HW team has promised to leave behind arch0==0, arch1==1 in
>> in boot0, more or less forever, specifically to help us out here.
>>
>> With that in mind, I *do* want to read boot0 for the forseeable future,
>> as a guide to whether to look at boot42. I really think that is the
>> way to thread the needle here.
> 
> Sure, and this is exactly what is_ancient_gpu() does.  It tells you whether to use boot42
> instead of boot0.  It is the only function that looks at boot0.

I think you're indeed talking about the same thing, but thinking differently
about the implementation details.

A standalone is_ancient_gpu() function called from probe() like

	if is_ancient_gpu(bar) {
		return Err(ENODEV);
	}

is what we would probably do in C, but in Rust we should just call

	let spec = Spec::new()?;

from probe() and Spec::new() will return Err(ENODEV) when it run into an ancient
GPU spec internally.

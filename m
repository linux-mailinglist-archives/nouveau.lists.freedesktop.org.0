Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEA7B37404
	for <lists+nouveau@lfdr.de>; Tue, 26 Aug 2025 22:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E473110E6BF;
	Tue, 26 Aug 2025 20:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rs/wbgOk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4829B10E6A7
 for <nouveau@lists.freedesktop.org>; Tue, 26 Aug 2025 20:45:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DCF2643ED3;
 Tue, 26 Aug 2025 20:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8602C4CEF1;
 Tue, 26 Aug 2025 20:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756241157;
 bh=LPYcNdjWMT5gtus+yEjlqVcxtuCErQDBe3KmbDjEKpo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rs/wbgOk/M9U4khTkYQrkEcZAAJZPJKgPLyHGVhjpnV3M9gisMAtbAqUd5GImyNY8
 nHBrNJcoQEnvmuYFWAlWYukBJ5kHX/OjqCl4XJGfsLWCRB2UNmA5OM940s90utYg6X
 iyyl/mCudCgQTQ3b8vv80lksFNaNCjF4ZuPx9IoPC5F4zDAq61m6mnbfuZlKCuKciM
 ceVQeQHagtuk5ErmC25DfRFji/YaTDk/jmMyWWMx4mqvUMcABzDN21aCQqJ2CaengG
 hDz/q0JuKDd1ycP6euZj7ScVuBMKAT94bCohxTVcFHqB3EK4YBvGggAj9Piyo6qb9w
 vIHjU6uNbTiWg==
Message-ID: <54b19bdc-5d88-4f71-ad8e-886847ccee8a@kernel.org>
Date: Tue, 26 Aug 2025 22:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] rust: pci: provide access to PCI Vendor values
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
References: <20250822020354.357406-1-jhubbard@nvidia.com>
 <20250822020354.357406-3-jhubbard@nvidia.com>
 <DCBIF83RP6G8.1B97Z24RQ0T24@nvidia.com>
 <DCBIPY9UJTT4.ETBXLTRGJWHO@kernel.org>
 <b1cbdc99-317e-454c-bf03-d6793be5b13c@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <b1cbdc99-317e-454c-bf03-d6793be5b13c@nvidia.com>
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

On 8/26/25 10:38 PM, John Hubbard wrote:
> On 8/25/25 5:47 AM, Danilo Krummrich wrote:
>> On Mon Aug 25, 2025 at 2:33 PM CEST, Alexandre Courbot wrote:
> ...
>>> Naive question from someone with a device tree background and almost no
>>> PCI experience: one consequence of using `From` here is that if I create
>>> an non-registered Vendor value (e.g. `let vendor =
>>> Vendor::from(0xf0f0)`), then do `vendor.as_raw()`, I won't get the value
>>> passed initially but the one for `UNKNOWN`, e.g. `0xffff`. Are we ok
>>> with this?
>>
>> I think that's fine, since we shouldn't actually hit this. Drivers should only
>> ever use the pre-defined constants of Vendor; consequently the
>> Device::vendor_id() can't return UNKNOWN either.
>>
>> So, I think the From impl is not ideal, since we can't limit its visibility. In
>> order to improve this, I suggest to use Vendor::new() directly in the macro, and
>> make Vendor::new() private. The same goes for Class, I guess.
> 
> Correction: when I went to implement this, I discovered that there is a better
> way, which addresses both Alex's and your concerns.
> 
> The incremental diff below shows how. It provides:
> 
> a) .from_raw(), which in this case matches conventions slightly better
>     than new(). (I'm still learning that the Rust way is a bit different
>     that the C++ way! haha).
> 
> b) Only the parent module (in this case, that's pci:: ) can call
>     Class::from_raw(). This is exactly what we need. Fully private methods
>     wouldn't work, but leaving it open for any caller to construct a
>     Class item is also a problem.

Sorry, that's on me being not precise. When I said private I meant private to
the parent module.

The diff looks good, thanks!

Please also make sure to add #[inline] where appropriate and rebase onto
driver-core-next.

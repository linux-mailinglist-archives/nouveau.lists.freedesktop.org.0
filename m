Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBAB5301F
	for <lists+nouveau@lfdr.de>; Thu, 11 Sep 2025 13:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C1010EA9F;
	Thu, 11 Sep 2025 11:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OM53fV2N";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628B310EA9E;
 Thu, 11 Sep 2025 11:23:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D8A8B4382A;
 Thu, 11 Sep 2025 11:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA3AC4CEF0;
 Thu, 11 Sep 2025 11:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757589826;
 bh=p4waa9LkxC8TTbVh+HqVY69fXLYJWft8thFtWQWeKzo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OM53fV2NC+l33RRDjaAOxmYNre07SpJ6jmrQ8VFbi5RNanuG5K5lirnRtn0uwFmh/
 rb4or7E6glMg2cWFY3Ymlgyx398Y6cKWJpzvdETAQHkUdMipZ4HG5Ah9Wu3nPDJ2QX
 B5R269ptR+hbjRldrlhrLAhBVMIc0AwR4YDpcFA6TCmgTyEHfyvKUvnUEE1GzLqmtg
 w4Cd/hpJp1ut86yD4mMwKRn4oWVvkUKPLWy/PQpmKepsj7MkCXyiN3MJ6U52gjn//C
 GCFGgW0bsObFVCJEwcUGuke5HFPfV3eKCR3KMuGsAkrJkBUK4ibQU0hwPAh1iZdtPk
 gulQKZ1hUfhpA==
Message-ID: <694e6b89-4d83-4a61-87e8-5c420b60114f@kernel.org>
Date: Thu, 11 Sep 2025 13:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] gpu: nova-core: firmware: move firmware request
 code into a function
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-5-5a8a33bddca1@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250911-nova_firmware-v5-5-5a8a33bddca1@nvidia.com>
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

On 9/11/25 1:04 PM, Alexandre Courbot wrote:
> +/// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
> +fn request_nv_firmware(

I think just request_firmware() is fine.

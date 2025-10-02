Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF5CBB4EA6
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 20:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148CB10E83F;
	Thu,  2 Oct 2025 18:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZZxiVwJQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2F610E83F
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 18:43:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F49144E16;
 Thu,  2 Oct 2025 18:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A5BC4CEF4;
 Thu,  2 Oct 2025 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759430585;
 bh=QBNmt5nQdlSHz9BzuBtd1eA2i421wdZw4slxcTsU9mI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZZxiVwJQ3Gdddbl8tlI81HLrcH+SF1gBXj73zyK1t/LCdnFStHGm2vLioyscg8PWL
 rxGjFhzTnlkA5myQXJMtParIPOuheo+6qYqwVPYkWsIjOcgtkoEYsRORCvggv1agiK
 mzItaIqY/mlrzFmBB/PC3SGNGW6IZjECH29l070K29qRC16WcnNE88NTJGlR493y6S
 pZLYKk1tchd103m2436bNFmX1y4cE5QCeIgBjTBWCFVnxeUe+xwEFxoIjYqzGmuEwN
 Bo4K/61gEWrtqNQ3w54P4A6H83COawIobBmOF4gXr8S2r6RVne6x5Yt5lJ9gdHJHVK
 jQ7AUhjza0BVA==
Message-ID: <56daf2fe-5554-4d52-94b3-feec4834c5be@kernel.org>
Date: Thu, 2 Oct 2025 20:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rust: pci: skip probing VFs if driver doesn't
 support VFs
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Williamson
 <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251002135600.GB3266220@nvidia.com>
 <DD7XKV6T2PS7.35C66VPOP6B3C@kernel.org> <20251002152346.GA3298749@nvidia.com>
 <DD7YQK3PQIA1.15L4J6TTR9JFZ@kernel.org> <20251002170506.GA3299207@nvidia.com>
 <DD80P7SKMLI2.1FNMP21LJZFCI@kernel.org>
 <DD80R10HBCHR.1BZNEAAQI36LE@kernel.org>
 <af4b7ce4-eb13-4f8d-a208-3a527476d470@nvidia.com>
 <20251002180525.GC3299207@nvidia.com>
 <3ab338fb-3336-4294-bd21-abd26bc18392@kernel.org>
 <20251002183114.GD3299207@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251002183114.GD3299207@nvidia.com>
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

On 10/2/25 8:31 PM, Jason Gunthorpe wrote:
> This exactly how this function is used.
> 
> The core PF driver provides an API:
> 
> struct mlx5_core_dev *mlx5_vf_get_core_dev(struct pci_dev *pdev)
> 
> Which takes in the VF as pdev and internally it invokes:
> 
> 	mdev = pci_iov_get_pf_drvdata(pdev, &mlx5_core_driver);

Oh, I see, that makes sense then. Thanks for clarifying. I think I already had
in mind how this would look like in the Rust abstraction, and there we don't
need pci_iov_get_pf_drvdata() to achieve the same thing.

> /**
>  * pci_iov_get_pf_drvdata - Return the drvdata of a PF
>  * @dev: VF pci_dev
>  * @pf_driver: Device driver required to own the PF
>  *
>  * This must be called from a context that ensures that a VF driver is attached.
>  * The value returned is invalid once the VF driver completes its remove()
>  * callback.
>  *
>  * Locking is achieved by the driver core. A VF driver cannot be probed until
>  * pci_enable_sriov() is called and pci_disable_sriov() does not return until
>  * all VF drivers have completed their remove().
>  *
>  * The PF driver must call pci_disable_sriov() before it begins to destroy the
>  * drvdata.
>  */
> 
> Meaning nova-core has to guarentee to call pci_disable_sriov() before
> remove completes or before a failing probe returns as part of
> implementing SRIOV support.

Yes, I already thought about this. In the context of adding support for SR-IOV
in the Rust abstractions I'm planning on sending an RFC to let the subsystem
provide this guarantee instead (at least under certain conditions).

This will allow us to assert the device to be bound by the type system in the
Rust PCI abstraction, rather than having the driver to provide a guarantee to
call pci_disable_sriov() manually. :)

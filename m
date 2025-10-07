Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428DFBC0FB7
	for <lists+nouveau@lfdr.de>; Tue, 07 Oct 2025 12:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16EA10E370;
	Tue,  7 Oct 2025 10:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="coVJS50V";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDCA10E370
 for <nouveau@lists.freedesktop.org>; Tue,  7 Oct 2025 10:14:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C5F5D417A2;
 Tue,  7 Oct 2025 10:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C2CC4CEF1;
 Tue,  7 Oct 2025 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759832089;
 bh=Ju8nRdH0aqsvJyBikVF6BTkTxsWPAUsD1kJPBH9jKMI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=coVJS50VC5DdgdFrzMctuKfI1jM4biaLANzzCd6NZGDn2h+6DSADWSF5xTGb2Om6P
 4ZlcxbeDB8Us2HWYQ9fzV96fbmcYuIDtHexC1rMhRax7Wnyjk1OO+/ztARKcDEpNN+
 xX3J56OFoWZ80iGc4bqhDj/Gkn5YiCalk9EIarkYSMxC790kDET80jnVnNDk2f8fn2
 /GRpcmRhxUUy68agWtK0rFr4UBiedswkMhz0GFmIUlQ9E8G4oBGpDpJ/KHgY/WBwAo
 Mp4llS+zLw8oVM7+n4+G8PM4kXFvPalhLBMcahKodaY3RPKCXnKoAhE4sJc2WaUesJ
 aUuRiolcXc/Xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 12:14:42 +0200
Message-Id: <DDC0EQ0793TC.2W132ZB3J9LPK@kernel.org>
Subject: Re: [PATCH 0/2] rust: pci: expose is_virtfn() and reject VFs in
 nova-core
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Surath Mitra" <smitra@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Alex Williamson"
 <alex.williamson@redhat.com>, "Neo Jia" <cjia@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <fb5c2be5-b104-4314-a1f5-728317d0ca53@nvidia.com>
 <DD6LORTLMF02.6M7ZD36XOLJP@nvidia.com>
 <12076511-7113-4c53-83e8-92c5ea0eb125@nvidia.com>
 <5da095e6-040d-4531-91f9-cd3cf4f4c80d@nvidia.com>
 <20251001144814.GB3024065@nvidia.com>
 <c56bd720-d935-4b51-b507-d794df3f66f4@nvidia.com>
 <20251002115851.GB3195801@nvidia.com>
 <ea82af0d-663f-4038-b8c9-cf1eba5bc4df@nvidia.com>
 <20251002134221.GA3266220@nvidia.com>
 <0c94b94b-68a7-47e2-acde-0a2082ed36bf@nvidia.com>
 <20251002143116.GA3268803@nvidia.com>
 <75316915-fbae-487a-b710-ce01f088a2ed@nvidia.com>
In-Reply-To: <75316915-fbae-487a-b710-ce01f088a2ed@nvidia.com>
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

On Tue Oct 7, 2025 at 8:51 AM CEST, Zhi Wang wrote:
> From the device vendor=E2=80=99s perspective, we have no support or use c=
ase for
> a bare-metal VF model, not now and not in the foreseeable future.

Who is we? I think there'd be a ton of users that do see such use-cases.

What does "no support" mean? Are there technical limitation that prevent an
implementation (I haven't seen any so far)?

> Even
> hypothetically, such support would not come from nova-core.ko, since
> that would defeat the purpose of maintaining a trimmed-down kernel
> module where minimizing the attack surface and preserving strict
> security boundaries are primary design goals.

I wouldn't say the *primary* design goal is to be as trimmed-down as possib=
le.

The primary design goals are rather proper firmware abstraction, addressing
design incompatibilities with modern graphics and compute APIs, memory safe=
ty
concerns and general maintainability.

It does make sense to not run the vGPU use-case on top of all the additiona=
l DRM
stuff that will go into nova-drm, since this is clearly not needed in the v=
GPU
use-case. But, it doesn't mean that we have to keep everything out of nova-=
core
for this purpose.

I think the bare-metal VF model is a very interesting use-case and if it is
technically feasable we should support it. And I think it should be in
nova-core. The difference between nova-core running on a bare metal VF and
nova-core running on the same VF in a VM shouldn't be that different anyway=
s,
no?

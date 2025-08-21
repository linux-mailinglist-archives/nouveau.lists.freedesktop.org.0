Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE2B2F5AC
	for <lists+nouveau@lfdr.de>; Thu, 21 Aug 2025 12:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F7710E2EA;
	Thu, 21 Aug 2025 10:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cZiMedDg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2297F10E2EA
 for <nouveau@lists.freedesktop.org>; Thu, 21 Aug 2025 10:52:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FFB4449EA;
 Thu, 21 Aug 2025 10:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42508C4CEED;
 Thu, 21 Aug 2025 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755773564;
 bh=R1V1AwRna/S8N/EhSnIaw17FsINeg5f7DVVQw8h2ON4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=cZiMedDgUMqwW3c+r9YzeXcJDpQqFJYlJ78w2zvhV9OUFIDzp56Gb1oMLnNNJYyz/
 AhsjENOCWk4xjaeuNqrxJdVNOmuOwmbygmsyKgM1eV3nLDHQg902o4M+KWuLNekYGi
 K6Avk/aw0OdBeQIGOqjAuqbS0OXHXsCiEWCXsx9l4Dv+IOsKkJW8duuI0PSYdGK2nw
 E9AFbwyanXElhVNV34z2bpjdcJCh3vcDVfJEcCPCYkh3LgLnDSVb4fxgojqTGrD73v
 BZ86KcW+d1VwgjHPXCDOGXdvQuK3hwdxrDobRO877jYn9kAe338WWnL1ZoiENoegu2
 OmJb8j7tECFrg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Aug 2025 12:52:38 +0200
Message-Id: <DC81S5SN8N76.YH4323TLNHJK@kernel.org>
Subject: Re: [PATCH v5 3/4] gpu: nova-core: avoid probing
 non-display/compute PCI functions
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Elle Rhumsaa" <elle@weathered-steel.dev>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250821044207.3732-1-jhubbard@nvidia.com>
 <20250821044207.3732-4-jhubbard@nvidia.com>
In-Reply-To: <20250821044207.3732-4-jhubbard@nvidia.com>
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

On Thu Aug 21, 2025 at 6:42 AM CEST, John Hubbard wrote:
> NovaCore has so far been too imprecise about figuring out if .probe()
> has found a supported PCI PF (Physical Function). By that I mean:
> .probe() sets up BAR0 (which involves a lot of very careful devres and
> Device<Bound> details behind the scenes). And then if it is dealing with
> a non-supported device such as the .1 audio PF on many GPUs, it fails
> out due to an unexpected BAR0 size. We have been fortunate that the BAR0
> sizes are different.
>
> Really, we should be filtering on PCI class ID instead. These days I
> think we can confidently pick out Nova's supported PF's via PCI class
> ID. And if not, then we'll revisit.
>
> The approach here is to filter on "Display VGA" or "Display 3D", which
> is how PCI class IDs express "this is a modern GPU's PF".
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 33 ++++++++++++++++++++++++++++-----
>  rust/kernel/pci.rs              | 21 +++++++++++++++++++++

Can you please split this one up in two patches?

>  2 files changed, 49 insertions(+), 5 deletions(-)

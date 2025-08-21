Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267A1B2F5A6
	for <lists+nouveau@lfdr.de>; Thu, 21 Aug 2025 12:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F13410E083;
	Thu, 21 Aug 2025 10:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IB04F8o0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F3C10E083
 for <nouveau@lists.freedesktop.org>; Thu, 21 Aug 2025 10:51:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 909AA60200;
 Thu, 21 Aug 2025 10:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D22FC4CEEB;
 Thu, 21 Aug 2025 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755773492;
 bh=cMytUFE1fmlfUaGX9cWvvFMAHcz0yzHNBDICGtrf7sk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=IB04F8o0JStewSEpV2ymvEO/zxxGwgvH1bK6Jr2UUPMiahi7qVV2NkjTaCjC00iZ8
 BBv36c6YLtgB7Dl5ddxh3qtB0JFm6HgEoUG78aRRQBArXGRHlUeFJ7V4dB28g/tNaO
 1RkdVuZSm6ueWKFtwQAZ1s4JKLRHKOv+Tz4P6B0FsR0YMycztEt2sDxfITlSvhYjdi
 4Q1zdq6f3oz9kqvLBfDD4gEidTRkppcS8ClTsTQX+n80DKy8I/WXLW1UUn3HC+REU8
 d5vKL5tMXNFT4vtyCuWzJ+2lyDJDiuGGwYdk+dLjbAwiL98bFT3qfLjmo/rHNFVv/i
 iS7H8QZ8pfwAA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Aug 2025 12:51:26 +0200
Message-Id: <DC81R8RHTHTC.3J58ODZD3UQLQ@kernel.org>
Subject: Re: [PATCH v5 1/4] rust: pci: provide access to PCI Class and
 Class-related items
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
 <20250821044207.3732-2-jhubbard@nvidia.com>
In-Reply-To: <20250821044207.3732-2-jhubbard@nvidia.com>
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
> Allow callers to write Class::STORAGE_SCSI instead of
> bindings::PCI_CLASS_STORAGE_SCSI, for example.
>
> New APIs:
>     Class::STORAGE_SCSI, Class::NETWORK_ETHERNET, etc.
>     Class::as_raw()
>     Class: From<u32> for Class
>     ClassMask: Full, ClassSubclass
>     Device::pci_class()
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  rust/kernel/pci.rs    |  10 ++
>  rust/kernel/pci/id.rs | 239 ++++++++++++++++++++++++++++++++++++++++++

Please add rust/kernel/pci/ to the maintainers entry.

(Would have done on apply, but I have another comment on patch 3.)

>  2 files changed, 249 insertions(+)
>  create mode 100644 rust/kernel/pci/id.rs

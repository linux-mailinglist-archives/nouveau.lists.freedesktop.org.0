Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C9B2DBD8
	for <lists+nouveau@lfdr.de>; Wed, 20 Aug 2025 13:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F6610E70F;
	Wed, 20 Aug 2025 11:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eAfSqlxm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6DB10E70F
 for <nouveau@lists.freedesktop.org>; Wed, 20 Aug 2025 11:56:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9238A5C689B;
 Wed, 20 Aug 2025 11:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE46C4CEEB;
 Wed, 20 Aug 2025 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755690977;
 bh=6M6pVjOhBfeqwKpYkqz5paUIiMzASEW08D70GptOgJA=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=eAfSqlxmkPHJo5yDX5t6UQTQrD0VFx7zJF/ZOOyguTzkP5uA62dDGkrGDcBPzl3te
 oxebeKWufKYdm84RpdHWR1kSEknK6c6mob94Pb8OngKRwKu2PHEopElVZkX+bfawt1
 344PX6/6kKj/bYMxgBRow/8/0RDhBEQfDfRmsI+zRcYGqQ7JWSMRFLA2nkzMCR6eVA
 ab6ga22cFBXP3XkRaM4STSrt4fju6QETApBbVheqJHDPgxkeuf8xYfh3Q+J0NQynFX
 E0GJFmuTSk0x4voxqWCkHmMFFjIxn/n1Gadz4XCra/fUgTqXW2N+rP/erXX1WxOC62
 5pyqTKe36HYDg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 13:56:12 +0200
Message-Id: <DC78IA71Z47V.1N46WE5U3EI5C@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 3/3] rust: pci: provide access to PCI Vendor values
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
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20250820030859.6446-1-jhubbard@nvidia.com>
 <20250820030859.6446-4-jhubbard@nvidia.com>
In-Reply-To: <20250820030859.6446-4-jhubbard@nvidia.com>
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

On Wed Aug 20, 2025 at 5:08 AM CEST, John Hubbard wrote:
>  impl Device {
> -    /// Returns the PCI vendor ID.
> -    pub fn vendor_id(&self) -> u16 {
> +    /// Returns the PCI vendor ID as a validated Vendor.
> +    /// Returns an error if the vendor ID is not recognized.
> +    pub fn vendor_id(&self) -> Result<Vendor> {
>          // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev=
`.
> -        unsafe { (*self.as_raw()).vendor }
> +        let vendor_id =3D unsafe { (*self.as_raw()).vendor };
> +        Vendor::try_from(vendor_id as u32)
>      }

Same as for Class, I think we just want Vendor::UNKNOWN.

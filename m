Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09CDB2DBB2
	for <lists+nouveau@lfdr.de>; Wed, 20 Aug 2025 13:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCB310E70C;
	Wed, 20 Aug 2025 11:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LvF3LCgn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DBE10E70C
 for <nouveau@lists.freedesktop.org>; Wed, 20 Aug 2025 11:51:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0404161435;
 Wed, 20 Aug 2025 11:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE17C116C6;
 Wed, 20 Aug 2025 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755690693;
 bh=BCf4oy3QiJQA2+jBC9hoGaSkFNSQT5YL981+qIDojUw=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=LvF3LCgnY/GRzggNVn5MVRpF1l34cVed2W+D2xfBDGpoIIexSuXLQevyOV7UgyVTI
 SSY6cRe0xJB9Ervp6COFmHDzciYoopkjK8pMYIeSo9EpH1t+/mayrtByB0a44selC9
 m2ukkfuvJHwj/C2d7hykXlCBl8gH6YPRt1nyv4XDU0ACgqkdkVwz7kmPdQl2kvphvg
 jKDwz0dpEIYqBajdusZCBBDY93HkU5XWg0dK7aXd1FGaf7177lzRi/9RTmgz18Wwxq
 bJTB0aKFDe7rTll7wUDQ08DEPSxJylSUdriCHKm1wIQ0X4A5Fs3NgMTQ1G6xDpp7V1
 tktYKZr0xTy/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 13:51:28 +0200
Message-Id: <DC78ENI8QVIO.1AU7LK858YKTM@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/3] rust: pci: provide access to PCI Class and
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
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20250820030859.6446-1-jhubbard@nvidia.com>
 <20250820030859.6446-2-jhubbard@nvidia.com>
In-Reply-To: <20250820030859.6446-2-jhubbard@nvidia.com>
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
> Allow callers to write Class::STORAGE_SCSI instead of
> bindings::PCI_CLASS_STORAGE_SCSI, for example.
>
> New APIs:
>     Class::STORAGE_SCSI, Class::NETWORK_ETHERNET, etc.
>     Class::as_raw()
>     Class: TryFrom<u32> for Class
>     ClassMask: Full, ClassSubclass
>     DeviceId::from_class_and_vendor()
>     Device::pci_class()
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> +    /// Returns the PCI class as a `Class` struct.
> +    /// Returns an error if the class code is not recognized.
> +    pub fn pci_class(&self) -> Result<Class> {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev=
`.
> +        Class::new(unsafe { (*self.as_raw()).class })
> +    }

I think all this turned out very nice!

One thing to reconsider would be whether we really want this to be fallible=
.

It's probably better to define a pci::Class::UNKNOWN and implement

	impl From<u32> for Class {
	    fn from(value: u32) -> Self {
	        match value {
	            $(x if x =3D=3D Self::$variant.0 =3D> Self::$variant,)+
	            _ =3D> Self::UNKNOWN,
	        }
	    }
	}

instead.

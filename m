Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095DABA0893
	for <lists+nouveau@lfdr.de>; Thu, 25 Sep 2025 18:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF58310E987;
	Thu, 25 Sep 2025 16:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I2VsaC8b";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B653110E981
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 16:04:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6A11A4028A;
 Thu, 25 Sep 2025 16:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBD4C4CEF5;
 Thu, 25 Sep 2025 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758816284;
 bh=J4lfDJvJgocwerP41ChdYCyqljRyihOByw2tDqIsf/0=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=I2VsaC8bw4xCfIrNIpD1bNAl+0M2V2X1yr6BfxIQWRuKkpujsnlGPvTTgbhN+H46K
 CS8iZ7KQwSNoYBxUa3fV9xrwrtBUaa3zShjwn9+GsIFEPScHG06lFcG7CER/G14reF
 jKZ97z1grrkrJOoidPf9wm8jCb8n/Qa+8LBmooC8JP1PCoWLc6jr4CmYl9wb5L1X6J
 OJOVZKuzSsyQgT5NYRseInCHnm+nAFwG8GZmAZkkmbwgA2MKcG84clKVOkKxGJRgzu
 /T2h9fTtNvfUJQNDfqyGbOuSN1vsCNxYVM0206IExEQl+GxbDPurjctd+pqLfjDhqi
 sUlcOBOgn96Dw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Sep 2025 18:04:38 +0200
Message-Id: <DD20C3S0YCK0.25BIXD409WED2@kernel.org>
Subject: Re: [PATCH 0/2] rust: pci: display symbolic PCI vendor and class names
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
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250925013359.414526-1-jhubbard@nvidia.com>
In-Reply-To: <20250925013359.414526-1-jhubbard@nvidia.com>
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

On Thu Sep 25, 2025 at 3:33 AM CEST, John Hubbard wrote:
> This applies to:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git

This is an old tree, the new one is:

https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
/

> John Hubbard (2):

Applied to driver-core-testing, thanks!

>   rust: pci: display symbolic PCI class names
>   rust: pci: display symbolic PCI vendor names

    [ Remove #[inline] for Vendor::fmt(). - Danilo ]

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A67BB3DDC
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 14:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C054E10E7CF;
	Thu,  2 Oct 2025 12:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Itkbsf7K";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FABD10E19D
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 12:18:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0242562054;
 Thu,  2 Oct 2025 12:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B33C4CEF4;
 Thu,  2 Oct 2025 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759407522;
 bh=XJh2rU3g6FXXRr4HSBSk9BT1NPgHOKWJMap6jFw2cfg=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Itkbsf7K6rt0J5zJFgF2UWghEIS0HfpbGyuQ1ojxLJcd8r+glln6f3tNWRgQNH9Iu
 Fb0f2Uy8sXoj6ke0Pi52KQsLjnpRlVcFcAeGMfiP2TqxuDvK8rq/243Csf5o/c9A7I
 Xd99xQIkKU1pN24b/Awhcjpjpdg/rXg9j6pdv1y+5evbPfL+U07Sas6zMq5HfOFpE8
 PRDexDCSSFaW980uSnl5JKkjuBV1DDd4/j2BefmELCFAr/1xIrZkmkQOxpNHH93dYS
 KVIm9J47v/2XiWmweZPaNtcIH9DfZuks4kFpN+EzPXElqJYsohsCakGqqqXkYtNtBq
 gXPjP5WhMTT7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 14:18:36 +0200
Message-Id: <DD7TWUPD83M9.5IO0VX7PP1UK@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: pci: skip probing VFs if driver doesn't
 support VFs
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Surath Mitra" <smitra@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alex Williamson"
 <alex.williamson@redhat.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251002020010.315944-1-jhubbard@nvidia.com>
 <20251002020010.315944-2-jhubbard@nvidia.com>
 <20251002121110.GE3195801@nvidia.com>
In-Reply-To: <20251002121110.GE3195801@nvidia.com>
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

On Thu Oct 2, 2025 at 2:11 PM CEST, Jason Gunthorpe wrote:
> On Wed, Oct 01, 2025 at 07:00:09PM -0700, John Hubbard wrote:
>> Add a "supports_vf" flag to struct pci_driver to let drivers declare
>> Virtual Function (VF) support. If a driver does not support VFs, then
>> the PCI driver core will not probe() any VFs for that driver's devices.
>>=20
>> On the Rust side, add a const "SUPPORTS_VF" Driver trait, defaulting to
>> false: drivers must explicitly opt into VF support.
>
> As I said in the other thread - please no.
>
> Linux drivers are expected to run on their VFs.

The consequence would be that drivers for HW that can export VFs would need=
 to
be rejected upstream if they only support the PF, but no VFs. IMHO, that's =
an
unreasonable requirement.

Don't get me wrong, I agree that it'd be great if all drivers would (be abl=
e to)
support the corresponding VFs.

But in practice that's not always the case, so I'd rather have a common way=
 to
let drivers assert what they support over going back to the "old model" of
probing drivers, where we just rely on probe() to fail.

> This temporary
> weirdness of novacore should not be elevated to a core behavior that
> people will misuse.

It's not just nova-core, please see [1].

[1] https://lore.kernel.org/lkml/DD7TP31FEE92.2E0AKAHUOHVVF@kernel.org/

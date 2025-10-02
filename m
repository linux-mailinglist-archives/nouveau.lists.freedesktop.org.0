Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E41BB3DA2
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 14:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A456F10E7CC;
	Thu,  2 Oct 2025 12:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ov2s+3Ra";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3452410E7CC
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 12:08:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1737141695;
 Thu,  2 Oct 2025 12:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A725C4CEF4;
 Thu,  2 Oct 2025 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759406913;
 bh=tb+QlM/Ac5Zz+ol4V4q9n2Sx0VeZEGrctLpsPyzSZ/k=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Ov2s+3RamDIsz558ZwAxKFI3wxtJ6RcDcvlPFYTiGQ9OOT7N5Wwed8fMa9Cs4mKIg
 vdxvGbGnfFaaj1e0SqgftZikY1SH02xYLw5hG0Gb9siGYXDif56X0aoAUfWkKz02Z7
 VTX2wo8znoNbJKCxfwrP24wiSk341/53Ged48CEbYFnKgH9s5t1LULBiMKF2fu6C31
 07cqIRRu+z21E/iFXFxjTMRNNBGSA65XB6whdQf7x4Yts4HkxLIHDVhy8HmaZv7x/B
 5XvOsA76/buhEn3u0OkqePQt7yiE+6y71o0y9IBJHmUMd/HNcF7bHbJ+U5xmoDGLIp
 SDyeKIaiS0YFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 14:08:27 +0200
Message-Id: <DD7TP31FEE92.2E0AKAHUOHVVF@kernel.org>
Subject: Re: [PATCH 0/2] rust: pci: expose is_virtfn() and reject VFs in
 nova-core
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Surath Mitra" <smitra@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Alex Williamson" <alex.williamson@redhat.com>
To: "Jason Gunthorpe" <jgg@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250930220759.288528-1-jhubbard@nvidia.com>
 <h6jdcfhhf3wuiwwj3bmqp5ohvy7il6sfyp6iufovdswgoz7vul@gjindki2pyeh>
 <e77bbcda-35a3-4ec6-ac24-316ab34a201a@nvidia.com>
 <DD6X0PXA0VAO.101O3FEAHJUH9@kernel.org>
 <f145fd29-e039-4621-b499-17ab55572ea4@nvidia.com>
 <ae48fad0-d40e-4142-87d0-8205abdf42d6@nvidia.com>
 <DD7CREVYE5L7.2FALGBC35L8CN@kernel.org>
 <20251002120149.GC3195801@nvidia.com>
In-Reply-To: <20251002120149.GC3195801@nvidia.com>
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

On Thu Oct 2, 2025 at 2:01 PM CEST, Jason Gunthorpe wrote:
> On Thu, Oct 02, 2025 at 12:52:10AM +0200, Danilo Krummrich wrote:
>
>> Indicating whether the driver supports VFs through a boolean in struct
>> pci_driver is about the same effort (well, maybe slightly more), but sol=
ves the
>> problem in a cleaner way since it avoids probe() being called in the fir=
st
>> place. Other existing drivers benefit from that as well.
>
> I'm strongly against that idea.
>
> Drivers should not be doing things like this, giving them core code
> helpers to do something they should not do is the wrong direction.
>
> I think this patchset should be simply dropped. Novacore should try to
> boot on a VF and fail if it isn't setup.

Why? What about other upstream drivers that clearly assert that they don't
support VFs? Why would we want to force them to try to boot to a point wher=
e
they "naturally" fail?

I think there's nothing wrong with allowing drivers to "officially" assert =
that
they're intended for PFs only.

Here are a few examples of drivers that have the same requirement:

https://elixir.bootlin.com/linux/v6.17/source/drivers/net/ethernet/realtek/=
rtase/rtase_main.c#L2195
https://elixir.bootlin.com/linux/v6.17/source/drivers/net/ethernet/intel/ic=
e/ice_main.c#L5266
https://elixir.bootlin.com/linux/v6.17/source/drivers/net/ethernet/intel/ig=
b/igb_main.c#L3221

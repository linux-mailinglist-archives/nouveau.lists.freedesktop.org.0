Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A88BB3EAE
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 14:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4244710E7DB;
	Thu,  2 Oct 2025 12:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W5Sw3XVh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245BA10E7DB
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 12:41:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D91B416D5;
 Thu,  2 Oct 2025 12:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91715C4CEF4;
 Thu,  2 Oct 2025 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759408884;
 bh=OB5RZ2Z3NNTRxf89lDpwSKFcKfYCorQFxOEo52iWI+U=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=W5Sw3XVh4RP2WI7MzUZNVzll6Senx/XbyFHBwLEvwPdNyr0EuYQrYFNYXmIlP1Tk4
 TedK5fEfuXLAdIgiENFxOBxMNHAyKlZntJkedU+m09NMAHbPrTy1JsT+hZYtPjRwtv
 Rh8pOYx1LqNELyZ++H4akBxB+JAuWiyZLbUtvsf/Ufj8yQWwmpgqqPf1npc3u4zYSP
 XD6lfoiWqzJeAjIAVcatkuQrSH52T9koEXBGMLGRXVvlF6zoQk7mgAf3F98HMeDIDT
 FfAx5bC9wFWUMFE4xcSeRGaaAFrerVV3Xm3oEwXlwRr1ewee9EhCGEk1YJJuY9o0Cd
 fWBkg5x9c65mA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 14:41:17 +0200
Message-Id: <DD7UE89USTBA.IQ7QR72RUSVB@kernel.org>
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
 <DD7TP31FEE92.2E0AKAHUOHVVF@kernel.org>
 <20251002123244.GF3195801@nvidia.com>
In-Reply-To: <20251002123244.GF3195801@nvidia.com>
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

On Thu Oct 2, 2025 at 2:32 PM CEST, Jason Gunthorpe wrote:
> On Thu, Oct 02, 2025 at 02:08:27PM +0200, Danilo Krummrich wrote:
>
>> Why? What about other upstream drivers that clearly assert that they don=
't
>> support VFs?
>
> They shouldn't be doing that either. There is lots of junk in Linux,
> that doesn't mean it should be made first-class to encourage more
> people to do the wrong thing.

Let's discontinue this thread and keep discussing in the v2 one, since the
discussions converge.

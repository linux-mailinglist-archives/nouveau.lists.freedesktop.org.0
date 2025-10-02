Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF5BB4470
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 17:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42CA10E7F6;
	Thu,  2 Oct 2025 15:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b7LAEI6A";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110D010E7F6
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 15:11:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 364966135A;
 Thu,  2 Oct 2025 15:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8D0C4CEF4;
 Thu,  2 Oct 2025 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759417867;
 bh=FNclR2C69WQjyAgJd3PWTF23QQxMqsFUS9Q5YQBoudQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=b7LAEI6A6X546xyoF4Ubb8NI3YdGNvaf/frUPbRe5r73qhmkrRjcLnf/9Lbbl05x1
 bceaUsBFQNzE+rDRu+V+2H/e/ibmjucWQvWLj1U5YnwDZmfg2fOroR+TpcUwqsFbGK
 AUNsL/ekG3Ksyie+AtPSMbscI1/ffKm24o2Q6lhfdJoMo/JDZO3PJKoAn7BpOcpO47
 gYjqSYKmpIDbQ6iKO0owh/TeE4cZF3BWlJQ4TZc3gB2EnzP6jVkO/Qz7jTlloYYn+p
 2n8nv942OpFmUZbjSSVNs2qwMEyzQYidZcNpQuSHHFGwGY9xI52RlmA5jOyMyRavCG
 +Py3BykTxtXAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 17:11:01 +0200
Message-Id: <DD7XKV6T2PS7.35C66VPOP6B3C@kernel.org>
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
 <DD7TWUPD83M9.5IO0VX7PP1UK@kernel.org>
 <20251002123921.GG3195801@nvidia.com>
 <DD7UVCEVB21H.SQ00WZLLPINP@kernel.org>
 <20251002135600.GB3266220@nvidia.com>
In-Reply-To: <20251002135600.GB3266220@nvidia.com>
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

On Thu Oct 2, 2025 at 3:56 PM CEST, Jason Gunthorpe wrote:
> On Thu, Oct 02, 2025 at 03:03:38PM +0200, Danilo Krummrich wrote:
>
>> I think it's not unreasonable to have a driver for the PF and a separate=
 driver
>> for the VFs if they are different enough; the drivers can still share co=
mmon
>> code of course.
>
> This isn't feasible without different PCI IDs.

At least on the host you can obviously differentiate them.

>> Surely, you can argue that if they have different enough requirements th=
ey
>> should have different device IDs, but "different enough requirements" is=
 pretty
>> vague and it's not under our control either.
>
> If you want two drivers in Linux you need two PCI IDs.
>
> We can't reliably select different drivers based on VFness because
> VFness is wiped out during virtualization.

Sure, but I thought the whole point is that some VFs are not given directly=
 to
the VM, but have some kind of intermediate layer, such as vGPU. I.e. some k=
ind
of hybrid approach between full pass-through and mediated devices?

>> But, if there is another solution for VFs already, e.g. in the case of n=
ova-core
>> vGPU, why restrict drivers from opt-out of VFs. (In a previous reply I m=
entioned
>> I prefer opt-in, but you convinced me that it should rather be
>> opt-out.)
>
> I think nova-core has a temporary (OOT even!) issue that should be
> resolved - that doesn't justify adding core kernel infrastructure that
> will encourage more drivers to go away from our kernel design goals of
> drivers working equally in host and VM.

My understanding is that vGPU will ensure that the device exposed to the VM=
 will
be set up to be (at least mostly) compatible with nova-core's PF code paths=
?

So, there is a semantical difference between vGPU and nova-core that makes =
a
differentiation between VF and PF meaningful and justified.

But maybe this understanding is not correct. If so, please educate me.

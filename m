Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE83CBB4B5A
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 19:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAE910E156;
	Thu,  2 Oct 2025 17:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hi4eaRPN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686F10E156
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 17:37:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D97B63D0C;
 Thu,  2 Oct 2025 17:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235D9C4CEF4;
 Thu,  2 Oct 2025 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759426671;
 bh=S0d9r03/9v9N3ZbCfImI3d/7yrfx9R+EGPykgOqDrXk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=hi4eaRPNY9GEnJ2h2BRe9o/nS8dMgEJHsVzfOyYM6Fw41EHvpUVbPYDk2+QUPXbb1
 IafOee7NPx++PZaNdXwgGrQ9695Zx8Pj/f6rHllmpA3yieNn9S/6mkdcAOBO81z2Yv
 lY89xlUsG16x/xgWtoH0k1IlrlA6w+o2lbSpwYRWdGGEULKpkoNWS1emq2GeohUO97
 2uygYRZtIMk9ggYcAEhaoMDIdRk2ZXl5jLMgbCgrQHfEHxJzaqEBFiZiAIo2F04bA5
 ia8v+Rsc02aFbpMPs7yyFwaJ+ZNjtLHu2yeHystxJSWb3MAXmb4hclIbUobUY6BmMn
 ZGZcpoyN0Mcog==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 19:37:45 +0200
Message-Id: <DD80P7SKMLI2.1FNMP21LJZFCI@kernel.org>
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
 <DD7XKV6T2PS7.35C66VPOP6B3C@kernel.org>
 <20251002152346.GA3298749@nvidia.com>
 <DD7YQK3PQIA1.15L4J6TTR9JFZ@kernel.org>
 <20251002170506.GA3299207@nvidia.com>
In-Reply-To: <20251002170506.GA3299207@nvidia.com>
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

On Thu Oct 2, 2025 at 7:05 PM CEST, Jason Gunthorpe wrote:
> On Thu, Oct 02, 2025 at 06:05:28PM +0200, Danilo Krummrich wrote:
>> On Thu Oct 2, 2025 at 5:23 PM CEST, Jason Gunthorpe wrote:
>> > This is not what I've been told, the VF driver has significant
>> > programming model differences in the NVIDIA model, and supports
>> > different commands.
>>=20
>> Ok, that means there are some more fundamental differences between the h=
ost PF
>> and the "VM PF" code that we have to deal with.
>
> That was my understanding.
> =20
>> But that doesn't necessarily require that the VF parts of the host have =
to be in
>> nova-core as well, i.e. with the information we have we can differentiat=
e
>> between PF, VF and PF in the VM (indicated by a device register).
>
> I'm not entirely sure what you mean by this..
>
> The driver to operate the function in "vGPU" mode as indicated by the
> register has to be in nova-core, since there is only one device ID.

Yes, the PF driver on the host and the PF (from VM perspective) driver in t=
he VM
have to be that same. But the VF driver on the host can still be a seaparat=
e
one.

>> > If you look at the VFIO driver RFC it basically does no mediation, it
>> > isn't intercepting MMIO - the guest sees the BARs directly. Most of
>> > the code is "profiling" from what I can tell. Some config space
>> > meddling.
>>=20
>> Sure, there is no mediation in that sense, but it needs quite some setup
>> regardless, no?
>>
>> I thought there is a significant amount of semantics that is different b=
etween
>> booting the PF and the VF on the host.
>
> I think it would be good to have Zhi clarify more of this, but from
> what I understand are at least three activites comingled all together:
>
>  1) Boot the PF in "vGPU" mode so it can enable SRIOV

Ok, this might be where the confusion above comes from. When I talk about
nova-core in vGPU mode I mean nova-core running in the VM on the (from VM
perspective) PF.

But you seem to mean nova-core running on the host PF with vGPU on top? Tha=
t of
course has to be in nova-core.

>  2) Enable SRIOV and profile VFs to allocate HW resources to them

I think that's partially in nova-core and partially in vGPU; nova-core prov=
iding
the abstraction of the corresponding firmware / hardware interfaces and vGP=
U
controlling the semantics of the resource handling?

This is what I thought vGPU has a secondary part for where it binds to nova=
-core
through the auxiliary bus, i.e. vGPU consisting out of two drivers actually=
; the
VFIO parts and a "per VF resource controller".

>  3) VFIO variant driver to convert the VF into a "VM PF" with whatever
>     mediation and enhancement needed

That should be vGPU only land.

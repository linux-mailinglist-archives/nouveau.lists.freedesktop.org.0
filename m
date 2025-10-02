Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88617BB4B7E
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 19:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A69710E1CC;
	Thu,  2 Oct 2025 17:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tMs+zvMv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC1310E1CC
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 17:40:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2F1E943912;
 Thu,  2 Oct 2025 17:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48285C4CEF4;
 Thu,  2 Oct 2025 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759426814;
 bh=oYrJIA6vkpZceZ0M4mLdsW2GlBt5dZV94uJaeXi0tbw=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=tMs+zvMve/ExgwSR4GhJRVFojCHnCjw6KsVJvq7zKVIqlvrLizd4h4L7T+SuaEFn/
 uWJ4QHe7cbigKndSLyAa5/1m/W7nucbm2fkjaJ+nr/D/qCByUap9cW5IluD1SZsawQ
 0mNiDqDSJOgShiOTsX6VynxmTpHlmnMCMeVEiLTSdLXWTaEhHbmyyEHYTD27i05ElT
 gCEoAgmYoyNOwkaJbz/ao3M4CbG+nM2a7CQR+QyNB5Pi+QHPWkP/3ST7Ie0AnnN8Wd
 rMJb2zVXKIK8TstdDYQ4NqWpLjp9L5YOZ7Ms2QyrSNstEqZxuDu8zvSIn/4Su1B3AP
 R1O74Jlt8l4kQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 19:40:07 +0200
Message-Id: <DD80R10HBCHR.1BZNEAAQI36LE@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
 <DD80P7SKMLI2.1FNMP21LJZFCI@kernel.org>
In-Reply-To: <DD80P7SKMLI2.1FNMP21LJZFCI@kernel.org>
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

On Thu Oct 2, 2025 at 7:37 PM CEST, Danilo Krummrich wrote:
> On Thu Oct 2, 2025 at 7:05 PM CEST, Jason Gunthorpe wrote:
>> On Thu, Oct 02, 2025 at 06:05:28PM +0200, Danilo Krummrich wrote:
>>> On Thu Oct 2, 2025 at 5:23 PM CEST, Jason Gunthorpe wrote:
>>> > This is not what I've been told, the VF driver has significant
>>> > programming model differences in the NVIDIA model, and supports
>>> > different commands.
>>>=20
>>> Ok, that means there are some more fundamental differences between the =
host PF
>>> and the "VM PF" code that we have to deal with.
>>
>> That was my understanding.
>> =20
>>> But that doesn't necessarily require that the VF parts of the host have=
 to be in
>>> nova-core as well, i.e. with the information we have we can differentia=
te
>>> between PF, VF and PF in the VM (indicated by a device register).
>>
>> I'm not entirely sure what you mean by this..
>>
>> The driver to operate the function in "vGPU" mode as indicated by the
>> register has to be in nova-core, since there is only one device ID.
>
> Yes, the PF driver on the host and the PF (from VM perspective) driver in=
 the VM
> have to be that same. But the VF driver on the host can still be a seapar=
ate
> one.
>
>>> > If you look at the VFIO driver RFC it basically does no mediation, it
>>> > isn't intercepting MMIO - the guest sees the BARs directly. Most of
>>> > the code is "profiling" from what I can tell. Some config space
>>> > meddling.
>>>=20
>>> Sure, there is no mediation in that sense, but it needs quite some setu=
p
>>> regardless, no?
>>>
>>> I thought there is a significant amount of semantics that is different =
between
>>> booting the PF and the VF on the host.
>>
>> I think it would be good to have Zhi clarify more of this, but from
>> what I understand are at least three activites comingled all together:
>>
>>  1) Boot the PF in "vGPU" mode so it can enable SRIOV
>
> Ok, this might be where the confusion above comes from. When I talk about
> nova-core in vGPU mode I mean nova-core running in the VM on the (from VM
> perspective) PF.
>
> But you seem to mean nova-core running on the host PF with vGPU on top? T=
hat of
> course has to be in nova-core.
>
>>  2) Enable SRIOV and profile VFs to allocate HW resources to them
>
> I think that's partially in nova-core and partially in vGPU; nova-core pr=
oviding
> the abstraction of the corresponding firmware / hardware interfaces and v=
GPU
> controlling the semantics of the resource handling?
>
> This is what I thought vGPU has a secondary part for where it binds to no=
va-core
> through the auxiliary bus, i.e. vGPU consisting out of two drivers actual=
ly; the
> VFIO parts and a "per VF resource controller".

Forgot to add: But I think Zhi explained that this is not necessary and can=
 be
controlled by the VFIO driver, i.e. the PCI driver that binds to the VF its=
elf.

>>  3) VFIO variant driver to convert the VF into a "VM PF" with whatever
>>     mediation and enhancement needed
>
> That should be vGPU only land.


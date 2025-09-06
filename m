Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A5B46ACE
	for <lists+nouveau@lfdr.de>; Sat,  6 Sep 2025 12:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D9310E0AD;
	Sat,  6 Sep 2025 10:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JfyT/RJF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6621610E0AD
 for <nouveau@lists.freedesktop.org>; Sat,  6 Sep 2025 10:34:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8B59D601B8;
 Sat,  6 Sep 2025 10:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75308C4CEE7;
 Sat,  6 Sep 2025 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757154886;
 bh=3dNxUbUU16M06cF3tAn6zCooVRvy93Ujlcyz6MsdRsc=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=JfyT/RJFIPVDWp1xIdaAv0dsrenrptpdo11wGP2msIu27WVZEy0AJytFB+CGZAwGs
 8pGQVgazZyyd8fDoePmGPtGUtToSGszMkfw1bF7lGwRyjYGyF13csw1znEJW1dycId
 0H/oIOGVwd2jsi2KqCaRwcf+BzwmFOw+uI51fuf7EBXSXbEllCBDgoiWk4fQ+5xry8
 Hs1aN9DfrJGLvWW8wahLuN8E88Lmsj/lInXaA9eDL0wIfYz2RhFV2pP/FlzRl9LHJW
 yKZBRTrbqcgxZaHZS9JtOtl11uPfzxiC0F38tiO5fPYGVrdUhWioSFdY+IdZ/NJfCe
 iCC3AGSxaIEbQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Sep 2025 12:34:40 +0200
Message-Id: <DCLNF4ADS21M.1WJ4YMSZ4RNF1@kernel.org>
Subject: Re: [RFC v2 03/14] vfio/nvidia-vgpu: introduce vGPU type uploading
Cc: <kvm@vger.kernel.org>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <jgg@nvidia.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiwang@kernel.org>,
 <acourbot@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
 <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>
To: "Zhi Wang" <zhiw@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250903221111.3866249-1-zhiw@nvidia.com>
 <20250903221111.3866249-4-zhiw@nvidia.com>
 <DCJWXVLI2GWB.3UBHWIZCZXKD2@kernel.org>
 <DCJX0ZBB1ATN.1WPXONLVV8RYD@kernel.org>
 <20250904174213.00003c38@nvidia.com>
In-Reply-To: <20250904174213.00003c38@nvidia.com>
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

On Thu Sep 4, 2025 at 5:43 PM CEST, Zhi Wang wrote:
> On Thu, 04 Sep 2025 11:41:03 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
>> (Cc: Alex, John, Joel, Alistair, nouveau)
>>=20
>> On Thu Sep 4, 2025 at 11:37 AM CEST, Danilo Krummrich wrote:
>> > nova-core won't provide any firmware specific APIs, it is meant to ser=
ve as a
>> > hardware and firmware abstraction layer for higher level drivers, such=
 as vGPU
>> > or nova-drm.
>> >
>> > As a general rule the interface between nova-core and higher level dri=
vers must
>> > not leak any hardware or firmware specific details, but work on a high=
er level
>> > abstraction layer.
>> >
>
> It is more a matter of where we are going to place vGPU specific
> functionality in the whole picture. In this case, if we are thinking abou=
t
> the requirement of vGPU type loading, which requires the GSP version
> number and checking. Are we leaning towards putting some vGPU specific
> functionality also in nova-core?

As much as needed to abstract firmware (and hardware) API details.

> Regarding not leaking any of the hardware details, is that doable?=20
> Looking at {nv04 * _fence}.c {chan*}.c in the current NVIF interfaces, I
> think we will expose the HW concept somehow.

I don't really mean that vGPU must be entirely unaware of the hardware, it'=
s
still a driver of course. But for the API between nova-core and client driv=
ers
we want to abstract how the firmware and hardware is programmed, i.e. not l=
eak
any (version specific) RM structures or provide APIs that consume raw regis=
ter
values to write, etc.

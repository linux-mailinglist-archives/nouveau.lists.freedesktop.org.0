Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4579B4375A
	for <lists+nouveau@lfdr.de>; Thu,  4 Sep 2025 11:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EF710E9CC;
	Thu,  4 Sep 2025 09:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="emZOx7j1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EE510E9CC
 for <nouveau@lists.freedesktop.org>; Thu,  4 Sep 2025 09:41:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A624F445B2;
 Thu,  4 Sep 2025 09:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E2CC4CEF0;
 Thu,  4 Sep 2025 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756978869;
 bh=XYdtB4QgovF+/4eIgDO6JOdgw1qaH6+X67HqQbA3+NA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=emZOx7j1dmRvG9tz6tSHCvhrVWXUU7ddp38STr5r/X91vmjD9gBl42jgA3duq/Usl
 FYoAI67aenRw9P7j9jyjQ1dSYu9dOfWH5EJ2LtggRvIDijDhZ/QJHgEPTQwT46QedR
 nKQjVLO1a7GWUbcwBz/rCi04elO5DhK4RBJFx9Gych2+PHwF2V6+snjYwQ0Ep3zRP9
 j6KBvAjES8255+XPyFqCJqitNUB7rbZDQhxO1ockGOCSQs3RQLnAWyjkvjVq9zbfhZ
 ICInW73iRQfgU8ShTte2Bws7+KueMHQo/wFDvI1iyqz5kS5Zk0IorznGEsoyoUKa89
 PrL4Qq41iykXw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 11:41:03 +0200
Message-Id: <DCJX0ZBB1ATN.1WPXONLVV8RYD@kernel.org>
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
In-Reply-To: <DCJWXVLI2GWB.3UBHWIZCZXKD2@kernel.org>
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

(Cc: Alex, John, Joel, Alistair, nouveau)

On Thu Sep 4, 2025 at 11:37 AM CEST, Danilo Krummrich wrote:
> On Thu Sep 4, 2025 at 12:11 AM CEST, Zhi Wang wrote:
>> diff --git a/drivers/vfio/pci/nvidia-vgpu/include/nvrm/gsp.h b/drivers/v=
fio/pci/nvidia-vgpu/include/nvrm/gsp.h
>> new file mode 100644
>> index 000000000000..c3fb7b299533
>> --- /dev/null
>> +++ b/drivers/vfio/pci/nvidia-vgpu/include/nvrm/gsp.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +#ifndef __NVRM_GSP_H__
>> +#define __NVRM_GSP_H__
>> +
>> +#include <nvrm/nvtypes.h>
>> +
>> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel=
-modules/tree/570 */
>> +
>> +#define NV2080_CTRL_CMD_GSP_GET_FEATURES (0x20803601)
>> +
>> +typedef struct NV2080_CTRL_GSP_GET_FEATURES_PARAMS {
>> +	NvU32  gspFeatures;
>> +	NvBool bValid;
>> +	NvBool bDefaultGspRmGpu;
>> +	NvU8   firmwareVersion[GSP_MAX_BUILD_VERSION_LENGTH];
>> +} NV2080_CTRL_GSP_GET_FEATURES_PARAMS;
>> +
>> +#endif
>
> <snip>
>
>> +static struct version supported_version_list[] =3D {
>> +	{ 18, 1, "570.144" },
>> +};
>
> nova-core won't provide any firmware specific APIs, it is meant to serve =
as a
> hardware and firmware abstraction layer for higher level drivers, such as=
 vGPU
> or nova-drm.
>
> As a general rule the interface between nova-core and higher level driver=
s must
> not leak any hardware or firmware specific details, but work on a higher =
level
> abstraction layer.
>
> Now, I recognize that at some point it might be necessary to do some kind=
 of
> versioning in this API anyways. For instance, when the semantics of the f=
irmware
> API changes too significantly.
>
> However, this would be a separte API where nova-core, at the initial hand=
shake,
> then asks clients to use e.g. v2 of the nova-core API, still hiding any f=
irmware
> and hardware details from the client.
>
> Some more general notes, since I also had a look at the nova-core <-> vGP=
U
> interface patches in your tree (even though I'm aware that they're not pa=
rt of
> the RFC of course):
>
> The interface for the general lifecycle management for any clients attach=
ing to
> nova-core (VGPU, nova-drm) should be common and not specific to vGPU. (Th=
e same
> goes for interfaces that will be used by vGPU and nova-drm.)
>
> The interface nova-core provides for that should be designed in Rust, so =
we can
> take advantage of all the features the type system provides us with conne=
cting
> to Rust clients (nova-drm).
>
> For vGPU, we can then monomorphize those types into the corresponding C
> structures and provide the corresponding functions very easily.
>
> Doing it the other way around would be a very bad idea, since the Rust ty=
pe
> system is much more powerful and hence it'd be very hard to avoid introdu=
cing
> limitations on the Rust side of things.
>
> Hence, I recommend to start with some patches defining the API in nova-co=
re for
> the general lifecycle (in Rust), so we can take it from there.
>
> Another note: I don't see any use of the auxiliary bus in vGPU, any clien=
ts
> should attach via the auxiliary bus API, it provides proper matching wher=
e
> there's more than on compatible GPU in the system. nova-core already regi=
sters
> an auxiliary device for each bound PCI device.
>
> Please don't re-implement what the auxiliary bus already does for us.
>
> - Danilo


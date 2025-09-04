Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1216B43BF9
	for <lists+nouveau@lfdr.de>; Thu,  4 Sep 2025 14:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EC510EA1E;
	Thu,  4 Sep 2025 12:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YvZUc08O";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865E10EA1D
 for <nouveau@lists.freedesktop.org>; Thu,  4 Sep 2025 12:45:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2331E448DF;
 Thu,  4 Sep 2025 12:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49363C4CEF1;
 Thu,  4 Sep 2025 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756989940;
 bh=/QNmFgSgm3l3iV46R+tQWtvZ5ZHhzWR4UUhKT2/hXXc=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=YvZUc08ObIiHjABIpvF7UWA3FWO8ZH2OaGFiY6ZZ1Jq/xoKaJahN1BBLFbX1xd3Fo
 WOt/y11i3vaI/ukWOViYkXOVtoY0yQ4qZIM+0agKOxTsFujtW7ziWKE863cW5LKAxS
 W1iUDPcZkMOt8JpL0ZXXgJi3obrRDSQA+MsYdYPbPYDWlcdmWd01gnCfsBBxJylamM
 MvLap+PFUcuRfhjtCrG3P/8vsltAuyZzYm170jo/4GO33hQBryG/4A5T/Frnnw/v/i
 LA2+cQSRhs8ukZPMCFfkyZ8oI4iE6nHD5b0gydFW7Y6tVusln3CCpeSAZcU9VgtSsm
 r6036swWRDYyA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 14:45:34 +0200
Message-Id: <DCK0Y92W1QSY.1O2U2K3GV61QW@kernel.org>
Cc: "Zhi Wang" <zhiw@nvidia.com>, <kvm@vger.kernel.org>,
 <alex.williamson@redhat.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiwang@kernel.org>,
 <acourbot@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
 <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC v2 03/14] vfio/nvidia-vgpu: introduce vGPU type uploading
References: <20250903221111.3866249-1-zhiw@nvidia.com>
 <20250903221111.3866249-4-zhiw@nvidia.com>
 <DCJWXVLI2GWB.3UBHWIZCZXKD2@kernel.org>
 <DCJX0ZBB1ATN.1WPXONLVV8RYD@kernel.org>
 <20250904121544.GL470103@nvidia.com>
In-Reply-To: <20250904121544.GL470103@nvidia.com>
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

On Thu Sep 4, 2025 at 2:15 PM CEST, Jason Gunthorpe wrote:
> On Thu, Sep 04, 2025 at 11:41:03AM +0200, Danilo Krummrich wrote:
>
>> > Another note: I don't see any use of the auxiliary bus in vGPU, any cl=
ients
>> > should attach via the auxiliary bus API, it provides proper matching w=
here
>> > there's more than on compatible GPU in the system. nova-core already r=
egisters
>> > an auxiliary device for each bound PCI device.
>
> The driver here attaches to the SRIOV VF pci_device, it should obtain the
> nova-core handle of the PF device through pci_iov_get_pf_drvdata().
>
> This is the expected design of VFIO drivers because the driver core
> does not support a single driver binding to two devices (aux and VF)
> today.

Yeah, that's for the VF PCI devices, but I thought vGPU will also have some=
 kind
of "control instance" for each physical device through which it can control=
 the
creation of VFs?

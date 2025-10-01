Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E653BB205B
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 00:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C195110E0E9;
	Wed,  1 Oct 2025 22:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ib5MtBt0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7510E0E9
 for <nouveau@lists.freedesktop.org>; Wed,  1 Oct 2025 22:52:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA9474361C;
 Wed,  1 Oct 2025 22:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0B5C4CEF1;
 Wed,  1 Oct 2025 22:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759359137;
 bh=3PdOFINQw3jijXpyTPI1RPhSJnvlq3NzijpY3jqVyzE=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=ib5MtBt0JkdO40bRNwqfWdPTurb+ijtNRok25qAU14CNWYlkw+9nzwd20NxoyLbMt
 m4bP3fN03qrJQLQ6OelkmojOYwvzUodpeswGm0d3Jt6PitfFlKTW3Bh3w1VRr/TgWe
 OspwUtKYcD7BLwA1k3KPijUqB0hJB/46RHItumjGkW5k7Jt5BRoRmhJW3Q72NbatRz
 SELrIRj5mb8AyUCOQZPGbyxp2Fyzee3HW4991mPP8F9+J/7NmM+9xdqhwk3hnWZQEc
 5EJD5IKKzH8cII+33HqyO5JbDKLrQ6pFZlzNZdsfOcccRbdmdOM8NLMF9MkPnzhyIn
 xHJpNSRledf+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 00:52:10 +0200
Message-Id: <DD7CREVYE5L7.2FALGBC35L8CN@kernel.org>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Surath Mitra"
 <smitra@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Jason Gunthorpe" <jgg@nvidia.com>, "Alex
 Williamson" <alex.williamson@redhat.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/2] rust: pci: expose is_virtfn() and reject VFs in
 nova-core
References: <20250930220759.288528-1-jhubbard@nvidia.com>
 <h6jdcfhhf3wuiwwj3bmqp5ohvy7il6sfyp6iufovdswgoz7vul@gjindki2pyeh>
 <e77bbcda-35a3-4ec6-ac24-316ab34a201a@nvidia.com>
 <DD6X0PXA0VAO.101O3FEAHJUH9@kernel.org>
 <f145fd29-e039-4621-b499-17ab55572ea4@nvidia.com>
 <ae48fad0-d40e-4142-87d0-8205abdf42d6@nvidia.com>
In-Reply-To: <ae48fad0-d40e-4142-87d0-8205abdf42d6@nvidia.com>
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

On Thu Oct 2, 2025 at 12:38 AM CEST, John Hubbard wrote:
> On 10/1/25 6:52 AM, Zhi Wang wrote:
>> On 1.10.2025 13.32, Danilo Krummrich wrote:
>>> On Wed Oct 1, 2025 at 3:22 AM CEST, John Hubbard wrote:
>>>> On 9/30/25 5:29 PM, Alistair Popple wrote:
>>>>> On 2025-10-01 at 08:07 +1000, John Hubbard <jhubbard@nvidia.com> wrot=
e...
> ...
>>> So, this patch series does not do anything uncommon.
>>>
>>>>> I'm guessing the proposal is to fail the probe() function in nova-cor=
e for
>>>>> the VFs - I'm not sure but does the driver core continue to try probi=
ng other
>>>>> drivers if one fails probe()? It seems like this would be something b=
est
>>>>> filtered on in the device id table, although I understand that's not =
possible
>>>>> today.
>>>
>>> Yes, the driver core keeps going until it finds a driver that succeeds =
probing
>>> or no driver is left to probe. (This behavior is also the reason for th=
e name
>>> probe() in the first place.)
>>>
>>> However, nowadays we ideally know whether a driver fits a device before=
 probe()
>>> is called, but there are still exceptions; with PCI virtual functions w=
e've just
>>> hit one of those.
>>>
>>> Theoretically, we could also indicate whether a driver handles virtual =
functions
>>> through a boolean in struct pci_driver, which would be a bit more elega=
nt.
>>>
>>> If you want I can also pick this up with my SR-IOV RFC which will proba=
bly touch
>>> the driver structure as well; I plan to send something in a few days.
>
> As I mentioned in the other fork of this thread, I do think this is
> a good start. So unless someone disagrees, I'd like to go with this
> series (perhaps with better wording in the commit messages, and maybe
> a better comment above the probe() failure return) for now.

Indicating whether the driver supports VFs through a boolean in struct
pci_driver is about the same effort (well, maybe slightly more), but solves=
 the
problem in a cleaner way since it avoids probe() being called in the first
place. Other existing drivers benefit from that as well.

Forget about the SR-IOV RFC I was talking about; I really just intended to =
offer
to take care of that. :)

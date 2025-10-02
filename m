Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE68DBB5750
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 23:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F2B10E852;
	Thu,  2 Oct 2025 21:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c9QPcHmg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C5710E852
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 21:14:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6323405CD;
 Thu,  2 Oct 2025 21:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE483C4CEF4;
 Thu,  2 Oct 2025 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759439694;
 bh=fEjxlXo9iGxGTGymMtJcGUd4ihSMkkTMFtMwsY3MTe0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c9QPcHmgH+iaGhQ9pFcH+PwurhmqcX2V055jstrUUj51qjzYRxN53YbQmjPJ5caxq
 OlcB7ozpI4oWf/WkwpJBdaFycOGoDcTsGMNexHJXr12bXjxKN93cLK7pbaWPUqlApQ
 TcmS+yItri3sP0PcQt6WtTwGaTfc8OHz+8T/NwF4r5fh/k/a+kMuMQQZhBfUSgTMsj
 AIfhHTSBqFfhzkzPoWtcAxCuS+loWYqKfwbAOiqcbZUanbvZuMKDZVfgicrcHkbTiG
 AjzfUeUL1XGrijOzY4BP9rv0MmQxHEvwjEuKxZsd13gdNupYJRPcws2hevKAqAlfUT
 vjNOvbUg+y0qw==
Message-ID: <bba17237-2401-4e9b-912b-29d31af748e1@kernel.org>
Date: Thu, 2 Oct 2025 23:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rust: pci: skip probing VFs if driver doesn't
 support VFs
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Williamson
 <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251002170506.GA3299207@nvidia.com>
 <DD80P7SKMLI2.1FNMP21LJZFCI@kernel.org>
 <DD80R10HBCHR.1BZNEAAQI36LE@kernel.org>
 <af4b7ce4-eb13-4f8d-a208-3a527476d470@nvidia.com>
 <20251002180525.GC3299207@nvidia.com>
 <3ab338fb-3336-4294-bd21-abd26bc18392@kernel.org>
 <20251002183114.GD3299207@nvidia.com>
 <56daf2fe-5554-4d52-94b3-feec4834c5be@kernel.org>
 <20251002185616.GG3299207@nvidia.com> <DD837Z9VQY0H.1NGRRI2ZRLG4F@kernel.org>
 <20251002210433.GH3299207@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251002210433.GH3299207@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/2/25 11:04 PM, Jason Gunthorpe wrote:
> On Thu, Oct 02, 2025 at 09:36:17PM +0200, Danilo Krummrich wrote:
>> If we want to obtain the driver's private data from a device outside the scope
>> of bus callbacks, we always need to ensure that the device is guaranteed to be
>> bound and we also need to prove the type of the private data, since a device
>> structure can't be generic over its bound driver.
> 
> pci_iov_get_pf_drvdata() does both of these things - this is what it
> is for. Please don't open code it :(

It makes no sense to use it, both of those things will be ensured in a more
generic way in the base device implementation already (which is what I meant
with layering).

Both requirements are not specific to PCI, or the specific VF -> PF use-case.

In order to guarantee soundness both of those things have to be guaranteed for
any access to the driver's private data.

I will send some patches soon, I think this will make it obvious. :)
>>> Certain conditions may be workable, some drivers seem to have
>>> preferences not to call disable, though I think that is wrong :\
>>
>> I fully agree! I was told that this is because apparently some PF drivers are
>> only loaded to enable SR-IOV and then removed to shrink the potential attack
>> surface. Personally, I think that's slightly paranoid, if the driver would not
>> do anything else than enable / disable SR-IOV, but I think we can work around
>> this use-case if people really want it.
> 
> I've heard worse reasons than that. If that is the interest I'd
> suggest they should just use VFIO and leave a userspace stub
> process..

I'm not sure I follow your proposal, can you elaborate?


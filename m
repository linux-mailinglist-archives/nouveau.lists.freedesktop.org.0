Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB9ABB4DE0
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 20:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF3C10E83D;
	Thu,  2 Oct 2025 18:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mX3HNEpE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1BD10E2EB
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 18:17:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5A1440A97;
 Thu,  2 Oct 2025 18:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99057C4CEF4;
 Thu,  2 Oct 2025 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759429037;
 bh=4nKLh32Hd2nAWCTAdpEWRGqLtylws6S+PEJ1b66ALT4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mX3HNEpEPuhjzPVJ0Wx7A8Nx8gieSgnTuE+DAIKmJaXa1Zr1t/9QfeYIlhdGxLGNp
 E6pxP1sRrTwrLntnRAMi5XkZzw+zxxjXW6RZrfq6q/Et3yF0z7dLQ7IVZZGKe6He88
 aIO8yst8sagPlV8FN9Jo44jXIltb0dvPehRRKMTA8nX+ODbnRScHe+n5NqqRKgRbhS
 zPyHkbG4SzgS27SwRQYHtrSRw93tXbFBAixuZao3TejkLuZaL9IsrXe1FuOjpJtAo3
 vWpoLgmiRqpj5mIejJy+VKhL09K7YiymH2AdbvCxWJyulNXyH/owx1sAhQbcQkoJ0o
 Zj1YwbWAho+vA==
Message-ID: <3ab338fb-3336-4294-bd21-abd26bc18392@kernel.org>
Date: Thu, 2 Oct 2025 20:17:10 +0200
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
References: <20251002123921.GG3195801@nvidia.com>
 <DD7UVCEVB21H.SQ00WZLLPINP@kernel.org> <20251002135600.GB3266220@nvidia.com>
 <DD7XKV6T2PS7.35C66VPOP6B3C@kernel.org> <20251002152346.GA3298749@nvidia.com>
 <DD7YQK3PQIA1.15L4J6TTR9JFZ@kernel.org> <20251002170506.GA3299207@nvidia.com>
 <DD80P7SKMLI2.1FNMP21LJZFCI@kernel.org>
 <DD80R10HBCHR.1BZNEAAQI36LE@kernel.org>
 <af4b7ce4-eb13-4f8d-a208-3a527476d470@nvidia.com>
 <20251002180525.GC3299207@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251002180525.GC3299207@nvidia.com>
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

On 10/2/25 8:05 PM, Jason Gunthorpe wrote:
> On Thu, Oct 02, 2025 at 10:49:21AM -0700, John Hubbard wrote:
>>> Forgot to add: But I think Zhi explained that this is not necessary and can be
>>> controlled by the VFIO driver, i.e. the PCI driver that binds to the VF itself.
>>
>> Yes, this is the direction that I originally (3 whole days ago, haha) had in mind,
>> after talking with Zhi and a few others: nova-core handles PFs, and the VFIO driver
>> handles the VFs, and use the "is virtual" logic to sort them out.
> 
> To be clear, no matter what the VFIO driver bound to the VF should not
> become entangled with any aux devices.
> 
> The VFIO VF driver uses pci_iov_get_pf_drvdata() to reach into the PF
> to request the PF's help. Eg for live migration or things of that
> nature.

Ick! The VF driver should never mess with the PF driver's private data.

Instead the PF driver should provide an API for the VF driver to get things done
on behalf.

It also has the implication that we need to guarantee that PF driver unbind will
also unbind all VFs, but we need this guarantee anyways. I.e. when the VFIO
driver calls into nova-core we want the guarantee that we're in a scope where
the PF driver is bound.
> My point here is that generally we don't put profiling code in the
> VFIO driver and then use pci_iov_get_pf_drvdata() to access the PF do
> actually do the profiling.
> 
> The VF cannot/should not control profiling of itself - that would be a
> security problem once it is assigned to a VM.

As mentioned above, if at all I think the PF driver has to provide an API for that.

> So the profiling resides entirely inside the PF world and should
> operate without VFIO.

Perfectly fine with me, I'm open to both approaches.

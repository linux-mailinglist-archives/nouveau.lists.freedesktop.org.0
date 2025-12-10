Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D08ACBAFE2
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF34A10ECC5;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ik.me header.i=@ik.me header.b="QaD2TaZh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Wed, 10 Dec 2025 23:07:24 UTC
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch
 [83.166.143.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB6510E677
 for <nouveau@lists.freedesktop.org>; Wed, 10 Dec 2025 23:07:24 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6c])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dRWD12Ggzz1vB;
 Wed, 10 Dec 2025 23:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
 t=1765407073; bh=BwZcPkwxeUAPL1DWDSRbquoxF+EJnKJ1r4hZeUQymzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QaD2TaZhg0TFtupyfZM5xCP4WsywzUEHpzzBsYYPiXYZ/m3s0/IbmQhdF5xuMHtwd
 6hG6fqOqqVtSgQR4FIT5qaOacumxNSStIqR8J9JSl7ArDdXEgwuku8HaLJe917eAUl
 iRnKXRUjv+qpqzxJUA9EcbCe+43w/1iE7+UtrHoI=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4dRWCz43vVzwVg; Wed, 10 Dec 2025 23:51:11 +0100 (CET)
Date: Wed, 10 Dec 2025 23:51:10 +0100
From: Ewan CHORYNSKI <ewan.chorynski@ik.me>
To: Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, airlied@gmail.com,
 dakr@kernel.org, 
 aliceryhl@google.com, bhelgaas@google.com, kwilczynski@kernel.org,
 ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
 markus.probst@posteo.de, helgaas@kernel.org, cjia@nvidia.com, alex@shazbot.org,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, acourbot@nvidia.com, joelagnelf@nvidia.com,
 jhubbard@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 2/7] [!UPSTREAM] rust: pci: support configuration space
 access
Message-ID: <h5pp4aqaglql5gak2ni7pw2jrcuecjaog3fmeu72p4kbcn6vgf@pzfiofsvoxe3>
References: <20251206124208.305963-1-zhiw@nvidia.com>
 <20251206124208.305963-3-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206124208.305963-3-zhiw@nvidia.com>
Feedback-ID: :67b9f1ba44ebda2:ham:e74197f626dda86
X-Infomaniak-Routing: alpha
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:49 +0000
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

On Sat, Dec 06, 2025 at 12:42:03PM +0000, Zhi Wang wrote:
> +    /// Find the extended capability
> +    pub fn find_ext_capability(&self, cap: i32) -> Option<u16> {
> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct pci_dev`.
> +        let offset = unsafe { bindings::pci_find_ext_capability(self.as_raw(), cap) };
> +        if offset != 0 {
> +            Some(offset as u16)
> +        } else {
> +            None
> +        }
> +    }

This is a good candidate to use `Option<NonZeroU16>` for the return
type as you don't expect Some(0) to be valid. It will also enable niche
optimisation for the Option. The whole if statement can even be replaced
by `NonZeroU16::new(offset as 16)` which return an option directly.

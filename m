Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99DCB2DE73
	for <lists+nouveau@lfdr.de>; Wed, 20 Aug 2025 15:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F9B10E357;
	Wed, 20 Aug 2025 13:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gS3i7LWA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9C610E357
 for <nouveau@lists.freedesktop.org>; Wed, 20 Aug 2025 13:56:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6024F5C697D;
 Wed, 20 Aug 2025 13:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40983C4CEE7;
 Wed, 20 Aug 2025 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698205;
 bh=piG/FiXhKiIArdVeFb0mh1k61fHGLdZsqcNNViU3X6g=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=gS3i7LWAe4EDXHuyD1/rYg1XqTVyLXT3pgtCd561jjf0M2wttckn8jFw7K1ssw01P
 OYwpupj11qtsNrN7p+yNHNIvFuXz6aPnHOWDi9xiA+GoGfVq7tESKMibmKim8JoEzX
 Q71d2WCaMAcPkQT90pVBimjKVPqecbTPqfFKlDz6rn5nraPOc2j6uVsZq4PwE3L09Q
 HYc5MHkC07RR2yQ0EGghcVSF2RuUPATiv06yz9TPVzC7cSpOVVddod+EWVQbtUmFlH
 XgUl3b7fqocDKrKRXHvp5ph1kXZ1wegx4Z9KMlg+d7U4409OrkpHd4Sql6aXsci0lj
 iKsFtV/oUeQXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 15:56:39 +0200
Message-Id: <DC7B2I88PS4K.TJAD25XWXK9K@kernel.org>
Subject: Re: [PATCH v4 2/3] gpu: nova-core: avoid probing
 non-display/compute PCI functions
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250820030859.6446-1-jhubbard@nvidia.com>
 <20250820030859.6446-3-jhubbard@nvidia.com>
 <DC7AZL4OWXTY.2F7TRSCZYNK6S@nvidia.com>
In-Reply-To: <DC7AZL4OWXTY.2F7TRSCZYNK6S@nvidia.com>
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

On Wed Aug 20, 2025 at 3:52 PM CEST, Alexandre Courbot wrote:
> This is making use of `from_class_and_vendor`, which is modified in the
> next patch, requiring to modify this part of the file again. How about
> switching this patch with 3/3 so we only modify the nova-core code once?

I think that makes sense.

> I also wonder if we want to merge 1/3 and (the current) 3/3, since 1/3
> alone leaves `from_class_and_vendor` into some intermediate state that
> nobody will ever get a chance to use anyway, and one doesn't really make
> sense without the other. WDYT?

Let's not merge them please, the intermediate state is not that bad, curren=
tly
we deal with raw integers for representing vendor IDs as well. So, patch 1 =
is an
improvement even by itself.

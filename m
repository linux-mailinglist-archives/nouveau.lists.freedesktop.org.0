Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B722DC1FBAF
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 12:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1FF10E276;
	Thu, 30 Oct 2025 11:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cgum3bRr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900E810E276
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 11:12:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C28F560270;
 Thu, 30 Oct 2025 11:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCE4C4CEF1;
 Thu, 30 Oct 2025 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761822727;
 bh=BSolpokxLywxqliZROQ9KV5FG5CYIMSvfXRul5jIyB0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cgum3bRr+d2xng6DdIy3v1BDtvsKHbN9eWzQehMlNHRh5Hanx0alkIKGGFUgorLx5
 CYu6xkABWusWSpXrVDHnnCwfHjdvdFg3dfA8FjF/1hXCi+genjkwvTKyn9N93nWS5L
 gykWg3frvVbxoHyEtjFjFkt83hYxTkSLK9KxwD+0bf6Vx8bc+HbVKkS3dhy937JLMs
 NeTKH4jKb3i4JmP/yZAfcwNpsWDIMeT/auysqszxvWV0KW9647BfEwXtMWIal6XG/7
 1RNmyjsr3bW/W/pDd5s74yqz8onJxt2SfSPayoP0ijtWRpU4B2/kLKMcBcuOvlxsFQ
 6jxtwBOysfXAw==
Message-ID: <06e18028-db5c-4a4e-a96d-29ddc07485ff@kernel.org>
Date: Thu, 30 Oct 2025 12:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] nova-core: regs: rename .alter() --> .update()
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251025010815.566909-1-jhubbard@nvidia.com>
 <20251025010815.566909-2-jhubbard@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251025010815.566909-2-jhubbard@nvidia.com>
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

On 10/25/25 3:08 AM, John Hubbard wrote:
> This also changes .try_alter() to try_update().
> 
> After this commit, instead of "read, write and alter", the methods
> available for registers are now "read, write and update".
> 
> This reads a lot easier for people who are used to working with
> registers.
> 
> No functional changes are intended.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

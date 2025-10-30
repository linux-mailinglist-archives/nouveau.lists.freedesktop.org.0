Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56EC1FB79
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 12:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACC210E273;
	Thu, 30 Oct 2025 11:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oDhkPcWz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8523010E273
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 11:10:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 458DC44539;
 Thu, 30 Oct 2025 11:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5897C4CEF1;
 Thu, 30 Oct 2025 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761822615;
 bh=7DPscIK43top2NRqx/uD0GvM9s9v/q9ETJ+c/B9fvTM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oDhkPcWzjUldtLgPpKfCaR+QVOlXQv3WVtoDkVJO2A1q0AQbE56AQlMMCEdY0jqlE
 fdoUoRupLV2jYgawaTZg8Nui50VMnb096AsyWBseFgJW5Y5XTX/tA51UVvg7C40WAq
 Ub9A76tZUTAzfJnAKRnrlDdvhYO67MjFQnb2QgHxGE209h/SHAQ+I/oJIK/wNAwgYT
 x1IGarw7/UVwt+CIXocPYlkBKh+zcX0+wbyuVFsJhpMSRjd91iMiyHDTGXdxd5riXc
 unn8YBvZMkPaktmwHktO4J0hr3DoK0HEzuGj9WxRTkPUaIQlrRvzQeQ3mdxj/P4hDG
 RPMXR5fHuLcDw==
Message-ID: <88199802-293e-4c09-9078-79a5bdd2fc7c@kernel.org>
Date: Thu, 30 Oct 2025 12:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] nova-core: remove HWCFG1 and need_riscv
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
References: <20251025014050.585153-1-jhubbard@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251025014050.585153-1-jhubbard@nvidia.com>
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

On 10/25/25 3:40 AM, John Hubbard wrote:
> John Hubbard (2):
>   nova-core: remove an unnecessary register read: HWCFG1
>   nova-core: remove unnecessary need_riscv, bar parameters

Acked-by: Danilo Krummrich <dakr@kernel.org>

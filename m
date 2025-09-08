Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA3B49080
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 15:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEE810E52E;
	Mon,  8 Sep 2025 13:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rm03CAil";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272F10E525
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 13:56:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 745DC447EF;
 Mon,  8 Sep 2025 13:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0D1C4CEF1;
 Mon,  8 Sep 2025 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757339816;
 bh=zRYexB8bj4GScDf3jj7zv+A1nsXQZmKkRKsKp2/PZ0g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rm03CAill+YlAHZghvUXvTt0aZ2mrKayqNNcLvMJbBWrP4R7/96CvKdE2pAa4cx+6
 EcSxQrVK85M45C9kKolpiNs5ssqmxyvElBYg0cD2WTBdK46KsnWe+zzJJvnma55BGH
 pHpOvPMQ3Gky4fyr5hkVE9SfATNJmFdKQNq4v2ZAMQD7bzHZ66ymRUrt1mVK3cikNd
 xN6i+Fr9XbpxkenYeCmuw9lRr+qpadxRteQhBJuzWRX29eMwKwh9DQeX4eUIG/Ov/R
 1qnH/GLznu+Xny2IDVayLHxmEPkUBgS8oz7z2qVO13NZWd0pQP1Rd84UKFAvlnZ/jm
 fhV15UeCd7Q+Q==
Message-ID: <8a41b893-cb4a-4380-a671-f554bd6d0cf3@kernel.org>
Date: Mon, 8 Sep 2025 15:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] gpu: nova-core: use Alignment for
 alignment-related operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
 <20250908-num-v5-2-c0f2f681ea96@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250908-num-v5-2-c0f2f681ea96@nvidia.com>
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

On 9/8/25 3:25 PM, Alexandre Courbot wrote:
> Make use of the newly-available `Alignment` type and remove the
> corresponding TODO item.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>


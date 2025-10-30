Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E282C1FC24
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 12:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3448F10E8DA;
	Thu, 30 Oct 2025 11:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="poMPAQXu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F9210E8DA
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 11:15:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6E1561D5D;
 Thu, 30 Oct 2025 11:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5893AC4CEF1;
 Thu, 30 Oct 2025 11:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761822911;
 bh=gP5Y5jDLLpBVmQGmQqu9eVBjgKlOOZRJlIXu5Gz0Nm4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=poMPAQXuSzuHhNnEazwK7onEIt+ouVImynsh6Oe59Qp1uSegSHuT/c3WQ+e5MB5dt
 mAZ3k7cQFvbEhh75Pxxl6YUZawvqRtufJ3frKlOWnf/22owMraMZiDkq4WWI3F6V/y
 1zLa5I4y/G0UWGfqxgcxJT0VwG8jITw1jrL2Z38QTVYraWHBUJH/aY9n1sqTvZ3vVg
 GvtAAHb32NHOEtIkIwfuDVfUdhryyeM4TvtEMnxw6lDrIgwFOwSVawfZW6FucuaNH7
 18sa/4W4j0NLODhN91BTofDBLVQavDrb/yZ/XTlW/VZ0XnM8H5A0yaRJ6GkVE/13HH
 EYPq3wyzwcO/g==
Message-ID: <7c8ab212-3905-4652-baa4-b422e69fea0c@kernel.org>
Date: Thu, 30 Oct 2025 12:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nova-core: Ada: basic GPU identification
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
References: <20251025012017.573078-1-jhubbard@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251025012017.573078-1-jhubbard@nvidia.com>
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

On 10/25/25 3:20 AM, John Hubbard wrote:
> ...which is sufficient to make Ada GPUs work, because they use the
> pre-existing Ampere GPU code, unmodified.
> 
> Tested on AD102 (RTX 6000 Ada).
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

You may want to consider requesting committer access for the drm-rust tree [1].

[1]
https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-access.html#access-request

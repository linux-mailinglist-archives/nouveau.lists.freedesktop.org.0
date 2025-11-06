Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D2C3D850
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 22:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8040710E958;
	Thu,  6 Nov 2025 21:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jDW3A3Jq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1A110E958
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 21:42:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BEF4F42B31;
 Thu,  6 Nov 2025 21:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CB6C4CEFB;
 Thu,  6 Nov 2025 21:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762465326;
 bh=HBOXIy/p5V/ZxzeiuRMeak4MAcNhX6QDmMzw4cwz5F4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jDW3A3Jq30LBdpxs0FpnswBnEhjdl+I6G+uilY2I8mNNWtN04l7vn1tBOsnsuJrCe
 UqnZcmxitkCDDT0rcq4QjEUGn0O8wgVH9k19AsdKVQSMJ8DL+PmhVOH7AQ/8bVhr2T
 eWDAeMa9Co9xg+4cmFuByJpw92NSJM3r6NH+dDrLCg57BDpTo7z5Og30JJ5xaxvOim
 zRFunfhIECox9QUAyFChYj4vkgcIrNEO5pOlEL30QOZGrx1kgoKhZEwKcHTdL+h1gl
 qsTL4eYTrDGkxEAgMu0C8ThQa1UIygqq+LeS5xwZXSuKBj8rIT5bL+aPuVTnCKclMS
 ycQB0z1YJIhiA==
Message-ID: <1c86eda2-b9ca-426c-8813-f91ddcd22085@kernel.org>
Date: Thu, 6 Nov 2025 22:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] gpu: nova-core: use gpu::Architecture instead of long
 lists of GPUs
To: Timur Tabi <ttabi@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-7-jhubbard@nvidia.com>
 <fc6616d404d8fd04a62bd90fa0f79e2c9d2a17da.camel@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <fc6616d404d8fd04a62bd90fa0f79e2c9d2a17da.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 11/6/25 3:41 PM, Timur Tabi wrote:
> On Wed, 2025-11-05 at 19:54 -0800, John Hubbard wrote:
>> -use crate::gpu::{Architecture, Chipset};
>> +use crate::gpu::{
>> +    Architecture,
>> +    Chipset, //
>> +};
> 
> I don't think this change should be part of this patch.  

I think it would be good to send a patch converting nova-core (and nova-drm) to
kernel vertical import style at once and then rebase other patches on top of that.

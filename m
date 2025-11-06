Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51958C3DD91
	for <lists+nouveau@lfdr.de>; Fri, 07 Nov 2025 00:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F29110EA10;
	Thu,  6 Nov 2025 23:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mqOHNpLp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DAD10EA10
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 23:30:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 042E3601A5;
 Thu,  6 Nov 2025 23:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBD7C116C6;
 Thu,  6 Nov 2025 23:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762471817;
 bh=RtKh1aHOhj1oUQyHUf8pa4sYnCoinvuK8XuzxIRajf8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mqOHNpLpMJukurAu9WEU6QNDCnr36o3iJUL1EV1KG77f+R9/afOeC2+ZO/2QbZT7c
 0k44sU4wPKl/m5aNVMevdrf0sen/hLfWu5F4UXlF7p+rnf/Hs3lbH3JtEvJ5LMp6du
 DVH6DpwBEfgS8s1OjfvrncliiGp2rmxS7Wb6q2+R91JkzsvnxnSUVIYryZ+t9fCIor
 ChrkA2xZZ0ncqdSryu/1ONR8a698bwr8xxuY9YHVfrSNnKJFkducAhM8dFI2sH/xaA
 o+gUnuSgswKb1QmkrhqXHq6ORdyIcZsQHk7LXKPhlO8qX4c+vbVcmXCDP32RP0WHFw
 CbFnZ/JhXtT4g==
Message-ID: <33fdac0d-fd7c-4c8e-9aa5-fa5558ff82d6@kernel.org>
Date: Fri, 7 Nov 2025 00:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] gpu: nova-core: use gpu::Architecture instead of long
 lists of GPUs
To: John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
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
 <1c86eda2-b9ca-426c-8813-f91ddcd22085@kernel.org>
 <4d93d66d-d186-4b0c-b51d-94303c58b791@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <4d93d66d-d186-4b0c-b51d-94303c58b791@nvidia.com>
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

On 11/6/25 11:18 PM, John Hubbard wrote:
> I'm thinking we can either do it, before or after the big pending
> set of patches that have been posted so far, probably.

I'd prefer doing it before, it ensures we have consistent style throughout the
driver and gives the chance to cleanup unnecessary imports that are covered by
prelude.

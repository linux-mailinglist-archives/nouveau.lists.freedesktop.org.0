Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B30B37428
	for <lists+nouveau@lfdr.de>; Tue, 26 Aug 2025 23:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A7A10E3AF;
	Tue, 26 Aug 2025 21:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Aqw4MJ2D";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35910E3AF
 for <nouveau@lists.freedesktop.org>; Tue, 26 Aug 2025 21:01:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F046E60228;
 Tue, 26 Aug 2025 21:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6923EC4CEF1;
 Tue, 26 Aug 2025 21:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756242059;
 bh=AM4QTX/jnq7zICEFB4XveBjYV48d+rGYsnq2fA0OB8U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Aqw4MJ2DDarCJ1O1tCb8L6v0hXZJ+4VHRWm4wm/lGRwbWrHUjbFshW3LPhJdzQtNY
 /r476FNwV/e4XP/n7684z75FTRl69CgL3STtnKJfaa3dc2+Fkdf27hihxPO0/eLHhn
 aNjqxiib4MgUZcMVcyocZZTjoUqHftnSQnptw2Y2F3nv/Z7UhQ6yw/2S7PvpZJtVp7
 RRCam6pPs6LnqB1DRJGKWlgdCgoRbr2v9+cOOxl39kY89MbOSrMWhadb7lUKTzU8G6
 M137S8d6p6ZFGoczaDU3G2nVoRVUEK/aqdS6XZs/JuPSlEd+DHBgQHosmB/vqyxEgk
 EGV10uodY4cfg==
Message-ID: <c137a383-6dec-4031-af45-0da821574f38@kernel.org>
Date: Tue, 26 Aug 2025 23:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] rust: pci: provide access to PCI Vendor values
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>
References: <20250822020354.357406-1-jhubbard@nvidia.com>
 <20250822020354.357406-3-jhubbard@nvidia.com>
 <DCBIF83RP6G8.1B97Z24RQ0T24@nvidia.com>
 <DCBIPY9UJTT4.ETBXLTRGJWHO@kernel.org>
 <b1cbdc99-317e-454c-bf03-d6793be5b13c@nvidia.com>
 <54b19bdc-5d88-4f71-ad8e-886847ccee8a@kernel.org>
 <65072e90-a1cd-43bb-bc31-04b16947113f@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <65072e90-a1cd-43bb-bc31-04b16947113f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/26/25 10:58 PM, John Hubbard wrote:
> I have no idea "where appropriate" is, here. These are not hot paths, and
> the existing pci.rs methods such as Device::vendor_id() are not inlined,
> and so my initial approach is to just not inline any of this...

I think we can inline those functions that only consist out of a single 
constructor (i.e. Self {...}) or a single function call either way.

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5BB4A717
	for <lists+nouveau@lfdr.de>; Tue,  9 Sep 2025 11:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637A110E677;
	Tue,  9 Sep 2025 09:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W5jf9RFl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2072010E677
 for <nouveau@lists.freedesktop.org>; Tue,  9 Sep 2025 09:14:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35F3B60230;
 Tue,  9 Sep 2025 09:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F9DC4CEF7;
 Tue,  9 Sep 2025 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757409275;
 bh=VQJWCICOhHbCkaUmxx5hpqb4ryuOMWY3hLJbYcGO+W8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=W5jf9RFl5PZh8xzrNThdiHCskbj7mamuSL8moI1HITaNGI2YQGHjGeTVgPixQ6CLC
 TiHNk+53Y0FBCW0KMPmApMTxqo2xbmSTV81CgNwMPKBep8JGSDCQpDH+UerjYrcmF1
 uhMV+SZkOyjN6FIIdw9ml/hsA6YiOIyBMg4s2m21RtKABWHtS/TZMQMCUBTdoWmdy+
 7kuaUcLNBV7n12k1Lt8ilyyCclQkYvllO8Uh8CAoTdFwcsomDhtHPxlCNTLMcM/NxL
 7Sia8SSrpDVYRmJfuhq8qsKah2ZXJw13dRMLVoZPCfiy+93XLjxngFM62Ygf3JMTTt
 7ZTgWcWofpADg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 11:14:31 +0200
Message-Id: <DCO5LDQHXVUC.3J2MSYSA0WCVC@kernel.org>
Subject: Re: [PATCH v5 1/2] rust: add `Alignment` type
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
 <20250908-num-v5-1-c0f2f681ea96@nvidia.com>
 <CANiq72kUsG10+E-W6zhFXhexZV+O_a-K1Px0kGkWPKvMMhAztQ@mail.gmail.com>
 <DCO2UHSV1FJH.146QJD3UR8FVR@nvidia.com>
 <CANiq72khp7PVeKmbvM=ima7Tp7o1zPfjNY6dRK79aAQZsOvBPw@mail.gmail.com>
In-Reply-To: <CANiq72khp7PVeKmbvM=ima7Tp7o1zPfjNY6dRK79aAQZsOvBPw@mail.gmail.com>
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

On Tue Sep 9, 2025 at 9:21 AM CEST, Miguel Ojeda wrote:
> On Tue, Sep 9, 2025 at 9:05=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> With -rc6 approaching, I don't think we will merge any Nova code taking
>> advantage of this for this cycle, so please feel free to take this
>> patch. We can then merge patch 2 through drm-rust after -rc1 is
>> released.
>
> Sure, sounds good. I can also take patch 2 already as a user of this
> if you prefer (ideally with an Acked-by).

Yeah, this way around make much more sense,

Acked-by: Danilo Krummrich <dakr@kernel.org>

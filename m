Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8403FB11BCB
	for <lists+nouveau@lfdr.de>; Fri, 25 Jul 2025 12:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79910E9C7;
	Fri, 25 Jul 2025 10:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UtpcPhjI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BED10E9DA
 for <nouveau@lists.freedesktop.org>; Fri, 25 Jul 2025 10:10:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5ED7A5C6173;
 Fri, 25 Jul 2025 10:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9E9C4CEE7;
 Fri, 25 Jul 2025 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753438257;
 bh=w/kRruVhK9RSEzYfppk9up+qBuWCPFlU/lKHshBF79g=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=UtpcPhjIbcTnlS1etmvJ/1RTZWoOiLQdxYlUPXqlD4V8Jfr6+UA2GS0neiBQ1+1X/
 hnXAxu4oi4QNl4SMqd1T0bXMU2XfeuXdNmKR3Cw21ItGlKri4WbMrOHCmRK8zcmws6
 yQt/Svg+8/asO19ShIbMftrRz/fJE/6ZJmCfpOofTzM5gEDx04EBmeTvXOl1Bnu8gr
 yMHXVk4CucXhdX8clxxEwHpPwUMMwwsLbGjozicy2U8VOEGWuOBmoD4GnC9HMQH2fq
 2tKWnarDoPpug1+VINaK7BIAdadi4TctaoF0RUi2emunwHcU53FukF0a0b/5/kCuMH
 sQE24ABlqyTtA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 12:10:52 +0200
Message-Id: <DBL1ZGZCSJF3.29HNS9BSN89C6@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <DASWS1A63LYM.399CKUDL4Z7UC@kernel.org>
 <DBKTNE4OF0IB.3C32NVHQ9UKQ3@nvidia.com>
In-Reply-To: <DBKTNE4OF0IB.3C32NVHQ9UKQ3@nvidia.com>
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

On Fri Jul 25, 2025 at 5:38 AM CEST, Alexandre Courbot wrote:
> Hi Benno,
>
> Sorry, took some time to come back to this!

No worries!

> On Sun Jun 22, 2025 at 5:11 PM JST, Benno Lossin wrote:
>> On Fri Jun 20, 2025 at 3:14 PM CEST, Alexandre Courbot wrote:
>>> +                /// Returns the value of this instance.
>>> +                ///
>>> +                /// It is guaranteed to be a power of two.
>>> +                ///
>>> +                /// # Examples
>>> +                ///
>>> +                /// ```
>>> +                /// use kernel::num::PowerOfTwo;
>>> +                ///
>>> +                #[doc =3D concat!("let v =3D PowerOfTwo::<", stringify=
!($t), ">::new(16);")]
>>> +                /// assert_eq!(v.value(), 16);
>>> +                /// ```
>>> +                #[inline(always)]
>>> +                pub const fn value(self) -> $t {
>>> +                    self.0
>>
>> Let's add:
>>
>>     if !self.0.is_power_of_two() {
>>         core::hint::unreachable_unchecked()
>>     }
>>     self.0
>
> Sure. Is it to enable compiler optimizations by making assumptions about
> the returned value?

Exactly, it will for example turn dividing by it into a right shift and
prevent a branch for the zero check.

---
Cheers,
Benno

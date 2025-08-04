Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE463B1A58E
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 17:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9341E10E587;
	Mon,  4 Aug 2025 15:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xfepz9Z0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC14610E587
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 15:11:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 988D9419A6;
 Mon,  4 Aug 2025 15:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA21C4CEE7;
 Mon,  4 Aug 2025 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754320295;
 bh=WsBZ9IWDi4AHnAaDyJYEnE0j2P2HYEAvJGAl8zo5e4U=;
 h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
 b=Xfepz9Z0LMoO19prxl1RC/Qhu/HzpwiQPHzWUOiHzdOPniAJPeu1Z2ZrSV3x5Hvxa
 Dv+QpoXahJ9MpZuLE4JkLoYP3QEgQJCA0ys2/JxrNwZmFYg03ko/bAGL6I6HbwGXEn
 S9rBu4eRISHBSAfOlLF+vOxSGN4T/L7HBDqqvtimCs/v7lNixsdjMIJTzvM0pCJTrL
 3YsNKAyLF0QfAscolFq5rbsMtby16OYnhrQnOLV0jcuY0xowjan+bDoRiEkoVBu/qa
 eY95FuuEnmUb9JLo+RIlJF6cUhkKxIi+9voLv9lMFoiGvw3v0mX74o/d3X12+UcERy
 V4A8RWhbf8qmw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 17:11:30 +0200
Message-Id: <DBTQN3RW1H1S.1G8KB3ZD8A58F@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] rust: add `Alignment` type
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
 <CANiq72miQSuEEzKZsOhHKDah1kP+8PYcmODGqwtcaRwAggF-+g@mail.gmail.com>
In-Reply-To: <CANiq72miQSuEEzKZsOhHKDah1kP+8PYcmODGqwtcaRwAggF-+g@mail.gmail.com>
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

On Mon Aug 4, 2025 at 4:17 PM CEST, Miguel Ojeda wrote:
> On Mon, Aug 4, 2025 at 1:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>> +        if !self.0.is_power_of_two() {
>> +            // SAFETY: per the invariants, `self.0` is always a power o=
f two so this block will
>> +            // never be reached.
>> +            unsafe { core::hint::unreachable_unchecked() }
>> +        }
>
> I guess this one is here to help optimize users after they inline the
> cal? Is there a particular case you noticed? i.e. it may be worth
> mentioning it.

I suggested this in the previous version [1]. For example, it optimizes
division to only be a left shift.

[1]: https://lore.kernel.org/all/DBL1ZGZCSJF3.29HNS9BSN89C6@kernel.org

---
Cheers,
Benno

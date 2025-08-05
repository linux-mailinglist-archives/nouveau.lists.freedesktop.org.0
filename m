Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2DB1B84F
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 18:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E65910E283;
	Tue,  5 Aug 2025 16:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="InPSQB4O";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D90C10E283
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 16:20:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 496C6601D1;
 Tue,  5 Aug 2025 16:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42103C4CEF0;
 Tue,  5 Aug 2025 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754410824;
 bh=XuMotM/gJfeeJYPH1ZQEnPrrlJmh37g9hr7AW2b3wjw=;
 h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
 b=InPSQB4ONboqyUhKYcqEcM1H1++iATuXvfsZEnrdIVHHvbt/r09WMxFsmZ9dWAV37
 g/gpBZlrCv3UnuZa+Sbgfc3A1IJhv62iEv6OxvUx4Kd6ch3a4OpLnJD550A2Phec/k
 8dMh7ZuvRyLLq57K98fx4bBTBvW1T9tbDuBHTr+jw/acziktaUztiVMsz3oVhvOMQx
 zmmdrLx9Z61rYC9vz8IDkpTPzf/w0k/PRoWYnydGMDhNkJn/Uwjcw5fArYDWX1rGg7
 +h6d1njYz7Kw5EC++g61W3xCa/bKvUcf8NHskeKkR5nDdOb+Q1pkw0SziJzYH0LpG9
 Lihk7/jmlR4Pw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 18:20:19 +0200
Message-Id: <DBUMQBY9W4GY.K4659O5ONHDQ@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
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
 <DBUIR9ALSORF.2UVITQEFXD0RM@nvidia.com>
In-Reply-To: <DBUIR9ALSORF.2UVITQEFXD0RM@nvidia.com>
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

On Tue Aug 5, 2025 at 3:13 PM CEST, Alexandre Courbot wrote:
> On Mon Aug 4, 2025 at 11:17 PM JST, Miguel Ojeda wrote:
>> On Mon, Aug 4, 2025 at 1:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>> +    pub const fn mask(self) -> usize {
>>> +        // INVARIANT: `self.as_usize()` is guaranteed to be a power of=
 two (i.e. non-zero), thus
>>> +        // `1` can safely be substracted from it.
>>> +        self.as_usize() - 1
>>> +    }
>>
>> I am not sure why there is `// INVARIANT` here, since we are not
>> creating a new `Self`.
>
>>
>> I guess by "safely" you are trying to say there is no overflow risk --
>> I would be explicit and avoid "safe", since it is safe to overflow.
>
> I just wanted to justify that we cannot substract from 0. Maybe an
> `unchecked_sub` would be better here? The `unsafe` block would also
> justify the safety comment.
>
> ... mmm actually that would be `checked_sub().unwrap_unchecked()`, since
> `unchecked_sub` appeared in Rust 1.79.

No need to do that, the compiler already knows that there won't be
underflow and optimizes it accordingly (since self.as_usize() converts a
`NonZero<usize>`). [1] (it also works when removing the
`is_power_of_two` check, but if we only stored a `usize`, I bet the
compiler would also optimize this given that check)

I'd just add a normal comment that mentions no underflow can occur. This
shouldn't need unsafe.

[1]: https://godbolt.org/z/M5x1W49nn

---
Cheers,
Benno

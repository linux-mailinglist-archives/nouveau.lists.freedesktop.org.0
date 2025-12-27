Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF4CE0299
	for <lists+nouveau@lfdr.de>; Sat, 27 Dec 2025 23:25:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 55F47113A6A;
	Sat, 27 Dec 2025 22:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AyQvmqNv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8C01344C6E;
	Sat, 27 Dec 2025 22:17:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766873864;
 b=Mbq54R786MoijjMSPSYDB6WoRCT3Q5V0DYUioeksmjw/t4S1ISR3CEuWAoXHWgF1+zM9Y
 JI5yHXF/+3BPALCTjBP0oJ8+f1nBGAmpMc/wmmJbdYuwDQEfVOaot0yVpMLy1JJfqQczFGl
 hZTC4vGWZCrMlytMumopN/yDSPPDL4EJPehh/L01ruxsmW1zeCYyeK1KM/sY2DXbhv3Ov2s
 u1v5uH6kB2h6LBraBoWXD0Iwf75uangjMIGs2osy3pwSDf2sOJYZQw6lhk/PwmcH4BZL6uj
 weC0Q5+DE3+Bhl+RepSrFgQhfeg0EUEFwAum4zcSvUXJX4+1y9d3o6Zes8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766873864; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Xy3RQdM6OLRr8Nyts+LLw5Iqr9Ocpy+EJ/pQF7/vWrU=;
 b=Kpen0bJEiTKmBo1ecNmIJWXFm/Ead4k/2Hf/P+bSiu9XwPAyu2zOWqUbw0OnxR3h3eyu9
 uHmqv7ahh3VYZr+bUjeuOll7F0mIGunpw2VhRRafv6Gih1/6WQHEK2xGva0YP/7mzVmhz/L
 3ZlDl7ukYVcV0W+vI5HtgWgjmF/pw3YI//th4650ieXEiWAB67eVga1Dy9NL6uzGP0IPI3m
 WYdgsRzedQr5CmQBdyRCXz97qKdeosgP6XJ9kV1xTSwl9SpFe1gIuYoB+cgIHmo2mopiaq/
 SUKKbXBy3MaJpZTyqiTUOf1lcCgnNkVwunBcFlcBZ/prR3+j+TJZAqSAEmKQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 20CE9401CB
	for <nouveau@lists.freedesktop.org>; Sat, 27 Dec 2025 22:17:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 876C0113A2C
	for <nouveau@lists.freedesktop.org>; Sat, 27 Dec 2025 22:25:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C60760010;
	Sat, 27 Dec 2025 22:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A6DC4CEF1;
	Sat, 27 Dec 2025 22:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766874332;
	bh=ve418wM/XyEWbfmF9fZaylARcLvP8lDozBBpjRZ5o+8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=AyQvmqNvp7aFQkxu9SD9KvqD0VPsY4RmdEyFYtNitIJA85tSgEOywKmb0jorw0lxS
	 IjpVlVP9LPMRay+Sec3vC3A2AkCG8ydTk+EL7v5/Rvbgy92vXOCxmp4AnxnUzsDgcO
	 Jf3ipoz5wiJvSNAeLP2N8LtwbR9BJHnhNVa7YBuDEXNYGFjtgZzNmQMNNpuIk8XkgL
	 Vr6b69aJIulzkcnfZIHt2KyLLUyA7pee51MsvXVSXYIskVTmpFlkET4Oo8zsg6feEb
	 i+ZT0v0mPlqtqFG9/Erz5tLI9V2JGKahlDqs0C3ChjjcutYSaNv+wsN5C6CwRPVFDF
	 UnjE7r2+m4c8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 23:25:27 +0100
Message-Id: <DF9COCLM7VEQ.11RH8SIO59PMU@kernel.org>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
From: "Benno Lossin" <lossin@kernel.org>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
 <CA+tqQ4Kyy1re209kjBvtJU037MEcv+jQzEt=E9CMS4d2iuFR5g@mail.gmail.com>
In-Reply-To: 
 <CA+tqQ4Kyy1re209kjBvtJU037MEcv+jQzEt=E9CMS4d2iuFR5g@mail.gmail.com>
Message-ID-Hash: 7D5HQD7P5PVGBG3CDQPFZ6CUMV3HLNB3
X-Message-ID-Hash: 7D5HQD7P5PVGBG3CDQPFZ6CUMV3HLNB3
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7D5HQD7P5PVGBG3CDQPFZ6CUMV3HLNB3/>
Archived-At: 
 <https://lore.freedesktop.org/DF9COCLM7VEQ.11RH8SIO59PMU@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Dec 27, 2025 at 11:45 AM CET, Jesung Yang wrote:
> On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
>> > On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
>> >> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
>> >> > +    fn emit_overflow_assert(
>> >> > +        enum_ident: &Ident,
>> >> > +        variants: &[Ident],
>> >> > +        repr_ty: &syn::Path,
>> >> > +        input_ty: &ValidTy,
>> >> > +    ) -> TokenStream {
>> >>
>> >> I feel like we should track this via traits rather than using a const
>> >> assert. That approach will require & generate much less code.
>> >
>> > Sorry, but could you elaborate? A small example of what you have in
>> > mind would help a lot.
>>
>> Oh yeah sorry, I had something different in mind compared to what I'll
>> describe now, but it achieves the same thing without introducing new
>> traits:
>>
>> We have two options:
>> 1) We use `<input_ty as TryFrom<repr_ty>>::try_from` instead of writing
>>    the `fits` function ourself.
>> 2) We require `input_ty: From<repr_ty>`.
>>
>> The first option would still check every variant and should behave the
>> same as your current code.
>>
>> Option 2 allows us to avoid the const altogether, but requires us to
>> choose the smallest integer as the representation (and if we want to be
>> able to use both `i8` and `u8`, we can't). I missed this before, so
>> using option 1 might be the only way to allow conversions of this kind.
>
> AFAIK, `<input_ty as TryFrom<repr_ty>>::try_from` cannot be called in
> const contexts without `#![feature(const_trait_impl, const_convert)]`.
> I assume we want to keep this validation at compile-time? If so, we
> might need to stick with the custom `fits` check for now. Please let me
> know if I misunderstood you.

Oh yeah that doesn't work (yet) :(

I'll take another look at the function itself then.

Cheers,
Benno

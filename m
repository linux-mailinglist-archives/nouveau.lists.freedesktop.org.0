Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D83CDE008
	for <lists+nouveau@lfdr.de>; Thu, 25 Dec 2025 18:42:41 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E11C9113E3E;
	Thu, 25 Dec 2025 17:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UZTJyut0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 18A5C44C6D;
	Thu, 25 Dec 2025 17:34:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766684092;
 b=hLx3nrdqz3d/eh+ghiHWcvgFJ+vIRsPspk4tvmZaRNlfSoNJf8LBaTkli7PD4snZ1lne8
 JqRhgecvRvhrV7k3ycGVeRmvbUAd1NwCYrCZniewWHJ3UbMwoBYeEAl8oR8tnQDRBAcYsTz
 I0fbWWnGHeEJGP4VpGW5703XsJkJrWc5vO7mnUmRbNfTcj4KIO3bwTbiD718aRpwqcyHRQN
 tGy0ENe+CgftX5MNPCkBYuBb426KaYtu+Q/BEMd6dmkuiO3gFG8bRJb0clkzJylv1Kz1CUJ
 N5+uoYlcGXXB6fPTKO0Dqpbf6mlYN03OIwHPYayGBUndhc0HCwvwmQOHtAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766684092; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gUShw2Gx26CNCb7Ikrbz7YPtkJ3h+A9zh69C2eyMdPc=;
 b=FrSx3BSlvxIWdSm56x5gzhDYqry8728NJT5tNkdQTsQzqdzsdlJd1SOb8uDLyd5uu5sA2
 u93IiaEj2ib7Tuv24NXp9YFZVCsVcaTcM3+qfh0PvbI9I/zWbdAvnVJDWNXbp0J3iSj0JUV
 Drb972LZfmJCqpiChNBsqLzVdNrgfz1xzLZd0FpGzgUQK6Evp39NBvXRBCGt2CDR6v9MGRF
 +uY8rhrBZAnggpw4uJCLm8l+85WZckw8UbAUPkyP3z27lVliYUPwxmhloIYVzK0TzUFx3oC
 9DLSl4juUv078+db4ywNoRkOtaRM7LQ822Ep8IQUf3Gp5s6GLBl5bgC4HP5w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6017644C5F
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 17:34:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 00FA610E27A
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 17:42:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26C8B60010;
	Thu, 25 Dec 2025 17:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C94C4CEF1;
	Thu, 25 Dec 2025 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766684555;
	bh=Q6K0G+6uAJEJNLBbvH8mvTIdhAB5aN6l2vYgs0mXJzY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UZTJyut0cPLRM7AoZquwviH1Y8Y94oaSklV1M/KbiMPANXS0L2gabgWJh30homC5q
	 0+xuMvAAwQUC/t8MvKAurmP2eXzH96tcDloMkmriC9oqSMX3J7thMBpvrqL2lAh62R
	 kib+0MUzU+CzaOVfBnK/+1DpdomvA7Gf5JayaO0GyhYwG36hAHcbDhYKUvW8ZO/nkk
	 AjqqGxcWBUyamGNcdgEJ3KWMLm0CXAMTj8lTEgH/Bc0qOWqdW0Wo0/7g/PW2DOrKlI
	 W8I4W0q1MMCZHgTfTyHHsk9NwTKT+CI2FDUgrCztOe4bfCwU6xL+Y+Ykj4U0vrV2V+
	 XiPAWsALH7aZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Dec 2025 18:42:31 +0100
Message-Id: <DF7HEMI7I3LS.FW1IPV2QS2HB@kernel.org>
Subject: Re: [PATCH v4 2/4] rust: macros: add derive macro for `TryFrom`
From: "Benno Lossin" <lossin@kernel.org>
To: <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-2-4a563d597836@gmail.com>
In-Reply-To: <20251225-try-from-into-macro-v4-2-4a563d597836@gmail.com>
Message-ID-Hash: EQSQ3O7Z6I4HJIUV6TL5DTTA5HE224EB
X-Message-ID-Hash: EQSQ3O7Z6I4HJIUV6TL5DTTA5HE224EB
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EQSQ3O7Z6I4HJIUV6TL5DTTA5HE224EB/>
Archived-At: 
 <https://lore.freedesktop.org/DF7HEMI7I3LS.FW1IPV2QS2HB@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
> +/// ## Compile-time Overflow Assertion
> +///
> +/// The following examples do not compile:
> +///
> +/// ```compile_fail
> +/// # use kernel::macros::Into;
> +/// #[derive(Into)]
> +/// #[into(u8)]
> +/// enum Foo {
> +///     // `256` is larger than `u8::MAX`.
> +///     A =3D 256,
> +/// }
> +/// ```
> +///
> +/// ```compile_fail
> +/// # use kernel::macros::Into;
> +/// #[derive(Into)]
> +/// #[into(u8)]
> +/// enum Foo {
> +///     // `-1` cannot be represented with `u8`.
> +///     A =3D -1,
> +/// }
> +/// ```

These two are copy-pasted from the `into` macro.

Cheers,
Benno

> +///
> +/// ## Unsupported Cases
> +///
> +/// The following examples do not compile:
> +///
> +/// ```compile_fail
> +/// # use kernel::macros::TryFrom;
> +/// // Tuple-like enums or struct-like enums are not allowed.
> +/// #[derive(TryFrom)]
> +/// enum Foo {
> +///     A(u8),
> +///     B { inner: u8 },
> +/// }
> +/// ```
> +///
> +/// ```compile_fail
> +/// # use kernel::macros::TryFrom;
> +/// // Structs are not allowed.
> +/// #[derive(TryFrom)]
> +/// struct Foo(u8);
> +/// ```
> +#[proc_macro_derive(TryFrom, attributes(try_from))]
> +pub fn derive_try_from(input: TokenStream) -> TokenStream {
> +    let input =3D parse_macro_input!(input as DeriveInput);
> +    convert::derive_try_from(input)
> +        .unwrap_or_else(syn::Error::into_compile_error)
> +        .into()
> +}


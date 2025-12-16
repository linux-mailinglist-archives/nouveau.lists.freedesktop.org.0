Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47637CC2CA9
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 13:34:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 825FC10E939;
	Tue, 16 Dec 2025 12:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tGTelK3Q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 483D2455A6;
	Tue, 16 Dec 2025 12:27:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765888024;
 b=sLl6wt5K53RUkNmi1vmXoZ0yEmGzzbXDqjWYx6eb77gGfubgsYPR/ZFQGXICmhtZZJ0VQ
 zBg1pPQTE5zIgfKQeSGe+b3f7tcZsftQUGm84OYhus+nWwxSkoXzHsP6jE9up/LU7K1StxO
 x/sfIHV73nVB6KCapjBFvj/RqBW+AXtdPchc014Zcuu7Uq6scXV1UymsWpvVXdVMAzXMSuN
 1vuyQeCU39WqOt0LM56+hEW38R32kJKf+DtePtjAnFxz3ED6WZo3RZvpp1LVQCELNTuH61L
 NgQ0EESosTbZ8DLyBXlVTeqh18wMICZHcEA+PGqtrt0SFA1fViQConFOFCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765888024; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=R1Lu0o+11egkckbi3cb1PoZrxvfjF/dinNsiKmKw2WU=;
 b=Oulczo+bZ4vsmi7vY3yxUXJ2qMor2XwcKg+2voDQucXR3v0MoxU62rgKwjNhZYYIGE6PO
 MwSxqaLDEbyr2taCuDkIJwZ3nhH8KZKYaCvoNqAg5RE6Gs4gYyRWUL1kI37oZctpxDcmJH5
 0w1qk4H19NkCGRaOsZ1d1O5Cw3qo6DylxHYQ6hy7/cIoa6WDXQlmMsURarMwz6VC1P5eV+U
 w3QpcZqHEpkkzU/klcHIetR1AA4EzEgmdb07QJPbNpD6FFHaNQzFejTUa6hemronfLp5+e8
 K4NCEywpmKTpgJ2M2fpW/3Nyb1KkV7A1Y0FPTJ+oz8s5jF59jVotgXUoWinw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C9A4745586
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 06:05:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDEC10E3E6;
	Tue, 16 Dec 2025 06:12:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FA3160010;
	Tue, 16 Dec 2025 06:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23DAC4CEF1;
	Tue, 16 Dec 2025 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765865555;
	bh=A+I04UHKw5lCsiggJwC3a6zTxGbfv3jvV4SKBE4/dIA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=tGTelK3QrmUWjrzbl++x6Q4x6OHDRdVlombnRPiRpgCFQ3inqoNZ6kLLmFJ//fAXP
	 6dhGAz9vuaka5p0xyBWMLk8pxcP3XWeQxXiSMe6YDWnfeSA2j1qxg76KY3+jAvwWqk
	 jHKdzzRnfBb+j5WBh21YZn6XUB7JANxaLDIG06rdkYwk/tISO6r8O1q5qpc86RdgZ6
	 a3aE3Spw97ncm9LKkgCgDa4nI+aVWFkeMII2lzNTqay7NJYiHMVNYZa6NJ/XIurr9A
	 xmcz73A6w2Q0DP3EU9JNr+UpweueFG8UlXfb0gDSelk/dM1NEp9Hq4TeSh4MeYqMhm
	 gxq3tZTalVndg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 07:12:27 +0100
Message-Id: <DEZF3DDSQXA9.2WAC2D5ZDKHDZ@kernel.org>
Subject: Re: [PATCH RFC 4/7] rust: pin-init: allow `dead_code` on projection
 structure
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-4-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-4-6a5d823be19d@nvidia.com>
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 3FPYRT3PBNRG6BY7ISAMYKTRVSFBTU5L
X-Message-ID-Hash: 3FPYRT3PBNRG6BY7ISAMYKTRVSFBTU5L
X-Mailman-Approved-At: Tue, 16 Dec 2025 12:27:01 +0000
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3FPYRT3PBNRG6BY7ISAMYKTRVSFBTU5L/>
Archived-At: 
 <https://lore.freedesktop.org/DEZF3DDSQXA9.2WAC2D5ZDKHDZ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 16, 2025 at 6:13 AM CET, Alexandre Courbot wrote:
> Projection structures are not necessarily (and often not) used in their
> entirety. At the moment partial uses result in warnings about the unused
> members.
>
> Discard them by allowing `dead_code` on the projection structure
>
> To: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> ---
> Benno, please let me know if this looks good to you and I will send you
> a Github PR for this.

Looks good :)

Cheers,
Benno

> ---
>  rust/pin-init/src/macros.rs | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
> index 682c61a587a0..fe60e570c729 100644
> --- a/rust/pin-init/src/macros.rs
> +++ b/rust/pin-init/src/macros.rs
> @@ -1004,6 +1004,7 @@ fn drop(&mut self) {
>          @not_pinned($($(#[$($attr:tt)*])* $fvis:vis $field:ident : $type=
:ty),* $(,)?),
>      ) =3D> {
>          $crate::macros::paste! {
> +            #[allow(dead_code)]
>              #[doc(hidden)]
>              $vis struct [< $name Projection >] <'__pin, $($decl_generics=
)*> {
>                  $($(#[$($p_attr)*])* $pvis $p_field : ::core::pin::Pin<&=
'__pin mut $p_type>,)*


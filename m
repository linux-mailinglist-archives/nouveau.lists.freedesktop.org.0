Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD5CF5C33
	for <lists+nouveau@lfdr.de>; Mon, 05 Jan 2026 23:03:45 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 086BC10E42F;
	Mon,  5 Jan 2026 22:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JWdksuDW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0B4CE44C9B;
	Mon,  5 Jan 2026 21:55:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767650131;
 b=qXAsDAViAcboK1soo1uB8gIBHJl3113X5IN7lCb9cTUwgWgnZ8JDJamrD/eMW7obHkklu
 gno7aZ+ac7FQ0nATUZbk34tuSQZH4FZYb1jTWmUr4qfu7LlOVlAoKOfjFTcTUcrk636Ae+r
 vidAzlneOtmCaq6XIwhle6HpWMt7wKrLo23RtVRrfiGomkf3NJFJe/XitIacnasAQOYWcZM
 BXU4NU+of2FkaMVsL7uKIdRCgYtRMnDd5m0Se4Bqb3o4EpxwC16ah8ouzzB2rnp13yqqbfF
 4/ZjQJRUqjxv4SQPbUJsvEDRIr0fzjW+RAzWTSkG0jRzYmOK24LcF1IjNYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767650131; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7PqAJNnSTmCk03me6D9R2IOLB0vM1Dp+lacjBF0xU3U=;
 b=Ty1+qgZZY+W1FexIIa2jQc5NMt5yuIHmaxFG+K3eolTmWqXbhA+PbNaTYtJMx8j6rnYNJ
 gVlB6J/j1IVDswqmpTRmP7cH/IYI5czbWA7fifViQUFT3COPzvOoTwoq53aLQpnavXOr490
 xSC3kfDHAuTRyZlph7XliQ/5aQ9k3mGTZSlP4gZAyc2BWyC4czvhceE1Gsr2yVQJ6WLd7Ia
 eUG3EI78X9dLblztRPJhWZlkrG7Fc+EPw13TNktCvBlYLEPeEAOWp1+Y/qt3bMUvKYxn97a
 woXZHYIHSUcqpd/NHscfLXvkgZZiaRS3S8xEbIjMhq6tC8H6xnHDNwdC+wrw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8037E44C95
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 21:55:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01DA010E40A;
	Mon,  5 Jan 2026 22:03:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D3C86011E;
	Mon,  5 Jan 2026 22:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B23C116D0;
	Mon,  5 Jan 2026 22:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767650618;
	bh=7PqAJNnSTmCk03me6D9R2IOLB0vM1Dp+lacjBF0xU3U=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=JWdksuDWGXu86n/msSKQajKTXlcCIaPzTVtGBLeKXtl4BcdHqCX3jjxlHNHR+CWbs
	 LJnqYpYTDlMx7icZlJkPClijMT5YJ09v6llgjKiW0bEfesfSq8WxAp+zeBrEH6RauV
	 WvIlqjip9NRNgy0TEsPIyqsVrmFp/DFYiTo5AkfD11G91+4+quIWX6nNAtcRiGbixq
	 MLy+p2g+5J2h87d4/+aiApyI/MSJzEkgTmwLnNlq83U6fCql4Qt0I1aLTa2euZ6v8U
	 jKdH5KX6+wRupUv29QMfUbeLtlfAlPNnw62Pla8LMdD+BdXdA+IrzJxvRLvj1RLIKK
	 ZXg0Mwy/JH7aw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 23:03:33 +0100
Message-Id: <DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
To: "Maurice Hieronymus" <mhi@mailbox.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <20260105161110.5d1ab548.gary@garyguo.net>
 <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
In-Reply-To: <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
Message-ID-Hash: A4ZJQ5XWMOVP6MQSDLGSRZVMFMJSJG76
X-Message-ID-Hash: A4ZJQ5XWMOVP6MQSDLGSRZVMFMJSJG76
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 aliceryhl@google.com, acourbot@nvidia.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A4ZJQ5XWMOVP6MQSDLGSRZVMFMJSJG76/>
Archived-At: 
 <https://lore.freedesktop.org/DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jan 5, 2026 at 10:11 PM CET, Maurice Hieronymus wrote:
> Before I start implementing, I want to reach common ground.
>
> In my opinion a derive macro which implements Display would be
> perfectly fine, as long as the name suggests what it does. So for
> example #[derive(DisplayEnumVariant)]. This would communicate the
> intent clearly to the user.
>
> Benno, would you be okay with that? If not, Gary and Danilo, are you
> fine with the proposed trait implementation (e.g. the variant_name
> function)?

Actually, it might even be reasonable to have both. In the Nova driver we h=
ave
the case that we want to print the enum variant exactly as it is defined in=
 the
code and a lowercase version of the enum variant.

> Are there any common use-cases where one wants to change the case of
> the enum variants? If not, I would not implement an argument and rather
> name the macro accordingly, so the intent is clear.

As mentioned above, we do have a case in Nova where we also want a lowercas=
e
representation to construct a firmware path with.

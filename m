Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAC0CF6D3F
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 06:56:24 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19E2310E485;
	Tue,  6 Jan 2026 05:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="el8ktEYv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8048144C98;
	Tue,  6 Jan 2026 05:48:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767678488;
 b=Rq7iOW9Yr5Bn7Gb8YpWCMnuAABb4oAdlN9xPrBsdlZ8bJ8Jx/wNtACa85yqnvIhR1ZRUN
 mF6HnIiXQUUg5U7EWn6H1O9WV8xf8rqlp+AbM6Tg2uU+MUZPIYHJyCgE0bYWQveHMybyzlN
 7Ve/3lHISbGvuAVpt68/ak9NYvyTWWZBFdl9ZlUM/wh5FQjR5ldtQbqE5f6UK5pyQvq0jpW
 i56JfkwapuJlMcJ0848bt0BA8pvGIClrZfger1Z00Xxkqs2UN2jJ/PVCktmuFE8ilGN1qro
 Iwqnrp/eKZu5OFGP13Zacxx8QyFd7vIAtpObKZQ6ln+iCnYQrig/A16vxIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767678488; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zNNJeUjcqXP09KifZHBl4UPg/Uv6TGp/KcRFDIyRRlw=;
 b=pMV4IB7lKAywvsj9UHefPFD537NrB34y6oc+uUsa81kjLfAOnJhkV9utU0K/xhBOE0RjH
 MPkGZqNDmUeyJhQJ1s/nKNbSvCZmKikZznCrBNpDj/EmFgbkVAs/MqpVYJ495xy5nEp5GpT
 vTfLzi+pMpfalsLPCL2KWeoRf79Uc89fTnlH8YoRikoHhiAGZc/ksWw8nmRsxXBFDnPmVSV
 WW8/GiiWiCIulu6AqAuJRxpu9LSbTbcE9tX9fyH/mS2OPAXiSA8WZT8PXwIDT0PqqXnbr/u
 46oN9S5AQ2cUF0/mlALCXyhL0Z3Tcy/XHN7b0ayAiYsUoqBBe/Uh49qtRkzA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3994E44C81
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 05:48:05 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA7A510E26F;
	Tue,  6 Jan 2026 05:56:14 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dlgQL3yZfz9tKf;
	Tue,  6 Jan 2026 06:56:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767678970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zNNJeUjcqXP09KifZHBl4UPg/Uv6TGp/KcRFDIyRRlw=;
	b=el8ktEYv6mUjC+Ut3t2jrwm1EL5iHjhlqc8tqoJWPzadHpZ1ivlHAdYQzAfJFvQtFjHNBt
	XvpePUFuabfxtTNv9mAFG3SbgY2crnLOgpOfkAZKVLPsviAjxklvKpkPrCnDHd8beWxgqM
	T/0pMRwrWw9CVS3xyIDTJyqNT86g7b7fhn6avcSZ6fD13fWSL1uPAWE0/8c7L/gjecJRPI
	h80xL9KYR8FTF4g5jQSEaOWFsrmAMPzam5rrj9BGskG9LW1wlqD7MNNz00fU5jf8VD9uP3
	wDHdMJLh1njKVWrmKkg4SyqmMGlugaSbjTc9znbKHrinivU1U9uvdVar5y4rBg==
Message-ID: <90fac786f019f06765edb7c362e96f1a19801f26.camel@mailbox.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: Maurice Hieronymus <mhi@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>
Date: Tue, 06 Jan 2026 06:56:05 +0100
In-Reply-To: <DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
	 <20260104200733.190494-2-mhi@mailbox.org>
	 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
	 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
	 <20260105161110.5d1ab548.gary@garyguo.net>
	 <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
	 <DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 988fjm6qg93t4asmng8b5qxhs8p76q9z
X-MBO-RS-ID: fb77628ce3067bce7cc
Message-ID-Hash: AHKJYYPYELLNBGXO2HLJZWM7SERLY27R
X-Message-ID-Hash: AHKJYYPYELLNBGXO2HLJZWM7SERLY27R
X-MailFrom: mhi@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AHKJYYPYELLNBGXO2HLJZWM7SERLY27R/>
Archived-At: 
 <https://lore.freedesktop.org/90fac786f019f06765edb7c362e96f1a19801f26.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 2026-01-05 at 23:03 +0100, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 10:11 PM CET, Maurice Hieronymus wrote:
> > Before I start implementing, I want to reach common ground.
> >=20
> > In my opinion a derive macro which implements Display would be
> > perfectly fine, as long as the name suggests what it does. So for
> > example #[derive(DisplayEnumVariant)]. This would communicate the
> > intent clearly to the user.
> >=20
> > Benno, would you be okay with that? If not, Gary and Danilo, are
> > you
> > fine with the proposed trait implementation (e.g. the variant_name
> > function)?
>=20
> Actually, it might even be reasonable to have both. In the Nova
> driver we have
> the case that we want to print the enum variant exactly as it is
> defined in the
> code and a lowercase version of the enum variant.
>=20
> > Are there any common use-cases where one wants to change the case
> > of
> > the enum variants? If not, I would not implement an argument and
> > rather
> > name the macro accordingly, so the intent is clear.
>=20
> As mentioned above, we do have a case in Nova where we also want a
> lowercase
> representation to construct a firmware path with.

So there would be the need to have two derive macros:

1. #[derive(DisplayEnumVariant)]
Implements Display for all enum variants as they are (original case).

2. #[derive(ImplementVariantName(Case::Lowercase))]
Implements the mentioned trait. Case could be an Enum where one could
choose between Case::Lowercase and Case::Original.

Something along those lines?

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9DBCF45FC
	for <lists+nouveau@lfdr.de>; Mon, 05 Jan 2026 16:23:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADEE10E443;
	Mon,  5 Jan 2026 15:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JkXpH+4U";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1A68144C99;
	Mon,  5 Jan 2026 15:15:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767626123;
 b=f7+E6hChtQ+DYhXPd6dExB7cPf7D5KhlZQsyN/Eaiia4bZv9/drBMitmMapBYXh1EUCOH
 5mIPH9qHZCJfXyud2cNja1lhXlQAGUgEXoHxc/BfH0cFMZ8knj5ci3Nx1jQLx9S1qzdsqyR
 oJ5OLpIGuyj5TW5NkMwwJhX7NPpqvtc013peOypY8uMAO33QdToBKP5oRA5zG1Wy2BpIkxX
 2/rrKonZhBK8N5p2T9NjOTCg2Fqrfrp5CBoRzHr39mHZrWCMoRNP34qFuXUB7Pwiv83Xu97
 Qf7BTGjQsGOS6zxZSbVl53XHlOSj12MNL9g7RHT/vwpERYqtdg44gDgoUmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767626123; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gC2Lzs3wCcRPxH7slhmmTPdk1OLnKBcCsXBkys9rvVQ=;
 b=FepBJYhmfukpyji3hsyIrlDCyA271hBsBYzfrYm6RixsnR0IDyY4/+/DT8UqvoI9gA2Sr
 bhiv0ZoglOl9Zuuwu32upv3dSwhBgt0MB+GLPp37WHyeVZ77oaGJPfe9ZyDCpvoq0jfPgnA
 OdWN3VI1UELOlOddEbbS7bMwnwqFZlfJVx+BELkbQaCjOzrDcdEZjs7nWUG0G1qeOE6lDBy
 50D38E6+THsKWOArs1vOIkADNzakIk1jVxlhv4aSXKqn0oyT8e+IldnrpD7xdc02S7STjpe
 xK6tnJy2oN8Fbed1Oih7fmeux80ftVIW90oOofWcrL778V85k87qoNiJk+QQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 77470404B1
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 15:15:21 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 11F3710E440;
	Mon,  5 Jan 2026 15:23:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlJ3M6bXnz9t7s;
	Mon,  5 Jan 2026 16:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767626608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gC2Lzs3wCcRPxH7slhmmTPdk1OLnKBcCsXBkys9rvVQ=;
	b=JkXpH+4Ub+LPm5/NwdQgFKgpjWVdQHfuqh4ZGd22US/UaHSvhUdD2uRPJ2FMhyMoKi+b0s
	aC4QRZXhlSdcaE4rZFhHipFuvTO8PdGEd3awdwNsqITWipHQemNnHHLT7RrGv2h1htHSf5
	aZNwkngOekRCiIjseTyiQsQiwT4JYJuGLhQ79EXbu/VetohKHSe0QidHi5I8ERnT7i4jrt
	VboMAN0SZPAzPy+wrF5NBGgWchXXGVfzRBZgpWP2sDpBdHVQcwxQYCdGzI0tjVsuvrZQ4y
	KVEqDS2piC0SzhqtVBWnaq4GF0KSXdkBSUdfP3b+2uG5LFyk6DTsmqwtBxrweA==
Message-ID: <3599677c19457baf5a68ddff563b6c9d8effdca6.camel@mailbox.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: Maurice Hieronymus <mhi@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>
Date: Mon, 05 Jan 2026 16:23:20 +0100
In-Reply-To: <DFGQUPHJVF5M.3EZ2KL4XIMDJH@kernel.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
	 <20260104200733.190494-2-mhi@mailbox.org>
	 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
	 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
	 <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
	 <DFGQUPHJVF5M.3EZ2KL4XIMDJH@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8103c5ec7968e4f08e3
X-MBO-RS-META: craoikjubuihbssfcrjducu6ab5z9ind
Message-ID-Hash: DSXMUOVSY7J7GCN2AIKDUYRSK6R6BD3V
X-Message-ID-Hash: DSXMUOVSY7J7GCN2AIKDUYRSK6R6BD3V
X-MailFrom: mhi@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, acourbot@nvidia.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DSXMUOVSY7J7GCN2AIKDUYRSK6R6BD3V/>
Archived-At: 
 <https://lore.freedesktop.org/3599677c19457baf5a68ddff563b6c9d8effdca6.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 2026-01-05 at 16:00 +0100, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 3:42 PM CET, Benno Lossin wrote:
> > I'm still skeptical about having a derive macro for `Display`. What
> > about adding & deriving the following trait instead:
> >=20
> > =C2=A0=C2=A0=C2=A0 pub trait EnumVariantName {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn variant_name(&self) -> &'=
static str;
> > =C2=A0=C2=A0=C2=A0 }
>=20
> With a derive macro for this trait, that sounds absolutely reasonable
> -- a
> corresponding Display implementation becomes trivial with this.

Sounds good to me too. I will change my implementation and send a V3
shortly.

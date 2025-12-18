Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D047CCC5AD
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:55:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F375A10EA28;
	Thu, 18 Dec 2025 14:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OHY/NIT6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0E0F54563F;
	Thu, 18 Dec 2025 14:48:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069295;
 b=zPQSisVzdAmEflu3PPyjo40sCWKRdSE6Z6R3aoF5a3wlp7JMZLs+1eW9yYjDwARyZ4RUQ
 8DJDR7AdKk3Ebn5bCymBVELmkwcWjfkZsbD/RuLTgBJ2xiSirAspTbqgIvHLH3lKtgxCA7f
 efNAPk11egOePaN66tBijrDZtb6gMyVjYijgqY33gimkI28ZJW/do9/he6TSSu5B38FS/QV
 wicWQIXWfVhRznEayMo0gvg+YONAF1uH5A8RCGSgd6NfsR3GOq5iB/0moGNJN7+2pivIyrr
 CyNUGwz43QOYi4XXnQpJ6Fter1NV2tQPbyQMyk4uoAvPCzkzvOf1DR0LvQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069295; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kw99CZ6VErZHARNPDm5gv9tWcubRwTnXuIl8lydkx3g=;
 b=UFinpsmgXNbe0YuXswNdNrajYDCTPzvE1RdG32utXINN4mNZaXTxE7MQyiVV0tgVy3v3A
 RBKMmQ+bNGpLr7xO4/d4uwf7QZhxC7dlmjhc4FklfBwpgRpHXQDdmBQqyrGblL8XCVqG9LV
 PAQGH6jWvQeclEX+DEl2sDaVIeQZR1MmjmrNm936VmwNUePr2XShJgx8dLilopP1A0mkfof
 q8tDAiJkAmzIaY4+GiAdQwCnJFM1ysKlGYt8q/v1DZVVW3fQXddpu/pubWtx7LVu0YcY8ln
 wnE5kigq8Ds/Ll1v+nx6xF0sGRg9dOVJHqY8wMdp3+bImgcMVfC8YXHzB4Zg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8656045683
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 09:32:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE91510EC78
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 09:40:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 02AF760010;
	Thu, 18 Dec 2025 09:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E966C4CEFB;
	Thu, 18 Dec 2025 09:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766050809;
	bh=kw99CZ6VErZHARNPDm5gv9tWcubRwTnXuIl8lydkx3g=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=OHY/NIT6Ow5kInnxL9eF94GYantJTnHTEgpfVN81AMbIolrWTTawcpyk8mB2k/wE/
	 z7SXmVYMaNGVbq4EQd6wjb7ialrP0MbCd256J4GT81Cce5f3ncN2XAigwuENDAum7P
	 z470N0arGQp6r1wFyQQHGXAJuWzu9TvZLosFR9jeUmWiaxZQ6KIbw5XbJdY7fWoPmB
	 q/CI9FeV+1uV85qkEE45XXD204fuu2h/3n8+PXRtbmGwrDrW/9LxMZs+4Cn+NfWWvt
	 wIIKXLUGnnErz8jsReEOn0cKEl6K+8RK/B2yaXU3gzJWzzr2Pe7uFLRbHpjqeHR8kU
	 Wg6c+FNgm1wUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 10:40:05 +0100
Message-Id: <DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org>
Subject: Re: [PATCH v3 2/9] rust: debugfs: add lookup contructor
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-3-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-3-ttabi@nvidia.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: U7ZVSJKEBJHGZHMCB2ZX7ECMMXYSTZYR
X-Message-ID-Hash: U7ZVSJKEBJHGZHMCB2ZX7ECMMXYSTZYR
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:48:10 +0000
CC: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U7ZVSJKEBJHGZHMCB2ZX7ECMMXYSTZYR/>
Archived-At: 
 <https://lore.freedesktop.org/DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> Add a new constructor for Dir that uses the debugfs_lookup() API to
> obtain a reference to an existing debugfs directory entry.
>
> The key difference from Dir::new() and Dir::subdir() is the cleanup
> semantics: when a Dir obtained via lookup() is dropped, it calls
> dput() to release the reference rather than debugfs_remove() which
> would delete the directory.
>
> To implement this cleanup distinction, the Entry class now includes
> an is_lookup boolean that specifies how the entry was created and
> therefore how it should be dropped.

I have two main comments about this.

(1) I think it would be better to wrap "lookup entries" into a new type in =
order
to account for the fact that they do not behave like regular entries. I.e. =
when
a "lookup entry" is dropped, it does not cause the entry to disappear from =
the
file system. Analogously, when the regular entry is dropped it disappears f=
rom
the file system regardless of whether a "lookup entry" still has a referenc=
e
count.

(2) The commit message lacks the motiviation for adding this functionality,
which is only for the purpose of a workaround of an unrelated limitation wi=
th
accessing the fields of a module structure (which Gary already works on a
solution for).

I understand it might take a while until the solution Gary works on is read=
y and
I'm perfectly fine with a temporary workaround. But, this workaround has to=
 be
on nova-core only and not introduce a feature in core code that in the near
future becomes dead code.

If we have a use-case for lookup() elsewhere, I'd like to see it first. But=
 if
we don't I prefer not to add this feature as a pure workaround for somethin=
g
else.

In fact, I think that debugfs_lookup() rarely is the correct solution and m=
ore
often indicates some kind of (design) issue, like in this case.

- Danilo

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11011D3914B
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 23:00:23 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4010E200;
	Sat, 17 Jan 2026 22:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KOIfb8gb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B2AB244CB2;
	Sat, 17 Jan 2026 21:51:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768686702;
 b=JJ8gWaqdQB6hY1D8vrw1chW/9DtIsdmsWJtwPZJxIIsg8x7XFV6DFnsGU4g58N3pucM8C
 SlBzI1jfDtA4LWpOfA+JvnXE1YFcg4G5XqVXLwOZ8zWf7By36GRRiur2KWVVifzudzwYVTx
 1e/0P8VP5mJ6Gc9UaPQ3NncpeYSpZTAIHFJt3HjuEa8EzHYQnhEg9HntusnlzRThXwyWAEW
 pMBVkMkzCdGWJ7uZZZEk7D8CZDqNjOGMT8CLSNQws6DgSkEkKkPQ2jipDDHZsAeEYEiJ5/I
 lXyOnw6DxLYF3QZaPDnFjtVzhqVJMLKRQHv/GHsj2TcwEM3nCoxwp5G89VDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768686702; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YBg0gFVsiUOlkpYv9c5NAJgoz6ORpXGBCkLZfyKcOyQ=;
 b=R4P30D9B+EtUvmq/QYfeeW4Ipq1BDYMArvM9q6Yg/oNsbBNl3v69DL413p8mzy8SJWw8k
 WtQXakeQJ3WdlHevV6UAsFzpLg81KnPDv4S1qa6VTwE5q8kYjQ5CvLBEhAEiH1dahTGZ3TC
 Pw8sT8xSCnABr1aJeiFjbuSo6qEMmT/xlpO2/9iq4yGBZzCbCI7JzOOCxJ3Imfa/AAFJTda
 mTdTC2+HCJuuZ1pWFLU4csW0idG22z82T8R6SNK6T6hSqeeFcxBA3/Hx4ipG6YZOTGR0Zo2
 YgIEKj0mHfoZJHBJeDWa3SYE8R6rGgiovLpho5fDfw+uo4idAiDlMSjiyWnQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CBB254032A
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 21:51:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25CD510E0EB
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 22:00:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAD89404B8;
	Sat, 17 Jan 2026 22:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232ADC4CEF7;
	Sat, 17 Jan 2026 22:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768687218;
	bh=zKdx7wffWw4P0xNqUBF0Sah1TphPqKlqGJeB7Pv9z1s=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KOIfb8gbUP3juNpqvh2IQ4Z2VzsTYXe8zCzn/+g/Yt1pPKJUGpRIauThylo6k8HlG
	 sk8L4ndssq/EU24tDprcnZmg4NvCK0Rmg0ldbz38zaFnWo0B9VrrqG060DqUXhDUf+
	 3U3NF0GCnJ+tjc+nSOgXqPfzdj0vMpyKnWweXa2ayqBdd/su0xeisq386KDCXQ+qN3
	 5a2huI9RA5r98cbT15s2lPRVaLrZwKSCdFjY8DJkV0RYmK/kRBrcQDWV2SKF04KRZL
	 XY7h21n5SBULJBDtaB5K5rAWV6FYv//nFV83dA3DMc0I4MvCrffvIjYo9Ey1dnE371
	 eqlZ72WaZG6Dw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 23:00:15 +0100
Message-Id: <DFR7AHOX0T8G.2NB9VOS3IZRZE@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-8-ttabi@nvidia.com>
 <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
 <656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com>
 <DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.org>
 <c5d5d3fe71f6cd8725b47435f5c75394cdc9d9fd.camel@nvidia.com>
In-Reply-To: <c5d5d3fe71f6cd8725b47435f5c75394cdc9d9fd.camel@nvidia.com>
Message-ID-Hash: 7UC4D7CYQQY3PR7FB5AHSCPN77R67DMH
X-Message-ID-Hash: 7UC4D7CYQQY3PR7FB5AHSCPN77R67DMH
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7UC4D7CYQQY3PR7FB5AHSCPN77R67DMH/>
Archived-At: 
 <https://lore.freedesktop.org/DFR7AHOX0T8G.2NB9VOS3IZRZE@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 17, 2026 at 10:52 PM CET, Timur Tabi wrote:
> On Sat, 2026-01-17 at 22:35 +0100, Danilo Krummrich wrote:
>> > You don't want the debugfs entries created by default?=C2=A0 That's ho=
w it is in Nouveau.
>>=20
>> I think it's OK to always have the entries on keeping them beyond device=
 unbind
>> has to be behind a Kconfig option.
>>=20
>> I thought you want this behind a Kconfig in general, otherwise what is
>> debugfs::Dir::empty() for?
>
> Oh, I see what you're saying.  Dir::empty() is for when CONFIGFS_DEBUG_FS=
 is disabled.  So
> obviously, I should not default DEBUGFS_ROOT to Some(dir) if CONFIGFS_DEB=
UG_FS is disabled.

This case is already handled, look at how debugfs::Dir::create() [1] is
implemented. I.e. it is fully transparent and you don't have to care about =
this
case.

debugfs::Dir::empty() would be useful if you have an additional case where =
you
want to have a debugfs file tree conditionally though, which is why I assum=
ed
you wanted an additional Kconfig for nova-core.

[1] https://rust.docs.kernel.org/src/kernel/debugfs.rs.html#53

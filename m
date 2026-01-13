Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6FD1BA9A
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 00:11:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF54110E59F;
	Tue, 13 Jan 2026 23:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SpbAb0GS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1B95644CAB;
	Tue, 13 Jan 2026 23:03:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768345397;
 b=SlozIgdeTfKAZ4tEF3Ng7vFXG9YXj85CbnWxKhPvpY6jwmhebmCzg53OXEQ1skRjybhAT
 WwzGkyMrzMN+1cTK/KBLGsokUof0aFaL/IRaLSGuXPoHf7/lOG/gLuDItIMA+R5rpG1+00e
 Q2K49xXqK5kgMuH+W7sE0NpX+FA6fEqDobEdFhjz4F1bVPpCM2bnJ0YzkpaNVrXZKN95WAj
 Sh/kF87mH7GJ3C1pg2pjnyChte9Q+v8khMhvATd/08bKsBjbF2qjGgNpTwxTzEeNfzEnviK
 IezdbLwOQAroXm5kd0zWeKt1o06USfuq6ujZCK7gTBwgIKLMKOgFAaO7i8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768345397; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ftouSGkghKTo6TcWk9NfTv0pHC1M6As3D1zClgvnRnA=;
 b=gDgRZ/WaPB7YxT44urvV6mSzJ1HKyb7p2JfD0X8QzCzB5ZUX7mGJ0hzXsmW/mw0dHdtke
 QUoiciuROXyuhS5ARKdh99WBQRxfRAsL27a3OMD8hLPEIx5ttiZZraO8o6orEA3M6zkE5D6
 6Pk/682b0k4I9K/TRL/gLd6dsevNodlte7H8yprVUK4piGYv47qEmFxPaYnhod6+cKSEPxm
 QD0PG49Nd8RlQfBHhJkW57owID/ae2QPzyPv6aGpdZM19PXXmCe/5qqkZkJox8D+21Y7/zM
 DZPaBl+PASfJBjLdMCN2rK9FUZ95MjlUyH3GAMXYFfCllsYm24uDmy9pX8Bw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BB22244C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 40F8D10E593
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 23:11:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC2E7435D1;
	Tue, 13 Jan 2026 23:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D19C116C6;
	Tue, 13 Jan 2026 23:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768345903;
	bh=xE5wvtrp6gzW1gwmsQun9qvnGk+tP6KzYgubpOTkQ1I=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=SpbAb0GSDUsZHX5hy+LAGQnJlOJMVrR/l6IEyMzEJycbEYNdAiYn52RfXRaeZQ721
	 EuPf6kPaBQDVwh8U92wvW4W/v/mMNXHD8y//a+ap4wmwN3YSn0GTLzUVsM+8IIQs1y
	 XkzSgX+K2HVlnivet5t0ZpOhV9Mzt3uc+u9n7dGjbb2ad/KWAxrxNtF67sPlZsIQLZ
	 BY8j6dllIU4R0faiUU5ThJU2I8fcRxsY9on0vj4qsA/4l7RgzbWiuf0y8O4ToFp6VX
	 CltkETnXNVBoOxAMHaHbESzZ8taJtbRuPyN2YbUz9c3ImD+jPZB4Pxti5zBjn0oPlC
	 tfIbXOkVEeB6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 00:11:40 +0100
Message-Id: <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
Message-ID-Hash: 3C4RR523HIASSQFVYO7G6LH2S4E7TPPN
X-Message-ID-Hash: 3C4RR523HIASSQFVYO7G6LH2S4E7TPPN
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Matthew Maurer <mmaurer@google.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3C4RR523HIASSQFVYO7G6LH2S4E7TPPN/>
Archived-At: 
 <https://lore.freedesktop.org/DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Jan 13, 2026 at 11:53 PM CET, Timur Tabi wrote:

It seems that a lot of the feedback from the last version has not been
addressed:

> Alexandre Courbot (1):
>   gpu: nova-core: implement BinaryWriter for LogBuffer

https://lore.kernel.org/all/DF19KTQTKOS9.33N1KT9WNLAUO@kernel.org/

> Timur Tabi (8):
>   rust: pci: add PCI device name method

https://lore.kernel.org/all/DF17TCJPO9RT.2BK28ZOQSF9SN@kernel.org/

>   gpu: nova-core: Replace module_pci_driver! with explicit module init

https://lore.kernel.org/all/DF17XPT1MU64.ZXT4LSXR9CIG@kernel.org/

>   gpu: nova-core: use pin projection in method boot()
>   rust: debugfs: implement Directory trait for Dir
>   rust: debugfs: wrap Entry in an enum to prep for LookupDir
>   rust: debugfs: add LookupDir

https://lore.kernel.org/all/DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org/

Especially this one is a concern, I don't want to add this infrastructure a=
s a
workaround until we land the feature Gary works on.

As mentioned in this reply, I think that debugfs_lookup() rarely is the cor=
rect
solution and more often indicates some kind of (design) issue, like it does=
 in
this case.

Before adding this, I would like to see a valid use-case elsewhere.

If we want this before Gary's work is ready, I prefer some hacky temporary
workaround in nova-core to access the module field instead.

>   gpu: nova-core: create debugfs root when driver loads
>   gpu: nova-core: create GSP-RM logging buffers debugfs entries

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE4D38739
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 21:21:39 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 633B410E92A;
	Fri, 16 Jan 2026 20:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uGlMkRFN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3235644C5E;
	Fri, 16 Jan 2026 20:13:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768594382;
 b=AItmDx99fiA0sGejGPSwFmSgd9HA2PfNDm+hdB53nR89ceXGSE6CLg9/+RBi+WnI9a1al
 /DuMdul+bxlj4Tyr37Gc7p6WBdvy2EMNEjRAEnF3Ki2UPkaloHqRPq6ztMFrS2fS9Rc7V/d
 Xg7t82OW36dzDmzEhaE3YJxBM++dwGQMjjnE8XgVmtoQVLr0o9vFZNXI5DSi5+qo0MS6jdA
 gQjp9UPgvlTIQP5rHk9OABr+fcmxUKtV7cdnHCBIYZa0qRSN3EBPYPw1z3EDAJ7q48uBMP4
 0xwKpjCYL4woLIQ7yGlH0Au7Di8OHu1mG7aC0FE+/5oZQJh+Xc8HZLauwA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768594382; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KPPMU2j6V0+rOswQNa73XvZUO31+VXJBQ5e6zMynV3M=;
 b=c1gM2D3k/hkWXo5DcrYjYDwAqsrc/T8SZBRvQ5595MDDVxNfKYxcSMGgNVe6n+tM2/AN7
 R38QCt6hHUWOr8JdTP1lovFI9fSV6/WdkZ0W3VXqmLYrafejV4m6o3YQxXhzw0qCS4ij+W7
 YjW34nSuqrEF60Cju1tuZb/SQosw3pjS4dP2Gu/nXM/VBgUye4cJC0neLhbeY3LDt0MrhXM
 FHMIa9yegknTJN/hus+O/+4g6BMcpW+SxF7yUM+NsT+cC6L5TSkro+WSAGW09ypn1bbLL5N
 m1BfexY6T1oD0p5t1AaDqVkvnBB5VMgmSqp1ys/IOw0mwZNSrztY41cH8tUA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A45F540744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:12:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95A6C10E923
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:21:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 486A644559;
	Fri, 16 Jan 2026 20:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BF5C116C6;
	Fri, 16 Jan 2026 20:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768594894;
	bh=z8xdkfPtkAh29N1Y7nIlxG72kA3KHdZLod1K2H0Ip4o=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uGlMkRFNSHWtUntHLprO4lIlwxI2NikBI5LREkePb+NGGtlyMYe238VzabatnovVl
	 N6wS0WEnNmgdEl3el66xgE2j1KJomf0RgeC6Kz3w0B1JixILXj4wYOMNIifXCYuS5Q
	 PEEE6nCD5TD7D0w8Eun1RiUnxKqUwRE4dCoPtM+zo0HytRZQvRrVR10nWDEmGD2AKX
	 2g2P3T4XiQHkdlcxZSVJVHzBOiVSuHH8F+mkwg3pvLkTc9lRa+Vdjrr52i7yEDE/j7
	 ka4EuUHez7ZH+SzPrXiuOt4uLAMhufUGooQAtf6j6yufLGkcu4kD8oEw9HWcgYfFZk
	 GdHB8oPy4150Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 21:21:31 +0100
Message-Id: <DFQAKCP72Y4W.3SD00GX4Y29N3@kernel.org>
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the
 HAL
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
 <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
 <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>
 <DFQACNZ42CNK.27BOZPAO1T33R@kernel.org>
 <9489bcba-6c0c-43b5-baf4-5f1dc9a888aa@nvidia.com>
In-Reply-To: <9489bcba-6c0c-43b5-baf4-5f1dc9a888aa@nvidia.com>
Message-ID-Hash: GCLV6QLDNKVYD3V47KHRGQBGDC2SCBOW
X-Message-ID-Hash: GCLV6QLDNKVYD3V47KHRGQBGDC2SCBOW
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GCLV6QLDNKVYD3V47KHRGQBGDC2SCBOW/>
Archived-At: 
 <https://lore.freedesktop.org/DFQAKCP72Y4W.3SD00GX4Y29N3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 9:15 PM CET, John Hubbard wrote:
> I missed something here. Could you elaborate just a bit more on
> your proposal please?

Both HALs Ampere and Turing implement the same code to reset the falcon eng=
ine:

	regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true))=
;

	// TIMEOUT: falcon engine should not take more than 10us to reset.
	fsleep(Delta::from_micros(10));

	regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false)=
);

Instead of repeating this code we can just add a new function
regs::NV_PFALCON_FALCON_ENGINE::reset() that toggles the bit with a
corresponding delay.

So far the delay is always the same, should a different delay be required f=
or
another architecture, we can also pass it to
regs::NV_PFALCON_FALCON_ENGINE::reset() as argument, but that doesn't seem =
to be
necessary.

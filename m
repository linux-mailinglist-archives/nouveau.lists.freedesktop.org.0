Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3DCCFD231
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 11:20:38 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25C1710E58E;
	Wed,  7 Jan 2026 10:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TPCtYDfS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EC76C44CA5;
	Wed,  7 Jan 2026 10:12:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767780741;
 b=BNmcE1xU/Oo2kfrFBIPtHWNBR3D8z4IvM2X6PaBV1i/fjVz1wzlMHuCCoBQfp+vibM0G2
 SgGElE2SLAuWVu8Cm1ycAIPj5WS5BYH/f6u2lWGGtaXHg8WRABVGbauFAyEsNQvfOKp4dLh
 2AV60LfZBvtB8kooDF12CQlIRMcR/I1CshOBhF9hjtv8X/5ALgmopuDNpemXqf02DHVJlW1
 kzdB3bZq6VLW44L8qJMnqEg+oUlFU+mguUDJkQzZIwHgSoNEypbtC6ELMMi+9y3GuDsXIZF
 14rTGa8QSI/h8ZC8SYJutZf5KSu1q+dV4aRA0X+fLeWOPozguDU62lvSxLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767780741; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QepSuPXhtG4ef2pvQ+IeVXuxq080RxJg7jJraN8//OA=;
 b=bNbXa+wdM3udLhzNR0iDzXsCEGS8FUgqU2d6/8DvTRgZO8mY6y0nxTCHpOWGcQ3+aeQ1D
 CqaD/9dL9MbHOrvVVwRusBn39bMO4fbQwwLotbqvAz19NMTOHpuG+KVjFvFUIf0mYgU0Yw5
 jn8At7YOK5sL7zQPqvnFB6c4VvWxBlFtyEz40q6i7GtyIpOh5eZ7XoMVoBJjwByJjYqltFo
 Lcqv2VbRrxmQuRghOv6ZhyaSEJXPUVgLMShkUyNHSLqfDcPZytjO6YgxQ4Kvjgg4KkB5Y1s
 YtzUoEfgj1QbNxhJIqdBsxFI33k/cxAk5DkX4GSTr1aSUIFKQFPYQmR6kQvQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 341B244C9C
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 10:12:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A52210E081
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 10:20:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BD4D60007;
	Wed,  7 Jan 2026 10:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B798DC16AAE;
	Wed,  7 Jan 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767781231;
	bh=ypPZHliCFbdwvmK0nWDp9/A/bjNjBDrGQz8E3u6yHAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TPCtYDfS6gtOcf57QcNV8pz2gS9xdRVza+rnJCg9DHzym/5kJpDKwR57RCNuftp/8
	 fKfgvF3XwD5aDFE74SKPc2RbD+AIa0LT/5LOZviMDj3KYHYl1zMl6JcH/blnGDKMQi
	 pS+c0GamFcKJS+zstothaU/k7RTfa4St2vH7wIxyuZYsdr0LEDxkJ7tmEM68t7tyGk
	 zmAt8L2WNbcOcJQwYNdLn9eGEkG/Vp/PyYISve+0YpNNUpvaxY62oKhrbxS2Kr3Hwc
	 1xMTIEBhsTfD8baHdNfChNUXauDau4eU9R1XlifpSk754Z3M2ZCUJ7f9xo/1tFiS5P
	 /SCrp/3mWSReA==
Message-ID: <9693961b-efe4-4b4c-bbe5-fdadc45a75e6@kernel.org>
Date: Wed, 7 Jan 2026 11:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: John Hubbard <jhubbard@nvidia.com>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
 <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
 <09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com>
 <9a8f8500-aa1e-4145-b84d-7ce424ead644@kernel.org>
 <70a8a73e-2dad-4bad-83bb-a245b83afe5d@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <70a8a73e-2dad-4bad-83bb-a245b83afe5d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R4EXQSFHCMVWAS4FY3WO73MGQ3CRPZ6O
X-Message-ID-Hash: R4EXQSFHCMVWAS4FY3WO73MGQ3CRPZ6O
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R4EXQSFHCMVWAS4FY3WO73MGQ3CRPZ6O/>
Archived-At: 
 <https://lore.freedesktop.org/9693961b-efe4-4b4c-bbe5-fdadc45a75e6@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/7/26 1:24 AM, John Hubbard wrote:
> $  dmesg -t --level=info|grep NovaCore
> NovaCore 0000:e1:00.0: NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
> NovaCore 0000:e1:00.0: GPU name: NVIDIA RTX A4000
> [drm] Initialized nova 0.0.0 for NovaCore.nova-drm.0 on minor 0
> 
> So I'd love to leave the GPU name at info level, if you agree that
> this is about right.

Since it adds additional information about the specific board, which is not
covered by the chipset information already I think it's fine.

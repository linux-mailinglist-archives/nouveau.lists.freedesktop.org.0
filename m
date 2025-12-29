Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF81CE71C5
	for <lists+nouveau@lfdr.de>; Mon, 29 Dec 2025 15:46:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B23A110E4E8;
	Mon, 29 Dec 2025 14:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oNu2u68N";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3065D44BAE;
	Mon, 29 Dec 2025 14:38:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767019115;
 b=MR1595gpPXbuhZbycMi+Q3L6J/F7KJw1C5I6KUXuzEb9ger7vONFAE1/kQQJyEE8zWf3S
 vEZqkd6IynP3w9fja9y9pj9mdthP5m0yxQHIWYnWlRJsprgZvu8a4JGg/tkpU6bzSKTEIKu
 C+SeyYINqjlbGhdRC2OMjv9Gl47ieoxgqHCHEt37WYErv1VCHn3LKIwRba1XT+iM+Gk8MAN
 fZVnWzycxKJLZfxuqzhABzRxDRmPyxAKpqu6zPaj0FW+0dopvMWT5o4dF3NavVJq+vqljfC
 fDMqwZO3+l6gr16b25di3tmxHeMXXw6grHLFo/ah8Mvr9m8nmo0/B1tJZ3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767019115; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kM6dRjt9sJYY1fFN25TojJKRucGCztlKtp9xZ8112lk=;
 b=wI0I6Sxko9a1O4oJHxNfZgzJo15ojrovAwbr0nZXYoOHBYeORg9ezFGhPhUVRE4Zs99en
 SSyU759StScdVJhitmLlCeet9S6n0XWag0ED8Lzw4DpIfJtGsl1qHFpRHHZz2j3f9GlLXEF
 4UpIiSXKIxz7rjqfFwC9ipdoww3EOIMif9h58OC5OHsQb0tbvVU8BXKaDLzF/tJ4llLmhqH
 husxw+v3hcHewFe/sqhsaD8py8liKGs5biBiNxNtIEsrsqA/BYm55qU9aIWLJEq3/25+DN2
 q79JxBIOHKy5Z+oCGZsB/08tTbDD+bnaFv/L1yBA5v7Ox1C05rC8VRQ0wjQg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9F68443E41
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 14:38:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C8D3E10E4E5
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 14:46:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DF8943601;
	Mon, 29 Dec 2025 14:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4B9C4CEF7;
	Mon, 29 Dec 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767019587;
	bh=q0XDlPuu5awhL7ME97+x8uG3V7rcU3hi9wMUlPBUvn4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=oNu2u68NlT7ivz3XPG9xc6eZbmwPALwLC8E9SaTheNHb8tvubUiN3Xz8WkeQrtaW4
	 F7yDX0KZ8gmtI8t0oQWYsKXPscfMAI6xZqc76b2V/sl5oG8uibQFbfkHnD81f5O8s7
	 6LWCu+NGw+GDTU+3IG+RzL8kLNcGgqMQ4x1Xh7IzDabgOZ1mxtO04lMn7ANCmMecpu
	 3Pvd/NYvH1Ngx/sxX/E9fhkaETgXxmcaZIAuJbKu/ce6VyTy7LJraV2eHWvPjwNkdi
	 kwJM3fKsm8XvDax5YIe7nmAZ4mFzRZMcTmjXrD8SuTVtVhOPmA/Ie1hJt2Koz/N7m2
	 lTvNJDVZADjvw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 15:46:24 +0100
Message-Id: <DFAS5YQICTL9.UHDV6CVYZ30W@kernel.org>
To: "Brendan Shephard" <bshephar@bne-home.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4] drm/nova: Align GEM memory allocation to system page
 size
References: <20251215083416.266469-1-bshephar@bne-home.net>
In-Reply-To: <20251215083416.266469-1-bshephar@bne-home.net>
Message-ID-Hash: G3FTCOQVFFRU567GRYL3ZSQ7PSY7PAEP
X-Message-ID-Hash: G3FTCOQVFFRU567GRYL3ZSQ7PSY7PAEP
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: aliceryhl@google.com, joelagnelf@nvidia.com, acourbot@nvidia.com,
 airlied@redhat.com, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/G3FTCOQVFFRU567GRYL3ZSQ7PSY7PAEP/>
Archived-At: 
 <https://lore.freedesktop.org/DFAS5YQICTL9.UHDV6CVYZ30W@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Dec 15, 2025 at 9:34 AM CET, Brendan Shephard wrote:
> Use page::page_align for GEM object memory allocation to ensure the
> allocation is page aligned. This is important on systems where the
> default page size is not 4k. Such as 16k or 64k aarch64 systems.
>
> This change uses the updated page_align() function which returns
> Option<usize> for overflow safety. (See "rust: Return Option from
> page_align and ensure no usize overflow").
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>

Applied to drm-rust-next, thanks!

    [ Import page module only. - Danilo ]

For future submissions, please make sure to run scripts/get_maintainer.pl.
